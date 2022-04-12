<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<h1>게시글 목록</h1>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">글쓴이</th>
					<th scope="col">쓴 날짜</th>
					<th scope="col">수정 날짜</th>
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
		
		<a href="/boardInsert">글쓰기</a><br/>
		
			<ul class="pagination justify-content-center">
				<c:if test="${pageMaker.prev }">
			    	<li class="page-item"><a class="page-link" href="/boardList?pageNum=${pageMaker.startPage-1}">&laquo;</a></li>
			 	</c:if>
			 	<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
			    	<li class="page-item${pageMaker.cri.pageNum eq idx ? ' active' : '' }"><a class="page-link" href="/boardList?pageNum=${idx }">${idx }</a></li>
			    </c:forEach>
			    <c:if test="${pageMaker.next }">
			    	<li class="page-item"><a class="page-link" href="/boardList?pageNum=${pageMaker.endPage+1}">&raquo;</a></li>
			    </c:if>
			</ul>
		
		</div>
</body>
</html>