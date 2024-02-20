<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <div class="content-login">
        <div class="top-margin"></div>
        <span class="logo">로그인</span><br>
        <div class="div-login"></div>
        <form action="#">
            <input type="text" class="input-login" id="id" placeholder="아이디를 입력해주세요" class="in">
            <div id="id-error-message" class="error-message"></div>
            <input type="password" class="input-pwd" id="pwd" placeholder="비밀번호를 입력해주세요" class="in">
            <div id="pwd-error-message" class="error-message"></div>
            <br>
        <div class="a-login">
            <a href="find-Id.html">아이디찾기</a>
            <a href="#">비밀번호찾기</a>
            <a href="#">회원가입 </a>
        </div>
            <br>
            <br>
            <input type="submit" id="btn" value="이메일 로그인" onclick="email_check();">
            <button id="go-kakao">카카오로 로그인</button>
            <button id="go-naver">네이버로 로그인</button>
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
</body>
</html>
