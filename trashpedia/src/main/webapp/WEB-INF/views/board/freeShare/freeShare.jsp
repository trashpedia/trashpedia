<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

<!-- css -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/board/boardList.css">
<link rel="stylesheet"
	href="${contextPath}resources/css/main/pledge.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/board/freeShare/freeShare.css">



<!-- slick 라이브러리 CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<!-- slick 라이브러리 테마 CSS (선택사항) -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<!-- slick 라이브러리 JS -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!-- GoogleFonts -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />



<style type="text/css">

/* ----- 이미지 부분 ----- */
.content-outer {
	width: 1760px;
	box-sizing: border-box;
	padding: 30px;
	background-color: white;
	border: 2px solid #5bbf5b;
	overflow: hidden;
	text-align: center;
	z-index: 2;
	/*     margin-top: 100px; */
}

.img {
	width: 20%;
}

.img-area {
	width: 340px;
	height: 340px;
	box-sizing: border-box;
	display: inline-block;
	margin: 15px;
	overflow: hidden;
}

.content-img {
	box-sizing: border-box;
	width: 270px;
	height: 270px;
	min-width: 100%;
	max-width: 100%;
	min-height: 100%;
	max-height: 100%;
	cursor: pointer;
	object-fit: cover;
}

.img-area:hover .content-img {
	transform: scale(1.15);
	transition: transform 0.4s ease-in-out;
}

.img-area:hover {
	border: 4px solid #78d078;
}
/* ----- 페이징 버튼 ----- */
.paging-button {
	margin-top: 42px;
	margin-bottom: 5px;
}

.pagingBtn {
	border-radius: 50%;
	width: 50px;
	height: 50px;
	font-size: 15px;
	border: 0;
	cursor: pointer;
	margin: 2px;
	font-weight: 500;
	background-color: #73cc73;
	color: white;
}
</style>
<script type="text/javascript">
	//상세보기 이동
	function goToFreeShareDetail(postNo) {
		location.href = "${contextPath}/board/community/detail/${postNo}" + postNo;
	}
	
</script>

</head>
<!-- jQuery -->
<body>
	<jsp:include page="../../common/header.jsp" />


	<!-- 상단바 -->
	<div class="practice-section">
		<p>무료 나눔 게시판</p>
		<p>Reduce Reuse Recycle Recovery</p>
	</div>
	<!-- 상단바 -->


	<!-- 본문 -->
	<div class="inner">
		<main>

			<div class="Content">
				<div class="Container">


					<button class="btn">
						<a
							href="${pageContext.request.contextPath}/write?bigCategoryNo=${bigCategoryNo}&subCategoryNo=${subCategoryNo}&type=1">
							글쓰기 </a>
					</button>


					<!-- 리스트 -->
					<div class="List">
						<%-- 						<c:forEach var="post" items="${list}" varStatus="status"> --%>
<%-- 						<c:forEach var="post" items="${list}" varStatus="status" begin="0"end="${empty list ? 0 : fn:length(list) - 1}"> --%>
						<c:forEach var="post" items="${list}" >

							<%
							com.kks.trashpedia.board.model.vo.Post post = (com.kks.trashpedia.board.model.vo.Post) pageContext.getAttribute("post");
							String content = post.getContent();
							// "<img>" 태그와 "<br>" 태그 제거
							content = content.replaceAll("<img[^>]*>|<br\\s*/?>", "");
							// 콘솔에 값 출력
// 							System.out.println("content: " + content);
							String cleanedContent = content.substring(0, Math.min(content.length(), 550));
							// 콘솔에 값 출력
