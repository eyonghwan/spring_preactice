<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>

	.uploadResult {
		width:100%;
		background-color: gray;
	}
	.uploadResult ul {
		display:flex;
		flex-flow:row;
		justify-content: center;
		align-items: center;
	}
	.uploadResult ul li {
		list-style: none;
		padding: 10px;
		align-content: center;
		text-align: center;
	}
	.uploadResult ul li img {
		width: 100px;
	}
	
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

	<div class="container">
	글 번호 : ${board.bno }<br/>
	글 제목 : ${board.title }<br/>
	글쓴이 : ${board.writer }<br/>
	글 내용 : ${board.content }<br/>
	
	<div class="row">
		<h3 class="text-primary">첨부파일</h3>
		<div id="uploadResult">
			<ul>
				<!-- 첨부파일이 들어갈 위치 -->
			</ul>
		</div>
	</div><!-- row -->
	
	<a href="/boardList?pageNum=${cri.pageNum }&searchType=${cri.searchType}&keyword=${cri.keyword}">글 목록가기</a>
	
	<form action="/boardDelete" method="post">
		<input type="hidden" value="${board.bno }" name="bno">
		<input type="hidden" name="pageNum" value="${cri.pageNum }">
		<input type="hidden" name="searchType" value="${cri.searchType }">
		<input type="hidden" name="keyword" value="${cri.keyword }">
		<input type="submit" value="삭제">
	</form>
	
	<form action="/boardUpdateForm" method="post">
		<input type="hidden" value="${board.bno }" name="bno">
		<input type="hidden" name="pageNum" value="${cri.pageNum }">
		<input type="hidden" name="searchType" value="${cri.searchType }">
		<input type="hidden" name="keyword" value="${cri.keyword }">
		<input type="submit" value="수정">
	</form>
	
	<button id="button">댓글 보기</button>
	<div class="row">	
		<h3 class="text-primary">댓글</h3>
		<div id="replies">
		
		</div>
	</div>
	
	<div class="row box-box-success">
		<div class="box-header">
			<h2 class="text-primary">댓글 작성</h2>
		</div><!-- header -->
		<div class="box-body">	
			<strong>Writer</strong>
			<input type="text" id="newReplyer" placeholder="Replyer" class="form-control"/>
			<strong>Reply</strong>
			<input type="text" id="newReply" placeholder="Reply" class="form-control"/>
		</div><!-- body -->
		<div class="box-footer">
			<button type="button" class="btn btn-success" id="replyAddBtn">ADD REPLY</button>
		</div><!-- footer -->
	</div><!-- row -->
	
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
	
	</div>
	
	<!-- 여기부터 댓글 비동기 처리 자바스크립트 처리 영역 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script>
	let bno = ${board.bno};
	
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
					let timestamp = this.updateDate;
					let date = new Date(timestamp);
					
					let formattedTime = "게시일 : " + date.getFullYear() 
										+ "/" + (date.getMonth() + 1)
										+ "/" + date.getDate()
										+ "-" + date.getHours()
										+ ":" + date.getMinutes()
										+ ":" + date.getSeconds();
					
					str += "<div data-rno='" + this.rno + "' class='replyLi'><strong>@"
						+ this.replyer + "</strong> - " + formattedTime + "<br/>"
						+ "<div class='reply'>" + this.reply + "</div>"
						+ "<button type='button' class='btn btn-info'>수정/삭제</button></div>";
						
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
		// let reply = $(this).prev().text();
		let reply = $(this).siblings(".reply").text();
		// let reply = $(this).parent().children(".reply").text();
		
		$(".modal-title").html(rno);
		$("#reply").val(reply);
		$("#modDiv").show("slow");
	});
	
	$("#closeBtn").on("click", () => {
		$("#modDiv").hide();
	});
	
	(function() {
		
		$.getJSON("/getAttachList", {bno: bno}, function(arr) {
			console.log(arr);
			
			let str = "";
			
			$(arr).each(function(i, attach){
				
				if(attach.fileType) {
					let fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);
				
					str += "<li data-path='" + attach.uploadPath
						+ "' data-uuid='" + attach.uuid
						+ "' data-filename='" + attach.fileName
						+ "' data-type='" + attach.fileType + "' ><div>"
						+ "<img src='/display?fileName=" + fileCallPath +"'>'"
						+ "</div> </li>"
				} else {
					str += "<li data-path='" + attach.uploadPath
					+ "' data-uuid='" + attach.uuid
					+ "' data-filename='" + attach.fileName
					+ "' data-type='" + attach.fileType + "' ><div>"
					+ "<img src='/resources/attachicon.png' width='100px' height='100px'>"
					+ "</div> </li>"
				}
			});
			$("#uploadResult ul").html(str);
		}); // end getJSON
	})(); // end anonymous
	
	$("#uploadResult").on("click", "li", function(e){
		
		let liObj = $(this);
		
		let path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("filename"));
		
		self.location = "/download?fileName=" + path;
	});
	
	
	</script>

</body>
</html>