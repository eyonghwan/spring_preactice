<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${boardList }<br/>
	
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>쓴 날짜</th>
				<th>수정 날짜</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="board" items="${boardList }">
				<tr>
		    <td>${board.bno }</td>
		    <td><a href="/boardList/${board.bno }">${board.title }</a></td>
		    <td>${board.writer }</td>
		    <td>${board.regdate }</td>
		    <td>${board.updatedate }</td>
				</tr>
			</c:forEach>
		
		</tbody>
	</table>
	
</body>
</html>