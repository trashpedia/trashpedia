<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dictonary</title>
</head>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<!--Swiper-->
<link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
<!-- GoogleFonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- css -->
<link rel="stylesheet" href="${contextPath}/resources/css/encyclopedia/trashEncyclopedia.css">

<!-- slick 라이브러리 CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<!-- slick 라이브러리 테마 CSS (선택사항) -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<!-- slick 라이브러리 JS -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>

<body>
	<jsp:include page="../common/header.jsp" />
	<main>
		<ul class="tabs">
			<li class="tab" id="activityTab">일반쓰레기</li>
			<li class="tab" id="alarmTab">음식물쓰레기</li>
			<li class="tab" id="memberInfoTab">대형폐기물</li>
		</ul>
		<div class="ency-background">
			<div class="ency-background-black">
				<div class="encyLogo">
					<p>쓰레기 백과사전</p>
				</div>
		
				<div class="encyContent1">
					<div class="ency-search-area">
						<input type="search" class="search-input" placeholder="검색어를 입력하세요"
							autocomplete="off">
						<button type="submit" class="search-button" aria-label="Search">search</button>
					</div>
				</div>
			</div>
		</div>

    		<div class="recently-outer showEvent">
    			<div id="recently-garbage-slider" class="recently-garbage-outer">
    			
    			<p id="recently-garbage-outer-title">
					최근 업데이트된 <strong>쓰레기</strong>
				</p>
			
								
				<%-- <c:forEach var="post" items="${trashlist}">
						<div class="img-area" onclick ="pledgeDetail(${post.trashPostNo})">
						 	<input type="text" value="${post.trashTitle}">
						 	<input type="text" value="${post.trashContent}">
						 	<input type="text" value="${post.createDate}">
                       	</div>
                       	</c:forEach> --%>
                   	
				
				<!-- 최근 업데이트된 쓰레기 시작 -->
				<div class="recently-garbage-inner">
				
					<c:forEach var="post" items="${trashList}">
						<div class="recently-garbage">
							<div class="garbage-img-outer">
								<img class="recently-garbage-img"
										src="https://blisgo.com/wp-content/uploads/elementor/thumbs/%EB%A7%A4%ED%8A%B8%EB%A6%AC%EC%8A%A4-p1z4xihromtb6umrxtb9tkawdj5anjg8a7kq5plx4w.jpg"
										onclick="trashDetail(${post.trashPostNo})">
							</div>
								<p class="recently-garbage-title">${post.trashTitle}</p>
								<p class="recently-garbage-content">${post.trashContent}</p>
						</div>
					</c:forEach>
					
					
