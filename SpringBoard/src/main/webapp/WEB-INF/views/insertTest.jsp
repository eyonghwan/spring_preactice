<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<button id="button">댓글 보기</button>
	<ul id="replies">
	
	</ul>

	<div id = "ReplyFrom">	
		<div>
			REPLYER <input type="text" name="replyer" id="newReplyer">
		</div>
		<div>
			REPLY <input type="text" name="reply" id="newReply">
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
					getAllList();
					$("#newReplyer").val("");
					$("#newReply").val("");
				}
			}
		});
	});
	
	function getAllList() {
		$.getJSON("/replies/all/" + bno, function(data){
			
			let str = "";
			console.log(data);
			
			$(data).each(
				function() {
					str += "<li data-rno='" + this.rno + "' class='replyLi'>"
						+ this.rno + ":" + this.reply
						+ "<button>수정/삭제</button></li>";
				});
			$("#replies").html(str);
		});
	}
	
	
	$("#button").on("click", function() {
	getAllList();
	});
	
	$("#replies").on("click", ".replyLi button", function() {
		let replytag = $(this).parent();
		
		let rno = replytag.attr("data-rno");
		let reply = replytag.text();
		
		alert(rno + " : " + reply);
	})
	
	</script>
</body>
</html>