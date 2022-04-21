<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>Ajax 테스트</h2>
	<button id="button">댓글 보기</button>
	<ul id="replies">
	
	</ul>
	
	<ul id="test">
	
	</ul>
	
	<!--  jquery는 이곳에 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script type="text/javascript">
		let bno = 356;
		
		function getAllList() {
			$.getJSON("/replies/all/" + bno, function(data){
				
				let str = "";
				console.log(data);
				
				$(data).each(
					function() {
						str += "<li data-rno='" + this.rno + "' class='replyLi'>"
							+ this.rno + ":" + this.reply + "</li>";
					});
				$("#replies").html(str);
			});
		}
		
		
		$("#button").on("click", function() {
		getAllList();
		});
		
		let daum = "<a href='http://www.daum.net'>다음</a>"; 
		$("#test").html(daum);
		
	</script>
	
	
</body>
</html>