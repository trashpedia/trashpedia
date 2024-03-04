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
<title>FREESHARING</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>

<!-- css -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/board/freeShare/freeShare.css">
<link rel="stylesheet"
	href="${contextPath}resources/css/main/pledge.css">



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
	
	
<script type="text/javascript">
//상세보기 이동
function goToFreeShareDetail(postNo){
	location.href= "${contextPath}/board/detail/${postNo}"+postNo;
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
					<button class="btn">
						<!-- big==1 sub==4 -->
						<a
							href="${pageContext.request.contextPath}/write?bigCategoryNo=${bigCategoryNo}&subCategoryNo=${subCategoryNo}&type=1">글쓰기</a>
					</button>

					<!-- 3개의 리스트 -->

					<div class="List">
						<c:forEach var="post" items="${list}">
							<div class="Card" onclick="goToFreeShareDetail(${post.postNo})"  data-postNo="${post.postNo}">
								<!-- Front -->
								<div class="Front">
									<div class="Image">
										<img
											src="<c:url value='/resources/attachFile/image/${post.changeName}'/>">
									</div>
									
									<div class="TextContent">
										<div class="Subtitle">${post.title}</div>
										<div class="IconButtons">
											<div class="Icon">😃</div>
											<div class="Icon">👍</div>
											<div class="Icon">🔥</div>
										</div>
									</div>
								</div>
								<!-- Back -->
								<div class="Back" onclick="goToFreeShareDetail(${post.postNo})"  data-postNo="${post.postNo}">
									<img
										src="<c:url value='/resources/attachFile/image/${post.changeName}'/>"
										alt=""> <span class="clickDetail"  data-postNo="${post.postNo}">${post.content}</span>
								</div>
							</div>

						</c:forEach>
					</div>





					<!-- 3개의 리스트 -->


				</div>
			</div>




			<div class="PagingArea">
				<button class="pagingBtn" id="prevBtn"><</button>
				<button class="pagingBtn">1</button>
				<button class="pagingBtn">2</button>
				<button class="pagingBtn">3</button>
				<button class="pagingBtn">4</button>
				<button class="pagingBtn">5</button>
				<button class="pagingBtn" id="nextBtn">></button>
			</div>

			<div id="searchPlace">
				<input class="search" type="text" name="keyword" id="keyword" placeholder="검색어 입력">
				 <span
					class="material-symbols-outlined"> search</span>
			</div>
		</main>
	</div>

	<jsp:include page="../../common/footer.jsp" />



	<script>
    $(document).ready(function() {
        var currentPage = 1; // 현재 페이지 초기값
        var totalPages = ${totalPages}; // 전체 페이지 수
        var pageSize = 4; // 페이지당 보여줄 항목 수

        // 페이지를 초기화하는 함수
        function initializePage() {
            changePage(currentPage); // 초기 페이지 설정
        }

        // 페이지를 변경하는 함수
        function changePage(pageNumber) {
            // 페이지 번호를 변경할 때마다 trashList의 해당 페이지에 맞는 데이터를 요청하고 받아와서 페이지에 출력하는 작업을 수행해야 합니다.
            // 여기서는 예시 코드이므로 실제로 데이터를 요청하는 부분은 생략하고 페이지 번호만 변경하는 작업만 수행합니다.
            
            // 현재 페이지에 해당하는 데이터를 요청하는 Ajax 호출을 추가해야 합니다.
            // Ajax 호출을 통해 받아온 데이터를 사용하여 페이지에 표시하는 작업을 수행합니다.

            // 예시: trashList의 해당 페이지에 맞는 데이터를 요청하고 받아온다고 가정합니다.
            // 받아온 데이터를 사용하여 페이지에 표시하는 작업을 한다고 가정합니다.
            
            // 페이지 번호에 해당하는 데이터를 받아온 후에는 페이지에 출력하는 작업을 수행합니다.
            // 여기서는 받아온 데이터를 사용하여 페이지에 표시하는 코드를 추가합니다.
            
            // 여기서는 예시로 currentPage를 출력하는 것으로 대체합니다.
            console.log("현재 페이지: " + currentPage);
        }

        // 'prev' 버튼 클릭 시 이전 페이지로 이동하는 함수
        $('#prevBtn').click(function() {
            if (currentPage > 1) {
                currentPage--; // 현재 페이지를 1 감소
                changePage(currentPage); // 페이지 변경 함수 호출
            }
        });

        // 'next' 버튼 클릭 시 다음 페이지로 이동하는 함수
        $('#nextBtn').click(function() {
            if (currentPage < totalPages) {
                currentPage++; // 현재 페이지를 1 증가
                changePage(currentPage); // 페이지 변경 함수 호출
            }
        });

        // 페이지 번호를 클릭할 때 해당 페이지로 이동하는 이벤트 핸들러
        $('.pagingBtn').click(function() {
            var pageNumber = parseInt($(this).text()); // 클릭한 버튼의 페이지 번호 가져오기
            if (pageNumber !== currentPage) {
                currentPage = pageNumber; // 현재 페이지를 클릭한 페이지로 변경
                changePage(currentPage); // 페이지 변경 함수 호출
            }
        });

        // 페이지 초기화
        initializePage();
    });
    
    
    
	//상세보기 이동
	function goToFreeShareDetail(postNo){
    	location.href= "${contextPath}/board/detail/${postNo}"+postNo;
    }
	
	
	
	
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
	        type: 'GET',
	        url: '${contextPath}/board/searchByTitle',
	        data: { title: title },
	        success: function(response) {
	            var postNo = response.postNo; // 검색 결과로 받은 postNo
	            if (postNo) {
	                // 상세 페이지로 이동
	                goToFreeShareDetail(postNo);
	            } else {
	                console.log("해당하는 글이 없습니다.");
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error("에러 발생:", error);
	        }
	    });
	}


	</script>
</body>
</html>
