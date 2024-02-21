<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>adminLogin</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/admin/adminLogin.css">
</head>
<body class="body">
	<form action="login.ad" method="POST">
		<h2>
			<span class="entypo-login"><i class="fa fa-sign-in"></i></span> Login
		</h2>
		<button class="submit">
			<span class="entypo-lock"><i class="fa fa-lock"></i></span>
		</button>
		<span class="entypo-user inputUserIcon"> <i class="fa fa-user"></i></span>
		<input type="text" class="user" placeholder="ursername" />
		<span class="entypo-key inputPassIcon"> <i class="fa fa-key"></i></span>
		<input type="password" class="pass" placeholder="password" />
	</form>
	<script>
		$(".user").focusin(function() {
			$(".inputUserIcon").css("color", "#e74c3c");
		}).focusout(function() {
			$(".inputUserIcon").css("color", "white");
		});
		$(".pass").focusin(function() {
			$(".inputPassIcon").css("color", "#e74c3c");
		}).focusout(function() {
			$(".inputPassIcon").css("color", "white");
		});
	</script>
</body>
</html>