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
            <div class="practice-section">
			    <p>게시글 관리</p>
			    <p>board management</p>
			</div>
			<section class="content-section">
                <div class="content-container">
                	<div class="content-title-wrapper">
                    	<div class="content-title">게시글</div>
	                   	<div class="filter-wrapper">
						    <select name="condition" id="board-filter-select">
						        <option value="boardNo" selected>번호</option>
						        <option value="subCategoryName">분류</option>
						        <option value="title">제목</option>
						        <option value="hit">조회수</option>
						    </select>
						</div>
                   	</div>
					<table class="long-table board-table">
					    <thead class="long-thead board-thead">
					    	<tr class="long-tr">
					    		<th>번호</th>
					    		<th>분류</th>
					    		<th>제목</th>
					    		<th>조회수</th>
					    		<th>작성일</th>
					    		<th>수정일</th>
					    		<th>공개/비공개</th>
					    		<th>비고</th>
					    	</tr>
					    </thead>
					    <tbody class="long-tbody board-list"></tbody>
					</table>
					<div class="search-wrapper">
						<select name="condition" id="board-search-filter-select">
			                <option value="boardNo" selected>번호</option>
			                <option value="subCategoryName">분류</option>
			                <option value="title">제목</option>
			                <option value="content">내용</option>
						</select>
						<input type="search" class="search-input board-search-input" placeholder="검색어를 입력하세요">
						<input type="button" class="search-button board-search-button" value="검색" onclick="boardSearch()">
					</div>
                	<div class="board-pageBar pageBar"></div>
                </div>
			</section>
			<section class="content-section">
                <div class="content-container">
                	<div class="content-title-wrapper">
                    	<div class="content-title">댓글</div>
	                   	<div class="filter-wrapper">
						    <select name="condition" id="comment-filter-select">
						        <option value="boardNo" selected>번호</option>
						        <option value="subCategoryName">분류</option>
						        <option value="title">제목</option>
						    </select>
						</div>
                   	</div>
					<table class="long-table comment-table">
					    <thead class="long-thead comment-thead">
					    	<tr class="long-tr">
					    		<th>번호</th>
					    		<th>분류</th>
					    		<th>제목</th>
					    		<th>댓글</th>
					    		<th>작성일</th>
					    		<th>수정일</th>
					    		<th>공개/비공개</th>
					    		<th>비고</th>
					    	</tr>
					    </thead>
					    <tbody class="long-tbody comment-list"></tbody>
					</table>
					<div class="search-wrapper">
						<select name="condition" id="comment-search-filter-select">
			                <option value="boardNo" selected>번호</option>
			                <option value="subCategoryName">분류</option>
			                <option value="title">제목</option>
			                <option value="content">내용</option>
						</select>
						<input type="search" class="search-input comment-search-input" placeholder="검색어를 입력하세요">
						<input type="button" class="search-button comment-search-button" value="검색" onclick="commentSearch()">
					</div>
                	<div class="comment-pageBar pageBar"></div>
                </div>
			</section>
        </div>
    </div>
    <script>
	    var boardFilterValue = 'boardNo';
	    var commentFilterValue = 'boardNo';
	    var boardSearchSelect = null;
	    var commentSearchSelect = null;
	    var boardSearchValue = null;
	    var commentSearchValue = null;
		
	    $(document).ready(function() {
	    	getBoardList(0, boardSearchSelect, boardSearchValue);
	    	getCommentList(0, commentSearchSelect, commentSearchValue);
	    });
	    
	    $('#board-filter-select').change(function(){
	    	boardFilterValue = $(this).val();
	    	$('.board-list').empty();
	    	getBoardList(0, boardSearchSelect, boardSearchValue);
	    });

	    $('#comment-filter-select').change(function(){
	    	commentFilterValue = $(this).val();
	    	$('.comment-list').empty();
	    	getCommentList(0, commentSearchSelect, commentSearchValue);
	    });
	    
	    function boardSearch(){
	    	boardSearchSelect = $('#board-search-filter-select').val();
	    	boardSearchValue = $('.board-search-input').val();
	    	$('.board-search-input').val('');
	    	$('.board-list').empty();
	    	getBoardList(0, boardSearchSelect, boardSearchValue);
	    }
	    
	    function commentSearch(){
	    	commentSearchSelect = $('#comment-search-filter-select').val();
	    	commentSearchValue = $('.comment-search-input').val();
	    	$('.comment-search-input').val('');
	    	$('.comment-list').empty();
	    	getCommentList(0, commentSearchSelect, commentSearchValue);
	    }
	    
	    function getBoardList(page, boardSearchSelect, boardSearchValue) {
	        $.ajax({
	            url: '${contextPath}/admin/loadBoardListData',
	            type: 'GET',
	            dataType: 'json',
	            data: {page: page, size: 20, sort: boardFilterValue, searchSelect: boardSearchSelect, searchValue: boardSearchValue},
	            success: function(data) {
	            	if(data.content.length != 0){
		                updateBoardTable(data.content);
		                updateBoardPagination(data);
	            	}
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	            }
	        });
	    }

	    function updateBoardTable(data) {
	    	let userList = document.querySelector('.board-list');
	        userList.innerHTML = '';
	        for (let i = 0; i < data.length; i++) {
	            let row = document.createElement('tr');
	            row.classList.add('long-tr');
	            
	            let cell1 = document.createElement('td');
	            cell1.textContent = data[i].boardNo;
	            
	            let cell2 = document.createElement('td');
	            cell2.innerHTML = data[i].subCategoryName;
	            
	            let cell3 = document.createElement('td');
	            cell3.textContent = data[i].title;
	            
	            let cell4 = document.createElement('td');
	            cell4.textContent = data[i].hit;

	            let cell5 = document.createElement('td');
	            cell5.textContent = data[i].createDate;
	            
	            let cell6 = document.createElement('td');
	            cell6.textContent = data[i].modifyDate;

	            let cell7 = document.createElement('td');
	            cell7.textContent = data[i].status;
	            
	            let cell8 = document.createElement('td');
	    		
	            let button1 = document.createElement('input');
            	button1.setAttribute('type', 'button');
            	button1.setAttribute('value', '상세보기');
            	button1.classList.add('detail-button');
            	button1.addEventListener('click', function() {
            	    boardDetail(data[i].boardNo);
            	});
            	
	            let button2 = document.createElement('input');
            	button2.setAttribute('type', 'button');
            	button2.setAttribute('value', '삭제');
            	button2.classList.add('detail-button');
            	button2.addEventListener('click', function() {
            	    boardDelete(data[i].boardNo);
            	});
            	cell8.appendChild(button1);
            	cell8.appendChild(button2);
            	
	            row.appendChild(cell1);
	            row.appendChild(cell2);
	            row.appendChild(cell3);
	            row.appendChild(cell4);
	            row.appendChild(cell5);
	            row.appendChild(cell6);
	            row.appendChild(cell7);
	            row.appendChild(cell8);
	            
	            userList.appendChild(row);
	        }
	    }
	    
	    function updateBoardPagination(data) {
	        let userPaging = document.querySelector('.board-pageBar');
	        let pagination = '';
	        
	        if (!data.empty) {
	            if (!data.first) {
	                pagination += '<div onclick="getBoardList(' + (data.number - 1) + ',\'' + boardSearchSelect + '\',\'' + boardSearchValue + '\')">이전</div>';
	            }
	            for (let i = 0; i < data.totalPages; i++) {
	                if (i >= data.number - 5 && i <= data.number + 5) {
	                    pagination += '<div';
	                    if (i === data.number) {
	                        pagination += ' class="active"';
	                    }
	                    pagination += ' onclick="getBoardList(' + i + ',\'' + boardSearchSelect + '\',\'' + boardSearchValue + '\')">' + (i + 1) + '</div>';
	                }
	            }
	            if (!data.last) {
	                pagination += '<div onclick="getBoardList(' + (data.number + 1) + ',\'' + boardSearchSelect + '\',\'' + boardSearchValue + '\')">다음</div>';
	            }
	        }
	        userPaging.innerHTML = pagination;
	    }
	    
	    function getCommentList(page, commentSearchSelect, commentSearchValue) {
	        $.ajax({
	            url: '${contextPath}/admin/loadCommentListData',
	            type: 'GET',
	            dataType: 'json',
	            data: {page: page, size: 20, sort: commentFilterValue, searchSelect: commentSearchSelect, searchValue: commentSearchValue},
	            success: function(data) {
	            	console.log(data);
	            	if(data.content.length != 0){
		                updateCommentTable(data.content);
		                updateCommentPagination(data);
	            	}
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	            }
	        });
	    }

	    function updateCommentTable(data) {
	    	let userList = document.querySelector('.comment-list');
	        userList.innerHTML = '';
	        for (let i = 0; i < data.length; i++) {
	            let row = document.createElement('tr');
	            row.classList.add('long-tr');

	            let cell1 = document.createElement('td');
	            cell1.textContent = data[i].boardNo;
	            
	            let cell2 = document.createElement('td');
	            cell2.innerHTML = data[i].subCategoryName;
	            
	            let cell3 = document.createElement('td');
	            cell3.textContent = data[i].title;
	            
	            let cell4 = document.createElement('td');
	            cell4.textContent = data[i].content;

	            let cell5 = document.createElement('td');
	            cell5.textContent = data[i].createDate;
	            
	            let cell6 = document.createElement('td');
	            cell6.textContent = data[i].modifyDate;

	            let cell7 = document.createElement('td');
	            cell7.textContent = data[i].status;
	            
	            let cell8 = document.createElement('td');
	    		
	            let button1 = document.createElement('input');
            	button1.setAttribute('type', 'button');
            	button1.setAttribute('value', '상세보기');
            	button1.classList.add('detail-button');
            	button1.addEventListener('click', function() {
            	    boardDetail(data[i].boardNo);
            	});
            	
	            let button2 = document.createElement('input');
            	button2.setAttribute('type', 'button');
            	button2.setAttribute('value', '삭제');
            	button2.classList.add('detail-button');
            	button2.addEventListener('click', function() {
            	    commentDelete(data[i].commentNo);
            	});
            	cell8.appendChild(button1);
            	cell8.appendChild(button2);
            	
	            row.appendChild(cell1);
	            row.appendChild(cell2);
	            row.appendChild(cell3);
	            row.appendChild(cell4);
	            row.appendChild(cell5);
	            row.appendChild(cell6);
	            row.appendChild(cell7);
	            row.appendChild(cell8);
	            
	            userList.appendChild(row);
	        }
	    }
	    
	    function updateCommentPagination(data) {
	        let userPaging = document.querySelector('.comment-pageBar');
	        let pagination = '';

	        if (!data.empty) {
	            if (!data.first) {
	                pagination += '<div onclick="getCommentList(' + (data.number - 1) + ',\'' + commentSearchSelect + '\',\'' + commentSearchValue + '\')">이전</div>';
	            }
	            for (let i = 0; i < data.totalPages; i++) {
	                if (i >= data.number - 5 && i <= data.number + 5) {
	                    pagination += '<div';
	                    if (i === data.number) {
	                        pagination += ' class="active"';
	                    }
	                    pagination += ' onclick="getCommentList(' + i + ',\'' + commentSearchSelect + '\',\'' + commentSearchValue + '\')">' + (i + 1) + '</div>';
	                }
	            }
	            if (!data.last) {
	                pagination += '<div onclick="getCommentList(' + (data.number + 1) + ',\'' + commentSearchSelect + '\',\'' + commentSearchValue + '\')">다음</div>';
	            }
	        }
	        userPaging.innerHTML = pagination;
	    }
	    
        function writeBoard(){
            location.href = "adminBoard.html";
        }
    </script>
</body>