<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>접근 실패</h1>
	<h2>${SPRING_SECURITY_403_EXCEPTION.getMessage() }</h2>
	
	<h2>${errorMessage }</h2>
</body>
</html>