<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hoicegram-회원가입</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap">
		<section class="mt-5 d-flex justify-content-center">
			<div class="join-box">
				<div class="join border border-sencondary d-flex justify-content-center align-items-center">
					<div class="box">
						<h2 class="text-center">hoicegram</h2>
						<div class="d-flex">
							<input type="text" placeholder="휴대폰 번호 또는 이메일" class="form-control col-8 mt-5">
						</div>
						
						<input type="text" placeholder="사용자 이름" class="form-control mt-4">
						<input type="text" placeholder="닉네임" class="form-control mt-4">
						<input type="text" placeholder="비밀번호" class="form-control mt-4">
						<input type="text" placeholder="비밀번호 확인" class="form-control mt-4">
						<input type="text" placeholder="프로필 사진 등록" class="form-control mt-4">
						<button type="button" class="btn btn-info btn-block mt-4">회원가입</button>
					</div>
				</div>
				
				<div class="signin mt-3 d-flex  align-items-center justify-content-center border border-sencondary">
					<h5 class="pt-2">계정이 있으신가요? <a href="#">로그인</a></h5> 
				</div>
			</div>
		</section>
		<footer class="">
				<div class="text-center pt-4">CopyRight</div>
		</footer>
	</div>
		
	
	
	
	
</body>
</html>