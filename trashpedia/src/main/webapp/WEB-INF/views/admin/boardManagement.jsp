<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>boardManagement</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/admin/boardManagement.css">
</head>
<jsp:include page="../common/header.jsp"/>
<body class="body">
    <jsp:include page="../common/sidebar.jsp"/>
    <div class="content-wrapper">
        <div class="content">
            <section class="search-section">
                <div class="search-container">
                    <div class="search-title">게시글 관리</div>
                    <div class="input">
                        <select name="condition" id="filterSelect">
                            <option value="userNo" selected>번호</option>
                            <option value="userName">제목</option>
                            <option value="userNickName">작성자</option>
                        </select>
                        <input type="search" name="search" id="search" placeholder="Search">
                        <input type="button" id="search" value="검색">
                    </div>
                </div>
            </section>
            <input class="trash-write" type="button" onclick="writeBoard()" value="글쓰기">
            <section class="board-section">
                <div class="category-container">
                    <div class="inner-category-container">
                        <div class="category-title-wrapper">
                            <div class="board-title">빅 카테고리</div>
                            <div class="board-subtitle">총 ${fn:length(bcl) + 1}개</div>
                        </div>
                        <div class="bigCategoryList list">
                        <c:forEach var="bcl" items="${bcl}">
                            <div class="item" onclick="loadSubCategoryList(${bcl.bigCategoryNo})">
                                <div class="icon">😃</div>
                                <div class="title">${bcl.bigCategoryName}</div>
                            </div>
                        </c:forEach>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">관리자</div>
                            </div>
                        </div>
                    </div>
                    <div class="inner-category-container">
                        <div class="category-title-wrapper subCategory-title">
                            <div class="board-title">서브 카테고리</div>
                            <div class="board-subtitle">총 5개</div>
                        </div>
                        <div class="subCategoryList list"></div>
                    </div>
                </div>
                <div class="board-container">
                    <div class="board-title-wrapper">
                        <div class="board-title">게시글 리스트</div>
                        <div class="board-subtitle">총 300,000개</div>
                    </div>
                    <div class="boardList list"></div>
                </div>
                <div class="board-container">
                    <div class="board-title">게시글 상세</div>
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
                                <div class="title">title : </div>
                            <div class="subtitle">밥 먹었습니까</div>
                        </div>
                        <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">content : </div>
                            <div class="subtitle">저는 밥 먹었습니다 아주 맛있게요 냠냠쩝쩝</div>
                        </div>
                        <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">Created At : </div>
                            <div class="subtitle">2021-01-01</div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
    <script>
		var isLoading = false;
	    var offset = 0;
		
	    $(document).ready(function() {
	    	loadSubCategoryList(1);
	    	loadBoardList();
	    	loadBoardDetail();
	    });
	    $('.boardList').scroll(function() {
	        if($(this).scrollTop() + $(this).innerHeight() + 70 >= $(this)[0].scrollHeight) {
	            if (!isLoading) {
	                isLoading = true;
	                loadBoardDetailData();
	            }
	        }
	    });
	
	    function loadSubCategoryList(bigCategoryNo) {
	        $.ajax({
	            url: '${contextPath}/admin/getSubCategoryList',
	            type: 'GET',
	            dataType: 'json',
	            data: { bigCategoryNo },
	            success: function(data) {
	            	if(data.content.length != 0){
		                updateSubCategoryTable(data);
		                isLoading = false;
	            	}
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	                isLoading = false;
	            }
	        });
	    }
	    function updateSubCategoryTable(data) {
	        let userList = document.querySelector('.boardList');
	        let list = data.content;
	        for (let i = 0; i < list.length; i++) {
	            let row = '<div class="item" onclick="loadBoardDetailData('+list[i].boardNo+')">';
	            row += '<div class="icon">😃</div>';
	            row += '<div class="subtitle">'+list[i].bigCategoryName+'</div>';
	            row += '<div class="subtitle">'+list[i].subCategoryName+'</div>';
	            row += '<div class="subtitle">'+list[i].title+'</div>';
	            row += '</div>';
	            userList.innerHTML += row;
	        }
	    }
	    
	    function loadSubCategoryList(bigCategoryNo) {
	        $.ajax({
	            url: '${contextPath}/admin/getMemberBoardList',
	            type: 'GET',
	            dataType: 'json',
	            data: { page: offset, size: 20, userNo: ${m.userNo} },
	            success: function(data) {
	            	if(data.content.length != 0){
		                updateBoardTable(data);
		                offset += 1;
		                isLoading = false;
	            	}
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	                isLoading = false;
	            }
	        });
	    }
	    function updateBoardTable(data) {
	        let userList = document.querySelector('.boardList');
	        let list = data.content;
	        for (let i = 0; i < list.length; i++) {
	            let row = '<div class="item" onclick="loadBoardDetailData('+list[i].boardNo+')">';
	            row += '<div class="icon">😃</div>';
	            row += '<div class="subtitle">'+list[i].bigCategoryName+'</div>';
	            row += '<div class="subtitle">'+list[i].subCategoryName+'</div>';
	            row += '<div class="subtitle">'+list[i].title+'</div>';
	            row += '</div>';
	            userList.innerHTML += row;
	        }
	    }
        function writeBoard(){
            location.href = "adminBoard.html";
        }
    </script>
</body>