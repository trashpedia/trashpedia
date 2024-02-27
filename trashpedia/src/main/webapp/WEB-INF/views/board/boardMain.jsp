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
<link rel="stylesheet" href="../css/community/boardMain.css">
<link rel="stylesheet"
	href="/src/main/webapp/resources/css/board/boardMain.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/board/boardMain.css">

</head>
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
					<div class="idx_board">
						<div class="title">
							<a href="${contextPath}/boardNotice?bigCategoryNo=1&subCategoryNo=1" class="name">공지사항</a> 
						</div>
						<div class="list">
							<ul>
								<c:forEach var="notice" items="${boardList}">
									<li><a
										href="${contextPath}/boardNotice/${boardList.postNo}">${boardList.title}</a>
										<span>${boardList.date}</span></li>
								</c:forEach>
							</ul>
						</div>
					</div>
					
					<!-- 일반게시판 섹션 -->
					<div class="idx_board">
						<div class="title">
							<a href="${contextPath}/boardNotice" class="name">일반게시판</a> <a
								href="#" class="more"><img src="${contextPath}/img/more.png"
								alt="더 보기"></a>
						</div>
						<div class="list">
							<ul>
								<c:forEach var="post" items="${generalList}">
									<li><a
										href="${contextPath}/boardNotice/${post.postNo}">${post.title}</a>
										<span>${post.date}</span></li>
								</c:forEach>
							</ul>
						</div>
					</div>

					<!-- 무료나눔게시판 섹션 -->
					<div class="idx_board">
						<div class="title">
							<a href="${contextPath}/boardFreeShare" class="name">무료나눔게시판</a> <a
								href="#" class="more"><img src="${contextPath}/img/more.png"
								alt="더 보기"></a>
						</div>
						<div class="list">
							<ul>
								<c:forEach var="freePost" items="${freeList}">
									<li><a
										href="${contextPath}/boardNotice/${freePost.postNo}">${freePost.title}</a>
										<span>${freePost.date}</span></li>
								</c:forEach>
							</ul>
						</div>
					</div>

					<!-- 건의게시판 섹션 -->
					<div class="idx_board">
						<div class="title">
							<a href="${contextPath}/boardNotice" class="name">건의게시판</a>
							<a href="#" class="more"><img
								src="${contextPath}/img/more.png" alt="더 보기"></a>
						</div>
						<div class="list">
							<ul>
								<c:forEach var="suggestion" items="${suggestionList}">
									<li><a
										href="${contextPath}/board/suggestion/detail/${suggestion.postNo}">${suggestion.title}</a>
										<span>${suggestion.date}</span></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
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