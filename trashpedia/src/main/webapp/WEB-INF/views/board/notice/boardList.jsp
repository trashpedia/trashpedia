<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet"
	href="${contextPath}/resources/css/board/boardList.css">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>

</head>


<body>
	<c:if test="${not empty alert}">
		<script>
			alert("${alert}");
		</script>
		<c:remove var="alert" />
	</c:if>

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

				<p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
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
<!-- 					<button type="button" onclick="boardSearch()">검색</button> -->
				</div>
			 	
				<div class="search_form_left">
					<select id="filter">
						<option value="createDate">작성일</option>
						<option value="hitCount">조회수</option>
					</select>
<!-- 					<button type="button" onclick="boardSearch()">정렬</button> -->
					<button type="button" onclick="boardSearch()">검색</button>
					
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

					<c:forEach var="board" items="${boardList.content}"
						varStatus="status">
						<div>
							<div class="num">${board.postNo}</div>
							<div class="title">
								<a href="${contextPath}/board/detail/${board.postNo}">${board.title}</a>
							</div>
							<div class="writer">${board.userName}</div>
							<div class="date">${board.createDate}</div>
							<%-- 	                         <div class="count">${board.viewCount}</div> --%>
						</div>
					</c:forEach>

				</div>
				
				<div class="insert-area">
	                <a href="${pageContext.request.contextPath}/write?bigCategoryNo=${bigCategoryNo}&subCategoryNo=${subCategoryNo}&type=1">
	                    <button id="insertButton"class="comment-buttons">게시글 등록하기</button>
	                </a>
            	</div>


				<div class="board_page">
					<c:if test="${boardList.number > 0}">
						<a
							href="${contextPath}/board/list?page=${boardList.number - 1}&subCategoryNo=${subCategoryNo}"
							class="bt prev">&lt;</a>
					</c:if>

					<c:forEach begin="0" end="${boardList.totalPages - 2}"
						var="pageNum">
						<a
							href="${contextPath}/board/list?page=${pageNum}&subCategoryNo=${subCategoryNo}"
							class="${pageNum == boardList.number ? 'num on' : 'num'}">${pageNum+1}
						</a>
					</c:forEach>

					<c:if test="${boardList.number + 1 < boardList.totalPages}">
						<a
							href="${contextPath}/board/list?page=${boardList.number + 1}&subCategoryNo=${subCategoryNo}"
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

	</script>
</body>
</html>
