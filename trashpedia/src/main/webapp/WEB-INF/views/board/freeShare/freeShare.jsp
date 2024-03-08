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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FREESHARING</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>

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
					<div class="Title">
						<!-- 무료 나눔 게시판 -->
					</div>
					<a
						href="${pageContext.request.contextPath}/write?bigCategoryNo=${bigCategoryNo}&subCategoryNo=${subCategoryNo}&type=1">
						<button class="btn">글쓰기</button>
					</a>




					<!-- 3개의 리스트 -->

					<div class="List">
						<c:forEach var="post" items="${list}" varStatus="status">


							<a href="${contextPath}/board/community/detail/${post.postNo}">
								<div class="Card">

									<div class="Front">
										<div class="Image">
											<img class="content-img"
												src="<c:url value='/resources/attachFile/image/${post.changeName}'/>">
										</div>

										<div class="TextContent">
											<div class="Subtitle">제목: ${post.title}</div>
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
											style="font-size: 18px; font-weight: 600;">${fn:substring(post.content,0,200)}</span>
									</div>
								</div>

							</a>

						</c:forEach>

					</div>

					<!-- 3개의 리스트 -->

					<!-- 				<div class="board_page"> -->
					<%-- 					<c:if test="${boardList.number > 0}"> --%>
					<%-- 						<a href="${contextPath}/board/list?page=${boardList.number - 1}&subCategoryNo=${subCategoryNo}" --%>
					<!-- 							class="bt prev">&lt;</a> -->
					<%-- 					</c:if> --%>

					<%-- 					<c:forEach begin="0" end="${boardList.totalPages - 1}" var="pageNum"> --%>
					<%-- 					    <c:if test="${pageNum >= boardList.number - 5 && pageNum <= boardList.number + 5}"> --%>
					<%-- 					        <a href="${contextPath}/board/list?page=${pageNum}&subCategoryNo=${subCategoryNo}" --%>
					<%-- 					            class="${pageNum == boardList.number ? 'num on' : 'num'}">${pageNum + 1} --%>
					<!-- 					        </a> -->
					<%-- 					    </c:if> --%>
					<%-- 					</c:forEach> --%>


					<%-- 					<c:if test="${boardList.number + 1 < boardList.totalPages}"> --%>
					<%-- 						<a href="${contextPath}/board/list?page=${boardList.number + 1}&subCategoryNo=${subCategoryNo}" --%>
					<!-- 							class="bt next">&gt;</a> -->
					<%-- 					</c:if> --%>
					<!-- 				</div> -->

				</div>
			</div>




		</main>


	</div>

	<jsp:include page="../../common/footer.jsp" />



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
		

       
	
	  
	    
        //페이징,검색
        var boardFilterValue = 'boardNo';
	    var boardSearchSelect = null;
	    var boardSearchValue = null;
		
		function pledgeShow() {
	        $("#pledgeBtn").css("background-color", "#5bbf5b");
// 	        $("#certificationBtn").css("background-color", "rgb(200, 200, 200)");
	        localStorage.setItem('selectedTab', 'pledge');
	        getBoardList(0, boardSearchSelect, boardSearchValue);
	    }
	
	    function certificationShow() {
	        $("#certificationBtn").css("background-color", "#5bbf5b");
// 	        $("#pledgeBtn").css("background-color", "rgb(200, 200, 200)");
	        localStorage.setItem('selectedTab', 'certification');
	        getBoardList(0, boardSearchSelect, boardSearchValue);
	    }
	    
	    $(document).ready(function () {
	    	
	    	  getBoardList(0, boardSearchSelect, boardSearchValue);
	    	  
	    	   
	    	    if (selectedTab === 'pledge') {
	    	        pledgeShow();
	    	    } else if (selectedTab === 'certification') {
	    	        certificationShow();
	    	    }
	    	});
	    
		
	</script>

	<script type="text/javascript">
	//상세보기 이동
	function goToFreeShareDetail(postNo) {
		location.href = "${contextPath}/board/community/detail/${postNo}" + postNo;
	}
	
</script>
</body>
</html>
