<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>reportManagement</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/admin/reportManagement.css">
</head>
<jsp:include page="../common/header.jsp"/>
<body class="body">
    <jsp:include page="../common/sidebar.jsp"/>
    <div class="content-wrapper">
        <div class="content">
            <section class="search-section">
                <div class="search-container">
                    <div class="search-title">신고 관리</div>
                    <div class="input">
                        <select name="condition" id="filterSelect">
                            <option value="userNo" selected>번호</option>
                            <option value="userName">제목</option>
                        </select>
                        <input type="search" name="search" id="search" placeholder="Search">
                        <input type="button" id="search" value="검색">
                    </div>
                </div>
            </section>
            <section class="report-section">
                <div class="report-board-container">
                    <div class="report-content">
                        <div class="report-board-title-wrapper board-title"></div>
                        <table class="board-table">
                            <thead>
                                <tr>
                                    <th>신고 번호</th>
                                    <th>게시글 대분류</th>
                                    <th>게시글 소분류</th>
                                    <th>게시글 제목</th>
                                    <th>게시글 신고일</th>
                                    <th>신고 처리일</th>
                                    <th>처리 여부</th>
                                </tr>
                            </thead>
                            <tbody class="board-tbody"></tbody>
                        </table>
                        <div class="board-pageBar pageBar"></div>
                    </div>
                </div>
            </section>
            <section class="report-section">
                <div class="report-board-container">
                    <div class="report-content">
                        <div class="report-board-title-wrapper comment-title"></div>
                        <table class="comment-table">
                            <thead>
                                <tr>
                                    <th>신고 번호</th>
                                    <th>게시글 소분류</th>
                                    <th>게시글 제목</th>
                                    <th>댓글 내용</th>
                                    <th>댓글 신고일</th>
                                    <th>신고 처리일</th>
                                    <th>처리 여부</th>
                                </tr>
                            </thead>
                            <tbody class="comment-tbody"></tbody>
                        </table>
                        <div class="comment-pageBar pageBar"></div>
                    </div>
                </div>
            </section>
        </div>
    </div>
    <script>
	    var isLoading = false;
		
	    $(document).ready(function() {
	    	getBoardReportList(0);
	    	getCommentReportList(0);
	    });
    
	    function getBoardReportList(page) {
	        $.ajax({
	            url: '${contextPath}/admin/getBoardReportList',
	            type: 'GET',
	            dataType: 'json',
	            data: { page: page, size: 20},
	            success: function(data) {
                	updateBoardReportTable(data);
                    updateBoardPagination(data);
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	            }
	        });
	    }
	
	    function updateBoardReportTable(data) {
			let title = document.querySelector('.board-title');
	    	let userList = document.querySelector('.board-tbody');
	        title.innerHTML = '';
	    	userList.innerHTML = '';
	    	let r = '<div class="report-board-title">게시글 신고 내역</div>';
	    	r += '<div class="report-board-subtitle">총 '+data.content.length+'개</div>';
	    	title.innerHTML += r;
	        let list = data.content;
	        for (let i = 0; i < list.length; i++) {
	            let row = '<tr onclick="trashDetail('+list[i].reportNo+')">';
	            row += '<td>'+list[i].bigCategoryName+'</td>';
	            row += '<td>'+list[i].subCategoryName+'</td>';
	            row += '<td>'+list[i].title+'</td>';
	            row += '<td>'+list[i].reportDate+'</td>';
	            row += '<td>'+list[i].processingDate+'</td>';
	            row += '<td class="button"><input type="button" onclick="detail('+list[i].reportTargetNo+')" value="상세"/><input type="button" onclick="processing('+list[i].reportNo+')" value="처리"/></td>';
	            row += '</tr>';
	            userList.innerHTML += row;
	        }
	    }
	
	    function updateBoardPagination(data) {
	        let userPaging = document.querySelector('.board-pageBar');
	        let pagination = '';
	        if (!data.empty) {
	            if (!data.first) {
	                pagination += '<td><a class="page-link" href="#" onclick="loadReportData(' + (data.number - 1) + ')">이전</a></td>';
	            }
	            for (let i = 0; i < data.totalPages; i++) {
	                if (i >= data.number - 5 && i <= data.number + 5) {
	                    pagination += '<td';
	                    if (i === data.number) {
	                        pagination += ' class="active"';
	                    }
	                    pagination += '><a href="#" onclick="loadReportData(' + i + ')">' + (i + 1) + '</a></td>';
	                }
	            }
	            if (!data.last) {
	                pagination += '<td><a href="#" onclick="loadReportData(' + (data.number + 1) + ')">다음</a></td>';
	            }
	        }
	        userPaging.innerHTML = '<tr>' + pagination + '</tr>';
	    }
	    
	    function getCommentReportList(page) {
	        $.ajax({
	            url: '${contextPath}/admin/getCommentReportList',
	            type: 'GET',
	            dataType: 'json',
	            data: { page: page, size: 20},
	            success: function(data) {
                	updateCommentReportTable(data);
                    updateCommentPagination(data);
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	            }
	        });
	    }
	
	    function updateCommentReportTable(data) {
			let title = document.querySelector('.comment-title');
	    	let userList = document.querySelector('.comment-tbody');
	        title.innerHTML = '';
	    	userList.innerHTML = '';
	    	let r = '<div class="report-board-title">게시글 신고 내역</div>';
	    	r += '<div class="report-board-subtitle">총 '+data.content.length+'개</div>';
	    	title.innerHTML += r;
	        let list = data.content;
	        for (let i = 0; i < list.length; i++) {
	            let row = '<tr onclick="trashDetail('+list[i].reportNo+')">';
	            row += '<td>'+list[i].subCategoryName+'</td>';
	            row += '<td>'+list[i].title+'</td>';
	            row += '<td>'+list[i].content+'</td>';
	            row += '<td>'+list[i].reportDate+'</td>';
	            row += '<td>'+list[i].processingDate+'</td>';
	            row += '<td class="button"><input type="button" onclick="detail('+list[i].boardNo+')" value="상세"/><input type="button" onclick="processing('+list[i].reportNo+')" value="처리"/></td>';
	            row += '</tr>';
	            userList.innerHTML += row;
	        }
	    }
	
	    function updateCommentPagination(data) {
	        let userPaging = document.querySelector('.comment-pageBar');
	        let pagination = '';
	        if (!data.empty) {
	            if (!data.first) {
	                pagination += '<td><a class="page-link" href="#" onclick="loadReportData(' + (data.number - 1) + ')">이전</a></td>';
	            }
	            for (let i = 0; i < data.totalPages; i++) {
	                if (i >= data.number - 5 && i <= data.number + 5) {
	                    pagination += '<td';
	                    if (i === data.number) {
	                        pagination += ' class="active"';
	                    }
	                    pagination += '><a href="#" onclick="loadReportData(' + i + ')">' + (i + 1) + '</a></td>';
	                }
	            }
	            if (!data.last) {
	                pagination += '<td><a href="#" onclick="loadReportData(' + (data.number + 1) + ')">다음</a></td>';
	            }
	        }
	        userPaging.innerHTML = '<tr>' + pagination + '</tr>';
	    }
	    
	    function detail(boardNo){
	        location.href="/board/detail?boardNo="+trashNo;
	    }
	    function processing(reportNo){
	        location.href="/trash/update/detail?boardNo="+trashNo;
	    }
    </script>
</body>
</html>