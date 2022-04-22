<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>	
		<div>
			REPLYER <input type="text" name="replyer" id="newReplyer">
		</div>
		<div>
			REPLY TEXT <input type="text" name="reply" id="newReply">
		</div>
		<button id="replyAddBtn">ADD REPLY</button>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script type="text/javascript">
		
	let bno = 356;
	
	$("#replyAddBtn").on("click", function() {
	
		let replyer = $("#newReplyer").val();
	
		let reply = $("#newReply").val();
	
		$.ajax({
			type : 'post',
			url : '/replies',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Overrride" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				bno : bno,
				reply : reply,
				replyer : replyer
			}),
			success : function(result) {
				if(result == 'SUCCESS') {
					alert("등록 되었습니다.");
				}
			}
		});
	});
	</script>
</body>
</html>