<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="/boardUpdate" method="post">
		<input type="text" name="title" placeholder="제목" value="${board.title }">
		<input type="text" name="writer" value="${board.writer }" readonly><br/>
		<textarea name="content" rows="20" cols="100">${board.content }</textarea><br/>
		<input type="hidden" name="bno" value="${board.bno }">
		<input type="submit" value="수정">
	</form>
	
</body>
</html>