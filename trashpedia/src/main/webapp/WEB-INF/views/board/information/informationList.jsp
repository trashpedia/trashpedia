<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>정보자료실</title>
<!-- <link rel="stylesheet" href ="resources/css/information/informationList.css"> -->
<!-- <link rel="stylesheet" href ="resources/css/information/informationDeatil.css"> -->
<link rel="stylesheet" href ="${contextPath}/resources/css/board/information/informationList.css">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<!-- css -->
<link rel="stylesheet" href="resources/css/main/main.css">
<!-- slick 라이브러리 CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<!-- slick 라이브러리 테마 CSS (선택사항) -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<!-- slick 라이브러리 JS -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</head>
<body>
        
	<jsp:include page="../../common/header.jsp" />
        
        <div id="menu-bar">
            
            <div id="container">
                <!--실천서약 타이틀 부분-->
                <div class="practice-section">
                    <p>정보자료실</p>
                    <p>Reduce Reuse Recycle Recovery</p>
                </div>
 
                <div class="list_wrap">
                    <ul>
                        <li class="item item1">
                            <div class="image">사진</div>
                            <div class="cont">
                                <strong>제목이 들어갑니다.</strong>
                                <p>내용이 들어갑니다.</p>
                                <a href="#">바로가기</a>
                            </div>
                        </li>
                        <li class="item item2">
                            <div class="image">사진</div>
                            <div class="cont">
                                <strong>제목이 들어갑니다.</strong>
                                <p>내용이 들어갑니다.</p>
                                <a href="#">바로가기</a>
                            </div>
                        </li>
                        <li class="item item3">
                            <div class="image">사진</div>
                            <div class="cont">
                                <strong>제목이 들어갑니다.</strong>
                                <p>내용이 들어갑니다.</p>
                                <a href="#">바로가기</a>
                            </div>
                        </li>
                        <li class="item item4">
                            <div class="image">사진</div>
                            <div class="cont">
                                <strong>제목이 들어갑니다.</strong>
                                <p>내용이 들어갑니다.</p>
                                <a href="#">바로가기</a>
                            </div>
                        </li>
                        <li class="item item5">
                            <div class="image">사진</div>
                            <div class="cont">
                                <strong>제목이 들어갑니다.</strong>
                                <p>내용이 들어갑니다.</p>
                                <a href="#">바로가기</a>
                            </div>
                        </li>
                        <li class="item item6">
                            <div class="image">사진</div>
                            <div class="cont">
                                <strong>제목이 들어갑니다.</strong>
                                <p>내용이 들어갑니다.</p>
                                <a href="#">바로가기</a>
                            </div>
                        </li>
                        <li class="item item7">
                            <div class="image">사진</div>
                            <div class="cont">
                                <strong>제목이 들어갑니다.</strong>
                                <p>내용이 들어갑니다.</p>
                                <a href="#">바로가기</a>
                            </div>
                        </li>
                        <li class="item item8">
                            <div class="image">사진</div>
                            <div class="cont">
                                <strong>제목이 들어갑니다.</strong>
                                <p>내용이 들어갑니다.</p>
                                <a href="#">바로가기</a>
                            </div>
                        </li>
                        <li class="item item9">
                            <div class="image">사진</div>
                            <div class="cont">
                                <strong>제목이 들어갑니다.</strong>
                                <p>내용이 들어갑니다.</p>
                                <a href="#">바로가기</a>
                            </div>
                        </li>
                    </ul>
                </div>

                <div class="btn-area">
                    <button type="button" id="moreButton" class="btn btn-lg btn-default">더보기</button>
                </div>
                 
            </div>
        </div>
        
	<jsp:include page="../../common/footer.jsp" />
        
        <script>
		// IntersectionObserver 설정
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