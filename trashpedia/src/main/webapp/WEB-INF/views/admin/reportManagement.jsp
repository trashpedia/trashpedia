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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/admin/reportManagement.css">
</head>
<body class="body">
    <jsp:include page="../common/sidebar.jsp"/>
    <div class="content-wrapper">
        <div class="content">
            <div class="practice-section">
			    <p id="practice-section-title"><span class="material-symbols-outlined">data_alert</span>신고 관리</p>
			    <p>report management</p>
			</div>
			<section class="content-section">
                <div class="content-container">
                	<div class="content-title-wrapper">
                    	<div class="content-title">게시글 신고</div>
	                   	<div class="filter-wrapper">
						    <select name="condition" id="board-filter-select">
						        <option value="reportNo" selected>번호</option>
						        <option value="title">제목</option>
						        <option value="processingDate">처리일</option>
						    </select>
						</div>
                   	</div>
					<table class="long-table board-table">
					    <thead class="long-thead board-thead">
					    	<tr class="board-long-tr">
					    		<th>번호</th>
					    		<th>게시글 제목</th>
					    		<th>신고 내용</th>
					    		<th>신고일</th>
					    		<th>처리일</th>
					    		<th>비고</th>
					    	</tr>
					    </thead>
					    <tbody class="long-tbody board-list"></tbody>
					</table>
					<div class="search-wrapper">
						<select name="condition" id="board-search-filter-select">
			                <option value="reportNo" selected>번호</option>
			                <option value="title">제목</option>
			                <option value="reportContent">신고 내용</option>
						</select>
						<input type="search" class="search-input board-search-input" placeholder="검색어를 입력하세요">
						<input type="button" class="search-button board-search-button" value="검색" onclick="announcementSearch()">
					</div>
                	<div class="board-pageBar pageBar"></div>
                </div>
			</section>
			<section class="content-section">
                <div class="content-container">
                	<div class="content-title-wrapper">
                    	<div class="content-title">댓글 신고</div>
	                   	<div class="filter-wrapper">
						    <select name="condition" id="comment-filter-select">
						        <option value="reportNo" selected>번호</option>
						        <option value="content">댓글 내용</option>
						        <option value="processingDate">처리일</option>
						    </select>
						</div>
                   	</div>
					<table class="long-table comment-table">
					    <thead class="long-thead comment-thead">
					    	<tr class="comment-long-tr">
					    		<th>번호</th>
					    		<th>댓글 내용</th>
					    		<th>신고 내용</th>
					    		<th>신고일</th>
					    		<th>처리일</th>
					    		<th>비고</th>
					    	</tr>
					    </thead>
					    <tbody class="long-tbody comment-list"></tbody>
					</table>
					<div class="search-wrapper">
						<select name="condition" id="comment-search-filter-select">
			                <option value="reportNo" selected>번호</option>
			                <option value="reportContent">신고 내용</option>
						</select>
						<input type="search" class="search-input comment-search-input" placeholder="검색어를 입력하세요">
						<input type="button" class="search-button comment-search-button" value="검색" onclick="announcementSearch()">
					</div>
                	<div class="comment-pageBar pageBar"></div>
                </div>
                <div id="modal" class="modal">
				    <div class="modal-content-wrapper"></div>
				</div>
			</section>
        </div>
    </div>
    <script>
	    var boardFilterValue = 'reportNo';
	    var commentFilterValue = 'reportNo';
	    var boardSearchSelect = null;
	    var commentSearchSelect = null;
	    var boardSearchValue = null;
	    var commentSearchValue = null;
		
	    $(document).ready(function() {
	    	getDataList('board', 0, boardFilterValue, boardSearchSelect, boardSearchValue);
	    	getDataList('comment', 0, commentFilterValue, commentSearchSelect, commentSearchValue);
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
	            url: '${contextPath}/admin/get' + endpoint + 'ReportList',
	            type: 'GET',
	            dataType: 'json',
	            data: {page: page, size: 10, sort: filterValue, searchSelect: searchSelect, searchValue: searchValue},
	            success: function(data) {
	                if(data.content.length != 0){
	                    if (endpoint === 'comment') {
	                        updateCommentTable(data.content);
	                    } else {
	                        updateBoardTable(data.content);
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
	    
	    
	    function updateBoardTable(data) {
	    	let userList = document.querySelector('.board-list');
	        userList.innerHTML = '';
	        for (let i = 0; i < data.length; i++) {
	            let row = document.createElement('tr');
	            row.classList.add('long-tr');

	            let cell1 = document.createElement('td');
	            cell1.textContent = data[i].reportNo;
	            
	            let cell2 = document.createElement('td');
	            cell2.innerHTML = data[i].title;
	            
	            let cell3 = document.createElement('td');
	            cell3.textContent = data[i].reportContent;
	            
	            let cell4 = document.createElement('td');
	            cell4.textContent = data[i].reportDate;

	            let cell5 = document.createElement('td');
	            cell5.textContent = data[i].processingDate;
	            
	            let cell6 = document.createElement('td');
	    		
	            let button1 = document.createElement('input');
            	button1.setAttribute('type', 'button');
            	button1.setAttribute('value', '상세보기');
            	button1.classList.add('detail-button');
            	button1.addEventListener('click', function() {
            	    reportDetail(data[i].reportNo);
            	});
            	
            	cell6.appendChild(button1);
            	
	            row.appendChild(cell1);
	            row.appendChild(cell2);
	            row.appendChild(cell3);
	            row.appendChild(cell4);
	            row.appendChild(cell5);
	            row.appendChild(cell6);
	            
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
	            cell1.textContent = data[i].reportNo;
	            
	            let cell2 = document.createElement('td');
	            cell2.innerHTML = data[i].content;
	            
	            let cell3 = document.createElement('td');
	            cell3.textContent = data[i].reportContent;
	            
	            let cell4 = document.createElement('td');
	            cell4.innerHTML = data[i].reportDate;

	            let cell5 = document.createElement('td');
	            cell5.textContent = data[i].processingDate;
	            
	            let cell6 = document.createElement('td');

	            let button1 = document.createElement('input');
            	button1.setAttribute('type', 'button');
            	button1.setAttribute('value', '상세보기');
            	button1.classList.add('detail-button');
            	button1.addEventListener('click', function() {
            	    reportDetail(data[i].reportNo);
            	});
            	
            	cell6.appendChild(button1);
            	
	            row.appendChild(cell1);
	            row.appendChild(cell2);
	            row.appendChild(cell3);
	            row.appendChild(cell4);
	            row.appendChild(cell5);
	            row.appendChild(cell6);
	            
	            userList.appendChild(row);
	        }
	    }
        
        function reportDetail(reportNo){
	        $('#modal').show();
	        
	        $('#closeModalBtn').click(function(){
	            $('#modal').hide();
	        });

	        $(document).mouseup(function(e){
	            let modalContent = $('.modal-content-wrapper');
	            let modal = $('#modal');
	            if (!modalContent.is(e.target) && modalContent.has(e.target).length === 0 && !$('#closeModalBtn').is(e.target)) {
	                $('#reportTitle').val('');
	                $('#reportContent').val('');
	                modal.hide();
	            }
	        });
	        
	        $.ajax({
	            url: '${contextPath}/report/' + reportNo,
	            type: 'GET',
	            success: function(data) {
	                if (data != null) {
	                    let mcw = document.querySelector('.modal-content-wrapper');
	                    let processingContentHTML = '';
	                    if (data.status == "Y") {
	                        processingContentHTML = '<textarea id="processingContent" name="processingContent" placeholder="처리 내용을 입력하세요"></textarea>';
	                    } else {
	                        processingContentHTML = '<pre> 처리 내용 : ' + data.processingContent + '</pre>';
	                    }
	                    let htmlContent =
	                        '<div style="width : 100%;">' +
	                        '<div class="modal-title">신고 상세보기</div>' +
	                        '<div class="request-title">내용 : ' + data.reportContent + '</div>' +
	                        '<div class="request-date"> <span><strong> 요청자 </strong> '+ data.userName + '</span> <span> | <strong> 요청일 </strong> ' + data.reportDate + '</span> </div>' +
	                        '<div class="request-content">' +
	                        '</div>' +
	                        '<div class="request-content">' + processingContentHTML + '</div>';
	                    if (data.status == "Y") {
	                        htmlContent += '<button id="updateBtn" class="requestBtn" onclick="boardDetail(' + data.boardNo + ')">확인하기</button>' +
                       		'<button id="processingBtn" class="requestBtn" onclick="processingReport(' + data.reportNo + ')">처리하기</button>' +
                            '<button id="processingBtn" class="requestBtn" onclick="processingDelete(' + data.reportNo + ',' + data.reportType + ',' + data.reportTargetNo + ')">삭제 후 처리하기</button>';
	                    }
	                    htmlContent += '</div></div>';
	                    mcw.innerHTML = htmlContent;
	                }
	            }
	        });
	    }
        
        function boardDetail(trashNo) {
            window.open("${contextPath}/board/detail/" + trashNo);
	    }
        
        function processingReport(reportNo){
        	let processingContent = $("#processingContent").val();
        	if(processingContent.trim() == null){
        		alert("처리 내용을 입력해주세요");
        		return;
        	}
        	if (confirm("삭제없이 처리하시겠습니까?")) {
        		console.log(processingContent);
                $.ajax({
                    url: '${contextPath}/report/processing/'+reportNo,
                    type: 'POST',
                    data: {processingContent},
                    success: function(data) {
                    	if (data > 0) {
                            alert("처리 완료되었습니다");
                            $("#processingContent").val('');
                            $('#modal').hide();
                            modal
                    	} else {
                            alert("처리에 실패했습니다. 로그를 확인하세요");
                        }
                    },
                    error: function(xhr, status, error) {
                        alert("처리에 실패했습니다. 로그를 확인하세요");
                        console.error('Error: ' + error);
                    }
                });
            }
        }

        function processingDelete(reportNo, reportType, reportTargetNo){
        	let processingContent = $("#processingContent").val();
        	if(processingContent.trim() == null){
        		alert("처리 내용을 입력해주세요");
        		return;
        	}
        	if (confirm("삭제와 같이 처리하시겠습니까?")) {
                $.ajax({
                    url: '${contextPath}/report/deleteProcessing/'+reportNo,
                    type: 'POST',
                    data: {processingContent, reportType, reportTargetNo},
                    success: function(data) {
                    	if (data > 0) {
                            alert("처리 완료되었습니다");
                            $("#processingContent").val('');
                            $('#modal').hide();
                            modal
                    	} else {
                            alert("처리에 실패했습니다. 로그를 확인하세요");
                        }
                    },
                    error: function(xhr, status, error) {
                        alert("처리에 실패했습니다. 로그를 확인하세요");
                        console.error('Error: ' + error);
                    }
                });
            }
        }
    </script>
</body>