<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>memberManagementDetail</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/admin/memberManagementDetail.css">
</head>
<%-- <jsp:include page="../common/header.jsp"/> --%>
<body class="body">
    <jsp:include page="../common/sidebar.jsp"/>
    <div class="content-wrapper">
        <div class="content">
            <div class="practice-section">
			    <p>회원상세관리</p>
			    <p>member detail management</p>
			</div>
			<section class="content-section">
                <div class="content-container">
	                <div class="member-item-wrapper">
	                    <div class="member-item">
	                        <div class="member-item-title">포인트</div>
	                        <div class="member-item-subtitle"><fmt:formatNumber type="number" pattern="#,##0" value="${m.point}"/></div>
	                    </div>
	                    <div class="member-item">
	                        <div class="member-item-title">등급</div>
	                        <div class="member-item-subtitle">${m.gradeName}</div>
	                    </div>
	                    <div class="member-item">
	                        <div class="member-item-title">권한</div>
	                        <div class="member-item-subtitle">${m.role}</div>
	                    </div>
	                    <div class="member-item">
	                        <div class="member-item-title">생성일</div>
	                        <div class="member-item-subtitle">${m.createDate}</div>
	                    </div>
	                    <div class="member-item">
	                        <div class="member-item-title">수정일</div>
	                        <c:if test="${not empty m.modifyDate}">
	                         <div class="member-item-subtitle">${m.modifyDate}</div>
	                        </c:if>
	                        <c:if test="${empty m.modifyDate}">
	                         <div class="member-item-subtitle">수정 없음</div>
	                        </c:if>
	                    </div>
	                </div>
	                <div class="member-item-wrapper">
                        <div class="member-item">
                            <div class="member-item-title">회원번호</div>
                            <div class="member-item-subtitle">${m.userNo}</div>
                        </div>
                        <div class="member-item">
                            <div class="member-item-title">이메일</div>
                            <div class="member-item-subtitle">${m.userEmail}</div>
                        </div>
                        <div class="member-item">
                            <div class="member-item-title">이름</div>
                            <div class="member-item-subtitle">${m.userName}</div>
                        </div>
                        <div class="member-item">
                            <div class="member-item-title">닉네임</div>
                            <div class="member-item-subtitle">${m.userNickname}</div>
                        </div>
                        <div class="member-item">
                            <div class="member-item-title">전화번호</div>
                            <div class="member-item-subtitle">${not empty m.phone ? m.phone : '정보 없음'}</div>
                        </div>
                    </div>
	                <div class="member-item-wrapper">
                        <div class="member-item">
                            <div class="member-item-title">주소</div>
                            <div class="member-item-subtitle address">
                            	<c:if test="${not empty m.zipcode}">
	                            	<div>
									    ${not empty m.zipcode ? m.zipcode : ''}
	                            	</div>
	                            	<div>
									    ${not empty m.address1 ? m.address1 : ''}
	                            	</div>
	                            	<div>
									    ${not empty m.address2 ? m.address2 : ''}
	                            	</div>
	                            	<div>
									    ${not empty m.address3 ? m.address3 : ''}
	                            	</div>
                            	</c:if>
                            	<c:if test="${empty m.zipcode}">
                            		<div>정보 없음</div>
                            	</c:if>
                            </div>
                        </div>
                    </div>
            	</div>
           	</section>
           	<section class="content-section">
				<div class="content-container">
				    <div class="content-title-wrapper">
				        <div class="content-title">작성 게시글</div>
				        <div class="content-subtitle">총 <fmt:formatNumber type="number" pattern="#,##0" value="${b}"/>개</div>
					</div>
					<div class="filter-wrapper">
					    <select name="condition" id="board-filter-select">
					        <option value="boardNo" selected>번호</option>
					        <option value="bigCategoryName">대분류</option>
					        <option value="subCategoryName">소분류</option>
					        <option value="title">제목</option>
					    </select>
					</div>
					<table class="content-table board-table">
					    <thead class="content-thead board-thead">
					    	<tr class="content-tr">
					    		<th>번호</th>
					    		<th>대분류</th>
					    		<th>소분류</th>
					    		<th>제목</th>
					    	</tr>
					    </thead>
					    <tbody class="content-tbody board-list"></tbody>
					</table>
					<div class="search-wrapper">
						<select name="condition" id="board-search-filter-select">
			                <option value="boardNo" selected>번호</option>
			                <option value="title">제목</option>
			                <option value="content">내용</option>
						</select>
						<input type="search" class="search-input board-search-input" placeholder="검색어를 입력하세요">
						<input type="button" class="search-button board-search-button" value="검색" onclick="boardSearch()">
					</div>
				</div>
				<div class="content-container">
				    <div class="content-title-wrapper">
				    	<div class="content-title">게시글 요약</div>
				    </div>
				    <div class="board-detail-list list"></div>
				</div>
			</section>
			<section class="content-section">
				<div class="content-container">
				    <div class="content-title-wrapper">
				        <div class="content-title">작성 댓글</div>
				        <div class="content-subtitle">총 <fmt:formatNumber type="number" pattern="#,##0" value="${c}"/>개</div>
					</div>
					<div class="filter-wrapper">
					    <select name="condition" id="comment-filter-select">
					        <option value="boardNo" selected>번호</option>
					        <option value="bigCategoryName">대분류</option>
					        <option value="subCategoryName">소분류</option>
					        <option value="title">제목</option>
					    </select>
					</div>
					<table class="content-table comment-table">
					    <thead class="content-thead comment-thead">
					    	<tr class="content-tr">
					    		<th>번호</th>
					    		<th>대분류</th>
					    		<th>소분류</th>
					    		<th>제목</th>
					    	</tr>
					    </thead>
					    <tbody class="content-tbody comment-list"></tbody>
					</table>
					<div class="search-wrapper">
						<select name="condition" id="comment-search-filter-select">
			                <option value="boardNo" selected>번호</option>
			                <option value="content">내용</option>
						</select>
						<input type="search" class="search-input comment-search-input" placeholder="검색어를 입력하세요">
						<input type="button" class="search-button comment-search-button" value="검색" onclick="commentSearch()">
					</div>
				</div>
				<div class="content-container">
				    <div class="content-title-wrapper">
				    	<div class="content-title">댓글 요약</div>
				    </div>
				    <div class="comment-detail-list list"></div>
				</div>
			</section>
            <section class="content-section">
                <div class="content-container">
                	<div class="content-title-wrapper">
                    	<div class="content-title">포인트 적립 내역</div>
	                   	<div class="filter-wrapper">
						    <select name="condition" id="point-filter-select">
						        <option value="pointNo" selected>번호</option>
						        <option value="pointContent">내역</option>
						        <option value="amount">증감</option>
						        <option value="pointDate">날짜</option>
						    </select>
						</div>
                   	</div>
					<table class="long-table point-table">
					    <thead class="long-thead point-thead">
					    	<tr class="long-tr">
					    		<th>번호</th>
					    		<th>포인트 적립 내역</th>
					    		<th>포인트 증감</th>
					    		<th>날짜</th>
					    	</tr>
					    </thead>
					    <tbody class="long-tbody point-list"></tbody>
					</table>
					<div class="search-wrapper">
						<select name="condition" id="point-search-filter-select">
			                <option value="pointNo" selected>번호</option>
			                <option value="pointContent">내역</option>
						</select>
						<input type="search" class="search-input point-search-input" placeholder="검색어를 입력하세요">
						<input type="button" class="search-button point-search-button" value="검색" onclick="pointSearch()">
					</div>
                	<div class="point-pageBar pageBar"></div>
                </div>
			</section>
            <section class="content-section">
                <div class="content-container">
                	<div class="content-title-wrapper">
                    	<div class="content-title">신고 내역</div>
	                   	<div class="filter-wrapper">
						    <select name="condition" id="report-filter-select">
						        <option value="reportNo" selected>번호</option>
		                            <option value="reportType">유형</option>
		                            <option value="reportContent">신고내용</option>
		                            <option value="processingContent">처리내용</option>
		                            <option value="reportDate">날짜</option>
		                            <option value="status">처리상태</option>
						    </select>
						</div>
                   	</div>
					<table class="long-table report-table">
					    <thead class="long-thead report-thead">
					    	<tr class="long-tr">
					    		<th>번호</th>
                                <th>신고 유형</th>
                                <th>신고 내용</th>
                                <th>처리 내용</th>
                                <th>날짜</th>
                                <th>처리상태</th>
					    	</tr>
					    </thead>
					    <tbody class="long-tbody report-list"></tbody>
					</table>
					<div class="search-wrapper">
						<select name="condition" id="report-search-filter-select">
			                <option value="reportNo" selected>번호</option>
			                <option value="reportContent">내용</option>
						</select>
						<input type="search" class="search-input report-search-input" placeholder="검색어를 입력하세요">
						<input type="button" class="search-button report-search-button" value="검색" onclick="reportSearch()">
					</div>
                	<div class="report-pageBar pageBar"></div>
                </div>
			</section>
        </div>
    </div>
    <script>
	    var boardOffset = 0;
	    var commentOffset = 0;
	    var boardFilterValue = 'boardNo';
	    var commentFilterValue = 'boardNo';
	    var pointFilterValue = 'pointNo';
	    var reportFilterValue = 'reportNo';
	    var boardSearchSelect = null;
	    var commentSearchSelect = null;
	    var pointSearchSelect = null;
	    var reportSearchSelect = null;
	    var boardSearchValue = null;
	    var commentSearchValue = null;
	    var pointSearchValue = null;
	    var reportSearchValue = null;
	
	    $(document).ready(function() {
	    	getBoardList(boardSearchSelect, boardSearchValue);
	    	getCommentList(commentSearchSelect, commentSearchValue);
	    	getPointList(0, pointSearchSelect, pointSearchValue);
	    	getReportList(0, reportSearchSelect, reportSearchValue);
	    });
	    
	    $('.board-list').scroll(function() {
	        if($(this).scrollTop() + $(this).innerHeight() + 70 >= $(this)[0].scrollHeight) {
            	getBoardList(boardSearchSelect, boardSearchValue);
	        }
	    });
	    
	    $('.comment-list').scroll(function() {
	        if($(this).scrollTop() + $(this).innerHeight() + 70 >= $(this)[0].scrollHeight) {
	        	getCommentList(boardSearchSelect, boardSearchValue);
	        }
	    });
	    
	    $('#board-filter-select').change(function(){
	    	let a = boardOffset;
	    	boardFilterValue = $(this).val();
	    	$('.board-list').empty();
	    	boardOffset = 0;
	    	getBoardList(boardSearchSelect, boardSearchValue);
	    });

	    $('#comment-filter-select').change(function(){
	    	commentFilterValue = $(this).val();
	    	$('.comment-list').empty();
	    	commentOffset = 0;
	    	getCommentList(boardSearchSelect, boardSearchValue);
	    });
	    
	    $('#point-filter-select').change(function(){
	    	pointFilterValue = $(this).val();
	    	$('.point-tbody').empty();
	    	getPointList(0, pointSearchSelect, pointSearchValue);
	    });
	    
	    $('#report-filter-select').change(function(){
	    	reportFilterValue = $(this).val();
	    	$('.report-tbody').empty();
	    	getReportList(0, reportSearchSelect, reportSearchValue);
	    });
	    
	    function boardSearch(){
	    	boardSearchSelect = $('#board-search-filter-select').val();
	    	boardSearchValue = $('.board-search-input').val();
	    	$('.board-search-input').val('');
	    	boardOffset = 0;
	    	$('.board-list').empty();
	    	getBoardList(boardSearchSelect, boardSearchValue);
	    }
	    
	    function commentSearch(){
	    	commentSearchSelect = $('#comment-search-filter-select').val();
	    	commentSearchValue = $('.comment-search-input').val();
	    	$('.comment-search-input').val('');
	    	commentOffset = 0;
	    	$('.comment-list').empty();
	    	getCommentList(boardSearchSelect, boardSearchValue);
	    }
	    
	    function pointSearch(){
	    	pointSearchSelect = $('#point-search-filter-select').val();
	    	pointSearchValue = $('.point-search-input').val();
	    	$('.point-search-input').val('');
	    	$('.point-list').empty();
	    	getPointList(0, pointSearchSelect, pointSearchValue);
	    }
	    
	    function reportSearch(){
	    	reportSearchSelect = $('#report-search-filter-select').val();
	    	reportSearchValue = $('.report-search-input').val();
	    	$('.report-search-input').val('');
	    	$('.report-list').empty();
	    	getReportList(0, reportSearchSelect, reportSearchValue);
	    }

	    function getBoardList(boardSearchSelect, boardSearchValue) {
	        $.ajax({
	            url: '${contextPath}/admin/getMemberBoardList',
	            type: 'GET',
	            dataType: 'json',
	            data: { page: boardOffset, size: 20, userNo: ${m.userNo}, sort: boardFilterValue, searchSelect: boardSearchSelect, searchValue: boardSearchValue},
	            success: function(data) {
	            	if(data.content.length != 0){
		                boardOffset += 1;
		                updateBoardTable(data);
	            	}
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	            }
	        });
	    }
	
	    function updateBoardTable(data) {
	    	let thead = document.querySelector('.board-thead');
	        let boardList = document.querySelector('.board-list');
	        let list = data.content;
	        for (let i = 0; i < list.length; i++) {
	            let row = document.createElement('tr');
	            row.classList.add('content-tr');
	            
	            let cell1 = document.createElement('td');
	            cell1.textContent = list[i].boardNo;
	            
	            let cell2 = document.createElement('td');
	            cell2.textContent = list[i].bigCategoryName;
	            
	            let cell3 = document.createElement('td');
	            cell3.textContent = list[i].subCategoryName;
	            
	            let cell4 = document.createElement('td');
	            cell4.textContent = list[i].title;
	            
	            row.appendChild(cell1);
	            row.appendChild(cell2);
	            row.appendChild(cell3);
	            row.appendChild(cell4);
	            
	            row.addEventListener('click', function() {
	                loadBoardDetailData(list[i].boardNo);
	            });
	            boardList.appendChild(row);
	        }
	    }
	    
	    function loadBoardDetailData(boardNo) {
	        $.ajax({
	            url: '${contextPath}/admin/getMemberBoardDetail',
	            type: 'GET',
	            dataType: 'json',
	            data: {boardNo},
	            success: function(data) {
	            	let boardList = document.querySelector('.board-detail-list');
	            	boardList.innerHTML = '';
	            	
	            	let row1 = document.createElement('div');
	            	row1.classList.add('item');
	            	let cell1 = document.createElement('div');
	            	cell1.classList.add('title');
	            	cell1.textContent = '제목 : ';
	            	let cell2 = document.createElement('div');
	            	cell2.classList.add('subtitle');
	            	cell2.textContent = data.title;
	            	row1.appendChild(cell1);
	            	row1.appendChild(cell2);

	            	let row2 = document.createElement('div');
	            	row2.classList.add('item');
	            	row2.classList.add('content-item');
	            	let cell3 = document.createElement('div');
	            	cell3.classList.add('title');
	            	cell3.textContent = '내용 : ';
	            	let cell4 = document.createElement('div');
	            	cell4.classList.add('subtitle');
	            	cell4.classList.add('sub-content');
	            	cell4.innerHTML = data.content;
	            	row2.appendChild(cell3);
	            	row2.appendChild(cell4);
	            	
	            	let row3 = document.createElement('div');
	            	row3.classList.add('item');
	            	let cell5 = document.createElement('div');
	            	cell5.classList.add('title');
	            	cell5.textContent = '생성일 : ';
	            	let cell6 = document.createElement('div');
	            	cell6.classList.add('subtitle');
	            	cell6.textContent = data.createDate;
	            	row3.appendChild(cell5);
	            	row3.appendChild(cell6);
	            	
	            	let row4 = document.createElement('div');
	            	row4.classList.add('item');
	            	let cell7 = document.createElement('div');
	            	cell7.classList.add('title');
	            	cell7.textContent = '수정일 : ';
	            	let cell8 = document.createElement('div');
	            	cell8.classList.add('subtitle');
	            	if(data.modifyDate == null){
		            	cell8.textContent = '없음';
	            	} else{
		            	cell8.textContent = data.modifyDate;
	            	}
	            	row4.appendChild(cell7);
	            	row4.appendChild(cell8);
	            	
	            	let button = document.createElement('input');
	            	button.setAttribute('type', 'button');
	            	button.setAttribute('value', '상세보기');
	            	button.classList.add('detail-button');
	            	button.addEventListener('click', function() {
	            	    boardDetail(data.boardNo);
	            	});
	            	
	            	boardList.appendChild(row1);
	            	boardList.appendChild(row2);
	            	boardList.appendChild(row3);
	            	boardList.appendChild(row4);
    	            boardList.appendChild(button);
    	        },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	            }
	        });
	    };
	    
	    function getCommentList(commentSearchSelect, commentSearchValue) {
	        $.ajax({
	            url: '${contextPath}/admin/getMemberCommentList',
	            type: 'GET',
	            dataType: 'json',
	            data: { page: commentOffset, size: 20, userNo: ${m.userNo}, sort: commentFilterValue, searchSelect: commentSearchSelect, searchValue: commentSearchValue},
	            success: function(data) {
	            	if(data.content.length != 0){
		                commentOffset += 1;
		                updateCommentTable(data.content);
	            	}
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	            }
	        });
	    }
	
	    function updateCommentTable(data) {
	        let userList = document.querySelector('.comment-list');
	        for (let i = 0; i < data.length; i++) {
	            let row = document.createElement('tr');
	            row.classList.add('content-tr');
	            
	            let cell1 = document.createElement('td');
	            cell1.textContent = data[i].boardNo;
	            
	            let cell2 = document.createElement('td');
	            cell2.textContent = data[i].bigCategoryName;
	            
	            let cell3 = document.createElement('td');
	            cell3.textContent = data[i].subCategoryName;
	            
	            let cell4 = document.createElement('td');
	            cell4.textContent = data[i].title;
	            
	            row.appendChild(cell1);
	            row.appendChild(cell2);
	            row.appendChild(cell3);
	            row.appendChild(cell4);
	            
	            row.addEventListener('click', function() {
                	loadCommentDetail(data[i].boardNo);
	            });
	            userList.appendChild(row);
	        }
	    }
	    
	    function loadCommentDetail(boardNo) {
	        $.ajax({
	            url: '${contextPath}/admin/getCommentDetail',
	            type: 'GET',
	            dataType: 'json',
	            data: {boardNo, userNo: ${m.userNo}},
	            success: function(data) {
	            	let userList = document.querySelector('.comment-detail-list');
	            	userList.innerHTML = '';
	            	for (let i = 0; i < data.length; i++) {
	    	            let row = document.createElement('div');
	    	            row.classList.add('comment-item');
	    	            
	    	            let cell1 = document.createElement('div');
	    	            cell1.classList.add('comment-content');
	    	            cell1.innerHTML = data[i].content;
	    	            
	    	            let cell2 = document.createElement('div');
	    	            cell2.classList.add('comment-date');
	    	            cell2.textContent = data[i].createDate;
	    	            
	    	            row.appendChild(cell1);
	    	            row.appendChild(cell2);
	    	            
	    	            userList.appendChild(row);
    	            };
    	            
    	            let button = document.createElement('input');
	            	button.setAttribute('type', 'button');
	            	button.setAttribute('value', '상세보기');
	            	button.classList.add('detail-button');
	            	button.addEventListener('click', function() {
	            	    boardDetail(data[0].boardNo);
	            	});
	            	
	            	userList.appendChild(button);
    	        },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	            }
	        });
	    };
	    
	    function getPointList(page, pointSearchSelect, pointSearchValue) {
	        $.ajax({
	            url: '${contextPath}/admin/getMemberPointList',
	            type: 'GET',
	            dataType: 'json',
	            data: { page: page, size: 10, userNo: ${m.userNo}, sort: pointFilterValue, searchSelect: pointSearchSelect, searchValue: pointSearchValue },
	            success: function(data) {
	                if(data.content.length != 0){
	                    updatePointTable(data.content);
	                    updatePointPagination(data);
	                }
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	            }
	        });
	    }

	    function updatePointTable(data) {
	        let userList = document.querySelector('.point-list');
	        userList.innerHTML = '';	
	        for (let i = 0; i < data.length; i++) {
	            let row = document.createElement('tr');
	            row.classList.add('long-tr');
	            
	            let cell1 = document.createElement('td');
	            cell1.textContent = data[i].pointNo;
	            
	            let cell2 = document.createElement('td');
	            cell2.innerHTML = data[i].pointContent;
	            
	            let cell3 = document.createElement('td');
	            cell3.textContent = data[i].amount;
	            
	            let cell4 = document.createElement('td');
	            cell4.textContent = data[i].pointDate;
	            
	            row.appendChild(cell1);
	            row.appendChild(cell2);
	            row.appendChild(cell3);
	            row.appendChild(cell4);
	            
	            userList.appendChild(row);
	        }
	    }

	    function updatePointPagination(data) {
	        let userPaging = document.querySelector('.point-pageBar');
	        let pagination = '';
	        
	        if (!data.empty) {
	            if (!data.first) {
	                pagination += '<div onclick="getPointList(' + (data.number - 1) + ',\'' + pointSearchSelect + '\',\'' + pointSearchValue + '\')">이전</div>';
	            }
	            for (let i = 0; i < data.totalPages; i++) {
	                if (i >= data.number - 5 && i <= data.number + 5) {
	                    pagination += '<div';
	                    if (i === data.number) {
	                        pagination += ' class="active"';
	                    }
	                    pagination += ' onclick="getPointList(' + i + ',\'' + pointSearchSelect + '\',\'' + pointSearchValue + '\')">' + (i + 1) + '</div>';
	                }
	            }
	            if (!data.last) {
	                pagination += '<div onclick="getPointList(' + (data.number + 1) + ',\'' + pointSearchSelect + '\',\'' + pointSearchValue + '\')">다음</div>';
	            }
	        }
	        userPaging.innerHTML = pagination;
	    }
	    
	    function getReportList(page) {
	        $.ajax({
	            url: '${contextPath}/admin/getMemberReportList',
	            type: 'GET',
	            dataType: 'json',
	            data: { page: page, size: 10, userNo: ${m.userNo}, sort: reportFilterValue, searchSelect: reportSearchSelect, searchValue: reportSearchValue },
	            success: function(data) {
	                if(data.content.length != 0){
	                	updateReportTable(data.content);
	                    updateReportPagination(data);
	                }
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	            }
	        });
	    }

	    function updateReportTable(data) {
	        let userList = document.querySelector('.report-list');
	        userList.innerHTML = '';	
	        let list = data.content;
	        for (let i = 0; i < data.length; i++) {
	            let row = document.createElement('tr');
	            row.classList.add('long-tr');
	            
	            let cell1 = document.createElement('td');
	            cell1.textContent = data[i].reportNo;
	            
	            let cell2 = document.createElement('td');
	            cell2.innerHTML = data[i].reportType;
	            
	            let cell3 = document.createElement('td');
	            cell3.textContent = data[i].reportContent;
	            
	            let cell4 = document.createElement('td');
	            cell4.textContent = data[i].processingDate;

	            let cell5 = document.createElement('td');
	            cell4.textContent = data[i].reportDate;

	            let cell6 = document.createElement('td');
	            cell4.textContent = data[i].status;
	            
	            row.appendChild(cell1);
	            row.appendChild(cell2);
	            row.appendChild(cell3);
	            row.appendChild(cell4);
	            row.appendChild(cell5);
	            row.appendChild(cell6);
	            
	            userList.appendChild(row);
	        }
	    }

	    function updateReportPagination(data) {
	        let userPaging = document.querySelector('.report-pageBar');
	        let pagination = '';
	        if (!data.empty) {
	            if (!data.first) {
	                pagination += '<div onclick="loadReportData(' + (data.number - 1) + ',\'' + reportSearchSelect + '\',\'' + reportSearchValue + '\')">이전</div>';
	            }
	            for (let i = 0; i < data.totalPages; i++) {
	                if (i >= data.number - 5 && i <= data.number + 5) {
	                    pagination += '<div';
	                    if (i === data.number) {
	                        pagination += ' class="active"';
	                    }
	                    pagination += ' onclick="loadReportData(' + i + ',\'' + reportSearchSelect + '\',\'' + reportSearchValue + '\')">' + (i + 1) + '</div>';
	                }
	            }
	            if (!data.last) {
	                pagination += '<div onclick="loadReportData(' + (data.number + 1) + ',\'' + reportSearchSelect + '\',\'' + reportSearchValue + '\')">다음</div>';
	            }
	        }
	        userPaging.innerHTML = pagination;
	    }
	    
        function boardDetail(boardNo){
            location.href="${contextPath}/board/detail/"+boardNo;
        }
    </script>
</body>
</html>