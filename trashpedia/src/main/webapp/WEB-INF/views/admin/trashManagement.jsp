<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>trashManagement</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/admin/trashManagement.css">
</head>
<jsp:include page="../common/header.jsp"/>
<body class="body">
    <jsp:include page="../common/sidebar.jsp"/>
    <div class="content-wrapper">
        <div class="content">
            <section class="search-section">
                <div class="search-container">
                    <div class="search-title">쓰레기 관리</div>
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
            <section class="trash-section">
                <div class="trash-board-container">
                    <div class="trash-content">
                        <div class="trash-board-title-wrapper trash-board-title"></div>
                        <table class="trash-table">
                            <thead>
                                <tr>
                                    <th>쓰레기 번호</th>
                                    <th>쓰레기 대분류</th>
                                    <th>쓰레기 소분류</th>
                                    <th>쓰레기 이름</th>
                                    <th>쓰레기 작성일</th>
                                    <th>쓰레기 수정일</th>
                                    <th>비고</th>
                                </tr>
                            </thead>
                            <tbody class="trash-tbody"></tbody>
                        </table>
                        <div class="pageBar"></div>
                    </div>
                </div>
                <div class="trash-request-container">
                    <div class="trash-container">
                        <div class="trash-title-wrapper suggestion-title"></div>
                        <div class="suggestion-list list"></div>
                    </div>
                    <div class="trash-container">
                        <div class="trash-title-wrapper request-title"></div>
                        <div class="request-list list"></div>
                    </div>
                </div>
            </section>
        </div>
    </div>
    <script>
	    var isLoading = false;
	    var suggestionOffset = 0;
	    var requestOffset = 0;
		
	    $(document).ready(function() {
	    	getTrashList(1);
	    	loadSuggestionListData();
	    	loadRequestListData();
	    });
    
	    function getTrashList(page) {
	        $.ajax({
	            url: '${contextPath}/admin/getTrashList',
	            type: 'GET',
	            dataType: 'json',
	            data: { page: page, size: 20},
	            success: function(data) {
                	updateTrashTable(data);
                    updateTrashPagination(data);
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	            }
	        });
	    }
	
	    function updateTrashTable(data) {
	    	console.log(data);
			let title = document.querySelector('.trash-board-title');
	    	let userList = document.querySelector('.trash-tbody');
	        title.innerHTML = '';
	    	userList.innerHTML = '';
	    	let r = '<div class="trash-board-title">쓰레기 게시글</div>';
	    	r += '<div class="trash-board-subtitle">총 '+data.content.length+'개</div>';
	    	r += '<input class="trash-write" type="button" onclick="writeTrash()" value="글쓰기">';
	    	title.innerHTML += r;
	        let list = data.content;
	        for (let i = 0; i < list.length; i++) {
	            let row = '<tr onclick="trashDetail('+list[i].trashNo+')">';
	            row += '<td>'+list[i].bigCategoryName+'</td>';
	            row += '<td>'+list[i].subCategoryName+'</td>';
	            row += '<td>'+list[i].trashTitle+'</td>';
	            row += '<td>'+list[i].createDate+'</td>';
	            row += '<td>'+list[i].modifyDate+'</td>';
	            row += '<td class="button"><input type="button" onclick="modify('+list[i].trashNo+')" value="수정"/><input type="button" onclick="delete('+list[i].trashNo+')" value="삭제"/></td>';
	            row += '</tr>';
	            userList.innerHTML += row;
	        }
	    }
	
	    function updateTrashPagination(data) {
	        let userPaging = document.querySelector('.pageBar');
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
	    
	    function loadSuggestionListData() {
	        $.ajax({
	            url: '${contextPath}/admin/loadSuggestionListData',
	            type: 'GET',
	            dataType: 'json',
	            success: function(data) {
	                updateSuggestionTable(data);
	                suggestionOffset += 1;
	                isLoading = false;
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	                isLoading = false;
	            }
	        });
	    }
	    function updateSuggestionTable(data) {
	    	var list = data.content;
	        let count = document.querySelector('.suggestion-title');
	        let userList = document.querySelector('.suggestion-list');
	        count.innerHTML = '';
	        let title = '<div class="trash-title">신청 리스트</div>';
            title += '<div class="trash-subtitle">총 '+list.length+'개</div>';
            count.innerHTML += title;
	        for (let i = 0; i < list.length; i++) {
	            let row = '<div class="item" onclick="loadSuggestionDetailData('+list[i].suggestionNo+')">';
	            row += '<div class="icon">😃</div>';
	            row += '<div class="subtitle">'+list[i].suggestionTitle+'</div>';
	            row += '</div>';
	            userList.innerHTML += row;
	        }
	    }
	    
	    function loadRequestListData() {
	        $.ajax({
	            url: '${contextPath}/admin/loadRequestListData',
	            type: 'GET',
	            dataType: 'json',
	            success: function(data) {
	                updateRequestTable(data);
	                requestOffset += 1;
	                isLoading = false;
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	                isLoading = false;
	            }
	        });
	    }
	    function updateRequestTable(data) {
	    	var list = data.content;
	        let count = document.querySelector('.request-title');
	        let userList = document.querySelector('.request-list');
	        count.innerHTML = '';
	        let title = '<div class="trash-title">요청 리스트</div>';
            title += '<div class="trash-subtitle">총 '+list.length+'개</div>';
            count.innerHTML += title;
	        for (let i = 0; i < list.length; i++) {
	            let row = '<div class="item" onclick="loadRequestDetailData('+list[i].requestNo+')">';
	            row += '<div class="icon">😃</div>';
	            row += '<div class="subtitle">'+list[i].requestTitle+'</div>';
	            row += '</div>';
	            userList.innerHTML += row;
	        }
	    }
	    
	    function trashDetail(trashNo){
	        location.href="/board/detail?boardNo="+trashNo;
	    }
	    function trashUpdate(trashNo){
	        location.href="/trash/update/detail?boardNo="+trashNo;
	    }
	    function trashDelete(trashNo){
	        location.href="/trash/delete/detail?boardNo="+trashNo;
	    }
    </script>
</body>
</html>