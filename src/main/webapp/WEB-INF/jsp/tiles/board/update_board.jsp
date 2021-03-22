<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Font Awesome -->
<link rel="stylesheet" href="<c:url value='/' />resources/plugins/fontawesome-free/css/all.min.css">
<!-- Bootstrap 4 -->
<link rel="stylesheet" href="<c:url value='/' />resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<script src="<c:url value='/' />resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLte -->
<link rel="stylesheet" href="<c:url value='/' />resources/dist/css/adminlte.min.css">	
<!-- write.html은 섬머노트 웹에디터 부분 추가(아래) -->
<link rel="stylesheet" href="<c:url value='/' />resources/plugins/summernote/summernote.css">
<script src="<c:url value='/' />resources/plugins/summernote/summernote.js"></script>
<!-- 메인콘텐츠영역 -->
	<div id="container">
		<!-- 메인상단위치표시영역 -->
		<div class="location_area customer">
			<div class="box_inner">
				<h2 class="tit_page">스프링 <span class="in">in</span> 자바</h2>
				<p class="location">고객센터 <span class="path">/</span> ${brdMstrVO.bbsNm}</p>
				<ul class="page_menu clear">
					<li><a href="<c:url value='/tiles/board/list_board.do?bbsId=BBSMSTR_AAAAAAAAAAAA' />" class="<c:out value='${brdMstrVO.bbsId=="BBSMSTR_AAAAAAAAAAAA"?"on":""}' />">공지사항</a></li>
					<li><a href="<c:url value='/tiles/board/list_board.do?bbsId=BBSMSTR_BBBBBBBBBBBB' />" class="<c:out value='${brdMstrVO.bbsId=="BBSMSTR_BBBBBBBBBBBB"?"on":""}' />">겔러리</a></li>
				</ul>
			</div>
		</div>	
		<!-- //메인상단위치표시영역 -->

		<!-- 메인본문영역 -->
		<div class="bodytext_area box_inner">
			<!-- 폼영역 -->
			<form encType="multipart/form-data" method="POST" name="form_insert" action="<c:url value='/tiles/board/update_board.do' />" class="appForm">
				<fieldset>
					<legend>상담문의 입력 양식</legend>
					<p class="info_pilsoo pilsoo_item">필수입력</p>
					<ul class="app_list">
						<li class="clear">
							<label for="title_lbl" class="tit_lbl pilsoo_item">제목</label>
							<div class="app_content">
							<input value="${result.nttSj}" type="text" name="nttSj" class="w100p" id="title_lbl" placeholder="제목을 입력해주세요" required/>
							</div>
						</li>
						<li class="clear">
							<label for="content_lbl" class="tit_lbl pilsoo_item">내용</label>
							<div class="app_content">
								<textarea name="nttCn" id="content_lbl" class="w100p" placeholder="내용을 입력해주세요." required><c:out value="${result.nttCn}" /></textarea></div>
						</li>
						<li class="clear">
							<label for="name_lbl" class="tit_lbl pilsoo_item">작성자명</label>
							<div class="app_content">
							<input disabled value="${LoginVO.name}" type="text" name="frstRegisterNm" class="w100p" id="name_lbl" placeholder="이름을 입력해주세요" required/>
							</div>
						</li>
						<c:if test="${not empty result.atchFileId}">
						<li class="clear">
							<label for="" class="tit_lbl">첨부파일</label>
							<div class="app_content" style="border:none;">
							<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
	                    		<c:param name="param_atchFileId" value="${result.atchFileId}" />
	                		</c:import>
							</div>
						</li>
						</c:if>
						<li class="clear">
		                    <label for="file_lbl" class="tit_lbl">첨부파일</label>
		                    <div class="custom-file" style="width:96%;margin:0 2%;">
			                    <input type="file" name="file" class="custom-file-input" id="customFile">
			                    <label class="custom-file-label" for="customFile" style="color:#999;">파일첨부</label>
			                </div>
		                </li>
					</ul>
					<p class="btn_line">
					<button type="submit" class="btn_baseColor">수정</button>
					<button type="button" id="btn_view" class="btn_baseColor">이전</button>
					<button type="button" id="btn_list" class="btn_baseColor">목록</button>
					</p>	
				</fieldset>
				<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
				<input type="hidden" name="returnUrl" value="<c:url value='/cop/bbs/forUpdateBoardArticle.do'/>"/>
				<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
				<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" />
				<input type="hidden" name="bbsAttrbCode" value="<c:out value='${bdMstr.bbsAttrbCode}'/>" />
				<input type="hidden" name="bbsTyCode" value="<c:out value='${bdMstr.bbsTyCode}'/>" />
				<input type="hidden" name="replyPosblAt" value="<c:out value='${bdMstr.replyPosblAt}'/>" />
				<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${bdMstr.fileAtchPosblAt}'/>" />
				<input type="hidden" name="posblAtchFileNumber" value="<c:out value='${bdMstr.posblAtchFileNumber}'/>" />
				<input type="hidden" name="posblAtchFileSize" value="<c:out value='${bdMstr.posblAtchFileSize}'/>" />
				<input type="hidden" name="tmplatId" value="<c:out value='${bdMstr.tmplatId}'/>" />
				<input type="hidden" name="ntcrNm" value="dummy">   <!-- validator 처리를 위해 지정 -->
				<input type="hidden" name="password" value="dummy"> <!-- validator 처리를 위해 지정 -->
				<input name="ntceBgnde" type="hidden" value="10000101">
				<input name="ntceEndde" type="hidden" value="99991231">
				
				<input type="hidden" name="fileSn" value="0">
			</form>
			<!-- //폼영역 -->
		</div>
		<!-- //메인본문영역 -->
	</div>
	<!-- //메이콘텐츠영역 -->
	<!-- 버튼액션 J쿼리(아래) -->
	<script>
	$(document).ready(function(){
		var form_element = $("form[name='form_insert']");
		$("#btn_view").on("click",function(){
			form_element.attr("action","<c:url value='/tiles/board/view_board.do' />");
			form_element.submit();
		});
		$("#btn_list").on("click",function(){
			form_element.attr("action","<c:url value='/tiles/board/list_board.do' />");
			form_element.submit();
		});
	});
	</script>
	<!-- 첨부파일 부트스트랩 디자인 JS -->
	<script src="<c:url value='/' />resources/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
	<!-- 첨부파일 선택한 내용 출력 실행 -->
	<script>
	$(document).ready(function () {
	  bsCustomFileInput.init();
	});
	</script>
	<script>
	$(document).ready(function(){
		$('#content_lbl').summernote({
			height:150,
			lang:"ko-KR",
			placeholder:'글 내용을 입력해 주세요',
			toolbar: [
					    ['fontname', ['fontname']],
					    ['fontsize', ['fontsize']],
					    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
					    ['color', ['forecolor','color']],
					    ['table', ['table']],
					    ['para', ['ul', 'ol', 'paragraph']],
					    ['height', ['height']],
					    ['insert',['link','video']],//'picture',
					    ['view', ['fullscreen', 'help']]
					],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		});
	});//textarea 중 content아이디영역을 섬머노트에디터로 변경처리 함수실행
	</script>