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
	
	.uploadResult ul li span {
	cursor : pointer;
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
			
			let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
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
					if(!checkExtension(files[i].name, files[i].size)) {
						return false;
					}
					formData.append("uploadFile", files[i]);
				}
				
				$.ajax({
					url: '/uploadAjax',
					processData: false,
					contentType: false,
					data: formData,
					type: 'POST',
					dataType: 'json',
					success: function(result) {
						alert("Uploaded");
						
						showUploadedFile(result);
						
						$(".uploadDiv").html(cloneObj.html());
					}
				}); // ajax
			});// onclick uploadBtn
			
			let uploadResult = $(".uploadResult ul");
			
			function showUploadedFile(uploadResultArr) {
				
				let str = "";
				
				$(uploadResultArr).each(function(i, obj) {
					
					if(!obj.image) {
						
						let fileCallPath = encodeURIComponent (obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
						
						str += "<li data-path = '" + obj.uploadPath + "' data-uuid='" + obj.uuid
							+ "' data-filename='" + obj.fileName + "' data-type='" + obj.fileType
							+ "'><a href='/download?fileName=" + fileCallPath
							+ "'>" + "<img src='/resources/attachicon.png'>"
							+ obj.fileName + "</a>"
							+ "<span data-file=\'" + fileCallPath + "\' data-type='file'> X </span>"
							+ "</li>";
							
					} else {
						
						let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
						let fileCallPathOriginal = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
						
						console.log("파일경로: " + fileCallPathOriginal);
						
						str += "<li data-path = '" + obj.uploadPath + "' data-uuid='" + obj.uuid
							+ "' data-filename='" + obj.fileName + "' data-type='" + obj.fileType
							+ "'> <a href='/download?fileName=" + fileCallPathOriginal
							+ "'> <img src='/display?fileName=" + fileCallPath
							+ "'/>" + obj.fileName + "</a>"
							+ "<span data-file=\'" + fileCallPath + "\' data-type='image'> X </span>"
							+ "</li>";
					}
					
				});
				
				uploadResult.append(str);
			}// showUploadedFile
			
			$(".uploadResult").on("click", "span", function(e) {
				let targetFile = $(this).data("file");
				let type = $(this).data("type");
				
				console.log(targetFile);
				console.log(type);
				
				let targetLi = $(this).closest("li");
				
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