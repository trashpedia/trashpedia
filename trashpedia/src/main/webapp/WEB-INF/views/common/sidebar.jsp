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
                        <div class="sidebar-title">
	                        <a href="${contextPath}/admin">
	                        <span class="material-symbols-outlined"> grid_view</span><span>메인</span></a>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sidebar-li">
                        <div class="sidebar-title">
                        <a href="${contextPath}/admin/member"><span class="material-symbols-outlined">patient_list</span><span>회원 관리</span></span></a>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sidebar-li">
                        <div class="sidebar-title">
                        <a href="${contextPath}/admin/board"><span class="material-symbols-outlined">data_check</span><span>게시글 관리</span></a>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sidebar-li">
                        <div class="sidebar-title">
                        <a href="${contextPath}/admin/trash"><span class="material-symbols-outlined">delete_sweep</span><span>쓰레기 관리<span></a>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sidebar-li">
                        <div class="sidebar-title">
                        <a href="${contextPath}/admin/report"><span class="material-symbols-outlined">data_alert</span><span>신고 관리</span></a>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>