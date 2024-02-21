<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Login Form</title>
    <link rel="stylesheet" href="resources/css/user/login.css">
    
    
    
    
    
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
</head>
<body class="body-login">
   <jsp:include page="../common/header.jsp"/>
   <main>
   <!-- 1. 로그인 페이지 -->
    <div class="content-login" id="loginArea">
        <div class="top-margin"></div>
        <span class="logo">로그인</span><br>
        <div class="div-login"></div>
       <form action="login.me">
            <input type="text" class="input-login" id="id" placeholder="아이디를 입력해주세요" class="in">
            <div id="id-error-message" class="error-message"></div>
            <input type="password" class="input-pwd" id="pwd" placeholder="비밀번호를 입력해주세요" class="in">
            <div id="pwd-error-message" class="error-message"></div>
            <br>
       	<div class="a-login">
            <a id ="findIdBtn" >아이디찾기</a>
            <a id ="findPwdBtn">비밀번호찾기</a>
            <a href="${contextPath}/join">회원가입</a>
        </div>
            <br>
            <br>
            <input type="submit" id="btn" value="이메일 로그인">
            <button id="go-kakao">카카오로 로그인</button>
            <button id="go-naver">네이버로 로그인</button>
        </form>
    </div>
    
    <!-- 아이디 찾기 페이지  -->
    <div class="content-login-find" id="findIdArea">
	<div class="top-margin"></div>
			<span class="logo-find">아이디 찾기</span><br>
			<div class="div-login"></div>
			<form action="findId.me" onsubmit="return findId()">
					<div id="findForm" style="position: relative;">
						<input type="text" class="input-login in" id="name"
							placeholder="이름을 입력해주세요">
						<input type="text" class="input-login in" id="phoneNum"
							placeholder="휴대폰번호를 입력해주세요">
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
					<a href="${contextPath}/login">로그인하기</a>
					<a id="findPwdBtn">비밀번호찾기</a>
					<a href="${contextPath}/join">회원가입</a>
				</div>
				<input type="submit" id="btn" value="아이디 찾기">
			</form>
		</div>
		
	<!-- 비밀번호 찾기 -->
		<div class="content-login" id="findPwdArea">
			<div class="top-margin"></div>
			<span class="logo-find">비밀번호 찾기</span><br>
			<div class="div-login"></div>
			<form action="findPwd.me" onsubmit="return findPwd()" >
			
				<div id="findForm" style="position: relative;">
						<input type="text" class="input-login in" id="email"
							placeholder="아이디를 입력해주세요">
						<input type="text" class="input-login in" id="phoneNum"
							placeholder="휴대폰번호를 입력해주세요">
						<button class="verificationButton" id="verificationBtn">인증하기</button>
						<div id="id-error-message" class="error-message"></div>
					</div>
				<br>
				<!-- <div id="found-info" style="display: none;">
					<span id="found-name"></span>님의 아이디는 <span id="found-id"></span>
					입니다.
				</div>
				<div id="no-info-message" style="display: none;">가입된 정보가 없습니다.</div> -->
				<br>
				<div class="a-findId-2">
					<a href ="${contextPath}/login">로그인하기</a>
					<a id ="findIdBtn">아이디찾기</a>
					<a href ="${contextPath}/join">회원가입 </a>
				</div>
				<input type="submit" id="btn" value="비밀번호 찾기">
			</form>
		</div>
    </main>
    <jsp:include page="../common/footer.jsp"/>
	<script>
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

			// 여기에서 추가적인 검증이나 로그인 로직을 수행할 수 있습니다.
			// 예를 들어, 로그인 성공 시 메인 페이지로 이동하는 코드를 추가할 수 있습니다.

			// 메인 페이지로 이동하는 링크를 추가
			window.location.href = "main.html"; // "main.html"을 실제 메인 페이지의 경로로 수정하세요.
			return false; // 폼 제출 방지
		}
	</script>
	
	<script>
		function findId() {
			var phoneNum = document.getElementById("name").value.trim();
			var pinNum = document.getElementById("phoneNum").value.trim();
			var nameErrorMessage = document.getElementById("id-error-message");
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

			if (email === "") {
				idErrorMessage.innerHTML = "<span style='color: red; font-size:10px;'>이메일을 입력해주세요.</span>";
				return false;
			}

			// 실제로는 이 부분에서 서버에 요청하여 사용자 정보를 찾아오는 로직이 들어가야 합니다.
			// 임시로 사용자 정보를 하드코딩합니다.
			var userData = {
				name : "오정연",
				email : "ojy***@naver.com",
				id : "ojy***"
			};

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

			return false; // 폼 제출 방지
		}
	</script>
	
	<script>
		function findPwd() {
			var email = document.getElementById("email").value.trim();
			var phoneNum = document.getElementById("phoneNum").value.trim();
			var nameErrorMessage = document.getElementById("id-error-message");
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

			if (email === "") {
				idErrorMessage.innerHTML = "<span style='color: red; font-size:10px;'>이메일을 입력해주세요.</span>";
				return false;
			}

			// 실제로는 이 부분에서 서버에 요청하여 사용자 정보를 찾아오는 로직이 들어가야 합니다.
			// 임시로 사용자 정보를 하드코딩합니다.
			var userData = {
				name : "오정연",
				email : "ojy***@naver.com",
				id : "ojy***"
			};

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

			return false; // 폼 제출 방지
		}
	</script>

	<script>
	$(document).ready(function(){
	    $("#loginArea").show();
	    $("#findIdArea").hide();
	    $("#findPwdArea").hide();
	    
	    $("#findPwdBtn").click(function(){
	        $("#findPwdArea").show();
	        $("#findIdArea").hide();
	        $("#loginArea").hide();
	    });

	    $("#findIdBtn").click(function(){
	        $("#findIdArea").show();
	        $("#findPwdArea").hide();
	        $("#loginArea").hide();
	    });
	});
</script>
</body>
</html>
