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
		<section id="loginArea">
			<div class="content-login">
				<div class="title-wrapper">
					<span class="title">로그인</span>
				</div>
				<form action="${contextPath}/login" method='post' id="loginForm">
					<input type="text" class="input-login" id="id" placeholder="아이디를 입력해주세요" class="in" name="username">
					<input type="password" class="input-pwd" id="pwd" placeholder="비밀번호를 입력해주세요" class="in" name="password">
					<input type="submit" class="btn" id="loginBtn" value="이메일 로그인">
				</form>
				<div class="a-login">
					<a class="findIdBtn">아이디찾기</a>
					<a class="findPwdBtn">비밀번호찾기</a>
					<a href="${contextPath}/member/join">회원가입</a>
				</div>
				<div class="social-login-wrapper">
					<img alt="카카오 로그인" src="${contextPath}/resources/image/user/kakao_login_medium_wide.png" onclick="location.href='${contextPath}/kakao/login'" class="kakao-login">
					<img alt="네이버 로그인" src="${contextPath}/resources/image/user/naver_login_green.png" onclick="location.href='${contextPath}/naver/login'" class="naver-login">
				</div>
			</div>
		</section>
		<section id="findIdArea">
			<div class="content-login-find">
				<div class="title-wrapper">
					<span class="title">아이디 찾기</span>
				</div>
				<div id="findForm" style="position: relative;">
					<input type="text" class="input-login in" id="userName" placeholder="이름을 입력해주세요">
					<input type="text" class="input-login in" id="phone" placeholder="휴대폰번호를 입력해주세요">
				</div>
				<input type="button" class="btn" id="findEmailBtn" value="아이디 찾기" onclick="findEmail()">
				<div class="a-findId-2">
					<a href="${contextPath}/login">로그인하기</a>
					<a class="findPwdBtn">비밀번호찾기</a>
					<a href="${contextPath}/member/join">회원가입</a>
				</div>
			</div>
		</section>
		<!-- 비밀번호 찾기 -->
		<section id="findPwdArea">
			<div class="content-login">
				<div class="title-wrapper">
					<span class="title">비밀번호 찾기</span>
				</div>
				<div id="findForm" style="position: relative;">
					<input type="text" class="input-login in" id="userEmail" placeholder="아이디를 입력해주세요">
					<input type="text" class="input-login in" id="pwdPhone" placeholder="휴대폰번호를 입력해주세요">
				</div>
				<input type="submit" class="btn" id="findPwdBtn" value="비밀번호 찾기" onclick="findPwd()">
				<div class="a-findId-2">
					<a href="${contextPath}/login">로그인하기</a>
					<a class="findIdBtn">아이디찾기</a>
					<a href="${contextPath}/member/join">회원가입</a>
				</div>
			</div>
		</section>
	</main>
	<jsp:include page="../common/footer.jsp" />
	<script>
		let userPwd = '';
		
		$(document).ready(function() {
		    $("#loginArea").show();
		    $("#findIdArea").hide();
		    $("#findPwdArea").hide();
		    $("#resetPwdArea").hide();
		});
		
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
		
		function emailCheck() {
		    var id = document.getElementById("id");
		    var pw = document.getElementById("pwd");
		
		    if (id.value.trim() === "") {
		        alert("아이디를 입력해주세요");
		        id.focus();
		        return;
		    }
		
		    if (pw.value.trim() === "") {
		        alert("비밀번호를 입력해주세요");
		        pw.focus();
		        return;
		    }
		
		    return true;
		}
		
		$('#loginForm').submit(function(event) {
		    if (!emailCheck()) {
		        event.preventDefault();
		    }
		});

		function findEmail() {
	        var userName = document.getElementById("userName").value.trim();
	        var phone = document.getElementById("phone").value.trim();
	
	        if (userName === "") {
	            alert("이름을 입력해주세요");
	            userName.focus();
	            return false;
	        }
	
	        if (phone === "") {
	            alert("휴대폰번호를 입력해주세요");
				phone.focus();
	            return false;
	        }
	
	        $.ajax({
	            url: '${contextPath}/member/findEmail',
	            type: 'GET',
	            data: {userName : userName, phone : phone},
	            success: function(data) {
	            	if(data != ""){
	            		alert("가입하신 이메일은 "+data.userEmail+"입니다.");
	            		location.href="${contextPath}/login"
	            	} else {
	            		alert("해당 정보로 가입한 이메일을 찾을 수 없습니다. 다시입력해주세요");
	            		document.getElementById("userName").value = "";
	        			document.getElementById("phone").value = "";
	            		document.getElementById("userName").focus();
	            	}
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	            }
	        });
	
	        return false;
	    }
		
		function findPwd() {
	        let userEmail = document.getElementById("userEmail").value.trim();
	        let phone = document.getElementById("pwdPhone").value.trim();
	
	        if (userEmail === "") {
	            alert("아이디를 입력해주세요");
	            userEmail.focus();
	            return false;
	        }
	
	        if (phone === "") {
	            alert("휴대폰번호를 입력해주세요.");
	            phone.focus();
	            return false;
	        }
	        
	        $.ajax({
	        	url: "${contextPath}/member/checkEmail",
	        	data: {userEmail : userEmail, phone : phone},
	        	success: function(result){
	        		if(result > 0){
	        			$.ajax({
	        				url: "/trashpedia/auth/temporaryPwd",
	        				data:{userEmail : userEmail, phone : phone},
	        				success:function(result){
	        					if(result > 0){
		       						alert(userEmail+"로 임시 비밀번호를 보냈습니다. 로그인 후 마이페이지에서 비밀번호를 변경해주세요");
		       						location.href="${contextPath}/login";
	        					} else {
	        						alert("임시 비밀번호 발급에 실패했습니다. 잠시 후 다시 시도해주세요.");
	        					}
	        				},
	        				error:function (xhr, status, error){
	        					console.log(status, error);
	        				}
	        			});
	        		} else {
	        			alert("입력하신 정보가 불일치합니다. 다시확인해주세요");
	        			document.getElementById("userEmail").value = "";
	        			document.getElementById("pwdPhone").value = "";
	        			document.getElementById("userEmail").focus();
	        		}
	        	},
	        	error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	            }
	        });
	    }
	</script>
</body>
</html>
