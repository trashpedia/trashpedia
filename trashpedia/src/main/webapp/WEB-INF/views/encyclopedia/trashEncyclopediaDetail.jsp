<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
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
		<main>
			<div class="contentBox">
				<div class= "content">
				<div class="imgArea"><img src="<c:url value='/resources/attachFile/image/${trash.changeName}'/>" class="content-img"></div>
				<div class="trashInfo">
				
					<span id="bigCategoryName">${trash.bigCategoryName}</span>
					<span>></span>
					<span id="subCategoryName">${trash.subCategoryName}</span>
					<h2 id="trashTitle">${trash.trashTitle}</h2>
					<h4>버리는 방법</h4>
					<p id="howto">${trash.trashContent}</p>
					<h4>알아두면 좋은점</h4>
					<p id="know">${trash.trashContent}</p>	
				
				</div>
				</div>
			</div>
			
			<!-- 소분류 카테고리가 같은 쓰레기들 swipper  -->
		<div class="recently-outer showEvent">
			<div id="recently-garbage-slider" class="recently-garbage-outer">
				<p id="recently-garbage-outer-title">
					비슷한 종류의 <strong>쓰레기</strong>
				</p>
				<div class="recently-garbage-inner">
					<c:forEach var="post" items="${similarList}">
						<div class="recently-garbage">
							<div class="garbage-img-outer">
								<img class="recently-garbage-img" 
 									src="<c:url value='/resources/attachFile/image/${post.changeName}'/>"> 
							</div>
							<p class="recently-garbage-title">${post.trashTitle}</p>
							<p class="recently-garbage-content">${post.trashContent}</p>
						</div>
					</c:forEach>
				</div>
			</div>
			</div>
		</main>
		
		<button id="scrollUpButton">
			<div class="material-symbols-outlined">arrow_upward</div>
		</button>
		

	<jsp:include page="../common/footer.jsp" />

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
 
    //스크롤 다운 버튼
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

 

</script>
   
    </script>
</body>
</html>