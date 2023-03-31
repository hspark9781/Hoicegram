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
			<div class=" d-flex justify-content-start ml-3">
					<h4 class=" font-weight-light ml-1" id="userId" data-user-id="${userId }">${nickname }</h4>
			</div>										
			<div class="d-flex mr-1"> 
				<a class="btn btn-primary" href="/post/create/view">게시물 작성</a>
				<a href="/user/signout" class="ml-2 btn btn-dark text-light">logout</a> 
			</div>
			</c:if>
		</header>					
		<section class="contents">
		<c:forEach var="post" items="${postList }">
		<div class="card-box border rounded mt-3">
			<div class="d-flex justify-content-between align-items-end">
				<div class="ml-3 mt-3">
					<h4 class=" font-weight-light ml-1">${post.nickname }</h4>
				</div>
				<div class="menu mt-3 mr-2">
					  <c:if test="${userId eq post.userId }">
					  <button class="btn menu-btn" type="button" data-toggle="modal" data-target="#menuBtn" data-post-id="${post.id }" data-user-id="${post.userId }">
					    <i class="bi bi-three-dots"></i>
					  </button>
					  </c:if>
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
				<c:choose>
					<c:when test="${post.like }">
						<i class="bi bi-heart-fill text-danger unlike-icon" data-post-id="${post.id }"></i>
					</c:when>
					<c:otherwise>
						<i class="bi bi-heart like-icon" data-post-id="${post.id }"></i>
					</c:otherwise>
				</c:choose>
				<span class="font-weight-bold ml-2">좋아요 </span> <span class="ml-2">${post.likeCount }개</span>
			</div>
			<div class="comment mt-4 ">
				<div class="comment-box ml-1">
					<c:forEach var="comment" items="${post.commentDetail }">
					<div class="d-flex mt-2">
						<div class="font-weight-bold">${comment.userNickname }</div><div class="ml-3">${comment.content }</div>
					</div>
					</c:forEach>
				</div>	
				<div class="input-group mt-3">
					  <input type="text" class="form-control col-5" id="commentInput${post.id }">
					 <div class="input-group-append">
					  <button class="btn btn-secondary comment-btn" data-post-id="${post.id }" type="button">게시</button>
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
	

	<div class="modal fade" id="menuBtn" tabindex="-1" role="dialog" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	    	<div class="modal-body text-center"> 	
				<button type="button" id="detailBtn" class="btn btn-primary btn-block">게시물 수정</button>
				<button type="button" id="deleteBtn" class="btn btn-danger btn-block postDeleteBtn">
					삭제
				</button>
			</div>  
	    </div>
	  </div>
	</div>


	
	
	<script>
		$(document).ready(function() {	
			
			$("#detailBtn").on("click", function() {
				let postId = $(this).data("post-id");
				let userId	= $(this).data("user-id");
				location.href="/post/detail/view?postId=" + postId + "&userId=" + userId;
			});
			
			$("#deleteBtn").on("click", function() {
				
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get"	
					, url:"/post/delete"
					, data:{"postId":postId}
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("삭제 실패");
						}
					}
					, error:function() {
						alert("삭제 에러");
					}
				});
				
			});
			
			$(".menu-btn").on("click", function() {
				let postId = $(this).data("post-id");
				let userId = $(this).data("user-id");
				
				$("#deleteBtn").data("post-id", postId);
				$("#detailBtn").data("post-id", postId);
				$("#detailBtn").data("user-id", userId);
			});
				
			
			
			$(".comment-btn").on("click", function() {
				let postId = $(this).data("post-id");
				
				// 버튼에 매칭된 input태그를 객체화 시키기
				// 1. 버튼 바로 앞 태그를 객체화 한다.
				// let comment = $(this).prev().val(); 내 태그에서는 바로 앞에 있지 않다.
				
				// 2. id에 post.id값
				let comment = $("#commentInput" + postId).val();
				
				$.ajax({
					type:"post"
					, url:"/post/comment/create"
					, data:{"postId":postId, "content":comment}
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("댓글쓰기 실패");
						}
					}
					, error:function() {
						alert("댓글쓰기 에러");
					}
				});
				
			});
				
				
				
							
			$(".unlike-icon").on("click", function() {
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get"
					, url:"/post/unlike"
					, data:{"postId":postId}
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("좋아요 취소 실패");
						}
					}
					, error:function() {
						alert("좋아요 취소 에러");
					}
				});
			});
			
			$(".like-icon").on("click", function() {
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get"
					, url:"/post/like"
					, data:{"postId":postId}
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