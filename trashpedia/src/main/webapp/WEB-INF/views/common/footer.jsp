<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Footer</title>
    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/common/footer.css">
</head>
<body>
    <footer>
        <div class="footer-outer">
            <div class="quick-links">
                <span><strong><a href="#">TRASHPEDIA</a></strong></span> 
                <span><a href="/">공지사항</a></span> |
                <span><a href="/">이용약관</a></span> |
                <span><a href="/">개인정보처리방침</a></span> |
                <span><a href="/">영상정보처리방침</a></span>
            </div>
            <div class="footer-info">
                <!-- <span><strong>COMPANY</strong> | </span>  -->
                <span> (우) 서울특별시 강남구 테헤란로14길 6 남도빌딩 2층 C반  </span>|
                <span> 책임자 : 류은선, 손형우, 오정연, 이준형, 정준식 </span> 
            </div>
            <div class="follow-us">
                <span>GitHub</span>
                <span><a href="https://github.com/ES1230"> <i class="fab fa-github github-icon"></i>류은선</a></span>
                <span><a href="https://github.com/son33"> <i class="fab fa-github github-icon"></i>손형우</a></span>
                <span><a href=""> <i class="fab fa-github github-icon"></i>오정연</a></span>
                <span><a href="https://github.com/970606Lee"> <i class="fab fa-github github-icon"></i >이준형</a></span>
                <span><a href=""> <i class="fab fa-github github-icon"></i>정준식</a></span>
            </div>
            <div class="reserved">
                <span> &copy; 2024 TRASHPEDIA. ALL RIGHTS RESERVED. </span>
            </div>
        </div>
    </footer>
</body>
</html>


   <!-- <div class="site-navigation">
            <h4>사이트 내비게이션</h4>
            <ul>
                <li><a href="/category1">카테고리 1</a></li>
                <li><a href="/category2">카테고리 2</a></li>
            </ul>
        </div> -->