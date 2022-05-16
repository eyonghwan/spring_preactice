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
	}
	.uploadResult ul li img {
		width: 20px;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Upload with Ajax</h1>
	
	<div class="uploadDiv">
		<input type="file" name="uploadFile" multiple>
	</div>
	
	<div class='uploadResult'>
		<ul>
			<!-- 업로드된 파일이 들어갈 자리 -->
		</ul>
	</div>
	
	<button id="uploadBtn">Upload</button>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script>
		$(document).ready(function() {
			
			let regex = new RefExp("(.*?)\.(exe|sh|zip|alz)$");
			let maxSize = 5242880; // 5MB
			
			function checkExtension(fileName, fileSize) {
				if(fileSize >= maxSize) {
					alert("파일 사이즈 초과");
					return false;
				}
				
				if(regex.test(fileName)) {
					alert("해당 종류의 파일은 업로드 될 수 없습니다.");
					return false;
				}
				return true;
			}
			
			let cloneObj = $(".uploadDiv").clone();
			
			$('#uploadBtn').on("click", function(e) {
				
				let formData = new FormData();
				
				let inputFile = $("input[name = 'uploadFile']");
				
				let files = inputFile[0].files;
				
				console.log(files);
				
				// 파일 데이터를 폼에 집어넣기
				for(let i = 0; i < files.length; i++) {
					if(!checkExtension(file[i].name, files[i].size)) {
						return false;
					}
					formDAta.append("uploadFile", files[i]);
				}
				
				$.ajax({
					url: '/uploadAjax',
					processDAta: false,
					contentType: false,
					data: formData,
					type: 'POST',
					dataType: 'json',
					success: function(result) {
						alert("Uploaded");
						
						ShowUploadedFile(result);
						
						$(".uploadDiv").html(cloneObj.html());
					}
				}); // ajax
			});// onclick uploadBtn
			
			let uploadtResult = $(".uploadResult ul");
			
			function showUploadedFile(uploadResultArr) {
				
				let str = "";
				
				$(uploadResultArr).each(function(i, obj) {
					
					if(!obj.image) {
						
						let fileCallPath = encodingURIComponent (
								obj.uploadPath + "/" +
								obj.uuid + "_" + obj.fileName);
						
						str += "<li>" + fileCallPath + 
								"'>" + "<img src='/resources/attachicon.png'>" + 
								obj.fileName + "</a>" +
								"<span data-file=\'" + fileCallPath + "\' data-type='file'> X </span>" +
								"</li>";
							
					} else {
						
						let fileCallPath = encodeURIComponent(obj.uploadPath + "\s_" +
															ogj.uuid + "_" + obj.fileName);
						
						str += "<li><a href='/download?fileName=" + fileCallPath +
								"'>" + "<img src='\display?fileName=" + fileCallPath + 
								"'>" + obj.fileName + "</a>" +
								"<span data-file=\'" + fileCallPath + "\' data-type='image'> X </span>" +
								"</li>";
					}
					
				});
				
				uploadResult.append(str);
			}// showUploadedFile
			
			$(".uploadResult").on("cilck", "span", function(e) {
				let tergetFile = $(this).data("file");
				let type = $(this).data("type");
				
				let targetLi = $(this).colsest("li");
				
				$.ajax({
					url: '/deleteFile',
					data: {fileName: targetFile, type:type},
					dataType: 'text',
					type: 'POST',
					success: function(result) {
						alert(result);
						targetLi.remove();
					}
				}); // ajax
				
			}); // click span
			
		});// document
	
	</script>

</body>
</html>