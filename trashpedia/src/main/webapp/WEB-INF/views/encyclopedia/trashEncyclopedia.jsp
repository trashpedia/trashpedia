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
<link rel="stylesheet" href="${contextPath}/resources/css/encyclopedia/trashEncyclopedia.css">

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

		<div class="recently-outer">
			<!--최근업데이트된 쓰레기 게시물  -->
				<div id="recently-garbage-slider" class="recently-garbage-outer">
					<p class="recently-garbage-outer-title"> 최근 업데이트된 쓰레기</p>
					<div class="recently-garbage-inner">
						<c:forEach var="post" items="${trashList}">
							<div class="recently-garbage">
								<div class="garbage-img-outer">
									<img class="popular-garbage-img"
										src="<c:url value='/resources/attachFile/image/${post.changeName}'/>"
										onclick="trashDetail(${post.trashPostNo})">
								</div>
								<p class="recently-garbage-title">${post.trashTitle}</p>
								<p class="recently-garbage-content">${post.trashInfo}</p>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>

		<!--인기 쓰레기 게시물  -->
		<div class="recently-outer">
			<div id="recently-garbage-slider2" class="recently-garbage-outer">
				<p class="recently-garbage-outer-title"> 인기쓰레기 </p>
				<div class="recently-garbage-inner">
					<c:forEach var="post" items="${trashList}">
						<div class="recently-garbage">
							<div class="garbage-img-outer">
								<img class="popular-garbage-img"
									src="<c:url value='/resources/attachFile/image/${post.changeName}'/>"
									onclick="trashDetail(${post.trashPostNo})">
							</div>
							<p class="recently-garbage-title">${post.trashTitle}</p>
							<p class="recently-garbage-content">${post.trashInfo}</p>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>		
			
			
			<%-- <div class="popular-outer">
		<!--인기 쓰레기 게시물  -->
			<div id="popular-garbage-slider" class="popular-garbage-outer">
			
			
				<p id="popular-garbage-outer-title">
					인기 <strong>쓰레기</strong>
				</p>
				
				
				<div class="recently-garbage-inner">
					<c:forEach var="post" items="${popularList}">
						<div class="recently-garbage">
							<div class="garbage-img-outer">
								<img class="recently-garbage-img"
									src="<c:url value='/resources/attachFile/image/${post.changeName}'/>"
									onclick="trashDetail(${post.trashPostNo})">
							</div>
							<p class="recently-garbage-title">${post.trashTitle}</p>
							<p class="recently-garbage-content">${post.trashInfo}</p>
						</div>
					</c:forEach>
				</div>
				</a>
			</div>
		</div> --%>
	
		
		
			
	
	</main>
	<button id="scrollUpButton">
		<span class="material-symbols-outlined">arrow_upward</span>
	</button>
	
			<div class="moreBtnArea">
				<div class="moreBtnBox">
					<button id="moreBtn">더알아보기</button>
				</div>
			</div>



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
	            });

	            $('#recently-garbage-slider2 .recently-garbage-inner').slick({
	                slidesToShow: 4,
	                slidesToScroll: 1,
	                autoplay: true,
	                autoplaySpeed: 2000, // 2초마다 슬라이드 전환
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

	 

	    //상세페이지로 이동
	    function trashDetail(trashPostNo) {
	    	console.log("상세페이지"+trashPostNo);
	     	location.href = "${contextPath}/trash/trashDetail/" + trashPostNo;
	    }
	    
	
	</script>
</body>
</html>






