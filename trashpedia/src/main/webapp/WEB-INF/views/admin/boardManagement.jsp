<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                            <div class="board-subtitle">총 3개</div>
                        </div>
                        <div class="bigCategoryList list">
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글</div>
                                <div class="Subtitle">001</div>
                            </div>
                        </div>
                    </div>
                    <div class="inner-category-container">
                        <div class="category-title-wrapper">
                            <div class="board-title">서브 카테고리</div>
                            <div class="board-subtitle">총 5개</div>
                        </div>
                        <div class="subCategoryList list">
                        	<div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글</div>
                                <div class="Subtitle">001</div>
                        	</div>
                        </div>
                    </div>
                </div>
                <div class="board-container">
                    <div class="board-title-wrapper">
                        <div class="board-title">게시글 리스트</div>
                        <div class="board-subtitle">총 300,000개</div>
                    </div>
                    <div class="list">
                        <div class="item">
                            <div class="icon">😃</div>
                            <div class="title">게시글1</div>
                        </div>
                    </div>
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
	    	loadData();
	    });
	    $('.userList').scroll(function() {
	        if($(this).scrollTop() + $(this).innerHeight() + 70 >= $(this)[0].scrollHeight) {
	            if (!isLoading) {
	                isLoading = true;
	                loadData();
	            }
	        }
	    });
	
	    function loadData() {
	        $.ajax({
	            url: '${contextPath}/admin/getMember',
	            type: 'GET',
	            dataType: 'json',
	            data: { page: offset, size: 20 },
	            success: function(data) {
	            	if(data.content.length != 0){
		                updateTable(data);
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
	
	    function updateTable(data) {
	        let userList = document.querySelector('.subCategoryList');
	        let list = data.content;
	        for (let i = 0; i < list.length; i++) {
	            let row = '<div class="item" onclick="loadDetailData('+list[i].userNo+')">';
	            row += '<div class="icon">😃</div>';
	            row += '<div class="title">NO : </div>';
	            row += '<div class="subtitle">'+list[i].userNo+'</div>';
	            row += '</div>';
	            userList.innerHTML += row;
	            <div class="item">
                <div class="icon">😃</div>
                <div class="title">게시글</div>
                <div class="Subtitle">001</div>
            </div>
	        }
	    }
	
	    function loadDetailData(userNo) {
	        $.ajax({
	            url: '${contextPath}/admin/getMemberDetail',
	            type: 'GET',
	            dataType: 'json',
	            data: {userNo},
	            success: function(data) {
	            	let userList = document.querySelector('.userDetailList');
	            	userList.innerHTML = '';
		            let row = '<div class="item">';
		            row += '<div class="icon">😃</div>';
		            row += '<div class="title">NO :</div>';
		            row += '<div class="subtitle">'+data.userNo+'</div>';
		            row += '</div>';
		            row += '<div class="item">';
		            row += '<div class="icon">😃</div>';
		            row += '<div class="title">Email : </div>';
		            row += '<div class="subtitle">'+data.userEmail+'</div>';
		            row += '</div>';
		            row += '<div class="item">';
		            row += '<div class="icon">😃</div>';
		            row += '<div class="title">Name : </div>';
		            row += '<div class="subtitle">'+data.userName+'</div>';
		            row += '</div>';
		            row += '<div class="item">';
		            row += '<div class="icon">😃</div>';
		            row += '<div class="title">Nickname : </div>';
		            if(data.userNickname == null){
	    	            row += '<div class="subtitle">없음</div>';
		            } else {
	    	            row += '<div class="subtitle">'+data.userNickname+'</div>';
		            }
		            row += '</div>';
		            row += '<div class="item">';
		            row += '<div class="icon">😃</div>';
		            row += '<div class="title">address : </div>';
		            if(data.address1 == null){
			            row += '<div class="subtitle">없음</div>';
		            } else {
	    	            row += '<div class="subtitle">'+data.address1+list.address2+'</div>';
		            }
		            row += '</div>';
		            row += '<div class="item">';
		            row += '<div class="icon">😃</div>';
		            row += '<div class="title">Created At : </div>';
		            row += '<div class="subtitle">'+data.createDate+'</div>';
		            row += '</div>';
		            row += '<div class="item">';
		            row += '<div class="icon">😃</div>';
		            row += '<input type="button" value="상세보기" onclick="detailmember('+data.userNo+')"/>';
		            row += '</div>';
		            userList.innerHTML += row;
		        },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	                isLoading = false;
	            }
	        });
	    };
        function writeBoard(){
            location.href = "adminBoard.html";
        }
    </script>
</body>