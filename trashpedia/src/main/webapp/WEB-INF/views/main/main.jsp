<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TRASHPEDIA</title>
</head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<!-- css -->
<link rel="stylesheet" href="resources/css/main/main.css">
<!-- slick 라이브러리 CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<!-- slick 라이브러리 테마 CSS (선택사항) -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<!-- slick 라이브러리 JS -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<body>
	<jsp:include page="../common/header.jsp"/>
	<main>
	<div class="backgroundImg">
		<!-- <img src="../main3.jpg" class="backgroundImg-img"> -->
		<div class="backgroundImg-black">
			<h2 class="scroll_on type_bottom">TRASHPEDIA</h2>
			<h4 class="scroll_on type_bottom">잘 버리는 일부터 시작하세요</h4>
			<h4 class="scroll_on type_bottom">모두를 위한 정보 플랫폼</h4>
			<!-- <h4> 누구나 쉽게 따라할 수 있는 친환경 라이프스타일을 전파합니다.</h4> -->
			<button id="scrollButton">
				<span class="material-symbols-outlined">arrow_downward</span>
			</button>
		</div>
		<!-- <img src="https://i.pinimg.com/736x/96/44/ba/9644bae369e627aef2bdd6ac4d621d65.jpg"> -->
		<!-- <img src="https://i.pinimg.com/564x/ed/fb/7c/edfb7c8f1d339e93605a0c50c0c8c6db.jpg"> -->
		<!-- <img src="https://www.10wallpaper.com/wallpaper/1366x768/1608/Green_leaves_macro-2016_High_Quality_Wallpaper_1366x768.jpg"> -->
	</div>
        <div class="recently-outer">
            <img src="https://theskinfood.com/design/skinfood/skinfood/images/dev/sub-slider-bg1.jpg">
            <div id="recently-garbage-slider" class="recently-garbage-outer"> 
                <p id="recently-garbage-outer-title"> 최근 업데이트된 <strong>쓰레기 게시글</strong> </p>
                 <!-- 밴드 이미지 -->
                <span class="slide-style-tape"></span> 
                <div class="recently-garbage-inner">
                    <div class="recently-garbage">
                        <div class="garbage-img-outer">
                            <img class="recently-garbage-img" src="https://blisgo.com/wp-content/uploads/elementor/thumbs/%EB%A7%A4%ED%8A%B8%EB%A6%AC%EC%8A%A4-p1z4xihromtb6umrxtb9tkawdj5anjg8a7kq5plx4w.jpg">
                        </div>
                        <a href="/WEB-INF/views/common/header.jsp">dddddd</a>
                        <p class="recently-garbage-title">매트리스</p>
                        <p class="recently-garbage-content">스프링, 메모리폼, 라텍스 등으로 이루어진 침대 매트리스는 분리 및 재활용이 불가능해요. 대형 생활 폐기물로 신고 배출해주세요.</p>
                    </div>
                    <div class="recently-garbage">
                        <div class="garbage-img-outer">
                            <img class="recently-garbage-img" src="https://blisgo.com/wp-content/uploads/elementor/thumbs/%E1%84%8A%E1%85%A1%E1%86%AF-%E1%84%87%E1%85%A1%E1%86%B8-qad46pf66xxu6kwhcbtq0696eqgc2m8a3en2ef5g5c.jpg">
                        </div>
                        <p class="recently-garbage-title">쌀</p>
                        <p class="recently-garbage-content">생쌀이나 취사된 밥은 모두 음식물 쓰레기로 버려요.</p>
                    </div>
                    <div class="recently-garbage">
                        <div class="garbage-img-outer">
                            <img class="recently-garbage-img" src="https://blisgo.com/wp-content/uploads/elementor/thumbs/%EB%85%B8%ED%8A%B8%EB%B6%81-p0rlb5fzdufcmaoxz90rc2u2wqxpthxyy1t0qrefb4.jpg">
                        </div>
                        <p class="recently-garbage-title">노트북</p>
                        <p class="recently-garbage-content">노트북을 포함해 5개 이상의 소형 가전제품을 한번에 배출시, 폐가전 무상방문수거 서비스 (→바로가기)를 이용할 수 있습니다.</p>
                    </div>
                    <div class="recently-garbage">
                        <div class="garbage-img-outer">
                            <img class="recently-garbage-img" src="https://blisgo.com/wp-content/uploads/elementor/thumbs/%EC%8B%A0%EB%B0%9C-owwcubdjbnkopoozfqyfu7p2l29z0lkqj8mz4aoqv4.jpg">
                        </div>
                        <p class="recently-garbage-title">신발</p>
                        <p class="recently-garbage-content">다른 사람이 신을 수 있는 상태면 가까운 의류수거함으로 배출해요.</p>
                    </div>
                    <div class="recently-garbage">
                        <div class="garbage-img-outer">
                            <img class="recently-garbage-img" src="https://blisgo.com/wp-content/uploads/elementor/thumbs/%EC%98%A8%EC%88%98%EB%A7%A4%ED%8A%B8-pfdcigccb3bo598lf7ayqdv3z72yxajl8h3v9nilfk.jpg">
                        </div>
                        <p class="recently-garbage-title">온수매트</p>
                        <p class="recently-garbage-content">온수매트는 복합재질로 구성되어 있어서 재활용이 불가능하고 보통 종량제봉투에 담을 수 없는 크기이므로 대형 생활 폐기물로 신고배출해야 합니다.</p>
                    </div>
                    <div class="recently-garbage">
                        <div class="garbage-img-outer">
                            <img class="recently-garbage-img" src="https://blisgo.com/wp-content/uploads/elementor/thumbs/%ED%98%84%EC%95%85%EA%B8%B0-pld3wkayd2dzf0pnc4l2qpkhcdkte4tg97wgr73g8w.jpg">
                        </div>
                        <p class="recently-garbage-title">현악기</p>
                        <p class="recently-garbage-content">기타, 바이올린 등 현악기는 주재질이 나무이기도 하고, 플라스틱, 구리 등의 합금 재질이 뒤섞인 물건이기 때문에 재활용이 불가능해요.</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- <button id="scrollButton"><span class="material-symbols-outlined">arrow_downward</span></button> -->
        <div class="content-outer">
            <p id="contentP1">환경을 위한 습관</p>
            <p id="contentP2">함께하는 자원순환의 첫 걸음</p>
            <p id="contentP3">Go Green with <span>TRESHPEDIA</span></p>
            <!-- <div class="content-tab">
                <ul class="temp-tab" aria-hidden="false">
                    <li><a href="#!" data-cont="thumb">유튜브 썸네일</a></li>
                    <li><a href="#!" data-cont="channel">유튜브 채널아트</a></li>
                    <li><a href="#!" data-cont="event">이벤트 . 홍보페이지</a></li>
                    <li><a href="#!" data-cont="webtoon">웹툰스타일</a></li>
                    <li><a href="#!" data-cont="banner">웹 배너</a></li>
                    <li><a href="#!" data-cont="banner-vertical">세로배너</a></li>
                    <li><a href="#!" data-cont="banner-mini">미니배너</a></li>
                </ul>
            </div> -->
        </div>
        <!-- 배경이미지 -->
        <img class="green-img" src="https://www.recycling-info.or.kr/act4r/images/main/main_2023/btmSection.jpg">
        <!-- 공지사항 / 실천서약 -->
        <div id="popularPost">
            <div id="popularPostBack"> 
                <section class="backSection"></section>
            </div>  
            <div class="posts-container">
                <!-- 왼쪽: 공지게시글-->
				<div id="noticePostsDiv">
					<span class="post-title">공지사항</span> <span class="more-btn"><a
						href="#">더보기</a></span>
					<div class="noticePostImg">
						<a href="#"> <img
							src="https://www.recycling-info.or.kr/act4r/cmm/image/view.do?id=agenfileupload_202310260443191071&ext=jpg">
						</a>
					</div>
				</div>
				<!-- 오른쪽: 인스타 게시글 리스트 -->
                <div id="instagramPostsDiv">
                    <span class="post-title">SNS 실천인증</span>
                    <span class="more-btn"><a href="#">더보기</a></span>
                    <div class="instagram-posts-list">
                        <div class="post-container">
                            <img src="https://t-cdn.taglive.net/photo/050192f7bb26a3e1dd7d34c6c4c7afa2/3297760710192953672_63251027837.jpg" alt="Instagram Image">
                            <span class="insta-logo">
                                <img class="snsimg" src="https://www.recycling-info.or.kr/act4r/taglive_img/instagram.png" social-name="instagram" alt="instagram">
                            </span>
                            <div class="post-overlay">
                                <p>
                                    아침 시간 짬 내어 들린 곳_ 가까운 곳에 이런 공간이 있음에 감사함을 🧡 
                                    아이들 책, 내 책 골라 담고_ 차 한잔 마시며 사색의 시간을 💚 
                                    오늘도 행복 가득 충전_ 아이들과 함께 이 마음 나누기 💛 
                                    🌱 아이들이 자라는 곳 🌱 🌳책나무_해운대좌동점🌳
                                </p>
                            </div>
                        </div>
                        <div class="post-container">
                            <img src="https://t-cdn.taglive.net/photo/050192f7bb26a3e1dd7d34c6c4c7afa2/3298804392930982370_61814787753.jpg" alt="Instagram Image">
                            <span class="insta-logo">
                                <img class="snsimg" src="https://www.recycling-info.or.kr/act4r/taglive_img/instagram.png" social-name="instagram" alt="instagram">
                            </span>
                            <div class="post-overlay">
                                <p>
                                    반려동물 키우는 친구에게 공유❤️ 
                                    환경까지 생각한 병뚜껑 키링과 함께 귀여운 내 반려동물 사진을 평생 볼 수 있다구요🥰 
                                    병뚜껑 키링은 반려동물의 털 색과 비슷하게 제작됩니다! (원하시는 색깔로 조합) 
                                    하루 사진 촬영한다고 하니까 급하게 펌핑한다고 운동하네요 ㅋㅋㅋ 아 나도 운동해야하는데..ㅎ 
                                    #고양이키링 #업사이클링 #업사이클링키링 #키링 #키링추천 #반려동물키링
                                </p>
                            </div>
                        </div>
                        <div class="post-container">
                            <img src="https://t-cdn.taglive.net/photo/050192f7bb26a3e1dd7d34c6c4c7afa2/3298683826808403425_2225123815.jpg" alt="Instagram Image">
                            <span class="insta-logo">
                                <img class="snsimg" src="https://www.recycling-info.or.kr/act4r/taglive_img/instagram.png" social-name="instagram" alt="instagram">
                            </span>
                            <div class="post-overlay">
                                <p>
                                    [광명업사이클아트센터와 친환경 설 보내기] 
                                    설 연휴 첫날인 오늘도 광명업사이클아트센터에 많은 관람객분들이 찾아주셨어요. 
                                    입장하자마자 뚱땅뚱땅 업사이클 악기에 홀린 아이들과 전시장의 할머니 솜이불 작품을 보며 고향을 떠올리는 엄마 아빠의 모습을 볼 수 있었어요. 
                                    항상 광명업사이클아트센터를 지켜봐 주시는 인친 여러분들에게 친환경 설 보내는 방법을 공유드릴게요.
                                </p>
                            </div>
                        </div>
                        <div class="post-container">
                            <img src="https://t-cdn.taglive.net/photo/050192f7bb26a3e1dd7d34c6c4c7afa2/3297960836188181445_4232363173.jpg" alt="Instagram Image">
                            <span class="insta-logo">
                                <img class="snsimg" src="https://www.recycling-info.or.kr/act4r/taglive_img/instagram.png" social-name="instagram" alt="instagram">
                            </span>
                            <div class="post-overlay">
                                <p>
                                    Q. 브리타 필터는 어떻게 재활용 되나요?
                                    A. 이온교환수지, 초정밀입상활성탄 ▶️ 산업수 처리시설
                                    본체(P.P), 그물망 ▶️ 세척과 원료화 작업을 거쳐 재활용됩니다!!</p>
                            </div>
                        </div>
                        <div class="post-container">
                            <img src="https://t-cdn.taglive.net/photo/050192f7bb26a3e1dd7d34c6c4c7afa2/3298016368311745260_56235218013.jpg" alt="Instagram Image">
                            <span class="insta-logo">
                                <img class="snsimg" src="https://www.recycling-info.or.kr/act4r/taglive_img/instagram.png" social-name="instagram" alt="instagram">
                            </span>
                            <div class="post-overlay">
                                <p>
                                    🌍금손 중학생의 작품🌍 가게에 모인 종이캐리어와 컵홀더가 들어오는 것 대비 순환이 안 되어서 고민이던 차에 가져가시겠다고 하셨어요! 
                                    흔쾌히 드렸는데 이렇게 DM을 받았습니다😭 캐리어로 종량제봉투 정리는 물론 신발정리, 다용도 정리함까지! 
                                    그리고 컵홀더로는 고양이 놀이터도 만들어줬어요 금손인 그녀🧡
                                </p>
                            </div>
                        </div>
                        <div class="post-container">
                            <img src="https://via.placeholder.com/200" alt="Instagram Image">
                            <span class="insta-logo">
                                <img class="snsimg" src="https://www.recycling-info.or.kr/act4r/taglive_img/instagram.png" social-name="instagram" alt="instagram">
                            </span>
                            <div class="post-overlay">
                                <p>게시글 내용</p>
                            </div>
                        </div>
                        <div class="post-container">
                            <img src="https://t-cdn.taglive.net/photo/050192f7bb26a3e1dd7d34c6c4c7afa2/3298804392930982370_61814787753.jpg" alt="Instagram Image">
                            <span class="insta-logo">
                                <img class="snsimg" src="https://www.recycling-info.or.kr/act4r/taglive_img/instagram.png" social-name="instagram" alt="instagram">
                            </span>
                            <div class="post-overlay">
                                <p>
                                    반려동물 키우는 친구에게 공유❤️ 
                                    환경까지 생각한 병뚜껑 키링과 함께 귀여운 내 반려동물 사진을 평생 볼 수 있다구요🥰 
                                    병뚜껑 키링은 반려동물의 털 색과 비슷하게 제작됩니다! (원하시는 색깔로 조합) 
                                    하루 사진 촬영한다고 하니까 급하게 펌핑한다고 운동하네요 ㅋㅋㅋ 아 나도 운동해야하는데..ㅎ 
                                    #고양이키링 #업사이클링 #업사이클링키링 #키링 #키링추천 #반려동물키링
                                </p>
                            </div>
                        </div>
                        <div class="post-container">
                            <img src="https://t-cdn.taglive.net/photo/050192f7bb26a3e1dd7d34c6c4c7afa2/3298683826808403425_2225123815.jpg" alt="Instagram Image">
                            <span class="insta-logo">
                                <img class="snsimg" src="https://www.recycling-info.or.kr/act4r/taglive_img/instagram.png" social-name="instagram" alt="instagram">
                            </span>
                            <div class="post-overlay">
                                <p>
                                    [광명업사이클아트센터와 친환경 설 보내기] 
                                    설 연휴 첫날인 오늘도 광명업사이클아트센터에 많은 관람객분들이 찾아주셨어요. 
                                    입장하자마자 뚱땅뚱땅 업사이클 악기에 홀린 아이들과 전시장의 할머니 솜이불 작품을 보며 고향을 떠올리는 엄마 아빠의 모습을 볼 수 있었어요. 
                                    항상 광명업사이클아트센터를 지켜봐 주시는 인친 여러분들에게 친환경 설 보내는 방법을 공유드릴게요.
                                </p>
                            </div>
                        </div>
                        <div class="post-container">
                            <img src="https://t-cdn.taglive.net/photo/050192f7bb26a3e1dd7d34c6c4c7afa2/3297960836188181445_4232363173.jpg" alt="Instagram Image">
                            <span class="insta-logo">
                                <img class="snsimg" src="https://www.recycling-info.or.kr/act4r/taglive_img/instagram.png" social-name="instagram" alt="instagram">
                            </span>
                            <div class="post-overlay">
                                <p>
                                    Q. 브리타 필터는 어떻게 재활용 되나요?
                                    A. 이온교환수지, 초정밀입상활성탄 ▶️ 산업수 처리시설
                                    본체(P.P), 그물망 ▶️ 세척과 원료화 작업을 거쳐 재활용됩니다!!</p>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </main>
    <jsp:include page="../common/footer.jsp"/>
    <script>
        // 최근 업데이트 된 쓰레기 슬라이드
        $(document).ready(function(){
	        $('#recently-garbage-slider .recently-garbage-inner').slick({
	            slidesToShow: 4,
	            slidesToScroll: 1,
	            autoplay: true,
	            autoplaySpeed: 2000, // 2초마다 슬라이드 전환
	            arrows : true,
	            dots: true,
	            prevArrow: '<div class="custom-prev"></div>',
	            nextArrow: '<div class="custom-next"></div>'
	            // prevArrow: '<button type="button" class="slick-prev">&#9665;</button>',
	            // nextArrow: '<button type="button" class="slick-next">&#9655;</button>'
	        });
        });
        // 스크롤 버튼 클릭 시  body를 1005px 아래로 스크롤
        $(document).ready(function() {
            $("#scrollButton").click(function() {
                $("body, html").animate({ 
                    scrollTop: 1005 
                }, 1000); 
            });
        });
        // color: #6eb76e;
        // 스크롤 변화에 따른 header 스타일 변경
        window.addEventListener('scroll', function() {
            var header = document.querySelector('.header');
            var headerLinks = document.querySelectorAll('.header-nav ul li a');
            var headerRightLink = document.querySelectorAll('.header-right li a, .header-right li span');

            if (window.scrollY > 100) {
                header.classList.add('header-scroll');
                headerLinks.forEach(function(link) {
                    link.style.color = 'black'; 
                    link.style.fontWeight = '650';
                });
                headerRightLink.forEach(function(link) {
                    link.style.color = 'rgb(88, 88, 88)'; 
                    link.style.fontWeight = '650';
                });

            } else {
                header.classList.remove('header-scroll');
                headerLinks.forEach(function(link) {
                    link.style.color = '';
                });
                headerRightLink.forEach(function(link) {
                    link.style.color = '';
                });
            }
        });
        // 스크롤
        $(document).ready(function() {
            // 클래스가 "scroll_on"인 모든 요소를 선택합니다.
            const $counters = $(".scroll_on");
            // 노출 비율(%)과 애니메이션 반복 여부(true/false)를 설정합니다.
            const exposurePercentage = 100; // ex) 스크롤 했을 때 $counters 컨텐츠가 화면에 100% 노출되면 숫자가 올라갑니다.
            const loop = true; // 애니메이션 반복 여부를 설정합니다. (true로 설정할 경우, 요소가 화면에서 사라질 때 다시 숨겨집니다.)
            // 윈도우의 스크롤 이벤트를 모니터링합니다.
            $(window).on('scroll', function() {
                // 각 "scroll_on" 클래스를 가진 요소에 대해 반복합니다.
                $counters.each(function() {
                    const $el = $(this);
                    // 요소의 위치 정보를 가져옵니다.
                    const rect = $el[0].getBoundingClientRect();
                    const winHeight = window.innerHeight; // 현재 브라우저 창의 높이
                    const contentHeight = rect.bottom - rect.top; // 요소의 높이
                    // 요소가 화면에 특정 비율만큼 노출될 때 처리합니다.
                    if (rect.top <= winHeight - (contentHeight * exposurePercentage / 100) && rect.bottom >= (contentHeight * exposurePercentage / 100)) {
                        $el.addClass('active');
                    }
                    // 요소가 화면에서 완전히 사라졌을 때 처리합니다.
                    if (loop && (rect.bottom <= 0 || rect.top >= window.innerHeight)) {
                        $el.removeClass('active');
                    }
                });
            }).scroll();
        });
        // document.addEventListener("DOMContentLoaded", function () {
        //     var contentP1 = document.getElementById("contentP1");
        //     var contentP2 = document.getElementById("contentP2");
        //     var contentP3 = document.getElementById("contentP3");

        //     // 특정 스크롤 위치
        //     var targetScrollPosition = 1000;

        //     window.addEventListener("scroll", function () {
        //         var scrollPosition = window.scrollY;

        //         // 특정 스크롤 위치에 도달하면 클래스 추가하여 나타나게 함
        //         if (scrollPosition >= targetScrollPosition) {
        //             contentP1.classList.add("show");
        //             contentP2.classList.add("show");
        //             contentP3.classList.add("show");
        //         } else {
        //             // 도달하지 않았으면 클래스 제거하여 사라지게 함
        //             contentP1.classList.remove("show");
        //             contentP2.classList.remove("show");
        //             contentP3.classList.remove("show");
        //         }
        //     });
        // });


        // document.addEventListener("DOMContentLoaded", function() {
        //     var img = document.querySelector('.backgroundImg-img');
        //     var currentScale = 1.0;  // 초기 스케일 값
        //     var targetScale = 1.15;   // 목표 스케일 값
        //     var scaleIncrement = 0.002;  // 스케일 증가량
        //     var intervalTime = 60;  // 갱신 간격 (밀리초)

        //     var scaleInterval = setInterval(function() {
        //         currentScale += scaleIncrement;
        //         img.style.transform = 'scale(' + currentScale + ')';

        //         if (currentScale >= targetScale) {
        //             clearInterval(scaleInterval);  // 목표 스케일에 도달하면 간격을 멈춤
        //         }
        //     }, intervalTime);
        // });
    </script>
</body>
</html>