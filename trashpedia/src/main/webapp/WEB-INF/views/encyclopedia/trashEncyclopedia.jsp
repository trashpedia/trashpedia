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
	href="resources/css/encyclopedia/trashEncyclopedia.css">
<body>
	<jsp:include page="../common/header.jsp" />

	<div class="practice-section">
		<p>쓰레기 백과사전</p>

		<p>Reduce Reuse Recycle Recovery</p>
	</div>
	<div class="inner">


		<main>
			<div class="elementor-widget-container">
				<div class="probox">
					<input class="search" type="text" placeholder="예)우산.형광등.프링글스통">
					<span class="material-symbols-outlined"> search</span>
				</div>

			</div>
			<div class="elementor-widget-container2">
				<img
					src="resources/image/main/trashEncyclopedia/Pngtree—trash can.png"
					alt="">
			</div>
			<!-- 드롭다운 -->
			<div class="dropdown-area">
				<div class="dropdown">
					<div class="main-categories">
						<div class="main-category" data-category="종이류">종이류</div>
						<div class="main-category" data-category="플라스틱류">플라스틱류</div>
						<div class="main-category" data-category="금속류">금속류</div>
					</div>
					<div class="subcategories"></div>
				</div>
			</div>
			<!-- 드롭다운 -->


			<!-- Swiper -->
			<!-- Swiper -->
			<div class="select">
				<div class="swiper-container">

					<div class="swiper-wrapper">
						<!-- List가 존재할 경우에만 반복문을 실행하고, 그렇지 않으면 슬라이드를 생성하지 않습니다. -->
						<!-- 비어있다면 -->
						<c:choose>
							<c:when test="${empty trashList}">
								<c:forEach begin="1" end="5" varStatus="loop">
									<div class="swiper-slide">
										<div class="Card">
											<!-- Front -->
											<div class="Front">
												<div class="Image">
													<img
														src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg"
														alt="이미지_대체_텍스트">
												</div>
											</div>
											<!-- Back -->
											<div class="Back">
												<img src="이미지_경로" alt="이미지_대체_텍스트"> <span>데이터
													없음</span>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:when>

							<c:otherwise>
								<c:forEach items="${trashList}" var="trash">
									<div class="swiper-slide">
										<div class="Card">
											<!-- Front -->
											<div class="Front">
												<div class="Image">
													<img src="이미지_경로" alt="이미지_대체_텍스트2">
												</div>
											</div>
											<!-- Back -->
											<div class="Back">
												<img src="이미지_경로" alt="이미지_대체_텍스트2"> <span>${trash.content}</span>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- <div class="swiper-button-next"></div> -->
					<!-- <div class="swiper-button-prev"></div> -->
					<div class="swiper-pagination"></div>

				</div>
			</div>
			<!-- Swiper -->

			<!-- Swiper -->


			<div class="today-popular-trash">
				<div class="Container">
					<div class="Title">오늘의 인기 쓰레기</div>
					<div class="card">
						<img src="resources/image/main/trashEncyclopedia/trash1.png"
							alt=""> 아파야
					</div>
					<div class="card">
						<img src="resources/image/main/trashEncyclopedia/trash2.png"
							alt=""> 사랑인
					</div>
					<div class="card">
						<img src="resources/image/main/trashEncyclopedia/trash3.png"
							alt=""> 거죠
					</div>
					<div class="card">
						<img src="resources/image/main/trashEncyclopedia/trash4.png"
							alt=""> 아프니까
					</div>
					<div class="card">
						<img src="resources/image/main/trashEncyclopedia/trash5.png"
							alt=""> 사랑인
					</div>
					<div class="card">
						<img src="resources/image/main/trashEncyclopedia/trash6.png"
							alt=""> 거겠죠
					</div>
					<div class="card">
						<img src="resources/image/main/trashEncyclopedia/trash7.png"
							alt=""> 이불
					</div>
					<div class="card">
						<img src="resources/image/main/trashEncyclopedia/trash8.png"
							alt=""> 그릇
					</div>
					<div class="card">
						<img src="resources/image/main/trashEncyclopedia/trash9.png"
							alt=""> 우산
					</div>
				</div>
				<img class="trash-can"
					src="resources/image/main/trashEncyclopedia/garbage can.png" alt="">
					<span>클릭!</span>
			</div>
		</main>
	</div>

	<jsp:include page="../common/footer.jsp" />

	<script>
        var swiper = new Swiper(".swiper-container", {
            loop: true, // 반복 재생 여부
            slidesPerView: 'auto', // 한 번에 보여줄 슬라이드 개수를 자동으로 조정합니다.
            slidesPerView: 5, // 한 번에 보여줄 슬라이드 개수
            spaceBetween: 20, // 슬라이드 사이 여백
            // centeredSlides: true, // 1번 슬라이드가 가운데 보이기

            autoplay: false,
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




        
        
        
        
        
        // 쓰레기통 요소를 클릭했을 때 애니메이션을 시작
        $('.trash-can').click(function () {
            setTimeout(startTrashAnimation, 600);
        });

        // 쓰레기통을 클릭했을 때 애니메이션을 시작하는 함수
        function startTrashAnimation() {
            var cards = document.querySelectorAll('.card');
            cards.forEach(function (card, index) {
                card.classList.add('animate-card' + (index + 1));
            });
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        document.addEventListener("DOMContentLoaded", function () {
            const mainCategories = document.querySelectorAll(".main-category");
            const subcategories = document.querySelector(".subcategories");

            mainCategories.forEach(function (mainCategory) {
                mainCategory.addEventListener("mouseover", function () {
                    const category = mainCategory.getAttribute("data-category");
                    const subcategoryItems = getSubcategoriesForCategory(category);
                    renderSubcategories(subcategoryItems);
                });
            });

            function renderSubcategories(subcategoryItems) {
                subcategories.innerHTML = "";
                subcategories.style.display = "block";
                subcategoryItems.forEach(function (subcategory) {
                    const subcategoryElement = document.createElement("div");
                    subcategoryElement.classList.add("subcategory");
                    subcategoryElement.textContent = subcategory;
                    subcategories.appendChild(subcategoryElement);
                });
            }

            function getSubcategoriesForCategory(category) {
                switch (category) {
                    case "종이류":
                        return ["신문", "책", "상자", "노트", "골판지"];
                    case "플라스틱류":
                        return ["페트병", "비닐봉지"];
                    case "금속류":
                        return ["알류미늄 캔", "철광석", "철제제품"];
                    default:
                        return [];
                }
            }
        });

        function sendMainCategoryToServer(mainCategory) {
            $.ajax({
                type: "POST",
                url: "/mainCategory",
                data: { mainCategory: mainCategory },
                success: function(response) {
                    console.log("서버 응답:", response);
                    // 서버로부터의 응답을 처리하는 코드를 작성합니다.
                },
                error: function(xhr, status, error) {
                    console.error("에러 발생:", error);
                }
            });
        }

        function sendSubCategoryToServer(subCategory) {
            $.ajax({
                type: "POST",
                url: "/subCategory",
                data: { subCategory: subCategory },
                success: function(response) {
                    console.log("서버 응답:", response);
                    // 서버로부터의 응답을 처리하는 코드를 작성합니다.
                },
                error: function(xhr, status, error) {
                    console.error("에러 발생:", error);
                }
            });
        }

        
        
    </script>
</body>
</html>