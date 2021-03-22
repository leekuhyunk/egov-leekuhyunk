<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<script>
function fn_egov_select_noticeList(pageNo) {
    document.search_form.pageIndex.value = pageNo;
    document.search_form.submit();  
}
</script>
<style>
.select {
	padding: 5px;
    margin-top: 1px;
    height: 35px;
    border: 1px solid #ccc;
}
.btn_submit {
	cursor: pointer;
    border: none;
    background: none;
    font-size: 0.95em;
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
			<!-- 검색폼영역 -->
			<form id="search_form" name="search_form" action="<c:url value='/tiles/board/list_board.do' />" class="minisrch_form">
				<fieldset>
					<legend>검색</legend>
					<select name="searchCnd" class="select">
						<option value="0" <c:out value='${searchVO.searchCnd=="0"?"selected":""}' />>제목</option>
						<option value="1" <c:if test="${searchVO.searchCnd=='1'}">selected</c:if> >내용</option>
						<option value="2" <c:if test="${searchVO.searchCnd=='2'}">selected</c:if> >작성자</option>
					</select>
					<input value="${searchVO.searchWrd}" name="searchWrd" type="text" class="tbox" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요">
					<button class="btn_srch">검색</button>
				</fieldset>
				<input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>" />
				<input type="hidden" name="nttId"  value="0" />
				<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
				<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
				<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
				<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
			</form>
			<!-- //검색폼영역 -->
			
			<!-- 게시물리스트영역 -->
			<table class="bbsListTbl" summary="번호,제목,조회수,작성일 등을 제공하는 표">
				<caption class="hdd">공지사항  목록</caption>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">조회수</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${resultList}" var="result" varStatus="cnt">
					<tr>
						<td>
						${paginationInfo.totalRecordCount+1-((searchVO.pageIndex-1)*searchVO.pageSize+cnt.count)}
						</td>
						<td class="tit_notice">
						<form name="view_form" action="<c:url value='/tiles/board/view_board.do' />" method="post">
	                      <!-- 답글일경우 계단식표시 추가(아래) -->
	                      <c:if test="${result.replyLc!=0}">
			                <c:forEach begin="0" end="${result.replyLc}" step="1">
			                    &nbsp;<!-- 들여쓰기 역할하는 스페이스바 특수문자 -->
			                </c:forEach>
			                &#8627;<!-- 화살표 특수문자 -->
			              </c:if>
	                      	<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
	                        <input type="hidden" name="nttId"  value="<c:out value="${result.nttId}"/>" />
	                        <input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
	                        <input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
	                        <input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
	                        <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
	                        <button class="btn_submit" style="cursor:pointer;"><c:out value="${result.nttSj}" /></button>
	                      </form>
						</td>
						<td>${result.inqireCo}</td>
						<td>${result.frstRegisterPnttm}</td>
					</tr>
				</c:forEach>	
				</tbody>
			</table>
			<!-- //게시물리스트영역 -->
			
			<!-- 페이징처리 시작 -->
            <div class="pagination">
            	<ui:pagination paginationInfo="${paginationInfo}" type="paging" jsFunction="fn_egov_select_noticeList" /> 
           	</div>
	  		<!-- 페이징처리 끝 --> 
	  		
			<p class="btn_line">
				<a href="<c:url value='/tiles/board/insert_board_form.do?bbsId=${boardVO.bbsId}' />" class="btn_baseColor">등록</a>
			</p>
		</div>
		<!-- //메인본문영역 -->
	</div>
	<!-- //메이콘텐츠영역 -->