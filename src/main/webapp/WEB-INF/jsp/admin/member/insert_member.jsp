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
            <h1 class="m-0">회원등록</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">회원등록</li>
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
          <form name="write_form" action="<c:url value='/admin/member/insert_member.do' />" method="post">
          
          <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">INSERT Member</h3>
              </div>
              <!-- /.card-header -->
              
                <div class="card-body">
                  <div class="form-group">
                    <label for="EMPLYR_ID">EMPLYR_ID</label>
                    <input type="text" class="form-control" name="EMPLYR_ID" id="EMPLYR_ID" placeholder="ID를 입력해 주세요." required>
                    <!-- 폼에서 input같은 입력태그에는 name속성이 반드시 필요, 이유는 DB에 입력할때,
                    	 값을 전송하게 되는데, 전송값을 담아두는 이름이 name가 되고, 위에서는 user_id 입니다. -->
                  </div>
                  <div class="form-group">
                    <label for="PASSWORD">PASSWORD</label>
                    <input type="password" class="form-control" name="PASSWORD" id="PASSWORD" placeholder="암호를 입력해 주세요." required>
                  </div>
                  <div class="form-group">
                    <label for="PASSWORD_HINT">PASSWORD_HINT</label>
                    <input type="text" class="form-control" name="PASSWORD_HINT" id="PASSWORD_HINT" placeholder="암호힌트를 입력해 주세요." required>
                  </div>
                  <div class="form-group">
                    <label for="PASSWORD_CNSR">PASSWORD_CNSR</label>
                    <input type="text" class="form-control" name="PASSWORD_CNSR" id="PASSWORD_CNSR" placeholder="암호힌트 답변을 입력해 주세요." required>
                  </div>
                  <div class="form-group">
                  	<label for="USER_NM">USER_NM</label>
                  	<input type="text" class="form-control" name="USER_NM" id="USER_NM" placeholder="이름을 입력해 주세요." required>
                  	<!-- 필수입력 값은 html5에서 지원하는 유효성 검사중 required 속성을 사용해서 빈(null)값체크(유효성검사)를 합니다. -->
                  </div>
                  <div class="form-group">
                  	<label for="SEXDSTN_CODE">SEXDSTN_CODE</label>
                  	<select class="form-control" name="SEXDSTN_CODE" id="SEXDSTN_CODE">
                  		<option value="M" >남자</option>
                  		<option value="F" >여자</option>
                  	</select>
                  </div>
                  <div class="form-group">
                  	<label for="EMAIL_ADRES">EMAIL_ADRES</label>
                  	<input type="email" class="form-control" name="EMAIL_ADRES" id="EMAIL_ADRES" placeholder="이메일을 입력해 주세요" required>
                  </div>
                  <div class="form-group">
                  	<label for="HOUSE_ADRES">HOUSE_ADRES</label>
                  	<input type="text" class="form-control" name="HOUSE_ADRES" id="HOUSE_ADRES" placeholder="집주소를 입력해 주세요" required>
                  </div>
                  <div class="form-group">
                  	<label for="ORGNZT_ID">ORGNZT_ID</label>
                  	<input value="ORGNZT_0000000000000" type="text" class="form-control" name="ORGNZT_ID" id="ORGNZT_ID" placeholder="소속기관을 입력해 주세요" required readonly>
                  </div>
                  <div class="form-group">
                  	<label for="EMPLYR_STTUS_CODE">EMPLYR_STTUS_CODE</label>
                  	<select class="form-control" name="EMPLYR_STTUS_CODE" id="EMPLYR_STTUS_CODE">
	                  	<c:forEach items="${codeMap}" var="sub">
	                  		<option value="${sub.value.CODE}">${sub.value.CODE_NM}</option>
	                  	</c:forEach>
                  	</select>
                  	<!-- 위 코드 설명: 맵자료형을 jstl에서 출력하기 (아래) -->
                  	<!-- codeMap자료-> {P={CODE=P, CODE_NM=활성}, S={CODE=S, CODE_NM=비활성}} 
                  	<c:forEach items="${codeMap}" var="sub2">
                  		codeMap의 밸류를 분리하면 키는 ${sub2.value.CODE} 밸류는 ${sub2.value.CODE_NM}<br>
                  	</c:forEach>
                  	-->
                  </div>
                  <div class="form-group">
                  	<label for="GROUP_ID">GROUP_ID</label>
                  	<select class="form-control" name="GROUP_ID" id="GROUP_ID">
                  		<c:forEach items="${codeGroup}" var="sub">
                  			<option value="${sub.value.GROUP_ID}" >${sub.value.GROUP_NM}</option>
                  		</c:forEach>
                  	</select>                  		
                  </div>
                  <div class="form-group">
                  	<label for="ESNTL_ID">ESNTL_ID</label>
                  	<input type="text" class="form-control" name="ESNTL_ID" id="ESNTL_ID" placeholder="게시판관리 고유ID를 입력해 주세요" required readonly>
                  </div>
                </div>
                <!-- /.card-body -->
              
           </div>
          
          <!-- 버튼영역 시작 -->
            <div class="card-body">
            	<a href="<c:url value='/admin/member/list_member.do' />" class="btn btn-primary float-right mr-1">목록</a>
              	<button id="btn_insert" type="submit" class="btn btn-info float-right mr-1" disabled>등록</button>
              	<!-- a태그는 링크이동은 되지만, post값을 전송하지는 못합니다. 그래서, button태그를 사용. -->
            </div>
          <!-- 버튼영역 끝 -->
          
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
	//EMPYR_ID 중복체크 이후 submit버튼을 disabled를 false로 활성화 시키면 전송이 가능 Ajax
	//blur조건 focus의 반대말.
	$("#EMPLYR_ID").bind("blur", function(){
		var emplyr_id = $(this).val();
		$.ajax({
			url:"<c:url value='/' />idcheck.do?emplyr_id="+emplyr_id,//@ResponseBody사용하는 클래스의 메서드 매핑URL값 반환값이 페이지X,text입니다.
			type:"get",//jsp에서 컨트롤러로 보내는하는 방식
			dataType:"text",//ajax결과를 컨트롤러에서 받는 방식
			success:function(result){
				if(result=="0"){//중복id가 없으면
					alert("사용가능한 ID입니다.");
					$("#btn_insert").attr("disabled", false);//서브밋 버튼 활성화
				}else{//중복id가 있으면
					alert("중복ID가 존재합니다.");
					$("#btn_insert").attr("disabled", true);//서브밋 버튼 비활성화
				}
			},
			error:function(){
				alert("RestAPI서버에 문제가 있습니다.");
			}
		});
		
	});
});
</script>