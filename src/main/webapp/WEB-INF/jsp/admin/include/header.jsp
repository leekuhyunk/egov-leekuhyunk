<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- 관리자단 헤더 시작 header.jsp -->
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>관리자 | Dashboard</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<c:url value='/' />resources/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="<c:url value='/' />resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="<c:url value='/' />resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="<c:url value='/' />resources/plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<c:url value='/' />resources/dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="<c:url value='/' />resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="<c:url value='/' />resources/plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="<c:url value='/' />resources/plugins/summernote/summernote-bs4.min.css">
</head>
<script>
if("${msg}"!="") { //RedirectAttributes 로 컨트롤러에서 보내온 값을 출력
	alert("${msg}가(이) 성공하였습니다.");
}
</script>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- 관리자화면 최상단 아이콘2개 Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
          <i class="fas fa-th-large"></i>
        </a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- 관리자화면 왼쪽메뉴부분 Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- 관리자 상단로고 Brand Logo -->
    <a href="<c:url value='/admin/home.do' />" class="brand-link">
      <img src="<c:url value='/' />resources/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">Spring 프로젝트</span>
    </a>

    <!-- 왼쪽메뉴 Sidebar -->
    <div class="sidebar">
      <!-- 로그인한 사용자표시 Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="<c:url value='/' />resources/dist/img/default-150x150.png" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">${LoginVO.name}-${LoginVO.id}</a>
        </div>
      </div>

      <!-- 검색폼 SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- 사용자 홈과 대시보드 메뉴 Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <li class="nav-item">
            <a href="<c:url value='/' />" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                	사용자 홈
                <span class="right badge badge-danger">New</span>
              </p>
            </a>
          </li>
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item menu-open">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
             <li class="nav-item">
                <a href="<c:url value='/admin/authorrole/list_author.do' />" class="nav-link">
                <!-- 위 메뉴선택시 활성화active 되는 것은 j쿼리로 만들예정입니다. -->
                  <i class="far fa-circle nav-icon"></i>
                  <p>권한 관리</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<c:url value='/admin/member/list_member.do' />" class="nav-link">
                <!-- 위 메뉴선택시 활성화active 되는 것은 j쿼리로 만들예정입니다. -->
                  <i class="far fa-circle nav-icon"></i>
                  <p>관리자 관리</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<c:url value='/' />admin/board/list_board.do?bbsId=BBSMSTR_AAAAAAAAAAAA" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>공지사항관리</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<c:url value='/' />admin/board/list_board.do?bbsId=BBSMSTR_BBBBBBBBBBBB" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>갤러리 관리</p>
                </a>
              </li>
            </ul>
          </li>
          
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
<!-- 관리자단 헤더 끝 -->