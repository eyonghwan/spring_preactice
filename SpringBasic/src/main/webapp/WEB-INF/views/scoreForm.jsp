<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>성적 정보를 입력해주세요.</h1><br/>
	<form action="/score" method="post">
		<input type="number" name="kor" placeholder="국어 점수" min="0" max="100"><br/>
		<input type="number" name="eng" placeholder="영어 점수" min="0" max="100"><br/>
		<input type="number" name="math" placeholder="수학 점수" min="0" max="100"><br/>
		<input type="number" name="sci" placeholder="과학 점수" min="0" max="100"><br/>
		<input type="number" name="computer" placeholder="컴퓨터 점수" min="0" max="100"><br/>
		<input type="submit" value="성적확인">
	</form>

</body>
</html>