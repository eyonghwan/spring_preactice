<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<ul id="replies">
		
	</ul>
	
	<button id="requestBtn">댓글 로딩해오기</button>
	
	<!-- jquery cdn -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<!--  script 태그에 requestBtn에 대한 onclick 이벤트를 걸어주세요.
	onclick시 $getJSON을 이용해 댓글 데이터를 요청한 다음(글번호는 test.jsp에 설정해둔 글 번호)
	얻어온 데이터를 이용해 #replies 내부에 댓글을 집어넣어주세요. -->
	<script type="text/javascript">
	let bno = 356;
		
	$("#requestBtn").on("click", function() {
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
	});
	</script>

	
</body>
</html>