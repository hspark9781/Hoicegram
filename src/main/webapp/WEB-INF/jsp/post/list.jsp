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
		<div class="menu d-flex justify-content-between mt-3">
			<div></div>
			<div class="dropdown">
			  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    Post menu
			  </button>
			  <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
			    <a class="dropdown-item" href="#">게시물 작성</a>
			    <a class="dropdown-item" href="#">게시물 수정</a>
			    <a class="dropdown-item" href="#">게시물 작성</a>
			  </div>
			</div>
		</div>
			
		<section class="contents">
		<div class="img d-flex justify-content-center align-items-center">
			<img alt="도시사진" width="600px" src="https://cdn.pixabay.com/photo/2023/03/13/04/25/buildings-7848348_960_720.jpg">
		</div>
		<div class="like d-flex align-items-center">
			<span class="font-weight-bold">좋아요 </span> <span class="ml-3">23개</span>
		</div>
			<div class="comment bg-success">
		</div>
		</section>
		<footer>
			<div class="text-center mt-3">CopyRight</div>
		</footer>		
	</div>
			   
		
			
		
	
	



</body>
</html>