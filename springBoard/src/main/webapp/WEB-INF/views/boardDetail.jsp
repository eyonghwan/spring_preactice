<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	글 번호 : ${board.bno }<br/>
	글 제목 : ${board.title }<br/>
	글쓴이 : ${board.writer }<br/>
	글 내용 : ${board.content }<br/>
	
	<a href="/boardList">글 목록가기</a>
	
	<form action="/boardDelete" method="post">
		<input type="hidden" value="${board.bno }" name="bno">
		<input type="submit" value="삭제">
	</form>
	
	<form action="/boardUpdateForm" method="post">
		<input type="hidden" value="${board.bno }" name="bno">
		<input type="submit" value="수정">
	</form>

</body>
</html>