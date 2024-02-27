<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/sidebar.css">
</head>
<body>
<div class="sidebar-wrapper">
    <div class="sidebar">
        <div class="sidebar-item">
            <ul class="sidebar-ul">
                <li>
                    <div class="sidebar-li">
                        <div class="icon">😃</div>
                        <div class="sidebar-title"><a href="${contextPath}/admin">메인</a></div>
                    </div>
                </li>
                <li>
                    <div class="sidebar-li">
                        <div class="icon">👥</div>
                        <div class="sidebar-title"><a href="${contextPath}/admin/member">회원 관리</a></div>
                    </div>
                </li>
                <li>
                    <div class="sidebar-li">
                        <div class="icon">📝</div>
                        <div class="sidebar-title"><a href="${contextPath}/admin/board">게시글 관리</a></div>
                    </div>
                </li>
                <li>
                    <div class="sidebar-li">
                        <div class="icon">🔔</div>
                        <div class="sidebar-title"><a href="${contextPath}/admin/trash">쓰레기 관리</a></div>
                    </div>
                </li>
                <li>
                    <div class="sidebar-li">
                        <div class="icon">🔔</div>
                        <div class="sidebar-title"><a href="${contextPath}/admin/report">신고 관리</a></div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>