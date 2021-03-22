<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<c:url value='/resources/home/css/join.css' />">
	<!-- 메인콘텐츠영역 -->
	<div id="container">
		<!-- 메인상단위치표시영역 -->
		<div class="location_area customer">
			<div class="box_inner">
				<h2 class="tit_page">스프링 <span class="in">in</span> 자바</h2>
				<p class="location">고객센터 <span class="path">/</span> 마이페이지</p>
				<ul class="page_menu clear">
					<li><a href="#" class="on">마이페이지</a></li>
				</ul>
			</div>
		</div>	
		<!-- //메인상단위치표시영역 -->

		<!-- 메인본문영역 -->
		<div class="bodytext_area box_inner">
			<!-- 폼영역 -->
			<form method="POST" name="mypage_form" action="<c:url value='/tiles/member/mypage.do' />" class="appForm">
				<fieldset>
					<legend>마이페이지폼</legend>
					<p class="info_pilsoo pilsoo_item">필수입력</p>
					<ul class="app_list">
						<li class="clear">
							<label for="EMPLYR_ID" class="tit_lbl pilsoo_item">아이디</label>
							<div class="app_content">
							<input readonly value="${memberVO.EMPLYR_ID}" type="text" name="EMPLYR_ID" class="w100p" id="EMPLYR_ID" placeholder="아이디를 입력해주세요" required/></div>
						</li>
						<li class="clear">
							<label for="password_lbl" class="tit_lbl pilsoo_item">비밀번호</label>
							<div class="app_content">
							<input type="password" name="PASSWORD" class="w100p" id="password_lbl" placeholder="비밀번호를 입력해주세요"/></div>
						</li>
						<li class="clear">
							<label for="password_hint_lbl" class="tit_lbl pilsoo_item">암호힌트</label>
							<div class="app_content">
							<input value="${memberVO.PASSWORD_HINT}" type="text" name="PASSWORD_HINT" class="w100p" id="password_hint_lbl" placeholder="암호힌트를 입력해주세요" required/></div>
						</li>
						<li class="clear">
							<label for="password_cnsr_lbl" class="tit_lbl pilsoo_item">암호힌트답변</label>
							<div class="app_content">
							<input value="${memberVO.PASSWORD_CNSR}" type="text" name="PASSWORD_CNSR" class="w100p" id="password_cnsr_lbl" placeholder="암호힌트답변을 입력해주세요" required/></div>
						</li>
						<li class="clear">
							<label for="user_nm_lbl" class="tit_lbl pilsoo_item">이름</label>
							<div class="app_content">
							<input value="${memberVO.USER_NM}" type="text" name="USER_NM" class="w100p" id="user_nm_lbl" placeholder="이름을 입력해주세요" required/></div>
						</li>
						<li class="clear">
							<label for="sexdstn_code_lbl" class="tit_lbl pilsoo_item">성별</label>
							<div class="app_content radio_area">
								<input value="M" type="radio" name="SEXDSTN_CODE" class="css-radio" id="man_lbl" <c:out value="${memberVO.SEXDSTN_CODE=='M'?'checked':''}" /> />
								<label for="man_lbl">남</label>
								<input value="F" type="radio" name="SEXDSTN_CODE" class="css-radio" id="woman_lbl" <c:out value="${memberVO.SEXDSTN_CODE=='F'?'checked':''}" /> />
								<label for="woman_lbl">여</label>
							</div>
						</li>
						<li class="clear">
							<label for="email_adres_lbl" class="tit_lbl pilsoo_item">이메일</label>
							<div class="app_content">
							<input value="${memberVO.EMAIL_ADRES}" type="email" name="EMAIL_ADRES" class="w100p" id="email_adres_lbl" placeholder="이메일을 입력해주세요" required/></div>
						</li>
						<li class="clear">
							<label for="house_adres_lbl" class="tit_lbl pilsoo_item">집주소</label>
							<div class="app_content">
							<input value="${memberVO.HOUSE_ADRES}" type="text" name="HOUSE_ADRES" class="w100p" id="house_adres_lbl" placeholder="집주소를 입력해주세요" required/></div>
						</li>
						
						<li class="clear">
							<label for="agree_lbl" class="tit_lbl pilsoo_item">개인정보활용동의</label>
							<div class="app_content checkbox_area"><input type="checkbox"" name="agree" class="css-checkbox" id="agree_lbl" required checked/>
							<label for="agree_lbl" class="agree">동의함</label>
							</div>
						</li>
					</ul>
					<p class="btn_line">
						<button id="btn_delete" type="button" class="btn_baseColor">회원탈퇴</button>
						<button type="submit" class="btn_baseColor">회원수정</button>
					</p>	
				</fieldset>
				<input type="hidden" name="ORGNZT_ID" value="${memberVO.ORGNZT_ID}">
				<input type="hidden" name="EMPLYR_STTUS_CODE" value="${memberVO.EMPLYR_STTUS_CODE}">
				<input type="hidden" name="GROUP_ID" value="${memberVO.GROUP_ID}">
				<input type="hidden" name="ESNTL_ID" value="${memberVO.ESNTL_ID}">
			</form>
			<!-- //폼영역 -->
		</div>
		<!-- //메인본문영역 -->
	</div>
	<!-- //메이콘텐츠영역 -->
<script>
$(document).ready(function(){
	$("#btn_delete").on("click", function(){
		//alert("회원탈퇴기능은 준비중 입니다.");
		if(confirm("진짜로 탈퇴하시겠습니까?")) {
			var form = $("form[name='mypage_form']");
			form.attr("action","<c:url value='/tiles/member/mypage_delete.do' />");
			//$(form "input[name='EMPLYR_STTUS_CODE']").val("S");//대신에 컨트롤러에서 처리합니다.
			form.submit();
		}
	});
});
</script>