<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404ErrorPage</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/error.css">
</head>
<body>

	<jsp:include page="../header.jsp" />
	<main>
		<h1>접근할 수 있는 권한이 없습니다.</h1>
	</main>
	<jsp:include page="../footer.jsp" />
    
</body>
</html>