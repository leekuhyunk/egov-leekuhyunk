<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 관리자단 푸터 시작 footer.jsp -->
  <footer class="main-footer">
    <strong>Copyright &copy; 2014-2020 <a href="https://adminlte.io">AdminLTE.io</a>.</strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> 3.1.0-rc
    </div>
  </footer>
  

  <!-- 로그아웃 영역 Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
    <div class="p-3 control-sidebar-content text-center">
	    <h5>로그 아웃</h5><hr class="mb-2"/>
	    <a href="<c:url value='/logout.do' />" class="btn btn-lg btn-primary">로그아웃</a>
    </div>
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="<c:url value='/' />resources/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="<c:url value='/' />resources/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="<c:url value='/' />resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="<c:url value='/' />resources/plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="<c:url value='/' />resources/plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="<c:url value='/' />resources/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="<c:url value='/' />resources/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="<c:url value='/' />resources/plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="<c:url value='/' />resources/plugins/moment/moment.min.js"></script>
<script src="<c:url value='/' />resources/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="<c:url value='/' />resources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="<c:url value='/' />resources/plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="<c:url value='/' />resources/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="<c:url value='/' />resources/dist/js/adminlte.js"></script>
<!-- AdminLTE for demo purposes -->
<%-- jsp에서 사용하는 자바주석방식 <script src="<c:url value='/' />resources/demo.js"></script> --%>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="<c:url value='/' />resources/dist/js/pages/dashboard.js"></script>
</body>
</html>
<script>
$(document).ready(function() {
	//현재 선택된 URL 값을 가져오는 명령(아래)
	var current = location.pathname;//current변수저장소에서 board, member 클릭한 내용 확인
	var current_2 = current.split("/").reverse()[1];//split분리함수로 current에있는 문자를 분리한 배열값을 반환.
	//alert('${brdMstrVO.bbsId}');//디버그
	$(".nav-treeview li a").each(function() {
		if( $(this).attr('href').indexOf(current_2) >= 0)	{//인덱스는 0,1,2... 이면 비교결과값이 있다는 얘기
			//위 문제를 처리하는 대체 함수 indexOf사용
			if(current_2 != 'admin' && ($(this).attr('href').indexOf('${brdMstrVO.bbsId}') >= 0) ){
				//$brdMstrVO.bbsId이용해서 비교추가
				$(this).addClass("active");//선택한 메뉴의 배경색상을 흰색으로 보이게 추가하는 처리.
			}
		} else {
			if(current_2 != 'admin'){
				//$bbsId이용해서 비교추가
				$(this).removeClass("active");//선택하지 않은 메뉴의 배경색상 흰색을 제거하는 처리.
			}
		}
	});
});
</script>
<!-- 관리자단 푸터 끝 -->