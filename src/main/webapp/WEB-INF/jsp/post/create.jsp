<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hoicegram-게시판</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/post/style.css" type="text/css">
</head>
<body>

	<div id="wrap">
		<header class="d-flex justify-content-between align-items-end">
			<c:if test="${not empty userId }">
			<div class="d-flex align-items-end">
				<h4 class=" font-weight-light ml-1">${nickname }</h4>
			</div>
			<div class="mr-1"> <a href="/user/signout" class="btn btn-dark text-light">logout</a> </div>
			</c:if>
		</header>
		<div class="menu d-flex justify-content-end mt-3">
			<div class="dropdown">
			  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    Post menu
			  </button>
			  <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
			    <a class="dropdown-item" href="/post/detail/view">게시물 수정</a>
			    <a class="dropdown-item" href="/post/timeline/view">Timeline</a>
			  </div>
			</div>
		</div>			
		<section class="contents">		
		<div class="mt-5">
			<h3 class="font-weight-light">게시물 작성</h3>
			<div class="border rounded">
				<div class="mt-3">
					<textarea rows="10" class="form-control border-0" id="contentInput"></textarea>
				</div>			
				<div class="d-flex justify-content-between mt-3">
					<i id="imageIcon" class="bi bi-card-image image-icon ml-2"></i> <!-- 크기 : font-size로 -->				
					<input type="file" class="p-0 d-none" id="fileInput">	
					<div class="pt-4 pb-1 mr-2">
						<button type="button" id="saveBtn" class="btn btn-primary">저장</button>
					</div>
				</div>
			</div>
		</div>
		</section>
		<footer>
			<div class="text-center mt-3">CopyRight</div>
		</footer>		
	</div>
	<script>
		$(document).ready(function() {
			$("#imageIcon").on("click", function() {
				// fileInput을 클릭한 동작을 수행한다.
				$("#fileInput").click();
			});
			$("#saveBtn").on("click", function() {
				let content = $("#contentInput").val();
				let file = $("#fileInput")[0]; 
				
				if(content.trim() == "") {
					alert("내용을 입력해 주세요");
					return;
				}
				
				// 파일이 선택되지 않았을대 유효성 검사
				/* if(file.files.length == 0) {
					alert("파일을 선택하세요");
					return;
				} */
				
				var formData = new FormData();
				formData.append("content", content); // 파라미터 추가(append메소드)
				formData.append("file", file.files[0]);
				
				$.ajax({
					type:"post"
					, url:"/post/create" // 404 url 주소
					, data:formData
					, enctype:"multipart/form-data"
					, processData:false
					, contentType:false
					, success:function(data) {
						if(data.result == "success") {
							location.href="/post/timeline/view";
						} else {
							alert("저장 실패");
						}
					}
					, error:function() {
						alert("저장 에러");
					}
				});
			});
		});
	</script>
			   
</body>
</html>
		
			
		
	
	


