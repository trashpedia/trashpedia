<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>memberManagement</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/admin/memberManagement.css">
</head>
<jsp:include page="../common/header.jsp"/>
<body class="body">
    <jsp:include page="../common/sidebar.jsp"/>
    <div class="content-wrapper">
        <div class="content">
            <section class="search-section">
                <div class="search-container">
                    <div class="search-title">회원 관리</div>
                    <div class="input">
                        <select name="condition" id="filterSelect">
                            <option value="userNo" selected>번호</option>
                            <option value="userName">이름</option>
                            <option value="userNickName">닉네임</option>
                            <option value="phone">전화번호</option>
                        </select>
                        <input type="search" name="search" id="search" placeholder="Search">
                        <input type="button" id="search" value="검색">
                    </div>
                </div>
            </section>
            <section class="member-section">
                <div class="member-container">
                    <div class="member-title-wrapper">
                        <div class="member-title">회원 리스트</div>
                        <div class="member-subtitle">총 500,000명</div>
                    </div>
                    <div class="list">
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">User ID</div>
                            <div class="Subtitle">001</div>
                        </div>
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">User ID</div>
                            <div class="subtitle">001</div>
                        </div>
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">User ID</div>
                            <div class="subtitle">001</div>
                        </div>
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">User ID</div>
                            <div class="subtitle">001</div>
                        </div>
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">User ID</div>
                            <div class="subtitle">001</div>
                        </div>
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">User ID</div>
                            <div class="subtitle">001</div>
                        </div>
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">User ID</div>
                            <div class="subtitle">001</div>
                        </div>
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">User ID</div>
                            <div class="subtitle">001</div>
                        </div>
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">User ID</div>
                            <div class="subtitle">001</div>
                        </div>
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">User ID</div>
                            <div class="subtitle">001</div>
                        </div>
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">User ID</div>
                            <div class="subtitle">001</div>
                        </div>
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">User ID</div>
                            <div class="subtitle">001</div>
                        </div>
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">User ID</div>
                            <div class="subtitle">001</div>
                        </div>
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">User ID</div>
                            <div class="subtitle">001</div>
                        </div>
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">User ID</div>
                            <div class="subtitle">001</div>
                        </div>
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">User ID</div>
                            <div class="subtitle">001</div>
                        </div>
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">User ID</div>
                            <div class="subtitle">001</div>
                        </div>
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">User ID</div>
                            <div class="subtitle">001</div>
                        </div>
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">User ID</div>
                            <div class="subtitle">001</div>
                        </div>
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">User ID</div>
                            <div class="subtitle">001</div>
                        </div>
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">User ID</div>
                            <div class="subtitle">001</div>
                        </div>
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">User ID</div>
                            <div class="subtitle">001</div>
                        </div>
                    </div>
                </div>
                <div class="member-container">
                    <div class="member-title">회원 상세</div>
                    <div class="list">
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">User ID : </div>
                            <div class="subtitle">001</div>
                        </div>
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">Email : </div>
                            <div class="subtitle">example@example.com</div>
                        </div>
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">Name : </div>
                            <div class="subtitle">John Doe</div>
                        </div>
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">Nickname : </div>
                            <div class="subtitle">johndoe</div>
                        </div>
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">Address : </div>
                            <div class="subtitle">123 Street</div>
                        </div>
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">Created At : </div>
                            <div class="subtitle">2021-01-01</div>
                        </div>
                        <div class="item">
                            <div class="icon">😃</div>
                            <input type="button" value="상세보기" onclick="detailmember(1)"/>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
    <script>
        function detailmember(userNo){
            location.href="/detail=" + userNo;
        }
    </script>
</body>