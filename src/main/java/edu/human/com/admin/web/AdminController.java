package edu.human.com.admin.web;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.impl.SimpleLog;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import edu.human.com.authorrole.service.AuthorRoleService;
import edu.human.com.authorrole.service.AuthorRoleVO;
import edu.human.com.authorrole.service.impl.AuthorRoleDAO;
import edu.human.com.board.service.BoardService;
import edu.human.com.member.service.EmployerInfoVO;
import edu.human.com.member.service.MemberService;
import edu.human.com.util.CommonUtil;
import edu.human.com.util.PageVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.let.cop.bbs.service.Board;
import egovframework.let.cop.bbs.service.BoardMaster;
import egovframework.let.cop.bbs.service.BoardMasterVO;
import egovframework.let.cop.bbs.service.BoardVO;
import egovframework.let.cop.bbs.service.EgovBBSAttributeManageService;
import egovframework.let.cop.bbs.service.EgovBBSManageService;
import egovframework.let.utl.sim.service.EgovFileScrty;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class AdminController {
	
	private Logger logger = Logger.getLogger(SimpleLog.class);
	 
	@Inject
	private MemberService memberService;
	@Inject
	private CommonUtil commUtil;
	@Inject
	private BoardService boardService;
	@Inject
	private AuthorRoleService authorRoleService;
	@Inject
	private AuthorRoleDAO authorRoleDAO;
	//스프링빈(new키워드만드는 오브젝트X) 오브젝트를 사용하는 방법 @Inject(자바8이상), @Autowired(많이사용), @Resource(자바7이하)
	@Autowired
	private EgovBBSAttributeManageService bbsAttrbService;
	@Autowired
	private EgovPropertyService propertyService;
	@Autowired
	private EgovBBSManageService bbsMngService;
	@Autowired
	private EgovFileMngService fileMngService;
	@Autowired
	private EgovMessageSource egovMessageSource;
	@Autowired
	private DefaultBeanValidator beanValidator;
	@Autowired
	private EgovFileMngUtil fileUtil;
	
	//권한 관리 삭제하기 호출POST
	@RequestMapping(value="/admin/authorrole/delete_author.do",method=RequestMethod.POST)
	public String delete_author(AuthorRoleVO authorRoleVO, RedirectAttributes rdat) throws Exception {
		authorRoleService.deleteAuthorRole(authorRoleVO.getAUTHORROLE_ID());
		rdat.addFlashAttribute("msg", "삭제");
		return "redirect:/admin/authorrole/list_author.do";
	}
	//권한 관리 등록하기 호출POST
	@RequestMapping(value="/admin/authorrole/insert_author.do",method=RequestMethod.POST)
	public String insert_author(AuthorRoleVO authorRoleVO, RedirectAttributes rdat) throws Exception {
		authorRoleService.insertAuthorRole(authorRoleVO);
		rdat.addFlashAttribute("msg", "등록");
		return "redirect:/admin/authorrole/list_author.do";
	}
	//권한 관리 등록하기 호출GET
	@RequestMapping(value="/admin/authorrole/insert_author_form.do",method=RequestMethod.GET)
	public String insert_author_form(Model model) throws Exception {
		model.addAttribute("codeGroup", memberService.selectGroupMap());
		return "admin/authorrole/insert_author";
	}
	//권한 관리 수정하기 호출POST
	@RequestMapping(value="/admin/authorrole/update_author.do",method=RequestMethod.POST)
	public String update_author(RedirectAttributes rdat,AuthorRoleVO authorRoleVO,PageVO pageVO) throws Exception {
		//업데이트 서비스호출
		authorRoleService.updateAuthorRole(authorRoleVO);
		rdat.addFlashAttribute("msg", "수정");
		return "redirect:/admin/authorrole/view_author.do?page="+pageVO.getPage()+"&authorrole_id="+authorRoleVO.getAUTHORROLE_ID();
	}
	//권한 관리 상세보기 호출GET
	@RequestMapping(value="/admin/authorrole/view_author.do",method=RequestMethod.GET)
	public String view_author(@RequestParam("authorrole_id") int authorrole_id, Model model,@ModelAttribute("pageVO") PageVO pageVO) throws Exception {
		AuthorRoleVO authorRoleVO = authorRoleService.viewAuthorRole(authorrole_id);
		model.addAttribute("result", authorRoleVO);
		model.addAttribute("codeGroup", memberService.selectGroupMap());
		return "admin/authorrole/view_author";
	}
	//권한 관리 리스트 호출GET/POST 2개다 허용
	@RequestMapping(value="/admin/authorrole/list_author.do",method=RequestMethod.GET)
	public String list_author(Model model,@ModelAttribute("pageVO") PageVO pageVO) throws Exception {
		//Get,Set VO생성
		if(pageVO.getPage() == null) { pageVO.setPage(1); }
		pageVO.setPerPageNum(5);//하단에 보여줄 페이지번호 개수
		pageVO.setQueryPerPageNum(10);//한화면에 보여줄 레코드의 개수
		List<AuthorRoleVO> authorRoleList = authorRoleService.selectAuthorRole(pageVO);
		
		int countAuthorRole = authorRoleDAO.countAuthorRole(pageVO);
		pageVO.setTotalCount(countAuthorRole);//이 명령어에서 prev,next 등이 계산이 됨.
		logger.debug("디버그: 토탈 사이즈 "+countAuthorRole);
		model.addAttribute("authorRoleList", authorRoleList);
		return "admin/authorrole/list_author";
	}
	//게시물 등록 폼화면 호출 POST
	@RequestMapping("/admin/board/insert_board_form.do")
	public String insert_board_form(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
		// 사용자권한 처리 new
		if(!commUtil.getAuthorities()) {
			model.addAttribute("msg","관리자그룹만 접근이 가능합니다.\\n사용자홈페이지로 이동");
	    	return "home.tiles";
		}

	    LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		BoardMasterVO bdMstr = new BoardMasterVO();

		if (isAuthenticated) {

		    BoardMasterVO vo = new BoardMasterVO();
		    vo.setBbsId(boardVO.getBbsId());
		    vo.setUniqId(user.getUniqId());

		    bdMstr = bbsAttrbService.selectBBSMasterInf(vo);
		    model.addAttribute("bdMstr", bdMstr);
		}

		//----------------------------
		// 기본 BBS template 지정
		//----------------------------
		if (bdMstr.getTmplatCours() == null || bdMstr.getTmplatCours().equals("")) {
		    bdMstr.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
		}

		model.addAttribute("brdMstrVO", bdMstr);
		////-----------------------------

		return "admin/board/insert_board";
	}
	//게시물 등록 DAO처리 호출 POST
	@RequestMapping("/admin/board/insert_board.do")
	public String insert_board(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
		    @ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board") Board board, BindingResult bindingResult, SessionStatus status,
		    ModelMap model) throws Exception {
		// 사용자권한 처리 new
		if(!commUtil.getAuthorities()) {
			model.addAttribute("msg","관리자그룹만 접근이 가능합니다.\\n사용자홈페이지로 이동");
	    	return "home.tiles";
		}

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {

		    BoardMasterVO master = new BoardMasterVO();
		    BoardMasterVO vo = new BoardMasterVO();

		    vo.setBbsId(boardVO.getBbsId());
		    vo.setUniqId(user.getUniqId());

		    master = bbsAttrbService.selectBBSMasterInf(vo);

		    model.addAttribute("bdMstr", master);

		    //----------------------------
		    // 기본 BBS template 지정
		    //----------------------------
		    if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
			master.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
		    }

		    model.addAttribute("brdMstrVO", master);
		    ////-----------------------------

		    return "admin/board/insert_board";
		}

		if (isAuthenticated) {
		    List<FileVO> result = null;
		    String atchFileId = "";

		    final Map<String, MultipartFile> files = multiRequest.getFileMap();
		    if (!files.isEmpty()) {
			result = fileUtil.parseFileInf(files, "BBS_", 0, "", "");
			atchFileId = fileMngService.insertFileInfs(result);
		    }
		    board.setAtchFileId(atchFileId);
		    board.setFrstRegisterId(user.getUniqId());
		    board.setBbsId(board.getBbsId());

		    board.setNtcrNm("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
		    board.setPassword("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
		    //board.setNttCn(unscript(board.getNttCn()));	// XSS 방지

		    bbsMngService.insertBoardArticle(board);
		}
		return "redirect:/admin/board/list_board.do?bbsId="+board.getBbsId();
	}
	
	//게시물 수정 처리 호출 POST
	@RequestMapping("/admin/board/update_board.do")
	public String update_board(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
		    @ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board") Board board, BindingResult bindingResult, ModelMap model,
		    SessionStatus status) throws Exception {

		// 사용자권한 처리 new
		if(!commUtil.getAuthorities()) {
			model.addAttribute("msg","관리자그룹만 접근이 가능합니다.\\n사용자홈페이지로 이동");
	    	return "home.tiles";
		}

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		String atchFileId = boardVO.getAtchFileId();

		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {

		    boardVO.setFrstRegisterId(user.getUniqId());

		    BoardMaster master = new BoardMaster();
		    BoardMasterVO bmvo = new BoardMasterVO();
		    BoardVO bdvo = new BoardVO();

		    master.setBbsId(boardVO.getBbsId());
		    master.setUniqId(user.getUniqId());

		    bmvo = bbsAttrbService.selectBBSMasterInf(master);
		    bdvo = bbsMngService.selectBoardArticle(boardVO);

		    model.addAttribute("result", bdvo);
		    model.addAttribute("bdMstr", bmvo);

		    return "admin/board/update_board";
		}

		if (isAuthenticated) {
		    final Map<String, MultipartFile> files = multiRequest.getFileMap();
		    if (!files.isEmpty()) {//첨부파일이 있을때 작동
		    	//기존 첨부파일이 존재하지 않으면 신규등록
				if ("".equals(atchFileId)) {
					System.out.println("디버그1:-기존첨부파일이 없을경우 신규등록시 사용"+atchFileId);
				    List<FileVO> result = fileUtil.parseFileInf(files, "BBS_", 0, atchFileId, "");
				    atchFileId = fileMngService.insertFileInfs(result);
				    board.setAtchFileId(atchFileId);
				} else {//기본첨부파일이 존재하면 기존것 보존하고, 다시 신규등록
					System.out.println("디버그2:"+atchFileId);
				    FileVO fvo = new FileVO();
				    fvo.setAtchFileId(atchFileId);
				    int cnt = fileMngService.getMaxFileSN(fvo);
				    List<FileVO> _result = fileUtil.parseFileInf(files, "BBS_", cnt, atchFileId, "");
				    fileMngService.updateFileInfs(_result);
				}
		    }

		    board.setLastUpdusrId(user.getUniqId());

		    board.setNtcrNm("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
		    board.setPassword("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
		    //게시물 업데이트 레코드 처리(아래)
		    bbsMngService.updateBoardArticle(board);
		}
		
	    BoardVO bdvo = new BoardVO();
	    bdvo = bbsMngService.selectBoardArticle(boardVO);

	    return "redirect:/admin/board/view_board.do?bbsId="+bdvo.getBbsId()
		+"&nttId="+bdvo.getNttId()+"&bbsTyCode="+bdvo.getBbsTyCode()
		+"&bbsAttrbCode="+bdvo.getBbsAttrbCode()+"&authFlag=Y"
		+"&pageIndex="+bdvo.getPageIndex();	
		//return "redirect:/admin/board/list_board.do?bbsId="+board.getBbsId();
	}
	//게시물 수정 화면을 호출 POST
	@RequestMapping("/admin/board/update_board_form.do")
	public String update_board(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") BoardVO vo, ModelMap model)
		    throws Exception {

		// 로그인체크(로그인 되지 않았으면 로그인페이지로 이동처리)
		if(!EgovUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
	    	return "cmm/uat/uia/EgovLoginUsr";
		}

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		boardVO.setFrstRegisterId(user.getUniqId());

		BoardMaster master = new BoardMaster();
		BoardMasterVO bmvo = new BoardMasterVO();
		BoardVO bdvo = new BoardVO();

		vo.setBbsId(boardVO.getBbsId());

		master.setBbsId(boardVO.getBbsId());
		master.setUniqId(user.getUniqId());

		if (isAuthenticated) {
		    bmvo = bbsAttrbService.selectBBSMasterInf(master);
		    bdvo = bbsMngService.selectBoardArticle(boardVO);
		}

		model.addAttribute("result", bdvo);//게시물 정보 오브젝트(게시물제목,내용,첨부파일id...)
		model.addAttribute("bdMstr", bmvo);//게시판 정보 오브젝트(게시판명,게시판id...)

		//----------------------------
		// 기본 BBS template 지정 게시판ID별로 필요한 디자인css파일을 변경 시켜줍니다.
		//----------------------------
		if (bmvo.getTmplatCours() == null || bmvo.getTmplatCours().equals("")) {
		    bmvo.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
		}
		model.addAttribute("brdMstrVO", bmvo);//위에서 정의한 bdMstr 모델과 같음.2사람이상이 만들어서 나오는현상
		////-----------------------------
		return "admin/board/update_board";
	}
	
	@RequestMapping("/admin/board/delete_board.do")
	public String delete_board(FileVO fileVO, BoardVO boardVO, RedirectAttributes rdat) throws Exception {
		//FileVO fileVO = new FileVO();
		if(boardVO.getAtchFileId()!=null && !"".equals(boardVO.getAtchFileId()) ) {
			System.out.println("디버그:첨부파일ID "+boardVO.getAtchFileId());
			//fileVO.setAtchFileId(boardVO.getAtchFileId());
			//fileMngService.deleteAllFileInf(fileVO);//USE_AT='N'삭제X
			//물리파일지우려면 2가지값 필수: file_stre_cours, stre_file_nm
			//실제 폴더에서 파일도 삭제(아래 1개만 삭제하는 로직 -> 여러개 삭제하는 로직 변경)
			List<FileVO> fileList = fileMngService.selectFileInfs(fileVO);
			for(FileVO oneFileVO:fileList) {
				FileVO delfileVO = fileMngService.selectFileInf(oneFileVO);
				File target = new File(delfileVO.getFileStreCours(), delfileVO.getStreFileNm());
				if(target.exists()) {
					target.delete();//폴더에서 기존첨부파일 지우기
					System.out.println("디버그:첨부파일삭제OK");
				}
			}
			//첨부파일 레코드삭제(아래)
			boardService.delete_attach(boardVO.getAtchFileId());//게시물에 딸린 첨부파일테이블 2개 레코드삭제
		}
		//게시물 레코드삭제(아래)
		boardService.delete_board((int)boardVO.getNttId());
		rdat.addFlashAttribute("msg", "삭제");
		return "redirect:/admin/board/list_board.do?bbsId="+boardVO.getBbsId();
	}
	
	@RequestMapping("/admin/board/view_board.do")
	public String view_board(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
		LoginVO user = new LoginVO();
	    if(EgovUserDetailsHelper.isAuthenticated()){
	    	user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		}

		// 조회수 증가 여부 지정
		boardVO.setPlusCount(true);

		//---------------------------------
		// 2009.06.29 : 2단계 기능 추가
		//---------------------------------
		if (!boardVO.getSubPageIndex().equals("")) {
		    boardVO.setPlusCount(false);
		}
		////-------------------------------

		boardVO.setLastUpdusrId(user.getUniqId());
		BoardVO vo = bbsMngService.selectBoardArticle(boardVO);
		//시큐어코딩 시작(게시물제목/내용에서 자바스크립트 코드의 꺽쇠태그를 특수문자로 바꿔서 실행하지 못하는 코드로 변경)
		//egov 저장할때, 시큐어코딩으로 저장하는 방식을 사용, 문제있음. 우리방식으로 적용
		String subject = commUtil.unscript(vo.getNttSj());//게시물제목
		String content = commUtil.unscript(vo.getNttCn());//개시물내용
		vo.setNttSj(subject);
		vo.setNttCn(content);
		model.addAttribute("result", vo);
		
		model.addAttribute("sessionUniqId", user.getUniqId());

		//----------------------------
		// template 처리 (기본 BBS template 지정  포함)
		//----------------------------
		BoardMasterVO master = new BoardMasterVO();

		master.setBbsId(boardVO.getBbsId());
		master.setUniqId(user.getUniqId());

		BoardMasterVO masterVo = bbsAttrbService.selectBBSMasterInf(master);

		if (masterVo.getTmplatCours() == null || masterVo.getTmplatCours().equals("")) {
		    masterVo.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
		}

		model.addAttribute("brdMstrVO", masterVo);
		
		return "admin/board/view_board";
	}
	
	@RequestMapping("/admin/board/list_board.do")
	public String list_board(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		boardVO.setBbsId(boardVO.getBbsId());
		boardVO.setBbsNm(boardVO.getBbsNm());

		BoardMasterVO vo = new BoardMasterVO();
		System.out.println("디버그: 게시판아이디는 "+boardVO.getBbsId());
		vo.setBbsId(boardVO.getBbsId());
		vo.setUniqId(user.getUniqId());

		BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);

		//-------------------------------
		// 방명록이면 방명록 URL로 forward
		//-------------------------------
		if (master.getBbsTyCode().equals("BBST04")) {
		    return "forward:/cop/bbs/selectGuestList.do";
		}
		////-----------------------------

		boardVO.setPageUnit(propertyService.getInt("pageUnit"));
		boardVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, vo.getBbsAttrbCode());
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);

		//-------------------------------
		// 기본 BBS template 지정
		//-------------------------------
		if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
		    master.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
		}
		////-----------------------------

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("brdMstrVO", master);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "admin/board/list_board";
	}
	
	@RequestMapping(value="/admin/member/delete_member.do",method=RequestMethod.POST)
	public String delete_member(EmployerInfoVO memberVO,RedirectAttributes rdat) throws Exception {
		memberService.deleteMember(memberVO.getEMPLYR_ID());
		rdat.addFlashAttribute("msg", "삭제");
		return "redirect:/admin/member/list_member.do";
	}
	
	@RequestMapping(value="/admin/member/view_member.do",method=RequestMethod.GET)
	public String view_member(@ModelAttribute("pageVO") PageVO pageVO,Model model,@RequestParam("emplyr_id") String emplyr_id) throws Exception {
		//회원 보기[수정] 페이지 이동.
		EmployerInfoVO memberVO = memberService.viewMember(emplyr_id);
		model.addAttribute("memberVO", memberVO);
		//공통코드 로그인활성/비활성 해시맵 오브젝트 생성(아래)
		//System.out.println("디버그:" + memberService.selectCodeMap("COM999"));
		//맵결과: 디버그:{P={CODE=P, CODE_NM=활성}, S={CODE=S, CODE_NM=비활성}}
		model.addAttribute("codeMap", memberService.selectCodeMap("COM999"));
		//그룹이름 해시맵 오브젝트 생성(아래)
		model.addAttribute("codeGroup", memberService.selectGroupMap());
		return "admin/member/view_member";
	}
	
	@RequestMapping(value="/admin/member/insert_member.do",method=RequestMethod.GET)
	public String insert_member(Model model) throws Exception {
		//입력폼 호출
		model.addAttribute("codeMap", memberService.selectCodeMap("COM999"));
		model.addAttribute("codeGroup", memberService.selectGroupMap());
		return "admin/member/insert_member"; 
	}
	@RequestMapping(value="/admin/member/insert_member.do",method=RequestMethod.POST)
	public String insert_member(EmployerInfoVO memberVO,RedirectAttributes rdat) throws Exception {
		//입력DB처리 호출: 1.암호를 egov암호화툴로 암호, 2.ESNTL_ID 고유ID(게시판관리자ID) 생성
		String formPassword = memberVO.getPASSWORD();//jsp입력폼에서 전송된 암호값GET
		String encPassword = EgovFileScrty.encryptPassword(formPassword, memberVO.getEMPLYR_ID());
		memberVO.setPASSWORD(encPassword);//egov암호화툴로 암호화된 값SET
		memberVO.setESNTL_ID("USRCNFRM_" + memberVO.getEMPLYR_ID());//고유ID값 SET
		memberService.insertMember(memberVO);
		rdat.addFlashAttribute("msg", "입력");
		return "redirect:/admin/member/list_member.do";
	}
	@RequestMapping(value="/admin/member/update_member.do",method=RequestMethod.POST)
	public String update_member(EmployerInfoVO memberVO,RedirectAttributes rdat) throws Exception {
		//회원 수정 페이지 DB처리
		if(memberVO.getPASSWORD() != null && !"".equals(memberVO.getPASSWORD())) {
			String formPassword = memberVO.getPASSWORD();//GET
			String encPassword = EgovFileScrty.encryptPassword(formPassword, memberVO.getEMPLYR_ID());
			memberVO.setPASSWORD(encPassword);//SET
		}
		memberService.updateMember(memberVO);
		rdat.addFlashAttribute("msg", "수정");//아래 view_member.jsp로 변수 msg값을 전송합니다.
		return "redirect:/admin/member/view_member.do?emplyr_id=" + memberVO.getEMPLYR_ID();
	}
	
	@RequestMapping(value="/admin/member/list_member.do",method=RequestMethod.GET)
	public String list_member(Model model,@ModelAttribute("pageVO") PageVO pageVO) throws Exception {
		//회원관리 페이지 이동.
		if(pageVO.getPage() == null) {
			pageVO.setPage(1);
		}		
		pageVO.setPerPageNum(5);//하단의 페이징보여줄 개수
		pageVO.setQueryPerPageNum(10);//쿼리에서 1페이당 보여줄 개수=화면에서 1페이당 보여줌
		List<EmployerInfoVO> listMember = memberService.selectMember(pageVO);
		//전체페이지 개수는 자동계산=total카운트를 계산순간(아래)
		System.out.println("현재 검색된 회원의 total카운트는 : " + listMember.size());
		pageVO.setTotalCount(listMember.size());
		model.addAttribute("listMember", listMember);
		//model.addAttribute("pageVO", pageVO); jsp로 보내는 대신에 @ModelAttribute사용
		return "admin/member/list_member";
	}
	@RequestMapping(value="/admin/home.do", method=RequestMethod.GET)
	public String home(Model model) throws Exception {
		// 사용자권한 처리 new
		if(!commUtil.getAuthorities()) {
			model.addAttribute("msg","관리자그룹만 접근이 가능합니다.\\n사용자홈페이지로 이동");
	    	return "home.tiles";
		}
		//관리자메인 페이지로 이동
		return "admin/home";
	}
}