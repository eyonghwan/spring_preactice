<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	#modDiv {
		width: 300px;
		height: 100px;
		background-color: green;
		position: absolute;
		top: 50%;
		left: 50%;
		margin-top: -50px;
		margin-left: -150px;
		padding: 10px;
		z-index: 1000;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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
	
	<!-- modal창은 일종의 팝업입니다. 
	단, 새 창을 띄우지는 않고 css를 이용해 특정 태그가 조건부로 보이거나 안 보이도록 처리해서
	마치 창이 새로 띄워지는 것처럼 만듭니다.
	따라서 눈에 보이지는 않아도 modal을 구성하는 태그 자체는 화면에 미리 적혀있어야 합니다.-->
	<div id="modDiv" style="display:none;">
		<div class="modal-title"></div>
		<div>
			<input type="text" id="reply">
		</div>
		<div>
			<button type="button" id="replyModBtn">Modify</button>
			<button type="button" id="replyDelBtn">Delete</button>
			<button type="button" id="closeBtn">Close</button>
		</div>
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
	
	$("#replyDelBtn").on("click", function() {
		let rno = $(".modal-title").html();
	
		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
			headers : {
				"X-HTTP-Method-Overrride" : "DELETE"
			},
			dataType : 'text',
			success : function(result) {
				if(result == 'SUCCESS') {
					alert("삭제 되었습니다.");
					$("#modDiv").hide();
					getAllList();
				}
			}
		});
	});
	
	$("#replyModBtn").on("click", function() {
		let rno = $(".modal-title").html();
		let reply = $("#reply").val();
		
		$.ajax({
			type : 'patch',
			url : '/replies/' + rno,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Overrride" : "PATCH"
			},
			contentType: "application/json",
			data: JSON.stringify({reply : reply}),
			dataType : 'text',
			success : function(result) {
				if(result == 'SUCCESS') {
					alert("수정 되었습니다.");
					$("#modDiv").hide();
					getAllList();
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
		
		$(".modal-title").html(rno);
		$("#reply").val(reply);
		$("#modDiv").show("slow");
	});
	
	$("#closeBtn").on("click", () => {
		$("#modDiv").hide();
	});
	
	
	</script>
	
	
	
</body>
</html>