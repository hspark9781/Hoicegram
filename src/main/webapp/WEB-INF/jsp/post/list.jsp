<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hoicegram-게시판</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

<link rel="stylesheet" href="/static/css/post/style.css" type="text/css">
</head>
<body>

	<div id="wrap">
		<header class="d-flex justify-content-between align-items-end">
			<c:if test="${not empty userId }">
			<div class="ml-3">
					<h4 class=" font-weight-light ml-1" id="userId" data-user-id="${userId }">${nickname }</h4>
			</div>
			<div class="mr-1"> <a href="/user/signout" class="btn btn-dark text-light">logout</a> </div>
			</c:if>
		</header>					
		<section class="contents">
		<c:forEach var="post" items="${postList }">
		<div class="card-box border rounded mt-3">
			<div class="d-flex justify-content-between align-items-end">
				<div class="ml-3">
					<h4 class=" font-weight-light ml-1">${post.nickname }</h4>
				</div>
				<div class="menu mt-3 mr-2">
					<div class="dropdown">
					  <button class="btn" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    <i class="bi bi-three-dots"></i>
					  </button>
					  <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
					    <a class="dropdown-item" href="/post/create/view">게시물 작성</a>
					    <a class="dropdown-item" href="/post/detail/view">게시물 수정</a>
					    <button type="button" class="dropdown-item btn">삭제</button>
					  </div>
					</div>
				</div>
			</div>
			<c:if test="${not empty post.imagePath }">
			<div class="img d-flex justify-content-center align-items-center mt-3">
				<img alt="도시사진" width="100%" src="${post.imagePath }">
			</div>
			</c:if>
			<div class="content-box mt-4 mb-4 d-flex ml-1">
				<div class="nickname font-weight-bold">${post.nickname }</div>
				<div class="content ml-2"> ${post.content }</div>
			</div>
			<div class="like d-flex align-items-center ml-1">
				<button type="button" class="border-0" id="likeBtn" data-post-id="${post.id }"><i class="bi bi-heart" ></i></button> 
				<span class="font-weight-bold ml-2">좋아요 </span> <span class="ml-2">23개</span>
			</div>
			<div class="comment mt-4 ml-1">
				<div class="comment-box">
					<div class="d-flex mt-2">
						<div class="font-weight-bold">hspaaaaar_k</div><div class="ml-3">곧 보자구~~</div>
					</div>
					<div class="d-flex mt-2">
						<div class="font-weight-bold">dabinnn0415</div><div class="ml-3">어딩ㅁ?</div>
					</div>
				</div>	
				<div class="input-group mt-3">
					  <input type="text" class="form-control col-5">
					  <div class="input-group-append">
					  <button class="btn btn-secondary" type="button">게시</button>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
		</section>
		
		<footer>
			<div class="text-center mt-3">CopyRight</div>
		</footer>		
	</div>
	
	
	<script>
		$(document).ready(function() {
			$("#likeBtn").on("click", function() {
				let postId = $(this).data("post-id");
				let userId = $("#userId").data("user-id");
				$.ajax({
					type:"get"
					, url:"/like/add"
					, data:{"postId":postId, "userId":userId}
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("좋아요 실패");
						}
					}
					, error:function() {
						alert("좋아요 에러");
					}
				});
			});
		});
	</script>
			   
		
			
		
	
	



</body>
</html>