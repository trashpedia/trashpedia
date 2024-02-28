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
		<h1>페이지를 찾을 수 없습니다.</h1>
		
	    <p>죄송합니다. 요청하신 페이지를 찾을 수 없습니다.</p>
	    <p>만약 이 페이지가 사라졌거나 이동되었다면, 다시 한 번 확인해보시기 바랍니다.</p>
	    <p>문제가 지속되면 관리자에게 문의해주세요.</p>
	</main>
	<jsp:include page="../footer.jsp" />
    
</body>
</html>