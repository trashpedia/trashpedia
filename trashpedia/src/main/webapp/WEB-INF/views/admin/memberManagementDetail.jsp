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
                            <c:if test="${not empty m.phone}">
	                            <div class="subtitle">${m.phone}</div>
                            </c:if>
                            <c:if test="${empty m.phone}">
	                            <div class="subtitle">정보 없음</div>
                            </c:if>
                        </div>
                        <div class="member-item">
                            <div class="title">주소</div>
                            <c:if test="${not empty m.address1}">
	                            <div class="subtitle"><span>${m.zipcode} ${m.address1} ${m.address2} ${m.address3}</span></div>
                            </c:if>
                            <c:if test="${empty m.address1}">
	                            <div class="subtitle">정보 없음</div>
                            </c:if>
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
                        <div class="commentDetail list">
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
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">Updated At : </div>
                                <div class="subtitle">2021-02-01</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">reply : </div>
                                <div class="subtitle">저도 밥 먹었습니다 너보다 아주 맛있게요</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">Created At : </div>
                                <div class="subtitle">2021-01-01</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">Updated At : </div>
                                <div class="subtitle">2021-02-01</div>
                            </div>
                            <div class="item">
                                <input type="button" onclick="boardDetail()" value="상세보기">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="point-container">
                    <div class="point-content">
                        <div class="point-title-wrapper">
                            <div class="board-title">포인트 적립 내역</div>
                        </div>
                        <table class="point-table">
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>포인트 적립 내역</th>
                                    <th>포인트 증감</th>
                                    <th>날짜</th>
                                </th>
                            </thead>
                            <tbody>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>출석체크</td>
                                    <td>10</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>출석체크</td>
                                    <td>10</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>출석체크</td>
                                    <td>10</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>출석체크</td>
                                    <td>10</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>출석체크</td>
                                    <td>10</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>출석체크</td>
                                    <td>10</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>출석체크</td>
                                    <td>10</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>출석체크</td>
                                    <td>10</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>출석체크</td>
                                    <td>10</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>출석체크</td>
                                    <td>10</td>
                                    <td>2024/02/01</td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="pageBar">
                            <div>&lt;&lt;</div>
                            <div>1</div>
                            <div>2</div>
                            <div>3</div>
                            <div>&gt;&gt;</div>
                        </div>
                    </div>
                </div>
                <div class="point-container">
                    <div class="point-content">
                        <div class="point-title-wrapper">
                            <div class="board-title">신고 접수 내역</div>
                        </div>
                        <table class="point-table">
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>신고 유형</th>
                                    <th>신고 제목</th>
                                    <th>신고 내용</th>
                                    <th>날짜</th>
                                </th>
                            </thead>
                            <tbody>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>게시글</td>
                                    <td>사기글 작성</td>
                                    <td>사기꾼입니다 이사람 산다해놓고 안사요</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>댓글</td>
                                    <td>욕설 작성</td>
                                    <td>아니 저를 언제 봤다고 욕부터 하네요;;</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>댓글</td>
                                    <td>사기글 작성</td>
                                    <td>사기꾼입니다 이사람 산다해놓고 안사요</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>게시글</td>
                                    <td>사기글 작성</td>
                                    <td>사기꾼입니다 이사람 산다해놓고 안사요</td>
                                    <td>2024/02/01</td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="pageBar">
                            <div>&lt;&lt;</div>
                            <div>1</div>
                            <div>2</div>
                            <div>3</div>
                            <div>&gt;&gt;</div>
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
	    	loadBoardData();
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
	            let row = '<div class="item" onclick="loadDetailData('+list[i].boardNo+')">';
	            row += '<div class="icon">😃</div>';
	            row += '<div class="subtitle">'+list[i].bigCategoryName+'</div>';
	            row += '<div class="subtitle">'+list[i].subCategoryName+'</div>';
	            row += '<div class="subtitle">'+list[i].title+'</div>';
	            row += '</div>';
	            userList.innerHTML += row;
	        }
	    }
	    
	    function loadBoardDetailData(userNo) {
	        $.ajax({
	            url: '${contextPath}/admin/getMemberBoardDetail',
	            type: 'GET',
	            dataType: 'json',
	            data: {userNo},
	            success: function(data) {
	            	let userList = document.querySelector('.boardDetail');
	            	userList.innerHTML = '';
    	            let row = '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<div class="title">title :</div>';
    	            row += '<div class="subtitle">'+data.title+'</div>';
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<div class="title">content : </div>';
    	            row += '<div class="subtitle">'+data.content+'</div>';
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<div class="title">Created At : </div>';
    	            row += '<div class="subtitle">'+data.createDate+'</div>';
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<div class="title">Updated At : </div>';
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
	            url: '${contextPath}/admin/getCommentList',
	            type: 'GET',
	            dataType: 'json',
	            data: { page: offset, size: 20, userNo: '${userNo}' },
	            success: function(data) {
	            	if(data.content.length != 0){
		                updateCommentTable(data);
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
	    function updateCommentTable(data) {
	        let userList = document.querySelector('.commentList');
	        let list = data.content;
	        for (let i = 0; i < list.length; i++) {
	            let row = '<div class="item" onclick="loadCommentData('+list[i].boardNo+')">';
	            row += '<div class="icon">😃</div>';
	            row += '<div class="subtitle">'+list[i].bigCategoryName+'</div>';
	            row += '<div class="subtitle">'+list[i].subCategoryName+'</div>';
	            row += '<div class="subtitle">'+list[i].title+'</div>';
	            row += '</div>';
	            userList.innerHTML += row;
	        }
	    }
	    
	    function loadCommentDetailData(userNo) {
	        $.ajax({
	            url: '${contextPath}/admin/getBoardDetail',
	            type: 'GET',
	            dataType: 'json',
	            data: {userNo},
	            success: function(data) {
	            	let userList = document.querySelector('.boardDetail');
	            	userList.innerHTML = '';
    	            let row = '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<div class="title">title :</div>';
    	            row += '<div class="subtitle">'+data.title+'</div>';
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<div class="title">content : </div>';
    	            row += '<div class="subtitle">'+data.content+'</div>';
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<div class="title">Created At : </div>';
    	            row += '<div class="subtitle">'+data.createDate+'</div>';
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<div class="title">Updated At : </div>';
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
	    
        function loadBoardDetail(boardNo){
            location.href="/board/detail?boardNo="+boardNo;
        }
    </script>
</body>