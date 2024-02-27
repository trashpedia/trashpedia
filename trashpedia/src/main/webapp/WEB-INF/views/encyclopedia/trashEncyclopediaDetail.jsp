<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet" href="resources/css/trashEncyclopedia.css">
<body>
	<jsp:include page="../common/header.jsp" />

	<div class="practice-section">
		<p>쓰레기 백과사전</p>
		<p>Reduce Reuse Recycle Recovery</p>
	</div>
	<div class="inner">

		<main>

			<div class="Content">
				<div class="Container">
					<div class="Title">
						<!-- 무료 나눔 게시판 -->
					</div>
				</div>
			</div>

			<div class="Section1">
				<div class="ImageContainer">
					<div class="Image">
						<img src="${imageUrl}" alt="Image">
					</div>
				</div>

				<div class="Container">
					<div class="Title">${trashTitle}</div>
					<div class="Description">${trashContent}</div>
				</div>
			</div>

			<div class="btnGroup">
				<button class="btn">좋아요 ♥</button>
				<!-- <button class="btn">
                    나눔받기?
                </button> -->

			</div>





			<!-- <div class="Section3"> -->


			<!-- </div> -->


			<div class="Section2">
				<div class="Container">
					<div class="Title">다른 무료 나눔</div>
					<div class="List">
						<c:forEach begin="1" end="5" var="index">
							<div class="Card">
								<!-- Front -->
								<div class="Front">
									<div class="Image">
										<img
											src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg"
											alt="">
										<div class="Tag">
											<div class="Text">New</div>
										</div>
									</div>
									<div class="TextContent">
										<div class="Title">지역</div>
										<div class="Subtitle">상품명</div>
										<div class="IconButtons">
											<div class="Icon">😃</div>
											<div class="Icon">👍</div>
											<div class="Icon">🔥</div>
										</div>
									</div>
								</div>
								<!-- Back -->
								<div class="Back">
									<img
										src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg"
										alt=""> <span>헌법재판소는 법관의 자격을 가진 9인의 재판관으로 구성하며,
										재판관은 대통령이 임명한다. 국민의 모든 자유와 권리는 국가안전보장·질서유지 또는 공공복리를 위하여 필요한
										경우에 한하여 법률로써 제한할 수 ... 국가는 전통문화의 계승·발전과 민족문화의 창달에 노력하여야 한다.
										헌법재판소 재판관은 정당에 가입하거나 정치에 관여할 수 없다. 모든 국민은 보건에 관하여 국가의 보호를
										받는다....</span>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>



			<!-- 버튼 -->

			<div class="btnGroup2">
				<button class="btn" id="previousButton" onclick="navigateToPrevious(trashNo)">이전글</button>
				<button class="btn" id="nextButton" onclick="navigateToNext(trashNo)">다음글</button>
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
    </script>
</body>
</html>