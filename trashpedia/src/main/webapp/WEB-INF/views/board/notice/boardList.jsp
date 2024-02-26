<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="/준식이 파이널/css/board/style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/board/boardList.css">

</head>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<!-- css -->
<link rel="stylesheet" href="css/mainPage.css">


<!-- slick 라이브러리 CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<!-- slick 라이브러리 테마 CSS (선택사항) -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<!-- slick 라이브러리 JS -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<body>

   <jsp:include page="../../common/header.jsp" />

    

    <main class="board_html">   
       
        <!--실천서약 타이틀 부분-->
        <div class="practice-section">
            <p>공지사항</p>
            <p>Reduce Reuse Recycle Recovery</p>
        </div>
       
        <!--list-->
        <div class="board_wrap">
            <div class="board_title">
                <strong>공지사항</strong>
                <p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
            </div>
            <div class="board_list_wrap">
                <div class="board_list">
                    <div class="top">
                        <div class="num">번호</div>
                        <div class="title">제목</div>
                        <div class="writer">글쓴이</div>
                        <div class="date">작성일</div>
                        <div class="count">조회</div>
                    </div>
                    
                    <c:forEach var="board" items="${boardList}" varStatus="status">
	                    <div>
	                        <div class="num">${status.count}</div>
	                        <div class="title"><a href="${contextPath}/boardDetail/${board.postNo}">${board.title}</a></div>
	                        <div class="writer">${board.writer}</div>
	                        <div class="date">${board.date}</div>
	                        <div class="count">${board.viewCount}</div>
	                    </div>
               		</c:forEach>
               		
                    <div>
                        <div class="num">5</div>
                        <div class="title"><a href="${contextPath}/boardDetail">${board.title}</a></div>
                        <div class="writer">김이름</div>
                        <div class="date">2021.1.15</div>
                        <div class="count">33</div>
                    </div>
                    <div>
                        <div class="num">5</div>
                        <div class="title"><a href="/boardDetail/{postNo}">글 제목이 들어갑니다.</a></div>
                        <div class="writer">김이름</div>
                        <div class="date">2021.1.15</div>
                        <div class="count">33</div>
                    </div>
                    <div>
                        <div class="num">5</div>
                        <div class="title"><a href="/community/board_view.html">글 제목이 들어갑니다.</a></div>
                        <div class="writer">김이름</div>
                        <div class="date">2021.1.15</div>
                        <div class="count">33</div>
                    </div>
                    <div>
                        <div class="num">5</div>
                        <div class="title"><a href="/community/board_view.html">글 제목이 들어갑니다.</a></div>
                        <div class="writer">김이름</div>
                        <div class="date">2021.1.15</div>
                        <div class="count">33</div>
                    </div>
                    <div>
                        <div class="num">5</div>
                        <div class="title"><a href="/community/board_view.html">글 제목이 들어갑니다.</a></div>
                        <div class="writer">김이름</div>
                        <div class="date">2021.1.15</div>
                        <div class="count">33</div>
                    </div>
                    <div>
                        <div class="num">5</div>
                        <div class="title"><a href="/community/board_view.html">글 제목이 들어갑니다.</a></div>
                        <div class="writer">김이름</div>
                        <div class="date">2021.1.15</div>
                        <div class="count">33</div>
                    </div>
                    <div>
                        <div class="num">5</div>
                        <div class="title"><a href="/community/board_view.html">글 제목이 들어갑니다.</a></div>
                        <div class="writer">김이름</div>
                        <div class="date">2021.1.15</div>
                        <div class="count">33</div>
                    </div>
                    
                </div>
                <div class="board_page">
                    <a href="#" class="bt first"><<</a>
                    <a href="#" class="bt prev"><</a>
                    <a href="#" class="num on">1</a>
                    <a href="#" class="num">2</a>
                    <a href="#" class="num">3</a>
                    <a href="#" class="num">4</a>
                    <a href="#" class="num">5</a>
                    <a href="#" class="bt next">></a>
                    <a href="#" class="bt last">>></a>
                </div>
                <div class="bt_wrap">
                    <a href="board_write.html" class="on">등록</a>
                    <!--<a href="#">수정</a>-->
                </div>
            </div>
        </div>


    </main>

     <jsp:include page="../../common/footer.jsp" />


     <script>
        
        //  header footer 로딩 , 나중에 지울거
        $(function(){
            $("#header").load("header.html"); 
            $("#footer").load("footer.html");
        })
    
        // 최근 업데이트 된 쓰레기 슬라이드
        $(document).ready(function(){
                $('#recently-garbage-slider .recently-garbage-inner').slick({
                    slidesToShow: 4,
                    slidesToScroll: 1,
                    autoplay: true,
                    autoplaySpeed: 2500, // 2.5초마다 슬라이드 전환
                    dots: true,
                    appendDots: $('#recently-garbage-slider .slick-dots')
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


        // 스크롤 변화에 따른 header 스타일 변경
        window.addEventListener('scroll', function() {
            var header = document.querySelector('.header');
            var headerLinks = document.querySelectorAll('.header-nav ul li a');
            var headerRihtLink = document.querySelectorAll('.header-right li a, .header-right li span');

            if (window.scrollY > 100) {
                header.classList.add('header-scroll');
                headerLinks.forEach(function(link) {
                    link.style.color = 'black'; 
                    link.style.fontWeight = '600';
                });
                headerRihtLink.forEach(function(link) {
                    link.style.color = 'rgb(88, 88, 88)'; 
                });

            } else {
                header.classList.remove('header-scroll');
                headerLinks.forEach(function(link) {
                    link.style.color = ''; // 링크 텍스트 색상 초기화
                });
                headerRihtLink.forEach(function(link) {
                    link.style.color = ''; // 링크 텍스트 색상 초기화
                });

            }
        });

        document.addEventListener("DOMContentLoaded", function() {
            var img = document.querySelector('.backgroundImg img');

            img.addEventListener('load', function() {
                img.classList.add('loaded');
            });
        });
                
    
    </script>
</body>
</html> 