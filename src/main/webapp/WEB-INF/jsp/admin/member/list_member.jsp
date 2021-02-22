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
            <h1 class="m-0">회원리스트</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">회원리스트</li>
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
            <div class="card"><!-- 부트스트랩의 카드 클래스:네모난 디자인 -->
              <div class="card-header">
                <h3 class="card-title">멤버 검색</h3>

                <div class="card-tools">
                  
                  <form name="search_form" action="<c:url value='/' />admin/member/list_member.do" method="get">
                  <div class="input-group input-group-sm">
                    <!-- 부트스트랩 템플릿만으로는 디자인처리가 부족한 경우가 있기 때문에 종종 인라인 스타일 사용 -->
                    <div>
                        <select name="search_type" class="form-control">
                            <option value="all" selected>-전체-</option>
                            <option value="user_id" data-select2-id="8">ID</option>
                            <option value="user_name" data-select2-id="16">이름</option>
                        </select>
                    </div>
                    <div>
                    <input type="text" name="search_keyword" class="form-control float-right" placeholder="Search">
					</div>
                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default">
                        <i class="fas fa-search"></i>
                      </button>
                    </div>
                  </div>
                  </form>
                  
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                  <thead>
                    <tr>
                      <th>EMPLYR_ID</th><!-- 테이블 헤드 타이틀태그th -->
                      <th>USER_NM</th>
                      <th>EMAIL_ADRES</th>
                      <th>EMPLYR_STTUS_CODE</th>
                      <th>SBSCRB_DE</th>
                      <th>GROUP_ID</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${listMember}" var="memberVO">
                    <tr>
                      <td><a href="<c:url value='/admin/member/view_member.do?emplyr_id=${memberVO.EMPLYR_ID}&pageVO=${pageVO}&search_type=${pageVO.search_type}&search_keyword=${pageVO.search_keyword}' />">${memberVO.EMPLYR_ID}</a></td>
                      <!-- 위에 a링크값은 리스트가 늘어날 수록 동적으로 user_id값이 변하게 됩니다. 개발자가 jsp처리 -->
                      <td>${memberVO.USER_NM}</td>
                      <td>${memberVO.EMAIL_ADRES}</td>
                      <td>${memberVO.EMPLYR_STTUS_CODE}</td>
                      <td>
                      <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${memberVO.SBSCRB_DE}" />
                      </td>
                      <td><span class="badge bg-danger">${memberVO.GROUP_ID}</span></td>
                      <!-- 권한표시는 부트스트랩 뺏지 클래스 사용 -->
                    </tr>
                  </c:forEach>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            
            </div>
            <!-- /.card -->
            
            <!-- 버튼영역 시작 -->
              <div class="card-body">
              	<a href="<c:url value='/admin/member/insert_member.do' />" class="btn btn-primary float-right">등록</a>
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
              
            <!-- 페이징처리 시작 -->
            <div class="pagination justify-content-center">
            	<ul class="pagination">
            	 <c:if test="${pageVO.prev}">
	            	 <li class="paginate_button page-item previous" id="example2_previous">
	            	 <a href="<c:url value='/' />admin/member/list_member.do?page=${pageVO.startPage-1}&search_type=${pageVO.search_type}&search_keyword=${pageVO.search_keyword}" aria-controls="example2" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
	            	 </li>
	            	 <!-- 위 이전게시물링크 -->
            	 </c:if>
            	 
            	 <!-- jstl for문이고, 향상된 for문이아닌 고전for문으로 시작값, 종료값 var변수idx는 인덱스값이 저장되어 있습니다. -->
            	 <c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="idx">
            	 	<li class='paginate_button page-item <c:out value="${idx==pageVO.page?'active':''}" />'>
            	 	<a href="<c:url value='/' />admin/member/list_member.do?page=${idx}&search_type=${pageVO.search_type}&search_keyword=${pageVO.search_keyword}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">${idx}</a></li>
            	 </c:forEach>

            	 <c:if test="${pageVO.next}">
	            	 <!-- 아래 다음게시물링크 -->
	            	 <li class="paginate_button page-item next" id="example2_next">
	            	 <a href="<c:url value='/' />admin/member/list_member.do?page=${pageVO.endPage+1}&search_type=${pageVO.search_type}&search_keyword=${pageVO.search_keyword}" aria-controls="example2" data-dt-idx="7" tabindex="0" class="page-link">Next</a>
	            	 </li>
            	 </c:if>
            	 </ul>
            </div>
	  		<!-- 페이징처리 끝 -->     
            
          </div>
        </div>
        
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

<%@ include file="../include/footer.jsp" %>  