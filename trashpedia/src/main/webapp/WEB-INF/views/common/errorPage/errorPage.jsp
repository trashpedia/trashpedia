<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ErrorPage</title>
</head>
<style>
	body {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		height: 100vh;
		margin: 0;
		font-family: 'Arial', sans-serif;
	}
	main {
		box-sizing: border-box;
		padding-top: 120px;
		text-align: center;
		color: #333;
	}
	main a {
		color: #007bff; /* 파란색 */
		text-decoration: none;
		font-weight: bold;
	}
	main a:hover {
		text-decoration: underline;
	}
	#errorMsg {
		margin-bottom: 80px;
		font-size: 18px;
		font-weight: bold;
		color: #e44d26; /* 빨간색 */
	}
</style>

<body>
	<jsp:include page="../header.jsp" />
	<main>
		<h1> 오류가 발생했습니다. </h1>
		<p> 문제가 지속되면 관리자에게 문의해주세요. </p>
		<p id="errorMsg">${errorMessage}</p>
		<a href="${contextPath}/">홈 페이지로 이동</a>
	</main>
	<jsp:include page="../footer.jsp" />
</body>

</html>