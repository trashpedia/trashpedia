<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>커뮤니티</title>
<link rel="stylesheet"
	href="${contextPath}/resources/css/board/boardMain.css">
</head>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<!-- css -->
<link rel="stylesheet" href="css/mainPage.css">


<!-- slick 라이브러리 CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<!-- slick 라이브러리 테마 CSS (선택사항) -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<!-- slick 라이브러리 JS -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<body>

	<jsp:include page="../common/header.jsp" />

	<main class="community_html">

		<div id="container">

			<div class="practice-section">
				<p>커뮤니티</p>
				<p>Reduce Reuse Recycle Recovery</p>
			</div>

			<section id="idx_board_wrap">
				<div>

					<!-- 공지사항 섹션 -->
					<c:forEach var="sc" items="${sc}">
						<c:if test="${sc.bigCategoryNo == 1}">
						
							<div class="idx_board">
							
								<div class="title">
									<a href="${contextPath}/boardList?subCategoryNo=${sc.subCategoryNo}&filter=createDate&searchSelect=&searchValue=&page=0">
										${sc.subCategoryName} </a>
								</div>
								
								<div class="list">
									<ul>
										<c:forEach var="p" items="${post}">
<%-- 											<c:if test="${p.subCategoryNo == sc.subCategoryNo}"> --%>
												<li>
													<a href="${contextPath}/boardNotice/${p.postNo}">${p.title}</a>
													<span>${p.createDate}</span>
												</li>
<%-- 											</c:if> --%>
										</c:forEach>
									</ul>
								</div>
								
							</div>
							
						</c:if>
					</c:forEach>


					<!-- 					일반게시판 섹션 -->
					<!-- 					<div class="idx_board"> -->
					<!-- 						<div class="title"> -->
					<%-- 							<a href="${contextPath}/boardNotice?bigCategoryNo=1&subCategoryNo=2" class="name">일반게시판</a>  --%>
					<!-- 						</div> -->
					<!-- 						<div class="list"> -->
					<!-- 							<ul> -->
					<%-- 								<c:forEach var="p" items="${post}"> --%>
					<!-- 									<li><a -->
					<%-- 										href="${contextPath}/boardNotice/${p.postNo}">${p.title}</a> --%>
					<%-- 										<span>${p.createDate}</span></li> --%>
					<%-- 								</c:forEach> --%>
					<!-- 							</ul> -->
					<!-- 						</div> -->
					<!-- 					</div> -->

					<!-- 					무료나눔게시판 섹션 -->
					<!-- 					<div class="idx_board"> -->
					<!-- 						<div class="title"> -->
					<%-- 							<a href="${contextPath}/boardNotice?bigCategoryNo=1&subCategoryNo=4" class="name">무료나눔게시판</a>  --%>
					<!-- 						</div> -->
					<!-- 						<div class="list"> -->
					<!-- 							<ul> -->
					<%-- 								<c:forEach var="freePost" items="${freeList}"> --%>
					<!-- 									<li><a -->
					<%-- 										href="${contextPath}/boardNotice/${freePost.postNo}">${freePost.title}</a> --%>
					<%-- 										<span>${freePost.date}</span></li> --%>
					<%-- 								</c:forEach> --%>
					<!-- 							</ul> -->
					<!-- 						</div> -->
					<!-- 					</div> -->

					<!-- 					건의게시판 섹션 -->
					<!-- 					<div class="idx_board"> -->
					<!-- 						<div class="title"> -->
					<%-- 							<a href="${contextPath}/boardNotice?bigCategory=1&subCategory=3" class="name">건의게시판</a> --%>

					<!-- 						</div> -->
					<!-- 						<div class="list"> -->
					<!-- 							<ul> -->
					<%-- 								<c:forEach var="suggestion" items="${suggestionList}"> --%>
					<!-- 									<li><a -->
					<%-- 										href="${contextPath}/board/suggestion/detail/${post.postNo}">${post.title}</a> --%>
					<%-- 										<span>${post.date}</span></li> --%>
					<%-- 								</c:forEach> --%>
					<!-- 							</ul> -->
					<!-- 						</div> -->
					<!-- 					</div> -->
					<!-- 				</div> -->
			</section>


		</div>
	</main>

	<jsp:include page="../common/footer.jsp" />



	<script>
            document.addEventListener('DOMContentLoaded', function() {
                // 모든 .idx_board .list를 선택
                var lists = document.querySelectorAll('.idx_board .list ul');
            
                // 각 리스트에 대하여 실행
                lists.forEach(function(list) {
                    // 리스트 내의 모든 항목(li)을 선택
                    var items = list.querySelectorAll('li');
                    
                    // 6개를 초과하는 항목들을 숨김
                    if (items.length > 6) {
                        for (var i = 6; i < items.length; i++) {
                            items[i].style.display = 'none';
                        }
                    }
                });
            });
            </script>

</body>
</html>