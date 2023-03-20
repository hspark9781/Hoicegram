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
						<div class="d-flex mt-5">
							<input type="text" placeholder="아이디 : email" id="emailInput" class="form-control col-9"> <button class="btn btn-sm btn-primary ml-2" id="emailCheck">중복확인</button>
						</div>
						<input type="text" placeholder="성명" id="userNameInput" class="form-control mt-4">
						<div class="d-flex mt-4">
							<input type="text" placeholder="사용자 이름" id="nicknameInput" class="form-control col-9"> <button class="btn btn-sm btn-primary ml-2" id="nicknameCheck">중복확인</button>
						</div>
						<div class="d-flex mt-4">
							<input type="text" placeholder="휴대폰 번호 : - 포함" id="phoneNumberInput" class="form-control col-9"> <button class="btn btn-sm btn-primary ml-2" id="phoneNumberCheck">중복확인</button>
						</div>
						<input type="password" placeholder="비밀번호" id="passwordInput" class="form-control mt-4">
						<input type="password" placeholder="비밀번호 확인" id="passwordCheck" class="form-control mt-4">
						<button type="button" id="joinBtn" class="btn btn-primary btn-block mt-4">회원가입</button>
					</div>
				</div>
				
				<div class="signin mt-3 d-flex  align-items-center justify-content-center border border-sencondary">
					<h5 class="pt-2">계정이 있으신가요? <a href="/user/signin/view">로그인</a></h5> 
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/user/include/footer.jsp"/>
	</div>
	
	<script>
	$(document).ready(function() {
		var emailCheck = false;
		var emailDuplicate = true;
		var nicknameCheck = false;
		var nicknameDuplicate = true;
		var phoneNumberCheck = false;
		var phoneNumberDuplicate = true;
		
		
		$("#emailinput").on("input", function()) {
			emailCheck = false;
			emailDuplicate = true;
		};
		
		$("#nicknameInput").on("input", function()) {
			nicknameCheck = false;
			nicknameDuplicate = true;
		};
		
		$("#phoneNumberInput").on("input", function() {
			phoneNumberCheck = false;
			phoneNumberDuplicate = true;
		});
		
		$("#nicknameCheck").on("click", function() {
			
			let nickname = $("#nicknameInput").val();
			$.ajax({
				type:"get"
				, url:"/user/nickname_duplicate"
				, data:{"nickname":nickname}
				, success:function(data) {
					if(data.result == false) {
						alert("사용 가능한 이름 입니다.");
						nicknameDuplicate = false;
						nicknameCheck = true;
					} else {
						alert("이름이 중복되었습니다.");
						nicknameDuplicate = true;
					}
				}
				, error:function() {
					alert("중복확인 에러");
				}
			});
		});
		
		$("#emailCheck").on("click", function() {
			let email = $("#emailInput").val();
			
			$.ajax({
				type:"post"
				, url:"/user/email_duplicate"
				, data:{"email":email}
				, success:function(data) {
					if(!data.result) {
						alert("사용 가능한 이메일 입니다.");
						emailDuplicate = false;
						emailCheck = true;
					} else {
						alert("이메일이 중복되었습니다.");
						emailDuplicate = true;
					}
				}
				, error:function() {
					alert("중복확인 에러");
				}
			});
		});
		
		$("#phoneNumberCheck").on("click", function() {
			
			let phoneNumber = $("#phoneNumberInput").val();
			
			$.ajax({
				type:"post"
				, url:"/user/phoneNumber_duplicate"
				, data:{"phoneNumber":phoneNumber}
				, success:function(data) {
					if(data.result == false) {
						alert("사용 가능한 번호입니다.");
						phoneNumberDuplicate = false;
						phoneNumberCheck = true;
					} else {
						alert("번호가 중복되었습니다.");
						phoneNumberDuplicate = true;
					}
				}
				, error:function() {
					alert("중복확인 에러");
				}
			});
		});
			
			
		$("#joinBtn").on("click", function() {
			
			let email = $("#emailInput").val();
			let userName = $("#userNameInput").val();
			let nickname = $("#nicknameInput").val();
			let phoneNumber = $("#phoneNumberInput").val();
			let password = $("#passwordInput").val();
			
			if(email == "") {
				alert("이메일을 입력해 주세요.");
				return;
			}
			
			if(userName == "") {
				alert("성명을 입력해 주세요.");
				return;
			}
			
			if(nickname == "") {
				alert("사용자 이름을 입력해 주세요.");
				return;
			}
			
			if(phoneNumber == "") {
				alert("휴대폰 번호를 입력해 주세요.");
				return;
			}
			
			if(password == "") {
				alert("비밀번호를 입력해 주세요.");
				return;
			}
			
			if($("#passwordCheck").val() == "") {
				alert("비밀번호 일치여부를 확인해 주세요.");
				return;
			}
			
			if(password != $("#passwordCheck").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}
			
			if(emailCheck == false) {
				alert("이메일 중복 확인을 진행해주세요.");
				return;
			}
			
			if(emailDuplicate == true) {
				alert("이메일이 중복되었습니다.");
				return;
			}
			
			if(nicknameCheck == false) {
				alert("사용자 이름 중복확인을 진행해주세요.");
				return;
			}
			
			if(nicknameDuplicate == true) {
				alert("사용자 이름이 중복되었습니다.");
				return;
			}
			
			if(phoneNumberCheck == false) {
				alert("휴대폰 번호 중복 확인을 진행해 주세요.");
				return;
			}
			
			if(phoneNumberDuplicate == true) {
				alert("휴대폰 번호가 중복되었습니다.");
				return;
			}
			
			
		
			

			
			
			
			
			
			$.ajax({
				type:"post"
				, url:"/user/signup"
				, data:{"phoneNumber":phoneNumber, "email":email, "password":password, "userName":userName, "nickname":nickname}
				, success:function(data) {
					if(data.result == "success") {
						location.href="/user/signin/view";
					} else {
						alert("회원가입 실패");
					}
				}
				, error:function() {
					alert("회원가입 에러");
				}
			});
			
			
			
			
		});
		
		
	});
	
	</script>
		
	
	
	
	
</body>
</html>