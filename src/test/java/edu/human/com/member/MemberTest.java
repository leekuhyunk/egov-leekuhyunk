package edu.human.com.member;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.human.com.member.service.EmployerInfoVO;
import edu.human.com.member.service.MemberService;
import edu.human.com.util.PageVO;
import egovframework.let.utl.sim.service.EgovFileScrty;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={
		"file:src/main/webapp/WEB-INF/config/egovframework/springmvc/egov-com-servlet.xml",
		"file:src/main/resources/egovframework/spring/com/*.xml"}
)
@WebAppConfiguration
public class MemberTest {
	@Inject
	private DataSource dataSource;
	
	@Inject
	private MemberService memberService;
	
	@Test
	public void updateMember() throws Exception {
		EmployerInfoVO memberVO = new EmployerInfoVO();
		memberVO.setEMPLYR_ID("user_1");//수정할 고유ID값 지정
		memberVO.setUSER_NM("사용자_1");
		memberVO.setORGNZT_ID("ORGNZT_0000000000000");//외래키이기때문에
		//암호값에 공백이면, 쿼리에서 제외됩니다.
		String secPassword = "";
		memberVO.setPASSWORD(secPassword);
		memberVO.setEMAIL_ADRES(memberVO.getEMPLYR_ID() + "@abc.com");
		memberVO.setPASSWORD_HINT("사는동네는?");//널체크에러때문에 질문추가
		//암호힌트에대한 답변(아래)
		memberVO.setPASSWORD_CNSR("쌍용동");
		memberVO.setSEXDSTN_CODE("F");
		memberVO.setHOUSE_ADRES("집주소");
		memberVO.setGROUP_ID("GROUP_00000000000000");//외래키이기때문에 부모테이블에 있는값을 넣어야 함.
		memberVO.setEMPLYR_STTUS_CODE("P");//회원상태코드 P-활성,S-비활성
		//memberVO.setESNTL_ID("USRCNFRM_00000000000");//고유ID이기때문에
		memberService.updateMember(memberVO);
	}
	@Test
	public void deleteMember() throws Exception {
		int result = memberService.deleteMember("user_1");
		if(result > 0) {
			System.out.println("디버그: 정상적으로 삭제 되었습니다.");
		} else {
			System.out.println("디버그: 삭제된 값이 없습니다.");
		}
		
	}
	@Test
	public void insertMember() throws Exception {
		EmployerInfoVO memberVO = new EmployerInfoVO();//고전방식 객체생성
		//memberVO에 set으로 값을 입력한 이후 DB에 인서트함.
		//emplyr_id는 기본키이기 때문에 중복허용하지 않게 처리(아래)
		PageVO pageVO = new PageVO();
		List<EmployerInfoVO> memberList = memberService.selectMember(pageVO);
		memberVO.setEMPLYR_ID("user_" + (memberList.size()+1));
		memberVO.setORGNZT_ID("ORGNZT_0000000000000");//외래키이기때문에
		memberVO.setUSER_NM("사용자_" + memberList.size());
		//암호화 작업(아래) 스프링시큐리티X, egov전용 시큐리티암호화("입력한문자","입력한ID")
		String secPassword = EgovFileScrty.encryptPassword("1234",memberVO.getEMPLYR_ID());
		memberVO.setPASSWORD(secPassword);
		memberVO.setEMAIL_ADRES("abc@abc.com");
		memberVO.setPASSWORD_HINT("사는동네는?");//널체크에러때문에 질문추가
		//암호힌트에대한 답변(아래)
		memberVO.setPASSWORD_CNSR("쌍용동");
		memberVO.setSEXDSTN_CODE("F");
		memberVO.setHOUSE_ADRES("집주소");
		memberVO.setGROUP_ID("GROUP_00000000000000");//외래키이기때문에 부모테이블에 있는값을 넣어야 함.
		memberVO.setEMPLYR_STTUS_CODE("P");//회원상태코드 P-활성,S-비활성
		memberVO.setESNTL_ID("USRCNFRM_" + (memberList.size()+1));//고유ID이기때문에 중복되면 않됨
		memberService.insertMember(memberVO);
	}
	@Test
	public void viewMember() throws Exception {
		EmployerInfoVO memberVO = memberService.viewMember("admin");
		System.out.println("admin회원의 상세정보는 "+memberVO.toString());
	}
	@Test
	public void selectMember() throws Exception {
		PageVO pageVO = new PageVO();
		pageVO.setPage(1);
		pageVO.setPerPageNum(5);//하단의 페이징보여줄 개수
		pageVO.setQueryPerPageNum(10);//쿼리에서 1페이당 보여줄 개수=화면에서 1페이당 보여줌
		List<EmployerInfoVO> listMember = memberService.selectMember(pageVO);
		//전체페이지 개수는 자동계산=total카운트를 계산순간(아래)
		pageVO.setTotalCount(listMember.size());
		List<EmployerInfoVO> memberList = memberService.selectMember(pageVO);
		for(EmployerInfoVO member:memberList) {
			System.out.println("현재 등록되 회원은 " + member.toString());
		}
	}
	@Test
	public void dbConnect_test() throws SQLException {
		Connection connect = dataSource.getConnection();
		System.out.println("데이터베이스 커넥션 결과: " + connect);
	}
	@Test
	public void junit_test() {
		System.out.println("JUnit실행 확인");
	}
}