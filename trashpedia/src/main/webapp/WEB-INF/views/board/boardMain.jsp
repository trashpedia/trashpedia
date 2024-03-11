<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<c:url var="currentUrl" value="/trashpedia/pledge/list">
    <c:param name="subCategoryNo" value="${currentSubCategoryNo}" />
    <c:param name="bigCategoryNo" value="${currentBigCategoryNo}" />
</c:url>
<c:set var="subCategoryNo" value="${param.subCategoryNo}" />
<c:set var="bigCategoryNo" value="${param.bigCategoryNo}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>커뮤니티</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${contextPath}/resources/css/board/boardMain.css">
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
					<c:forEach var="sc" items="${sc}">
						<c:if test="${sc.bigCategoryNo == 1}">
							<div class="idx_board">
								<div class="title">
									<a href="${contextPath}/board/list?subCategoryNo=${sc.subCategoryNo}&filter=createDate&searchSelect=&searchValue=&page=0"> ${sc.subCategoryName} </a>
								</div>
								<div class="list">
									<ul>
										<c:forEach var="b" items="${board}">
											<c:if test="${b.subCategoryNo == sc.subCategoryNo}">
												<li>
													<a href="${contextPath}/board/detail/${b.boardNo}">${b.title}</a>
													<span>${b.createDate}</span>
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</section>
		</div>
	</main>
	<jsp:include page="../common/footer.jsp" />
	<script>
		document.addEventListener('DOMContentLoaded', function() {
		    var lists = document.querySelectorAll('.idx_board .list ul');
		
		    lists.forEach(function(list) {
		        var items = list.querySelectorAll('li');
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