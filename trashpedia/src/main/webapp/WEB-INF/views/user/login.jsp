<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Login Form</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/user/login.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body class="body-login">
	<jsp:include page="../common/header.jsp" />
	<main>
		<div class="content-login" id="loginArea">
			<div class="title-wrapper">
				<span class="title">로그인</span>
			</div>
			<form action="${contextPath}/login" method='post'>
				<input type="text" class="input-login" id="id" placeholder="아이디를 입력해주세요" class="in" name="username">
				<input type="password" class="input-pwd" id="pwd" placeholder="비밀번호를 입력해주세요" class="in" name="password">
				<input type="submit" id="btn" value="이메일 로그인">
			</form>
			<div class="a-login">
				<a class="findIdBtn">아이디찾기</a> <a class="findPwdBtn">비밀번호찾기</a>
				<a href="${contextPath}/member/join">회원가입</a>
			</div>
			<button id="go-kakao" onclick="location.href = '/'">카카오로 로그인</button>
			<button id="go-naver">네이버로 로그인</button>
		</div>

		<div class="content-login-find" id="findIdArea">
			<div class="top-margin"></div>
			<span class="logo-find">아이디 찾기</span>
			<div class="div-login"></div>
			<form action="findId.me" onsubmit="return findId()">
				<div id="findForm" style="position: relative;">
					<input type="text" class="input-login in" id="name"
						placeholder="이름을 입력해주세요"> <input type="text"
						class="input-login in" id="phoneNum" placeholder="휴대폰번호를 입력해주세요">
					<button class="verificationButton" id="verificationBtn">인증하기</button>
					<div id="id-error-message" class="error-message"></div>
				</div>
				<!-- <div id="found-info" style="display: none;">
					<span id="found-name"></span>님의 아이디는 <span id="found-id"></span>
					입니다.
				</div> -->
				<div id="no-info-message" style="display: none;">가입된 정보가 없습니다.
				</div>
				<div class="a-findId-2">
					<a href="${contextPath}/login">로그인하기</a> <a class="findPwdBtn">비밀번호찾기</a>
					<a href="${contextPath}/join">회원가입</a>
				</div>
				<input type="submit" id="btn" value="아이디 찾기">
			</form>
		</div>

		<!-- 비밀번호 찾기 -->
		<div class="content-login" id="findPwdArea">
			<div class="top-margin"></div>
			<span class="logo-find">비밀번호 찾기</span>
			<div class="div-login"></div>
			<form action="findPwd.me" onsubmit="return findPwd()">

				<div id="findForm" style="position: relative;">
					<input type="text" class="input-login in" id="email"
						placeholder="아이디를 입력해주세요"> <input type="text"
						class="input-login in" id="phoneNum" placeholder="휴대폰번호를 입력해주세요">
					<button class="verificationButton" id="verificationBtn">인증하기</button>
					<div id="id-error-message" class="error-message"></div>
				</div>
				<!-- <div id="found-info" style="display: none;">
					<span id="found-name"></span>님의 아이디는 <span id="found-id"></span>
					입니다.
				</div>
				<div id="no-info-message" style="display: none;">가입된 정보가 없습니다.</div> -->
				<div class="a-findId-2">
					<a href="${contextPath}/login">로그인하기</a> <a class="findIdBtn">아이디찾기</a>
					<a href="${contextPath}/join">회원가입 </a>
				</div>
				<input type="submit" id="btn" value="비밀번호 찾기">
			</form>
		</div>

		<!-- 비밀번호 재설정 -->
		<div class="content-login" id="resetPwdArea">
			<div class="top-margin"></div>
			<span class="logo-find">비밀번호 재설정</span>
			<div class="div-login"></div>
			<form action="resetPwd.me" onsubmit="return resetPwd()">

				<div id="findForm" style="position: relative;">
					<input type="text" class="input-login in" id="newPassword"
						placeholder="새로운 비밀번호를 입력해주세요"> <input type="text"
						class="input-login in" id="checkPassword"
						placeholder="비밀번호를 한번 더 입력해주세요">
					<div id="passNotice" class="on-cont">
						<p class="ico-possible">가능</p>
						<p class="ico-impossible">불가능</p>
						<p class="ico-same">일치</p>
						<p class="ico-notsame">불일치</p>
					</div>
				</div>
				<input type="submit" id="btn" value="비밀번호재설정" onclick="resetPwdForm">
			</form>
			<!-- <div id="found-info" style="display: none;">
					<span id="found-name"></span>님의 아이디는 <span id="found-id"></span>
					입니다.
				</div>
				<div id="no-info-message" style="display: none;">가입된 정보가 없습니다.</div> 
		 -->
		</div>
	</main>
	<jsp:include page="../common/footer.jsp" />
	<script>
		Kakao.init('613219f2943fa9cbe4fff314968bf471');
		console.log(Kakao.isInitialized());
		Kakao.isInitialized();
		
		$(document).ready(function() {
			$("#loginArea").show();
			$("#findIdArea").hide();
			$("#findPwdArea").hide();
			$("#resetPwdArea").hide();

			$(".findPwdBtn").click(function() {
				$("#findPwdArea").show();
				$("#findIdArea").hide();
				$("#loginArea").hide();
			});

			$(".findIdBtn").click(function() {
				$("#findIdArea").show();
				$("#findPwdArea").hide();
				$("#loginArea").hide();
			});
		});
		function email_check() {
			var id = document.getElementById("id"); 
			var pw = document.getElementById("pwd");
			var idErrorMessage = document.getElementById("id-error-message");
			var pwdErrorMessage = document.getElementById("pwd-error-message");

			idErrorMessage.innerHTML = "";
			pwdErrorMessage.innerHTML = "";

			if (id.value.trim() === "") {
				idErrorMessage.innerHTML = "<span style='color: red; font-size:10px;'>아이디를 입력해주세요.</span>";
				id.focus();
				return false;
			}

			if (pw.value.trim() === "") {
				pwdErrorMessage.innerHTML = "<span style='color: red; font-size:10px;'>비밀번호를 입력해주세요.</span>";
				pw.focus();
				return false;
			}

			window.location.href = "${contextPath}/main";
			return false;
		}

		function findId() {
	        var name = document.getElementById("name").value.trim();
	        var phoneNum = document.getElementById("phoneNum").value.trim();
	        var idErrorMessage = document.getElementById("id-error-message");
	        var foundInfo = document.getElementById("found-info");
	        var noInfoMessage = document.getElementById("no-info-message");
	        var foundName = document.getElementById("found-name");
	        var foundId = document.getElementById("found-id");
	        var findForm = document.getElementById("findForm");
	
	        idErrorMessage.innerHTML = "";
	
	        if (name === "") {
	            idErrorMessage.innerHTML = "<span style='color: red; font-size:10px;'>이름을 입력해주세요.</span>";
	            return false;
	        }
	
	        if (phoneNum === "") { 
	            idErrorMessage.innerHTML = "<span style='color: red; font-size:10px;'>휴대폰번호를 입력해주세요.</span>";
	            return false;
	        }
	
	        if (userData && userData.id) {
	            foundName.innerText = userData.name;
	            foundId.innerText = userData.id;
	            findForm.style.display = "none";
	            foundInfo.style.display = "block";
	            noInfoMessage.style.display = "none";
	        } else {
	            findForm.style.display = "none";
	            foundInfo.style.display = "none";
	            noInfoMessage.style.display = "block";
	        }
	
	        return false;
	    }
		
	    function findPwd() {
	        var email = document.getElementById("email").value.trim();
	        var phoneNum = document.getElementById("phoneNum").value.trim();
	        var idErrorMessage = document.getElementById("id-error-message");
	        var foundInfo = document.getElementById("found-info");
	        var noInfoMessage = document.getElementById("no-info-message");
	        var foundName = document.getElementById("found-name");
	        var foundId = document.getElementById("found-id");
	        var findForm = document.getElementById("findForm");
	
	        idErrorMessage.innerHTML = "";
	
	        if (email === "") {
	            idErrorMessage.innerHTML = "<span style='color: red; font-size:10px;'>아이디를 입력해주세요.</span>";
	            return false;
	        }
	
	        if (phoneNum === "") {
	            idErrorMessage.innerHTML = "<span style='color: red; font-size:10px;'>휴대폰번호를 입력해주세요.</span>"; // 변수명 수정
	            return false;
	        }
	
	        if (userData && userData.id) {
	            foundName.innerText = userData.name;
	            foundId.innerText = userData.id;
	            findForm.style.display = "none";
	            foundInfo.style.display = "block";
	            noInfoMessage.style.display = "none";
	        } else {
	            findForm.style.display = "none";
	            foundInfo.style.display = "none";
	            noInfoMessage.style.display = "block";
	        }
	
	        return false;
	    }
	   
		function resetPwdForm(){
			var newPassword = document.getElementById("newPassword").value.trim();
	        var checkPassword = document.getElementById("checkPassword").value.trim(); // 변수명 수정
	        var idErrorMessage = document.getElementById("id-error-message");
	        
	        idErrorMessage.innerHTML = "";
	
	        if (email === "") {
	            idErrorMessage.innerHTML = "<span style='color: red; font-size:10px;'>아이디를 입력해주세요.</span>";
	            return false;
	        }
	
	        if (phoneNum === "") { // 변수명 수정
	            idErrorMessage.innerHTML = "<span style='color: red; font-size:10px;'>휴대폰번호를 입력해주세요.</span>"; // 변수명 수정
	            return false;
	        }
		}
	
		function resetPwdForm() {
	        var newPassword = document.getElementById('newPassword').value;
	        var checkPassword = document.getElementById('checkPassword').value;
	
	        var passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[a-zA-Z\d!@#$%^&*]{6,15}$/;
	        var passwordMatch = passwordInput === checkPassword;
	
	        return { isValid: passwordRegex.test(passwordInput), isMatch: passwordMatch };
	    }

	 
		function updatePasswordNotice() {
			var passNotice = document.getElementById('passNotice');
			var passwordValidation = validatePassword();
			var passwordInput = document.getElementById('passwordInput');
			var confirmPasswordInput = document.getElementById('confirmPasswordInput');

			passNotice.querySelectorAll('p').forEach(function(element) {
				element.style.display = 'none';
			});

			if (newPassword.value !== "") {
				if (passwordValidation.isValid) {
					passNotice.querySelector('.ico-possible').style.display = 'block';
				} else {
					passNotice.querySelector('.ico-possible').style.display = 'none';
					passNotice.querySelector('.ico-impossible').style.display = 'block';
					return;
				}

				if (passwordValidation.isMatch
						&& confirmPasswordInput.value !== "") {
					passNotice.querySelector('.ico-same').style.display = 'block';
					passNotice.querySelector('.ico-possible').style.display = 'none';
				} else if (!passwordValidation.isMatch
						&& confirmPasswordInput.value !== "") {
					passNotice.querySelector('.ico-notsame').style.display = 'block';
					passNotice.querySelector('.ico-possible').style.display = 'none';
				}

			}
		}
	</script>
</body>
</html>
