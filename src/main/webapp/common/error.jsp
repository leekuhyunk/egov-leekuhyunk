<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta http-equiv="content-language" content="ko">
<title>ERROR</title>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="100%" height="100%" align="center" valign="middle" style="padding-top:150px;"><table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><span style="font-family:Tahoma; font-weight:bold; color:#000000; line-height:150%; width:440px; height:70px;">
        	오류발생 알림화면(허용되지 않는 요청을 하셨습니다)
        	<!-- 주의: 개발할때는 아래내용이 필요하지만, 배포할때는 주석 처리해서 보이지 않게 합니다. -->
			<br>에러code : ${requestScope['javax.servlet.error.status_code']}
			<br>exception type : ${requestScope['javax.servlet.error.exception_type']}
			<br>message : ${requestScope['javax.servlet.error.message']}
			<br>exception : ${requestScope['javax.servlet.error.exception']}
			<br>request uri : <a href="${requestScope['javax.servlet.error.request_uri']}">${requestScope['javax.servlet.error.request_uri']}</a>
			<c:set var="url" value="${header.referer}"></c:set>
			<br>이전페이지로 이동: <a href="${url}">${url}</a>
			<br>servlet name : ${requestScope['javax.servlet.error.servlet_name']}
			<c:set var="exception" value="${requestScope['javax.servlet.error.exception']}"/>
			<br>에러추적trace : 
			 <ul>
				<c:forEach items="${exception.getStackTrace()}" var="stack">
				<li>${stack.toString()}</li>
				</c:forEach>
			 </ul>
        	</span></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>