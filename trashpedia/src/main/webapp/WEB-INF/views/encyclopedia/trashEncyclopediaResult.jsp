<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dictonary</title>
</head>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<!--Swiper-->
<link rel="stylesheet"
	href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
<!-- GoogleFonts -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- css -->
<link rel="stylesheet" href="${contextPath}/resources/css/encyclopedia/trashEncyclopediaResult.css">

<!-- slick 라이브러리 CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<!-- slick 라이브러리 테마 CSS (선택사항) -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<!-- slick 라이브러리 JS -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>

<body>
	<jsp:include page="../common/header.jsp" />
	<main>
	<div class="outer">
		<div class="contentBox">
			<div class="content">
				<c:forEach var="big" items="${bigCategory}">
					<div>${big.bigCategoryName}</div>
					<c:forEach var="sub" items="${subCategory}">
						<c:if test="${big.bigCategoryNo == sub.bigCategoryNo}">
							<div>${sub.subCategoryName}</div>
							<c:forEach var="trash" items="${trash}">
								<c:if test="${sub.subCategoryNo == trash.subCategoryNo}">
									<div class="imgArea" >
									<img src="<c:url value='/resources/attachFile/image/${trash.changeName}'/>" class="content-img">
									</div>
									
									<div class="trashInfo">
										<div id="trashNo"><h4>${trash.trashNo}<h4></div>
										<div id="trashTitle"><h2>${trash.trashTitle}<h2></div>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
					</c:forEach>
				</c:forEach> 
			</div>
		</div>
	</div> 
	</main>
	
	<button id="scrollUpButton">
		<span class="material-symbols-outlined">arrow_upward</span>
	</button>
	
	<jsp:include page="../common/footer.jsp" />

	<script>
		
	    $(document).ready(function() {
	        // 스크롤 다운 버튼 
	        $("#scrollDownButton").click(function() {
	            $("body, html").animate({ 
	                scrollTop: 1160 
	            }, 1100); 
	        });
	        
	        // 상단 이동 버튼
	        var scrollUpButton = $('#scrollUpButton');

	        $(window).scroll(function() {
	            if ($(this).scrollTop() > 300) {
	                scrollUpButton.show();
	            } else {
	                scrollUpButton.hide();
	            }
	        });
	        
	        scrollUpButton.click(function(){
	        	$('html,body').animate({scrollTop:0},500);
	        	return false;
	        });
	        
	    });

	 

	    //상세페이지로 이동
	    function trashDetail(trashPostNo) {
	    	console.log("상세페이지"+trashPostNo);
	     	location.href = "${contextPath}/trash/trashDetail/" + trashPostNo;
	    }
	    
	
	</script>
</body>
</html>






