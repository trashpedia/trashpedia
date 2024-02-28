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
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/${VERSION}/kakao.min.js" integrity="${INTEGRITY_VALUE}" crossorigin="anonymous"></script>
</head>
<body class="body-login">
   <jsp:include page="../common/header.jsp"/>
   <main>
   <a href="myPage">마이페이지로 이동</a>
   <!-- 1. 로그인 페이지 -->
    <div class="content-login" id="loginArea">
        <div class="top-margin"></div>
        
        <span class="logo">로그인</span><br>
        <div class="div-login"></div>
       <form action="login.me" method='post'>
            <input type="text" class="input-login" id="id" placeholder="아이디를 입력해주세요" class="in" name="">
            <div id="id-error-message" class="error-message"></div>
            <input type="password" class="input-pwd" id="pwd" placeholder="비밀번호를 입력해주세요" class="in" name="">
            <div id="pwd-error-message" class="error-message"></div>
            <input type="submit" id="btn" value="이메일 로그인">
            <br>
       	<div class="a-login">
            <a class ="findIdBtn" >아이디찾기</a>
            <a class ="findPwdBtn">비밀번호찾기</a>
            <a href="${contextPath}/join">회원가입</a>
        </div>
            <br>
            <br>
        </form>
       <button id="go-kakao" onclick="location.href = '/'">카카오로 로그인</button>
       <button id="go-naver">네이버로 로그인</button>
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
					<a class ="findPwdBtn">비밀번호찾기</a>
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
					 <a class ="findIdBtn" >아이디찾기</a>
					<a href ="${contextPath}/join">회원가입 </a>
				</div>
				<input type="submit" id="btn" value="비밀번호 찾기">
			</form>
		</div>
		
		<!-- 비밀번호 재설정 -->
		<div class="content-login" id="resetPwdArea">
			<div class="top-margin"></div>
			<span class="logo-find">비밀번호 재설정</span><br>
			<div class="div-login"></div>
			<form action="resetPwd.me" onsubmit="return resetPwd()" >
			
				<div id="findForm" style="position: relative;">
						<input type="text" class="input-login in" id="newPassword"
							placeholder="새로운 비밀번호를 입력해주세요">
						<input type="text" class="input-login in" id="checkPassword"
							placeholder="비밀번호를 한번 더 입력해주세요">
						<div id="passNotice" class="on-cont">
			                <p class="ico-possible">가능</p>
			                <p class="ico-impossible">불가능</p>
			                <p class="ico-same">일치</p>
			                <p class="ico-notsame">불일치</p>
			            </div>
	            </div>
					
				<br>
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
    <jsp:include page="../common/footer.jsp"/>
	<script>
		Kakao.init('613219f2943fa9cbe4fff314968bf471');
		console.log(Kakao.isInitialized());
		Kakao.isInitialized();
		
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
        var name = document.getElementById("name").value.trim(); // 변수명 수정
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

        if (phoneNum === "") { // 변수명 수정
            idErrorMessage.innerHTML = "<span style='color: red; font-size:10px;'>휴대폰번호를 입력해주세요.</span>"; // 변수명 수정
            return false;
        }

        // 실제로는 이 부분에서 서버에 요청하여 사용자 정보를 찾아오는 로직이 들어가야 합니다.
        // 임시로 사용자 정보를 하드코딩합니다.

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
        var phoneNum = document.getElementById("phoneNum").value.trim(); // 변수명 수정
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

        if (phoneNum === "") { // 변수명 수정
            idErrorMessage.innerHTML = "<span style='color: red; font-size:10px;'>휴대폰번호를 입력해주세요.</span>"; // 변수명 수정
            return false;
        }

        // 실제로는 이 부분에서 서버에 요청하여 사용자 정보를 찾아오는 로직이 들어가야 합니다.
        // 임시로 사용자 정보를 하드코딩합니다.
      
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
	    $("#resetPwdArea").hide();
	    
	    
	    $(".findPwdBtn").click(function(){
	        $("#findPwdArea").show();
	        $("#findIdArea").hide();
	        $("#loginArea").hide();
	    });

	    $(".findIdBtn").click(function(){
	        $("#findIdArea").show();
	        $("#findPwdArea").hide();
	        $("#loginArea").hide();
	    });
	});
</script>

<script>
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

        // 기본적으로 모든 메시지를 숨김
        passNotice.querySelectorAll('p').forEach(function (element) {
            element.style.display = 'none';
        });

        // 비밀번호 입력란에 입력이 시작될 때 메시지 보이기
        if (newPassword.value !== "") {
            // 비밀번호 유효성 검사
            if (passwordValidation.isValid) {
                passNotice.querySelector('.ico-possible').style.display = 'block';
            } else {
                passNotice.querySelector('.ico-possible').style.display = 'none';
                passNotice.querySelector('.ico-impossible').style.display = 'block';
                return; // 비밀번호 유효성 검사를 통과하지 못하면 이후의 검사를 진행하지 않음
            }

            // 비밀번호 재확인 일치 여부 검사
            if (passwordValidation.isMatch && confirmPasswordInput.value !== "") {
                passNotice.querySelector('.ico-same').style.display = 'block';
                passNotice.querySelector('.ico-possible').style.display = 'none'; // 가능 문구는 지워줌
            } else if (!passwordValidation.isMatch && confirmPasswordInput.value !== "") {
                passNotice.querySelector('.ico-notsame').style.display = 'block';
                passNotice.querySelector('.ico-possible').style.display = 'none';
            }
        }
    }
</script>
</body>
</html>
