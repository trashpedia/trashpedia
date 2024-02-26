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
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/admin/memberManagementDetail.css">
</head>
<jsp:include page="../common/header.jsp"/>
<body class="body">
    <jsp:include page="../common/sidebar.jsp"/>
    <div class="content-wrapper">
        <div class="content">
            <section class="search-section">
                <div class="search-container">
                    <div class="search-title">회원 상세 정보</div>
                </div>
            </section>
            <section class="member-section">
                <div class="member-container">
                    <div class="grade-container">
                        <div class="grade-item-wrapper">
                            <div class="grade-item">
                                <div class="grade-item-icon">★</div>
                                <div class="grade-item-title">포인트</div>
                                <div class="grade-item-subtitle"><fmt:formatNumber type="number" pattern="#,##0" value="${m.point}"/></div>
                            </div>
                            <div class="grade-item">
                                <div class="grade-item-icon">👑</div>
                                <div class="grade-item-title">등급</div>
                                <div class="grade-item-subtitle">${m.gradeName}</div>
                            </div>
                            <div class="grade-item">
                                <div class="grade-item-icon">🔒</div>
                                <div class="grade-item-title">권한</div>
                                <div class="grade-item-subtitle">${m.roleName}</div>
                            </div>
                            <div class="grade-item">
                                <div class="grade-item-icon"></div>
                                <div class="grade-item-title">생성일</div>
                                <div class="grade-item-subtitle">${m.createDate}</div>
                            </div>
                            <div class="grade-item">
                                <div class="grade-item-icon"></div>
                                <div class="grade-item-title">수정일</div>
                                <c:if test="${not empty m.modifyDate}">
	                                <div class="grade-item-subtitle">${m.modifyDate}</div>
                                </c:if>
                                <c:if test="${empty m.modifyDate}">
	                                <div class="grade-item-subtitle">수정 없음</div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <div class="member-info-list">
                        <div class="member-item">
                            <div class="title">이메일</div>
                            <div class="subtitle">${m.userEmail}</div>
                        </div>
                        <div class="member-item">
                            <div class="title">이름</div>
                            <div class="subtitle">${m.userName}</div>
                        </div>
                        <div class="member-item">
                            <div class="title">닉네임</div>
                            <div class="subtitle">${m.userNickname}</div>
                        </div>
                        <div class="member-item">
                            <div class="title">전화번호</div>
                            <div class="subtitle">${not empty m.phone ? m.phone : '정보 없음'}</div>
                        </div>
                        <div class="member-item">
                            <div class="title">주소</div>
                            <div class="subtitle">${not empty m.address1 ? m.zipcode + ' ' + m.address1 + ' ' + m.address2 + ' ' + m.address3 : '정보 없음'}</div>
                        </div>
                    </div>
                </div>
                <div class="member-board-container">
                    <div class="board-container">
                        <div class="board-title-wrapper">
                            <div class="board-title">작성 게시글</div>
                            <div class="board-subtitle">총 ${b}개</div>
                        </div>
                        <div class="boardList list"></div>
                    </div>
                    <div class="board-container">
                        <div class="board-title">게시글 상세</div>
                        <div class="boardDetail list"></div>
                    </div>
                </div>
                <div class="member-board-container">
                    <div class="board-container">
                        <div class="board-title-wrapper">
                            <div class="board-title">작성 댓글</div>
                            <div class="board-subtitle">총 ${c}개</div>
                        </div>
                        <div class="commentList list"></div>
                    </div>
                    <div class="board-container">
                        <div class="board-title">댓글 상세</div>
                        <div class="commentDetail list"></div>
                    </div>
                </div>
                <div class="point-container">
                    <div class="point-content">
                        <div class="point-title-wrapper">
                            <div class="board-title">포인트 적립 내역</div>
                        </div>
                        <table class="point-table table">
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>포인트 적립 내역</th>
                                    <th>포인트 증감</th>
                                    <th>날짜</th>
                                </tr>
                            </thead>
                            <tbody class="point-tbody"></tbody>
                        </table>
                        <div class="point-pageBar pageBar"></div>
                    </div>
                </div>
                <div class="point-container">
                    <div class="point-content">
                        <div class="point-title-wrapper">
                            <div class="board-title">신고 접수 내역</div>
                        </div>
                        <table class="report-table table">
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>신고 유형</th>
                                    <th>신고 제목</th>
                                    <th>신고 내용</th>
                                    <th>날짜</th>
                                </tr>
                            </thead>
                            <tbody class="report-tbody"></tbody>
                        </table>
                        <div class="report-pageBar pageBar"></div>
                    </div>
                </div>
            </section>
        </div>
    </div>
    <script>
	    var isLoading = false;
	    var boardOffset = 0;
	    var commentOffset = 0;
		
	    $(document).ready(function() {
	    	loadBoardData();
	    	loadCommentData();
	    	loadPointData(1);
	    	loadReportData(1);
	    });
	    $('.boardList').scroll(function() {
	        if($(this).scrollTop() + $(this).innerHeight() + 70 >= $(this)[0].scrollHeight) {
	            if (!isLoading) {
	                isLoading = true;
	                loadBoardDetailData();
	            }
	        }
	    });
	
	    function loadBoardData() {
	        $.ajax({
	            url: '${contextPath}/admin/getMemberBoardList',
	            type: 'GET',
	            dataType: 'json',
	            data: { page: boardOffset, size: 20, userNo: ${m.userNo} },
	            success: function(data) {
	            	if(data.content.length != 0){
		                updateBoardTable(data);
		                boardOffset += 1;
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
	    	console.log(data);
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
	    
	    function loadBoardDetailData(boardNo) {
	        $.ajax({
	            url: '${contextPath}/admin/getMemberBoardDetail',
	            type: 'GET',
	            dataType: 'json',
	            data: {boardNo},
	            success: function(data) {
	            	let userList = document.querySelector('.boardDetail');
	            	userList.innerHTML = '';
    	            let row = '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<div class="title">제목 :</div>';
    	            row += '<div class="subtitle">'+data.title+'</div>';
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<div class="title">내용 : </div>';
    	            row += '<div class="subtitle">'+data.content+'</div>';
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<div class="title">생성일 : </div>';
    	            row += '<div class="subtitle">'+data.createDate+'</div>';
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<div class="title">수정일 : </div>';
    	            if(data.modifyDate != null){
	    	            row += '<div class="subtitle">'+data.modifyDate+'</div>';
    	            } else {
	    	            row += '<div class="subtitle">수정 없음</div>';
    	            }
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<input type="button" value="상세보기" onclick="loadBoardDetail('+data.boardNo+')"/>';
    	            row += '</div>';
    	            userList.innerHTML += row;
    	        },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	                isLoading = false;
	            }
	        });
	    };
	    $('.commentList').scroll(function() {
	        if($(this).scrollTop() + $(this).innerHeight() + 70 >= $(this)[0].scrollHeight) {
	            if (!isLoading) {
	                isLoading = true;
	                loadBoardData();
	            }
	        }
	    });
	
	    function loadCommentData() {
	        $.ajax({
	            url: '${contextPath}/admin/getMemberCommentList',
	            type: 'GET',
	            dataType: 'json',
	            data: { page: commentOffset, size: 20, userNo: '${userNo}' },
	            success: function(data) {
	            	if(data.content.length != 0){
		                updateCommentTable(data);
		                commentOffset += 1;
		                isLoading = false;
	            	}
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	                isLoading = false;
	            }
	        });
	    }
	    function updateCommentTable(data) {
	        let userList = document.querySelector('.commentList');
	        let list = data.content;
	        for (let i = 0; i < list.length; i++) {
	        	if(list[i].commentNo != null){
		            let row = '<div class="item" onclick="loadCommentDetailData('+list[i].commentNo+')">';
	        	} else {
		            let row = '<div class="item" onclick="loadNestedCommentDetailData('+list[i].nestedCommentNo+')">';
	        	}
	            row += '<div class="icon">😃</div>';
	            row += '<div class="subtitle">'+list[i].bigCategoryName+'</div>';
	            row += '<div class="subtitle">'+list[i].subCategoryName+'</div>';
	            row += '<div class="subtitle">'+list[i].title+'</div>';
	            row += '</div>';
	            userList.innerHTML += row;
	        }
	    }
	    function loadCommentDetailData(commentNo) {
	        $.ajax({
	            url: '${contextPath}/admin/getCommentDetailData',
	            type: 'GET',
	            dataType: 'json',
	            data: {commentNo},
	            success: function(data) {
	            	let userList = document.querySelector('.commentDetail');
	            	userList.innerHTML = '';
    	            let row = '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<div class="title">제목 :</div>';
    	            row += '<div class="subtitle">'+data.title+'</div>';
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<div class="title">내용 : </div>';
    	            row += '<div class="subtitle">'+data.content+'</div>';
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<div class="title">댓글 : </div>';
    	            row += '<div class="subtitle">'+data.commentContent+'</div>';
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<div class="title">생성일 : </div>';
    	            row += '<div class="subtitle">'+data.createDate+'</div>';
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<div class="title">수정일 : </div>';
    	            row += '<div class="subtitle">'+data.modifyDate+'</div>';
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<input type="button" value="상세보기" onclick="loadBoardDetail('+data.boardNo+')"/>';
    	            row += '</div>';
    	            userList.innerHTML += row;
    	        },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	                isLoading = false;
	            }
	        });
	    };
	    function loadNestedCommentDetailData(userNo) {
	        $.ajax({
	            url: '${contextPath}/admin/getNestedCommentDetailData',
	            type: 'GET',
	            dataType: 'json',
	            data: {userNo},
	            success: function(data) {
	            	let userList = document.querySelector('.commentDetail');
	            	userList.innerHTML = '';
    	            let row = '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<div class="title">제목 :</div>';
    	            row += '<div class="subtitle">'+data.title+'</div>';
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<div class="title">내용 : </div>';
    	            row += '<div class="subtitle">'+data.content+'</div>';
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<div class="title">댓글 : </div>';
    	            row += '<div class="subtitle">'+data.commentContent+'</div>';
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<div class="title">생성일 : </div>';
    	            row += '<div class="subtitle">'+data.createDate+'</div>';
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<div class="title">수정일 : </div>';
    	            row += '<div class="subtitle">'+data.modifyDate+'</div>';
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<input type="button" value="상세보기" onclick="loadBoardDetail('+data.boardNo+')"/>';
    	            row += '</div>';
    	            userList.innerHTML += row;
    	        },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	                isLoading = false;
	            }
	        });
	    };
	    
	    function loadPointData(page) {
	        $.ajax({
	            url: '${contextPath}/admin/getMemberPointList',
	            type: 'GET',
	            dataType: 'json',
	            data: { page: page, size: 20, userNo: ${m.userNo} },
	            success: function(data) {
	            	console.log(data);
	                if(data.content.length != 0){
	                    updatePointTable(data);
	                    updatePointPagination(data);
	                }
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	            }
	        });
	    }

	    function updatePointTable(data) {
	        let userList = document.querySelector('.point-tbody');
	        userList.innerHTML = '';	
	        let list = data.content;
	        for (let i = 0; i < list.length; i++) {
	            let row = '<tr>';
	            row += '<td>😃</td>';
	            row += '<td>'+list[i].pointContent+'</td>';
	            row += '<td>'+list[i].amount+'</td>';
	            row += '<td>'+list[i].pointDate+'</td>';
	            row += '</tr>';
	            userList.innerHTML += row;
	        }
	    }

	    function updatePointPagination(data) {
	        let userPaging = document.querySelector('.point-pageBar');
	        let pagination = '';
	        if (!data.empty) {
	            if (!data.first) {
	                pagination += '<td><a class="page-link" href="#" onclick="loadPointData(' + (data.number - 1) + ')">이전</a></td>';
	            }
	            for (let i = 0; i < data.totalPages; i++) {
	                if (i >= data.number - 5 && i <= data.number + 5) {
	                    pagination += '<td';
	                    if (i === data.number) {
	                        pagination += ' class="active"';
	                    }
	                    pagination += '><a href="#" onclick="loadPointData(' + i + ')">' + (i + 1) + '</a></td>';
	                }
	            }
	            if (!data.last) {
	                pagination += '<td><a href="#" onclick="loadPointData(' + (data.number + 1) + ')">다음</a></td>';
	            }
	        }
	        userPaging.innerHTML = '<tr>' + pagination + '</tr>';
	    }
	    
	    function loadReportData(page) {
	        $.ajax({
	            url: '${contextPath}/admin/getMemberReportList',
	            type: 'GET',
	            dataType: 'json',
	            data: { page: page, size: 20, userNo: ${m.userNo} },
	            success: function(data) {
	            	console.log(data);
	                if(data.content.length != 0){
	                	updateReportTable(data);
	                    updateReportPagination(data);
	                }
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	            }
	        });
	    }

	    function updateReportTable(data) {
	        let userList = document.querySelector('.report-tbody');
	        userList.innerHTML = '';	
	        let list = data.content;
	        for (let i = 0; i < list.length; i++) {
	            let row = '<tr>';
	            row += '<td>'+list[i].reportNo+'</td>';
	            row += '<td>'+list[i].reportType+'</td>';
	            row += '<td>'+list[i].reportContent+'</td>';
	            row += '<td>'+list[i].processingDate+'</td>';
	            row += '</tr>';
	            userList.innerHTML += row;
	        }
	    }

	    function updateReportPagination(data) {
	        let userPaging = document.querySelector('.report-pageBar');
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
	    
        function loadBoardDetail(boardNo){
            location.href="/board/detail?boardNo="+boardNo;
        }
    </script>
</body>