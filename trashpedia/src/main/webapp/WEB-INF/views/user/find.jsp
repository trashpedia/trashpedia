<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Login Form</title>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/find-id.css">
</head>
<body class="body-login">
    <jsp:include page="../common/header.jsp"/>
    <main>
        <div class="content-login">
            <div class="top-margin"></div>
            <span class="logo">아이디 찾기</span><br>
            <div class="div-login"></div>
            <form action="#" onsubmit="return findId()">
            <div id="findForm">
                <input type="text" class="input-login" id="name" placeholder="이름을 입력해주세요" class="in">
                <input type="text" class="input-login" id="email" placeholder="이메일을 입력해주세요" class="in">
                <div id="id-error-message" class="error-message"></div>
            </div>
                <br>
                <div id="found-info" style="display: none;">
                    <span id="found-name"></span>님의 아이디는 <span id="found-id"></span> 입니다.
                </div>
                <div id="no-info-message" style="display: none;">
                    가입된 정보가 없습니다.
                </div>
                <br>
            <div class="a-findId">
                <a href="find-pwd.html">로그인하기</a>
                <a href="find-pwd.html">비밀번호찾기</a>
                <a href="joinMembership.html">회원가입 </a>
            </div>
                <br>
                <br>
                <input type="submit" id="btn" value="아이디 찾기">
            </form>
        </div>
    </main>
    <jsp:include page="../common/footer.jsp"/>
	<script>
		function findId() {
			var name = document.getElementById("name").value.trim();
			var email = document.getElementById("email").value.trim();
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
</body>
</html>