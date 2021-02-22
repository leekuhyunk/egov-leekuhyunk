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
              <li class="breadcrumb-item active">글상세보기</li>
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
                ${result.ntcrId}
                </p>
                <c:if test="${not empty result.atchFileId}">
                <hr>
                <strong><i class="far fa-save mr-1"></i> 첨부파일</strong>
                <p class="text-muted"><a href="#">파일다운로드</a></p>
                </c:if>
              </div>
              <!-- /.card-body -->
            </div>
          <!-- 버튼영역 시작 -->
          <div class="card-body">
            	<a href="board_list.html" class="btn btn-primary float-right mr-1">LIST ALL</a>
              	<a href="board_list.html" class="btn btn-danger float-right mr-1">DELETE</a>
				<a href="board_write.html" class="btn btn-warning float-right mr-1 text-white">UPDATE</a>              	
              	<!-- 부트스트랩 디자인 버튼클래스를 이용해서 a태그를 버튼모양 만들기(위) -->
              	<!-- btn클래스명이 버튼모양으로 변경, btn-primary클래스명은 버튼색상을 변경하는역할 -->
              	<!-- 
              	어떻게 스타일이 아닌 클래스에다가 넣어줌으로서 모양과 위치과 바뀌는건가요?
              	... 생각하는 부트스트랩은 html과 css를 모아놓은 집합체라고 생각하는데 
              	거기에 float-right클라스로 정해놓은곳에 오른쪽으로 가게하는 스타일이 지정되어있어서 = 부트스트랩
              	클래스 이름만 지정해줘도 그 클래스로 지정된 스타일이 적용되어서 
              	클래스 이름 지정만으로도 스타일이 적용된다고 보면...          	
              	 -->
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