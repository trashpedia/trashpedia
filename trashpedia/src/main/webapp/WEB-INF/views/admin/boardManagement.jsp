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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/admin/boardManagement.css">
</head>
<%-- <jsp:include page="../common/header.jsp"/> --%>
<body class="body">
    <jsp:include page="../common/sidebar.jsp"/>
    <div class="content-wrapper">
        <div class="content">
            <div class="practice-section">
			    <p id="practice-section-title"><span class="material-symbols-outlined">data_check</span>게시글 관리</p>
			    <p>board management</p>
			</div>
			<section class="content-section">
                <div class="content-container" style="padding-bottom : 50px;">
                	<div class="content-title-wrapper">
                    	<div  class="content-title">공지사항</div>
	                   	<div class="filter-wrapper">
						    <select name="condition" id="announcement-filter-select">
						        <option value="boardNo" selected>번호</option>
						        <option value="title">제목</option>
						    </select>
						    <input type="button" class="search-button announcement-write-button" value="글쓰기" onclick="announcementWrite()">
						</div>
                   	</div>
					<table class="long-table announcement-table">
					    <thead class="long-thead announcement-thead">
					    	<tr class="announcement-long-tr">
					    		<th>번호</th>
					    		<th>제목</th>
					    		<th>작성일</th>
					    		<th>수정일</th>
					    		<th>공개/비공개</th>
					    		<th>비고</th>
					    	</tr>
					    </thead>
					    <tbody class="long-tbody announcement-list"></tbody>
					</table>
					<div class="search-wrapper">
						<select name="condition" id="announcement-search-filter-select">
			                <option value="boardNo" selected>번호</option>
			                <option value="title">제목</option>
			                <option value="content">내용</option>
						</select>
						<input type="search" class="search-input announcement-search-input" placeholder="검색어를 입력하세요">
						<input type="button" class="search-button announcement-search-button" value="검색" onclick="announcementSearch()">
					</div>
                	<div class="announcement-pageBar pageBar"></div>
                </div>
			</section>
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
						        <option value="createDate" selected>날짜</option>
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
	    var announcementFilterValue = 'boardNo';
	    var boardFilterValue = 'boardNo';
	    var commentFilterValue = 'createDate';
	    var announcementSearchSelect = null;
	    var boardSearchSelect = null;
	    var commentSearchSelect = null;
	    var announcementSearchValue = null;
	    var boardSearchValue = null;
	    var commentSearchValue = null;
		
	    $(document).ready(function() {
	    	getDataList('announcement', 0, announcementFilterValue, announcementSearchSelect, announcementSearchValue);
	    	getDataList('board', 0, boardFilterValue, boardSearchSelect, boardSearchValue);
	    	getDataList('comment', 0, commentFilterValue, commentSearchSelect, commentSearchValue);
	    });
	    
	    $('#announcement-filter-select').change(function(){
	    	boardFilterValue = $(this).val();
	    	$('.announcement-list').empty();
	    	getDataList('announcement', 0, announcementFilterValue, announcementSearchSelect, announcementSearchValue);
	    });

	    $('#board-filter-select').change(function(){
	    	boardFilterValue = $(this).val();
	    	$('.board-list').empty();
	    	getDataList('board', 0, boardFilterValue, boardSearchSelect, boardSearchValue);
	    });

	    $('#comment-filter-select').change(function(){
	    	commentFilterValue = $(this).val();
	    	$('.comment-list').empty();
	    	getDataList('comment', 0, commentFilterValue, commentSearchSelect, commentSearchValue);
	    });
	    
	    function announcementSearch(){
	    	announcementSearchSelect = $('#announcement-search-filter-select').val();
	    	announcementSearchValue = $('.announcement-search-input').val();
	    	$('.announcement-search-input').val('');
	    	$('.announcement-list').empty();
	    	getDataList('announcement', 0, announcementFilterValue, announcementSearchSelect, announcementSearchValue);
	    }
	    
	    function boardSearch(){
	    	boardSearchSelect = $('#board-search-filter-select').val();
	    	boardSearchValue = $('.board-search-input').val();
	    	$('.board-search-input').val('');
	    	$('.board-list').empty();
	    	getDataList('board', 0, boardFilterValue, boardSearchSelect, boardSearchValue);
	    }
	    
	    function commentSearch(){
	    	commentSearchSelect = $('#comment-search-filter-select').val();
	    	commentSearchValue = $('.comment-search-input').val();
	    	$('.comment-search-input').val('');
	    	$('.comment-list').empty();
	    	getDataList('comment', 0, commentFilterValue, commentSearchSelect, commentSearchValue);
	    }
	    
	    function getDataList(endpoint, page, filterValue, searchSelect, searchValue) {
	        $.ajax({
	            url: '${contextPath}/admin/get' + endpoint + 'List',
	            type: 'GET',
	            dataType: 'json',
	            data: {page: page, size: 10, sort: filterValue, searchSelect: searchSelect, searchValue: searchValue},
	            success: function(data) {
	                if(data.content.length != 0){
	                    if (endpoint === 'comment') {
	                        updateCommentTable(data.content);
	                    } else if (endpoint === 'board') {
	                        updateBoardTable(data.content);
	                    } else if (endpoint === 'announcement') {
	                    	updateAnnouncementTable(data.content);
	                    }
	                    updatePagination(data, endpoint, searchSelect, searchValue);
	                }
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	            }
	        });
	    }
	    
	    function updatePagination(data, endpoint, searchSelect, searchValue) {
	        let pagingClass = '.' + endpoint.toLowerCase() + '-pageBar';
	        let userPaging = document.querySelector(pagingClass);
	        let pagination = '';
	        
	        if (!data.empty) {
	            if (!data.first) {
	                pagination += '<div onclick="getDataList(\'' + endpoint + '\',' + (data.number - 1) + ',\'' + boardFilterValue + '\',\'' + searchSelect + '\',\'' + searchValue + '\')">이전</div>';
	            }
	            for (let i = 0; i < data.totalPages; i++) {
	                if (i >= data.number - 5 && i <= data.number + 5) {
	                    pagination += '<div';
	                    if (i === data.number) {
	                        pagination += ' class="active"';
	                    }
	                    pagination += ' onclick="getDataList(\'' + endpoint + '\',' + i + ',\'' + boardFilterValue + '\',\'' + searchSelect + '\',\'' + searchValue + '\')">' + (i + 1) + '</div>';
	                }
	            }
	            if (!data.last) {
	                pagination += '<div onclick="getDataList(\'' + endpoint + '\',' + (data.number + 1) + ',\'' + boardFilterValue + '\',\'' + searchSelect + '\',\'' + searchValue + '\')">다음</div>';
	            }
	        }
	        userPaging.innerHTML = pagination;
	    }
	    
	    function updateAnnouncementTable(data) {
	    	let userList = document.querySelector('.announcement-list');
	        userList.innerHTML = '';
	        for (let i = 0; i < data.length; i++) {
	            let row = document.createElement('tr');
	            row.classList.add('announcement-long-tr');
	            
	            let cell1 = document.createElement('td');
	            cell1.textContent = data[i].boardNo;
	            
	            let cell2 = document.createElement('td');
	            cell2.innerHTML = data[i].title;
	            
	            let cell3 = document.createElement('td');
	            cell3.textContent = data[i].createDate;
	            
	            let cell4 = document.createElement('td');
	            cell4.textContent = data[i].modifyDate;

	            let cell5 = document.createElement('td');
	            cell5.textContent = data[i].status;
	            
	            let cell6 = document.createElement('td');
	    		
	            let button1 = document.createElement('input');
            	button1.setAttribute('type', 'button');
            	button1.setAttribute('value', '상세보기');
            	button1.classList.add('detail-button');
            	button1.addEventListener('click', function() {
            	    boardDetail(data[i].boardNo);
            	});
            	
	            let button2 = document.createElement('input');
            	button2.setAttribute('type', 'button');
            	button2.classList.add('detail-button');
            	if(data[i].status == 'Y'){
	            	button2.setAttribute('value', '삭제');
	            	button2.classList.add('delete');
	            	button2.addEventListener('click', function() {
	            	    boardDelete(data[i].boardNo, $(this));
	            	});
            	} else {
	            	button2.setAttribute('value', '원복');
	            	button2.classList.add('undelete');
	            	button2.addEventListener('click', function() {
	            	    boardUndelete(data[i].boardNo, $(this));
	            	});
            	}
            	cell6.appendChild(button1);
            	cell6.appendChild(button2);
            	
	            row.appendChild(cell1);
	            row.appendChild(cell2);
	            row.appendChild(cell3);
	            row.appendChild(cell4);
	            row.appendChild(cell5);
	            row.appendChild(cell6);
	            
	            userList.appendChild(row);
	        }
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
            	button2.classList.add('detail-button');
            	if(data[i].status == 'Y'){
	            	button2.setAttribute('value', '삭제');
	            	button2.classList.add('delete');
	            	button2.addEventListener('click', function() {
	            	    boardDelete(data[i].boardNo, $(this));
	            	});
            	} else {
	            	button2.setAttribute('value', '원복');
	            	button2.classList.add('undelete');
	            	button2.addEventListener('click', function() {
	            	    boardUndelete(data[i].boardNo, $(this));
	            	});
            	}
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
	    
	    function updateCommentTable(data) {
	    	let userList = document.querySelector('.comment-list');
	        userList.innerHTML = '';
	        for (let i = 0; i < data.length; i++) {
	            let row = document.createElement('tr');
	            row.classList.add('comment-long-tr');

	            let cell1 = document.createElement('td');
	            cell1.textContent = data[i].boardNo;
	            
	            let cell2 = document.createElement('td');
	            cell2.innerHTML = data[i].subCategoryName;
	            
	            let cell3 = document.createElement('td');
	            cell3.textContent = data[i].title;
	            
	            let cell4 = document.createElement('td');
	            cell4.innerHTML = data[i].content;

	            let cell5 = document.createElement('td');
	            cell5.textContent = data[i].createDate;
	            
	            let cell6 = document.createElement('td');
	            cell6.textContent = data[i].nestedCommentNo;

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
            	if(data[i].status == 'Y' && data[i].nestedCommentNo == 0){
	            	button2.setAttribute('value', '삭제');
	            	button2.classList.add('detail-button');
	            	button2.classList.add('delete');
	            	button2.addEventListener('click', function() {
	            	    commentDelete(data[i].commentNo, $(this));
	            	});
            	} else if(data[i].status == 'Y' && data[i].nestedCommentNo != 0){
            		button2.setAttribute('value', '삭제');
	            	button2.classList.add('detail-button');
	            	button2.classList.add('delete');
	            	button2.addEventListener('click', function() {
	            	    nestedCommentDelete(data[i].nestedCommentNo, $(this));
	            	});
            	} else if(data[i].status == 'N' && data[i].nestedCommentNo == 0) {
	            	button2.setAttribute('value', '원복');
	            	button2.classList.add('detail-button');
	            	button2.classList.add('undelete');
	            	button2.addEventListener('click', function() {
	            	    commentUndelete(data[i].commentNo, $(this));
	            	});
            	} else {
            		button2.setAttribute('value', '원복');
	            	button2.classList.add('detail-button');
	            	button2.classList.add('undelete');
	            	button2.addEventListener('click', function() {
	            	    nestedCommentUndelete(data[i].nestedCommentNo, $(this));
	            	});
            	}
            	
            	
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
	    
        function boardDetail(boardNo){
            location.href = "${contextPath}/board/detail/"+boardNo;
        }
        
        function boardDelete(boardNo, buttonElement) {
        	console.log(buttonElement);
            if (confirm("정말로 이 게시글을 삭제하시겠습니까?")) {
                $.ajax({
                    url: '${contextPath}/admin/delete/board',
                    type: 'GET',
                    data: { boardNo },
                    success: function(data) {
                    	if (data > 0) {
                            alert("게시글 삭제에 성공했습니다");
                            let parent = buttonElement.parent();
                            buttonElement.remove();
                            let button = document.createElement('input');
                        	button.setAttribute('type', 'button');
                        	button.classList.add('detail-button');
           	            	button.setAttribute('value', '원복');
           	            	button.classList.add('undelete');
           	            	button.addEventListener('click', function() {
          	            	    boardUndelete(boardNo, $(this));
                            });
           	            	
           	            	parent.append(button);
                    	} else {
                            alert("게시글 삭제에 실패했습니다. 로그를 확인하세요");
                        }
                    },
                    error: function(xhr, status, error) {
                        alert("게시글 삭제에 실패했습니다. 로그를 확인하세요");
                        console.error('Error: ' + error);
                    }
                });
            }
        }
        
        function boardUndelete(boardNo, buttonElement) {
            if (confirm("정말로 이 게시글을 복원하시겠습니까?")) {
                $.ajax({
                    url: '${contextPath}/admin/unDelete/board',
                    type: 'GET',
                    data: { boardNo },
                    success: function(data) {
                    	if (data > 0) {
                            alert("게시글 복원에 성공했습니다");
                            let parent = buttonElement.parent();
                            buttonElement.remove();
                            let button = document.createElement('input');
                        	button.setAttribute('type', 'button');
                        	button.classList.add('detail-button');
           	            	button.setAttribute('value', '삭제');
           	            	button.classList.add('delete');
           	            	button.addEventListener('click', function() {
          	            	    boardDelete(boardNo, $(this));
                            });
           	            	
           	            	parent.append(button);
                    	} else {
                            alert("게시글 원복에 실패했습니다. 로그를 확인하세요");
                        }
                    },
                    error: function(xhr, status, error) {
                        alert("게시글 원복에 실패했습니다. 로그를 확인하세요");
                        console.error('Error: ' + error);
                    }
                });
            }
        }
        
        function commentDelete(commentNo, buttonElement) {
            if (confirm("정말로 이 댓글을 삭제하시겠습니까?")) {
                $.ajax({
                    url: '${contextPath}/admin/delete/comment',
                    type: 'GET',
                    data: { commentNo },
                    success: function(data) {
                    	if (data > 0) {
                            alert("댓글 삭제에 성공했습니다");
                            let parent = buttonElement.parent();
                            buttonElement.remove();
                            let button = document.createElement('input');
                        	button.setAttribute('type', 'button');
                        	button.classList.add('detail-button');
           	            	button.setAttribute('value', '원복');
           	            	button.classList.add('undelete');
           	            	button.addEventListener('click', function() {
          	            	    commentUndelete(commentNo, $(this));
                            });
           	            	
           	            	parent.append(button);
                    	} else {
                            alert("댓글 삭제에 실패했습니다. 로그를 확인하세요");
                        }
                    },
                    error: function(xhr, status, error) {
                        alert("댓글 삭제에 실패했습니다. 로그를 확인하세요");
                        console.error('Error: ' + error);
                    }
                });
            }
        }
        
        function commentUndelete(commentNo, buttonElement) {
        	let $this = $(this);
            if (confirm("정말로 이 댓글을 복원하시겠습니까?")) {
                $.ajax({
                    url: '${contextPath}/admin/unDelete/comment',
                    type: 'GET',
                    data: { commentNo },
                    success: function(data) {
                    	if (data > 0) {
                            alert("댓글 복원에 성공했습니다");
                            let parent = buttonElement.parent();
                            buttonElement.remove();
                            let button = document.createElement('input');
                        	button.setAttribute('type', 'button');
                        	button.classList.add('detail-button');
           	            	button.setAttribute('value', '삭제');
           	            	button.classList.add('delete');
           	            	button.addEventListener('click', function() {
          	            	    commentDelete(commentNo, $(this));
                            });
           	            	
           	            	parent.append(button);
                    	} else {
                            alert("댓글 원복에 실패했습니다. 로그를 확인하세요");
                        }
                    },
                    error: function(xhr, status, error) {
                        alert("댓글 원복에 실패했습니다. 로그를 확인하세요");
                        console.error('Error: ' + error);
                    }
                });
            }
        }
        
        function nestedCommentDelete(nestedCommentNo, buttonElement) {
        	let $this = $(this);
            if (confirm("정말로 이 댓글을 삭제하시겠습니까?")) {
                $.ajax({
                    url: '${contextPath}/admin/delete/nestedComment',
                    type: 'GET',
                    data: { nestedCommentNo },
                    success: function(data) {
                    	if (data > 0) {
                            alert("댓글 삭제에 성공했습니다");
                            let parent = buttonElement.parent();
                            buttonElement.remove();
                            let button = document.createElement('input');
                        	button.setAttribute('type', 'button');
                        	button.classList.add('detail-button');
           	            	button.setAttribute('value', '원복');
           	            	button.classList.add('undelete');
           	            	button.addEventListener('click', function() {
          	            	    nestedCommentUndelete(nestedCommentNo, $(this));
                            });
           	            	
           	            	parent.append(button);
                    	} else {
                            alert("댓글 삭제에 실패했습니다. 로그를 확인하세요");
                        }
                    },
                    error: function(xhr, status, error) {
                        alert("댓글 삭제에 실패했습니다. 로그를 확인하세요");
                        console.error('Error: ' + error);
                    }
                });
            }
        }
        
        function nestedCommentUndelete(nestedCommentNo, buttonElement) {
        	let $this = $(this);
            if (confirm("정말로 이 댓글을 복원하시겠습니까?")) {
                $.ajax({
                    url: '${contextPath}/admin/unDelete/nestedComment',
                    type: 'GET',
                    data: { nestedCommentNo },
                    success: function(data) {
                    	if (data > 0) {
                            alert("댓글 복원에 성공했습니다");
                            let parent = buttonElement.parent();
                            buttonElement.remove();
                            let button = document.createElement('input');
                        	button.setAttribute('type', 'button');
                        	button.classList.add('detail-button');
           	            	button.setAttribute('value', '삭제');
           	            	button.classList.add('delete');
           	            	button.addEventListener('click', function() {
          	            	    nestedCommentDelete(nestedCommentNo, $(this));
                            });
           	            	
           	            	parent.append(button);
                    	} else {
                            alert("댓글 원복에 실패했습니다. 로그를 확인하세요");
                        }
                    },
                    error: function(xhr, status, error) {
                        alert("댓글 원복에 실패했습니다. 로그를 확인하세요");
                        console.error('Error: ' + error);
                    }
                });
            }
        }
        
        function announcementWrite(){
        	location.href="${contextPath}/write?subCategoryNo=1&type=1";
        }
    </script>
</body>