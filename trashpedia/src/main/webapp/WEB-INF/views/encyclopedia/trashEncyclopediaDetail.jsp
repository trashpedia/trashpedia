<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />	x
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dictonary Detailpage</title>
</head>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<!-- css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/encyclopedia/trashEncyclopediaDetail.css">
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="inner">

		
			<main>
				<div class="detail_wrap">
				<section class="trash_img_wrap">
					<img src="<c:url value='/resources/attachFile/image/${trash.changeName}'/>" class="content-img">
				</section>
				
				<section class="trash_info_wrap">

					<span id="category">소분류: ${trash.subCategoryName}</span>
					<span id="title">${trash.trashTitle}</span>

				</section>
				</div>
				<div class="trash_list_title">
					<h1>다른 쓰레기</h1>
				</div>
				<div class="detail_bottom_wrap">
					<section class="trash_list">
						<ul>
							<li style="background-image: url('your-image-url.jpg');"><a
								href="호잇.jpg">아이템 1</a></li>
							<li style="background-image: url('your-image-url.jpg');"><a
								href="link-to-detail-page.html">아이템 2</a></li>
							<li style="background-image: url('your-image-url.jpg');"><a
								href="link-to-detail-page.html">아이템 3</a></li>
							<li style="background-image: url('your-image-url.jpg');"><a
								href="link-to-detail-page.html">아이템 3</a></li>
							<li style="background-image: url('your-image-url.jpg');"><a
								href="link-to-detail-page.html">아이템 3</a></li>
							<li style="background-image: url('your-image-url.jpg');"><a
								href="link-to-detail-page.html">아이템 3</a></li>
							<!-- 추가 아이템 -->
						</ul>
					</section>
				</div>
			</main>
			
			
		</div>

	<jsp:include page="../common/footer.jsp" />

	<script>
    var swiper = new Swiper(".swiper-container", {
        spaceBetween: 10,
        centeredSlides: true,
        autoplay: {
            delay: 500,
            disableOnInteraction: false,
        },
        slidesPerView: 3,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },

        scrollbar: {
            el: '.swiper-scrollerbar',
        },
    });
    
    
    
    <!-- 페이지 전환-->
    
    function navigateToPrevious(trashNo) {
        var previousTrashNo = trashNo - 1;
        var previousUrl = "/trashDetail?trashNo=" + previousTrashNo;
        document.getElementById("previousButton").setAttribute("href", previousUrl);
    }
    
    function navigateToNext(trashNo) {
        var nextTrashNo = trashNo + 1;
        var nextUrl = "/trashDetail?trashNo=" + nextTrashNo;
        document.getElementById("nextButton").setAttribute("href", nextUrl);
    }
    
 // 이미지 요소 생성
    let imgElement = document.createElement('img');
    imgElement.src = "${contextPath}/resources/attachFile/image/${trash.changeName}";
    imgElement.className = 'content-img';
    
   
    </script>
</body>
</html>