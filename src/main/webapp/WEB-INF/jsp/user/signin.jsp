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
<style>
	@import url('https://fonts.googleapis.com/css2?family=Italianno&display=swap');
	.Italianno { font-family: Italianno; }
</style>
</head>
<body>

	<div id="wrap">
		<section class="mt-5 d-flex justify-content-center">
			<div class="join-box">
				<div class="join border border-sencondary d-flex justify-content-center align-items-center">
					<div class="box my-4">
						<div class="text-center Italianno display-2">hoicegram</div>
						<div class="pt-2"><hr></div>
						<div class="d-flex mt-5">
							<input type="text" placeholder="아이디 : email" id="emailInput" class="form-control">
						</div>
						<input type="password" placeholder="비밀번호" id="passwordInput" class="form-control mt-4">
						<button type="button" id="joinBtn" class="btn btn-primary btn-block mt-4">로그인</button>
					</div>
				</div>
				
				<div class="signin mt-3 d-flex  align-items-center justify-content-center border border-sencondary">
					<h5 class="pt-2">계정이 없으신가요? <a href="/user/signup/view">회원가입</a></h5> 
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/user/include/footer.jsp"/>
	</div>

</body>
</html>