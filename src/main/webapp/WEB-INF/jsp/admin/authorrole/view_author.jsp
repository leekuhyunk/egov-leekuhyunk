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
            <h1 class="m-0">권한수정</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">권한수정</li>
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
          
          <!-- form start -->
          <form name="write_form" action="<c:url value='/admin/authorrole/update_author.do' />" method="post">
          
          <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">UPDATE AuthorRole</h3>
              </div>
              <!-- /.card-header -->
              
                <div class="card-body">
                  <div class="form-group">
                    <label for="ROLE_PTTRN">ROLE_PTTRN</label>
                    <input value="${result.ROLE_PTTRN}" type="text" class="form-control" name="ROLE_PTTRN" id="ROLE_PTTRN" placeholder="화면URL" required >
                    <!-- 폼에서 input같은 입력태그에는 name속성이 반드시 필요, 이유는 DB에 입력할때,
                    	 값을 전송하게 되는데, 전송값을 담아두는 이름이 name가 되고, 위에서는 user_id 입니다. -->
                  </div>
                  <div class="form-group">
                  	<label for="AUTHOR_CODE">AUTHOR_CODE</label>
                  	<select class="form-control" name="AUTHOR_CODE" id="AUTHOR_CODE">
                  		<c:forEach items="${codeGroup}" var="sub">
                  			<option value="${sub.value.group_nm}" <c:out value="${(result.AUTHOR_CODE eq sub.value.group_nm)?'selected':''}" /> >${sub.value.group_nm}</option>
                  		</c:forEach>
                  	</select>                  		
                  </div>
                  <div class="form-group">
                    <label for="AUTHORROLE_DC">AUTHORROLE_DC</label>
                    <input value="${result.AUTHORROLE_DC}" type="text" class="form-control" name="AUTHORROLE_DC" id="AUTHORROLE_DC" placeholder="권한설명" required>
                  </div>
                  <div class="form-group">
                    <label for="SORT_ORDR">SORT_ORDR</label>
                    <input value="${result.SORT_ORDR}" type="text" class="form-control" name="SORT_ORDR" id="SORT_ORDR" placeholder="권한적용순서" required>
                  </div>
                  <div class="form-group">
                  <label for="SORT_ORDR">USE_AT</label>
                  	<div class="form-check">
                  	<input class="form-check-input" type="radio" id="USE_Y" name="USE_AT" value="Y" <c:out value="${(result.USE_AT eq 'Y')?'checked':''}" />>
                    <label class="form-check-label" for="USE_Y">사용</label>
					<span style="display:inline-block;width:20px;"></span>
                    <input class="form-check-input" type="radio" id="USE_N" name="USE_AT" value="N" <c:out value="${(result.USE_AT eq 'N')?'checked':''}" />>
                    <label class="form-check-label" for="USE_N">미사용</label>
                    </div>
                  </div>
                  
                  
                </div>
                <!-- /.card-body -->
              
           </div>
          
          <!-- 버튼영역 시작 -->
            <div class="card-body">
            	<a href="<c:url value='/admin/authorrole/list_author.do?page=${pageVO.page}&search_type=${pageVO.search_type}&search_keyword=${pageVO.search_keyword}' />" class="btn btn-primary float-right mr-1">목록</a>
              	<button type="submit" class="btn btn-info float-right mr-1">수정</button>
              	<button id="btn_delete" type="button" class="btn btn-danger float-right mr-1">삭제</button>            	
              	<!-- a태그는 링크이동은 되지만, post값을 전송하지는 못합니다. 그래서, button태그를 사용. -->
            </div>
          <!-- 버튼영역 끝 -->
          <input type="hidden" name="AUTHORROLE_ID" value="${result.AUTHORROLE_ID}" />
          <input type="hidden" name="page" value="${pageVO.page}" />
          </form>
          <!-- 폼내부에 버튼이 있어야지만, 전송버튼이 작동 됩니다. -->
          
          </div>
        </div>
        
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

<%@ include file="../include/footer.jsp" %>
<script>
$(document).ready(function(){
	$("#btn_delete").on("click",function(){
		alert("준비중 입니다.");
		return false;
		if(confirm("정말로 삭제 하시겠습니까?")) {
			var delete_form = $("form[name='write_form']");
			delete_form.attr("action","<c:url value='/admin/authorrole/delete_author.do' />");
			delete_form.submit();
		}
	});
});
</script>