<!-- 					<div class="recently-garbage"> -->
<!-- 						<div class="garbage-img-outer"> -->
<!-- 							<img class="recently-garbage-img" -->
<!-- 								src="https://blisgo.com/wp-content/uploads/elementor/thumbs/%EB%A7%A4%ED%8A%B8%EB%A6%AC%EC%8A%A4-p1z4xihromtb6umrxtb9tkawdj5anjg8a7kq5plx4w.jpg"> -->
<!-- 						</div> -->
<!-- 						<p class="recently-garbage-title">매트리스</p> -->
<!-- 						<p class="recently-garbage-content">스프링, 메모리폼, 라텍스 등으로 이루어진 침대 -->
<!-- 							매트리스는 분리 및 재활용이 불가능해요. 대형 생활 폐기물로 신고 배출해주세요.</p> -->
<!-- 					</div> -->
<!-- 				</div> -->
    		</div>
    			<div class="space"></div>
    			
    			<div id="recently-garbage-slider" class="popular-garbage-outer">
    			
    			<p id="recently-garbage-outer-title">
					인기 <strong>쓰레기</strong>
				</p>
				
				<div class="recently-garbage-inner">
					
					<div class="recently-garbage">
						<div class="garbage-img-outer">
							<img class="recently-garbage-img"
								src="https://blisgo.com/wp-content/uploads/elementor/thumbs/%EB%A7%A4%ED%8A%B8%EB%A6%AC%EC%8A%A4-p1z4xihromtb6umrxtb9tkawdj5anjg8a7kq5plx4w.jpg">
						</div>
						<p class="recently-garbage-title">매트리스</p>
						<p class="recently-garbage-content">스프링, 메모리폼, 라텍스 등으로 이루어진 침대
							매트리스는 분리 및 재활용이 불가능해요. 대형 생활 폐기물로 신고 배출해주세요.</p>
					</div>
				</div>
    			
    			
    			</div>
    		</div>
    			
    	</div>

    </main>
        <button id="scrollUpButton">
		<span class="material-symbols-outlined">arrow_upward</span>
	</button>
    

	
	<jsp:include page="../common/footer.jsp" />

		<script>
		let observer = new IntersectionObserver((entries) => {
		  entries.forEach((entry) => {
		    if (entry.isIntersecting) { // 화면에 나타날 때
		      $(entry.target).css({
		        opacity: 1,
		        transform: 'translate(0, -60px)'
		      });
		    } else { // 화면에 나타나지 않을 때
		      $(entry.target).css({
		        opacity: 0,
		        transform: 'none' // 기존의 트랜스폼 효과 제거
		      });
		    }
		  });
		});
	
		$('.showEvent').each(function() {
		  observer.observe(this);
		});
	    
		// 슬라이드
	    $(document).ready(function(){
	    		//최근 업데이트 된 쓰레기
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
	    		

		//정보자료글
	            $('#information-content-slider').slick({
	                slidesToShow: 1,
	                slidesToScroll: 1,
	                autoplay: true,
	                autoplaySpeed: 3000, // 2초마다 슬라이드 전환
	                arrows : true,
	                dots: true,
	                prevArrow: '<div class="custom-prev"></div>',
	                nextArrow: '<div class="custom-next"></div>'
	            });
	    	});
		
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
	    
	 // 스크롤 변화에 따른 header 스타일 변경
		$(window).scroll(function() {
		  var header = $('.header');
		  var headerLinks = $('.header-nav ul li a');
		  var headerRightLink = $('.header-right li a, .header-right li span');
		
		  if ($(window).scrollTop() > 100) {
		    header.addClass('header-scroll');
		    headerLinks.css({
		      color: 'black',
		      fontWeight: '650'
		    });
		    headerRightLink.css({
		      color: 'rgb(88, 88, 88)',
		      fontWeight: '650'
		    });
		  } else {
		    header.removeClass('header-scroll');
		    headerLinks.css({
		      color: '',
		      fontWeight: ''
		    });
		    headerRightLink.css({
		      color: '',
		      fontWeight: ''
		    });
		  }
		});
	 
		// 메인 이미지 스크롤 효과
	    $(document).ready(function() {
	        const $counters = $(".scroll_on");
	        const exposurePercentage = 100; // ex) 스크롤 했을 때 $counters 컨텐츠가 화면에 100% 노출되면 숫자가 올라감
	        const loop = true; // 애니메이션 반복 여부설정 (true로 설정할 경우, 요소가 화면에서 사라질 때 다시 숨겨짐)
	
	        // 윈도우의 스크롤 이벤트 모니터링
	        $(window).on('scroll', function() {
	            // 각 "scroll_on" 클래스를 가진 요소에 대해 반복
	            $counters.each(function() {
	                const $el = $(this);
	        
	                // 요소의 위치 정보를 가져옴
	                const rect = $el[0].getBoundingClientRect();
	                const winHeight = window.innerHeight; // 현재 브라우저 창의 높이
	                const contentHeight = rect.bottom - rect.top; // 요소의 높이
	                
	                // 요소가 화면에 특정 비율만큼 노출될 때 처리
	                if (rect.top <= winHeight - (contentHeight * exposurePercentage / 100) && rect.bottom >= (contentHeight * exposurePercentage / 100)) {
	                    $el.addClass('active');
	                }
	                // 요소가 화면에서 완전히 사라졌을 때 처리
	                if (loop && (rect.bottom <= 0 || rect.top >= window.innerHeight)) {
	                    $el.removeClass('active');
	                }
	            });
	        }).scroll();
	    });
	
	</script>
	</body>
</html>






