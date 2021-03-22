<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.btn_bbs {
	border: none;
    margin-bottom: 0px;
    cursor: pointer;
}
</style>
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
			<ul class="bbsview_list">
				<li class="bbs_title">${result.nttSj}</li>
				<li class="bbs_hit">작성일 : <span>${result.frstRegisterPnttm}</span></li>
				<li class="bbs_date">조회수 : <span>${result.inqireCo}</span></li>
				<li class="bbs_content">
					<div class="editer_content" style="line-height:1.8em">
					    ${result.nttCn}
                    </div>
				</li>
				<c:if test="${not empty result.atchFileId}">
				<li class="bbs_title">
				첨부파일: 
	                <c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
	                    <c:param name="param_atchFileId" value="${result.atchFileId}" />
	                </c:import>
				</li>
				</c:if>
			</ul>
			<p class="btn_line txt_right">
				<button id="btn_list" type="button" class="btn_bbs">목록</button>
				<c:if test="${LoginVO.id ne null}">
            	<button id="btn_delete" type="button" class="btn_bbs">삭제</button>
				<button id="btn_update" type="button" class="btn_bbs">수정</button>
				</c:if>
			</p>
			
		</div>
		<!-- //메인본문영역 -->
	</div>
	<!-- //메이콘텐츠영역 -->
<form name="frm" method="post" action="<c:url value='/tiles/board/list_board.do'/>">
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
	<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" >
	<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" >
	<input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>" >
	<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" >
	<input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>" >
	<input type="hidden" name="nttSj" value="<c:out value='${result.nttSj}'/>" >
	<input type="hidden" name="atchFileId" value="${result.atchFileId}">
	<input type="hidden" name="fileSn" value="0">
</form>
<script>
$(document).ready(function(){
	var action_form = $("form[name='frm']");
	$("#btn_list").on("click",function(){
		action_form.submit();
	});
	$("#btn_delete").on("click",function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			action_form.attr("action","<c:url value='/tiles/board/delete_board.do' />");
			action_form.submit();
		}	
	});
	$("#btn_update").on("click",function(){
		//alert("준비중 입니다.");
		action_form.attr("action","<c:url value='/tiles/board/update_board_form.do' />");
		action_form.submit();
	});
});
</script>