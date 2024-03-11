<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<c:url var="currentUrl" value="/trashpedia/pledge/list">
	<c:param name="subCategoryNo" value="${currentSubCategoryNo}" />
	<c:param name="bigCategoryNo" value="${currentBigCategoryNo}" />
</c:url>
<c:set var="subCategoryNo" value="${param.subCategoryNo}" />
<c:set var="bigCategoryNo" value="${param.bigCategoryNo}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>커뮤니티</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/board/boardList.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
	<main class="board_html">
		<!--실천서약 타이틀 부분-->
		<div class="practice-section">
			<p>커뮤니티</p>
			<p>Reduce Reuse Recycle Recovery</p>
		</div>
		<!--list-->
		<div class="board_wrap">
			<div class="board_title">
				<c:choose>
					<c:when test="${subCategoryNo == 1 }">
						<strong>공지사항</strong>
					</c:when>
					<c:when test="${subCategoryNo == 2 }">
						<strong>일반게시판</strong>
					</c:when>
					<c:when test="${subCategoryNo == 3 }">
						<strong>건의게시판</strong>
					</c:when>
					<c:when test="${subCategoryNo == 4 }">
						<strong>무료나눔게시판</strong>
					</c:when>
				</c:choose>
				<p>빠르고 정확한 정보를 안내해드립니다.</p>
			</div>
			<%-- ${contextPath}/board/list?subCategoryNo=${sc.subCategoryNo}&filter=createDate&searchSelect=&searchValue=&page=0 --%>
			<!-- 검색 폼 추가 -->
			<!-- 			<div class="search-form"> -->
			<%-- 				<form action="${contextPath}/board/list" method="get"> --%>
			<%-- 					<input type="hidden" name="subCategoryNo" value="${subCategoryNo}"> --%>
			<!-- 					<input type="text" name="searchValue" placeholder="검색어를 입력하세요" aria-label="검색"> -->
			<!-- 					<button type="submit">검색</button> -->
			<!-- 				</form> -->
			<!-- 			</div> -->
			 <div class="search-form">
				<div class="search_form_right">
					<select id="searchSelect">
						<option value="boardNo">게시글 번호</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" id="searchValue" placeholder="검색어를 입력하세요">
					<button type="button" onclick="boardSearch()">검색</button>
				</div>
				<div class="search_form_left">
					<select id="filter">
						<option value="createDate">작성일</option>
						<option value="hitCount">조회수</option>
					</select>
				</div>
		    </div>
			<div class="board_list_wrap">
				<div class="board_list">
					<div class="top">
						<div class="num">번호</div>
						<div class="title">제목</div>
						<div class="content">내용</div>
						<div class="writer">글쓴이</div>
						<div class="date">작성일</div>
						<div class="count">조회</div>
						
					</div>
					<c:forEach var="board" items="${boardList.content}" varStatus="status">
						<div id="boardDetailDiv" onclick="boardDetail(${board.postNo})">
							<div class="num">${board.postNo}</div>
							<div class="title">
								<p>${fn:substring(board.title, 0, 8)}${fn:length(board.title) > 8 ? '' : ''}
								</p>
							</div>
							<div class="content">
								<p>
									${fn:substring(board.content, 0, 100)}${fn:length(board.content) > 100 ? '...' : ''}
								</p>
							</div>
							<div class="writer">${board.userName}</div>
							<div class="date">${board.createDate}</div>
							<div class="count">${board.hits}</div>
						</div>
					</c:forEach>
				</div>
				<div class="insert-area">
	                <a href="${pageContext.request.contextPath}/write?bigCategoryNo=1&subCategoryNo=${subCategoryNo}&type=1">
	                    <button id="insertButton"class="comment-buttons">게시글 등록하기</button>
	                </a>
            	</div>
				<div class="board_page">
					<c:if test="${boardList.number > 0}">
						<a href="${contextPath}/board/list?page=${boardList.number - 1}&subCategoryNo=${subCategoryNo}"
							class="bt prev">&lt;</a>
					</c:if>
					<c:if test="${boardList.totalPages > 0}">
						<c:forEach begin="0" end="${boardList.totalPages - 1}" var="pageNum">
						    <c:if test="${pageNum >= boardList.number - 5 && pageNum <= boardList.number + 5}">
						        <a href="${contextPath}/board/list?page=${pageNum}&subCategoryNo=${subCategoryNo}"
						            class="${pageNum == boardList.number ? 'num on' : 'num'}">${pageNum + 1}
						        </a>
						    </c:if>
						</c:forEach>
					</c:if>
					<c:if test="${boardList.number + 1 < boardList.totalPages}">
						<a href="${contextPath}/board/list?page=${boardList.number + 1}&subCategoryNo=${subCategoryNo}"
							class="bt next">&gt;</a>
					</c:if>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="../../common/footer.jsp" />
	<script>
	
	function boardSearch() {
	    var searchSelect = $('#searchSelect').val();
	    var searchValue = $('#searchValue').val();
	    var subCategoryNo = ${subCategoryNo};
	    
	    var filter = $('#filter').val();

	    location.href = '${contextPath}/board/list?searchSelect=' + searchSelect + '&searchValue=' + searchValue + '&subCategoryNo=' + subCategoryNo + '&filter=' + filter + '&page=0';
	}
	
	$(document).ready(function() {
		$('.content').each(function() {
			var htmlContent = $(this).html(); // HTML 내용을 가져옵니다.
			var textContent = $('<div>').html(htmlContent).text(); // HTML 태그를 제거합니다.
			$(this).text(textContent); // 순수 텍스트로 내용을 변경합니다.
		});
	});
	
	// 	<a href="${contextPath}/board/community/detail/${board.postNo}">
    // 상세페이지 이동
    function boardDetail(postNo) {
    	location.href = "${contextPath}/board/detail/" + postNo;
	}
    
    
    
    
    $('#filter').change(function() {
        var filter = $(this).val();
        $.ajax({
            url: '${contextPath}/board/list',
            type: 'GET',
            data: {
                subCategoryNo: ${subCategoryNo},
                filter: filter,
                page: 0
            },
            success: function(response) {
                // 성공적으로 데이터를 받아온 경우, 페이지 내용을 업데이트합니다.
                // 예를 들어, 받아온 HTML을 특정 div에 삽입할 수 있습니다.
                // $('#boardList').html(response);
            },
            error: function(xhr, status, error) {
                // 오류 처리
                alert("데이터를 불러오는 데 실패했습니다.");
            }
        });
    });

	</script>
</body>
</html>