// 							System.out.println("cleanedContent: " + cleanedContent);
							%>

							<a href="${contextPath}/board/community/detail/${post.postNo}">
								<div class="Card">

									<div class="Front">
										<div class="Image">
											<img class="content-img"
												src="<c:url value='/resources/attachFile/image/${post.changeName}'/>">
										</div>

										<div class="TextContent">
											<div class="Subtitle">제목: ${fn:substring(post.title,0,11)}</div>
											<div class="Subtitle">작성일: ${post.createDate}</div>
											<div class="Subtitle">조회: ${post.hitsNo}</div>

										</div>
									</div>

									<div class="Back" onclick="goToFreeShareDetail(${post.postNo})"
										data-postNo="${post.postNo}">
										<img class="content-img"
											src="<c:url value='/resources/attachFile/image/${post.changeName}'/>"
											alt=""> <span class="clickDetail"
											data-postNo="${post.postNo}"
											style="font-size: 18px; font-weight: 600;"><%=cleanedContent%></span>



										<%-- 										<span class="clickDetail" data-postNo="${post.postNo}" --%>
										<%-- 											style="font-size: 18px; font-weight: 600;">${fn:substring(post.content,0,200)}</span> --%>
									</div>
								</div>

							</a>

						</c:forEach>

					</div>

				</div>
			</div>





			<!-- 					페이징 버튼 -->
			<div class="PagingArea paging-button">
				<!-- 						이전 페이지 버튼 -->
				<!-- 						현재 페이지가 첫 번째 페이지가 아닌 경우에만 이전 페이지로 이동할 수 있는 버튼을 표시합니다. -->
				<c:if test="${page gt 0}">
					<a
						href="${contextPath}/board/list?page=${page - 1}&subCategoryNo=${subCategoryNo}"
						class="pagingBtn">&lt;</a>
				</c:if>


				<c:choose>
					<c:when test="${totalPages > 1}">
						<c:set var="endValue" value="${totalPages - 1}" />
					</c:when>
					<c:otherwise>
						<c:set var="endValue" value="0" />
					</c:otherwise>
				</c:choose>

				<!-- 페이지 번호 표시 -->

				<c:forEach begin="0" end="${totalPages - 1}" var="pageNum">
					<!-- 							현재 페이지를 기준으로 좌우 5페이지 범위 내에 있는 페이지만 표시합니다. -->
					<c:if test="${pageNum ge page - 5 and pageNum le page + 5}">
						<a
							href="${contextPath}/board/list?page=${pageNum}&subCategoryNo=${subCategoryNo}"
							class="${pageNum eq page ? 'pagingBtn on' : 'pagingBtn'}">${pageNum + 1}</a>
					</c:if>
				</c:forEach>

				<!-- 						다음 페이지 버튼 -->
				<!-- 						현재 페이지가 마지막 페이지가 아닌 경우에만 다음 페이지로 이동할 수 있는 버튼을 표시합니다. -->
				<c:if test="${page + 1 lt totalPages}">
					<a
						href="${contextPath}/board/list?page=${page + 1}&subCategoryNo=${subCategoryNo}"
						class="pagingBtn">&gt;</a>
				</c:if>
			</div>
		</main>


	</div>

	<jsp:include page="../../common/footer.jsp" /><!-- 스크립트 -->

	<script>


		// Enter 키를 누르면 제목으로 검색 실행
		$('#keyword').keypress(function(event) {
			if (event.keyCode === 13) { // Enter 키를 누른 경우
				var title = $('#keyword').val(); // 검색어 가져오기
				if (title.trim() !== '') { // 검색어가 비어있지 않은 경우
					// 검색 실행
					searchByTitle(title);
				}
			}
		});

		// 제목으로 검색하는 함수
		function searchByTitle(title) {
			$.ajax({
				type : 'GET',
				url : '${contextPath}/board/searchByTitle',
				data : {
					title : title
				},
				success : function(response) {
					var postNo = response.postNo; // 검색 결과로 받은 postNo
					if (postNo) {
						// 상세 페이지로 이동
						goToFreeShareDetail(postNo);
					} else {
						console.log("해당하는 글이 없습니다.");
					}
				},
				error : function(xhr, status, error) {
					console.error("에러 발생:", error);
				}
			});
		}
	</script>


	<script type="text/javascript">
	//상세보기 이동
	function goToFreeShareDetail(postNo) {
		location.href = "${contextPath}/board/community/detail/${postNo}" + postNo;
	}
	
	</script>


	<script type="text/javascript">


	</script>

	<!-- 스크립트 -->
</body>
</html>
