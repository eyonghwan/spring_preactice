<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/userInfo" method="post">
		<input type="number" name="userNum" placeholder="유저번호"><br/>
		<input type="text" name="userId" placeholder="아이디"><br/>
		<input type="password" name="userPw" placeholder="비밀번호"><br/>
		<input type="text" name="userName" placeholder="이름"><br/>
		<input type="number" name="userAge" placeholder="나이"><br/>
		<input type="submit" value="제출">
	</form>
</body>
</html>