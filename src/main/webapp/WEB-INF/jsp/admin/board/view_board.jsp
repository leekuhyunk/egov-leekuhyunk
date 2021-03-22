<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

  <!-- 대시보드 본문 Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- 본문헤더 Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">${brdMstrVO.bbsNm} 글상세보기</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">${brdMstrVO.bbsNm} 글상세보기</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- 본문내용 Main content -->
    <section class="content">
      <div class="container-fluid">
        
        <div class="row"><!-- 부트스트랩의 디자인 클래스 row -->
          <div class="col-12"><!-- 그리드시스템중 12가로칼럼 width:100% -->
          <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">READ Board</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <strong><i class="fas fa-book mr-1"></i> title</strong>
                <p class="text-muted">${result.nttSj}</p>

                <hr><!-- horizontal 수평선 태그 -->
                <strong><i class="fas fa-map-marker-alt mr-1"></i> content</strong>
                <p class="text-muted">
                	${result.nttCn}
                </p>
				<!-- 부트스트랩 오른쪽여백주기클래스명mr-1:(margin-right: .25rem!important;) -->
                <hr>
                <strong><i class="fas fa-pencil-alt mr-1"></i> 작성자</strong>
                <p class="text-muted">
                ${result.frstRegisterNm}
                </p>
                <c:if test="${not empty result.atchFileId}">
	                <hr>
	                <strong><i class="far fa-save mr-1"></i> 첨부파일</strong>
	                <p class="text-muted">
	                <c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
	                    <c:param name="param_atchFileId" value="${result.atchFileId}" />
	                </c:import>
	                </p>
                </c:if>
              </div>
              <!-- /.card-body -->
            </div>
          <!-- 버튼영역 시작 -->
          <div class="card-body">
            <button id="btn_list" type="button" class="btn btn-primary float-right mr-1">목록</button>
            <button id="btn_delete" type="button" class="btn btn-danger float-right mr-1">삭제</button>
			<button id="btn_update" type="button" class="btn btn-warning float-right mr-1 text-white">수정</button>              	
          </div>
          <!-- 버튼영역 끝 -->
          </div><!-- //col-12 -->
        </div><!-- //row -->
        
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
<%@ include file="../include/footer.jsp" %>
<form name="frm" method="post" action="<c:url value='/admin/board/list_board.do'/>">
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
	<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" >
	<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" >
	<input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>" >
	<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" >
	<input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>" >
	<input type="hidden" name="nttSj" value="<c:out value='${result.nttSj}'/>" >
	<input type="hidden" name="atchFileId" value="${result.atchFileId}">
	<input type="hidden" name="fileSn" value="0" >
</form>
<script>
$(document).ready(function(){
	var action_form = $("form[name='frm']");
	$("#btn_list").on("click",function(){
		action_form.submit();
	});
	$("#btn_delete").on("click",function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			action_form.attr("action","<c:url value='/admin/board/delete_board.do' />");
			action_form.submit();
		}	
	});
	$("#btn_update").on("click",function(){
		//alert("준비중 입니다.");
		action_form.attr("action","<c:url value='/admin/board/update_board_form.do' />");
		action_form.submit();
	});
});
</script>