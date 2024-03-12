<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<c:url var="currentUrl" value="/trashpedia/pledge/list">
	<c:param name="subCategoryNo" value="${currentSubCategoryNo}" />
	<c:param name="searchSelect" value="${searchSelect}" />
	<c:param name="searchValue" value="${searchValue}" />
	<c:param name="filter" value="${filter}" />
	<c:param name="page" value="${page}" />
</c:url>
<c:set var="subCategoryNo" value="${param.subCategoryNo}" />
<c:set var="searchSelect" value="${param.searchSelect}" />
<c:set var="searchValue" value="${param.searchValue}" />
<c:set var="filter" value="${param.filter}" />
<c:set var="page" value="${param.page}" />
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
						<option value="createDate" ${filter == 'createDate' ? 'selected' : ''}>작성일</option>
						<option value="hits" ${filter == 'hits' ? 'selected' : ''}>조회수</option>
					</select>
				</div>
		    </div>
			<div class="board_list_wrap">
				<div class="board_list">
					<div class="top">
						<div class="num">번호</div>
						<div class="title">제목</div>
						<div class="writer">글쓴이</div>
						<div class="date">작성일</div>
						<div class="count">조회</div>
					</div>
					<c:forEach var="board" items="${boardList.content}" varStatus="status">
						<div id="boardDetailDiv" onclick="boardDetail(${board.boardNo})">
							<div class="num">${board.postNo}</div>
							<div class="title"><p>${board.title}</p></div>
							<div class="writer">${board.userName}</div>
							<div class="date">${board.createDate}</div>
							<div class="count">${board.hits}</div>
						</div>
					</c:forEach>
				</div>
				<c:if test="${authentication != null && subCategoryNo != 1}">
					<div class="insert-area">
		                <a href="${pageContext.request.contextPath}/write?subCategoryNo=${subCategoryNo}&type=1">
		                    <button id="insertButton"class="comment-buttons">게시글 등록하기</button>
		                </a>
	            	</div>
				</c:if>
				<div class="board_page">
				    <c:if test="${boardList.number > 0}">
				        <a href="${contextPath}/board/list?searchSelect=${searchSelect}&searchValue=${searchValue}&subCategoryNo=${subCategoryNo}&filter=${filter}&page=${boardList.number - 1}"
				            class="bt prev">&lt;</a>
				    </c:if>
				    <c:if test="${boardList.totalPages > 0}">
				        <c:forEach begin="0" end="${boardList.totalPages - 1}" var="pageNum">
				            <c:if test="${pageNum >= boardList.number - 5 && pageNum <= boardList.number + 5}">
				                <a href="${contextPath}/board/list?searchSelect=${searchSelect}&searchValue=${searchValue}&subCategoryNo=${subCategoryNo}&filter=${filter}&page=${pageNum}"
				                    class="${pageNum == boardList.number ? 'num on' : 'num'}">${pageNum + 1}
				                </a>
				            </c:if>
				        </c:forEach>
				    </c:if>
				    <c:if test="${boardList.number + 1 < boardList.totalPages}">
				        <a href="${contextPath}/board/list?searchSelect=${searchSelect}&searchValue=${searchValue}&subCategoryNo=${subCategoryNo}&filter=${filter}&page=${boardList.number + 1}"
				            class="bt next">&gt;</a>
				    </c:if>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="../../common/footer.jsp" />
	<script>
	    var subCategoryNo = ${subCategoryNo};
	    var searchSelect = "${not empty searchSelect ? searchSelect : ''}";
	    var searchValue = "${not empty searchValue ? searchValue : ''}";
	    var filter = "${not empty filter ? filter : 'createDate'}";
	    var page = ${not empty page ? page : 0};
	    
	    $(document).ready(function() {
	        $('.content').each(function() {
	            var htmlContent = $(this).html();
	            var textContent = $('<div>').html(htmlContent).text();
	            $(this).text(textContent);
	        });
	    });
	
	    function boardSearch() {
	        var searchSelect = $('#searchSelect').val();
	        var searchValue = $('#searchValue').val();
	        location.href = '${contextPath}/board/list?searchSelect=' + searchSelect + '&searchValue=' + searchValue + '&subCategoryNo=' + subCategoryNo + '&filter=' + filter + '&page=0';
	    }
	
	    function boardDetail(boardNo) {
	        location.href = "${contextPath}/board/detail/" + boardNo;
	    }
	
	    $('#filter').change(function() {
	        var filter = $('#filter').val();
	        location.href = '${contextPath}/board/list?searchSelect=' + searchSelect + '&searchValue=' + searchValue + '&subCategoryNo=' + subCategoryNo + '&filter=' + filter + '&page=0';
	    });
	</script>
</body>
</html>