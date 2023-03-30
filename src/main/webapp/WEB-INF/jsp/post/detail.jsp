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
			  <button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown">
			    Post menu
			  </button>
			  <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
			    <a class="dropdown-item" href="/post/create/view">게시물 작성</a>
			    <a class="dropdown-item" href="/post/timeline/view">타임라인</a>
			  </div>
			</div>
		</div>		
		<section class="contents">
		<div class="mt-5">
			<h3 class="font-weight-light">게시물 수정</h3>
			<div class="mt-3">
				<textarea rows="10" class="form-control">${post.content }</textarea>
			</div>
			<c:if test="${not empty post.imagePath }">
			<div>
				<img alt="이미지" src="${post.imagePath }">
			</div>
			</c:if>
			<input type="file" class="btn p-0 mt-3">	
			<div class="d-flex justify-content-between mt-3">
				<button class="btn btn-danger" data-post-id="${post.id }">삭제</button>
				<button class="btn btn-primary">저장</button>
			</div>
		</div>
		</section>
		<footer>
			<div class="text-center mt-3">CopyRight</div>
		</footer>		
	</div>
			   
</body>
</html>
		
			
		
	
	


