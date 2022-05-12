<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="/boardInsert" method="post">
		<input type="text" name="title" placeholder="제목">
		<input type="text" name="writer" value="아이디"><br/>
		<textarea name="content" rows="20" cols="100"></textarea><br/>
		<input type="submit" value="작성">
	</form>

</body>
</html>