<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<!DOCTYPE html>
<html>
<head>
<title>타일즈템플릿사용</title>
</head>
<body>
	<t:insertAttribute name="header"></t:insertAttribute>
	<t:insertAttribute name="content"></t:insertAttribute>
	<t:insertAttribute name="footer"></t:insertAttribute>
</body>
</html>