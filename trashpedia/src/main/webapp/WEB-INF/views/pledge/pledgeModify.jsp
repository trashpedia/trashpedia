<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>실천게시글</title>
</head>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/main/practiceModify.css">
<body>
    <jsp:include page="../common/header.jsp"/>
    <main>
        <div class="container">
            <div class="content-title-outer">
                <input type="text" class="input-title" placeholder="제목을 입력하세요.">
                <hr>
            </div>
            <div class="content-outer">
                <textarea class="content-inner" placeholder="내용을 입력하세요."></textarea>
                <div class="post-buttons">
                    <a href="practiveView.html"><button class="btn-list">목록</button></a>
                    <a href="practiceModify.html"><button class="btn-edit">수정</button></a>
                    <a href=""><button class="btn-delete">삭제</button></a>
                </div>
            </div>
        </div>
    </main>
    <jsp:include page="../common/footer.jsp"/>
    <script>
    
    </script>
</body>
</html>