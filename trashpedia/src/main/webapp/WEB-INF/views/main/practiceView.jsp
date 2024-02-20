<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>실천서약</title>
</head>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/main/practice.css">
<body>
    <jsp:include page="../common/header.jsp"/>
    <main>
        <div class="practice-section">
            <p>실천하기</p>
            <p>Reduce Reuse Recycle Recovery</p>
        </div>
        <div class="participant-section"> 
            <div class="participant-section-outer">
                <p>오늘까지 <span class="participant-count" id="dynamicCount">3,128</span>명 참여</p>
            </div>
        </div>
        <div class="content-section">
            <div class="content-section-outer">
                <div class="content-title"> 
                    <div class="content-tab">
                        <span id="pledgeBtn" onclick="pledgeShow">실천서약</span>
                        <span id="certificationBtn" onclick="certificationShow">실천인증</span>
                    </div>
                    <div class="content-search">
                        <input type="text" name="keyword" id="keyword" placeholder="작성자/제목">
                        <span id="searchButton" class="material-symbols-outlined icon">search</span> 
                    </div>
                </div>
                <!-- 실천서약 -->
                <div class="pledge">
                    <div class="content-outer">
                        <div class="img-area">
                            <a href="practiceDetailView.html">
                            <img src="img/testImg/test5.jpg"  class="content-img">
                            </a>
                        </div>
                        <div class="img-area">
                            <img src="img/testImg/test4.jpg"  class="content-img">
                        </div>
                        <div class="img-area">
                            <img src="img/testImg/test1.jpg"  class="content-img">
                        </div>
                        <div class="img-area">
                            <img src="img/testImg/test2.jpg"  class="content-img">
                        </div>
                        <div class="img-area">
                            <img src="img/testImg/test3.jpg"  class="content-img">
                        </div>
                        <div class="img-area">
                            <img src="img/testImg/test1.jpg"  class="content-img">
                        </div>
                        <div class="img-area">
                            <img src="img/testImg/test5.jpg"  class="content-img">
                        </div>
                        <div class="img-area">
                            <img src="img/testImg/test3.jpg"  class="content-img">
                        </div>
                        <!-- <div class="img-area">
                            <img src="https://www.recycling-info.or.kr/act4r/cmm/image/view.do?id=admfileupload_202307121120459250&ext=gif" class="content-img">
                        </div>
                        <div class="img-area">
                            <img src="https://www.recycling-info.or.kr/act4r/cmm/image/view.do?id=agenfileupload_202211180935033920&ext=GIF" class="content-img">
                        </div>
                        <div class="img-area">
                            <img src="https://www.recycling-info.or.kr/act4r/cmm/image/view.do?id=agenfileupload_202211040343223620&ext=GIF" class="content-img">
                        </div>
                        <div class="img-area">
                            <img src="https://www.recycling-info.or.kr/act4r/cmm/image/view.do?id=agenfileupload_202210241002323550&ext=GIF" class="content-img">
                        </div>
                        <div class="img-area">
                            <img src="https://www.recycling-info.or.kr/act4r/cmm/image/view.do?id=agenfileupload_202110190523524070&ext=gif" class="content-img">
                        </div>
                        <div class="img-area">
                            <img src="https://www.recycling-info.or.kr/act4r/cmm/image/view.do?id=admfileupload_202307121120459250&ext=gif" class="content-img">
                        </div>
                        <div class="img-area">
                            <img src="https://www.recycling-info.or.kr/act4r/cmm/image/view.do?id=agenfileupload_202211180935033920&ext=GIF" class="content-img">
                        </div>
                        <div class="img-area">
                            <img src="https://www.recycling-info.or.kr/act4r/cmm/image/view.do?id=agenfileupload_202211040343223620&ext=GIF" class="content-img">
                        </div> -->
                        <div class="paging-button">
                            <button class="pagingBtn" id="prevBtn"> < </button>
                            <button class="pagingBtn">1</button>
                            <button class="pagingBtn">2</button>
                            <button class="pagingBtn">3</button>
                            <button class="pagingBtn">4</button>
                            <button class="pagingBtn">5</button>
                            <button class="pagingBtn" id="nextBtn"> > </button>
                        </div>
                    </div>
                </div>
                 <!-- 실천인증 -->
                 <div class="certification">
                    <div class="content-outer">
                        <div class="img-area">
                            <img src="img/testImg/test1.jpg"  class="content-img">
                        </div>
                        <div class="img-area">
                            <img src="img/testImg/test2.jpg"  class="content-img">
                        </div>
                        <div class="img-area">
                            <img src="img/testImg/test3.jpg"  class="content-img">
                        </div>
                        <div class="img-area">
                            <img src="img/testImg/test4.jpg"  class="content-img">
                        </div>
                        <div class="img-area">
                            <img src="img/testImg/test5.jpg"  class="content-img">
                        </div>
                        <div class="img-area">
                            <img src="img/testImg/test4.jpg"  class="content-img">
                        </div>
                        <div class="img-area">
                            <img src="img/testImg/test3.jpg"  class="content-img">
                        </div>
                        <div class="img-area">
                            <img src="img/testImg/test2.jpg"  class="content-img">
                        </div>
                        <div class="paging-button">
                            <button class="pagingBtn" id="prevBtn"> < </button>
                            <button class="pagingBtn">1</button>
                            <button class="pagingBtn">2</button>
                            <button class="pagingBtn">3</button>
                            <button class="pagingBtn">4</button>
                            <button class="pagingBtn">5</button>
                            <button class="pagingBtn" id="nextBtn"> > </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="insert-area">
                <a href="practiceInsert.html">
                    <button id="insertButton">게시글 등록하기</button>
                </a>
            </div>
        </div>
    </main>
    <jsp:include page="../common/footer.jsp"/>
    <script>
        // 시작 숫자
        let currentCount = 0;
        // 목표 숫자
        let targetCount = parseInt($("#dynamicCount").text().replace(/,/g, ''), 10);
        // 숫자 업데이트
        function updateCount() {
            document.getElementById('dynamicCount').textContent = currentCount.toLocaleString();

            // 목표 카운트에 도달하면 중지
            if (currentCount < targetCount) {
                let timeoutValue;

                if (currentCount <= targetCount - 200 ) {  timeoutValue = 60; } 
                else if (currentCount <= targetCount - 40) {  timeoutValue = 80; } 
                else if (currentCount <= targetCount - 12) { timeoutValue = 110; } 
                else if (currentCount <= targetCount - 5) { timeoutValue = 170; } 
                else{ timeoutValue = 450; }

                setTimeout(function() {
                    if (targetCount - currentCount <= 30) {  currentCount += 1; } 
                    else if (targetCount - currentCount <= 100) { currentCount += 10; } 
                    else {  currentCount += 100; }
                    updateCount();
                }, timeoutValue);
            }
        }
        updateCount();

        // 실천서약, 실천인증 클릭
        $(document).ready(function(){
            // 초기에 실천서약 보이도록 설정
            $(".pledge").show();
            $(".certification").hide();
            $("#pledgeBtn").css("background-color", "#5bbf5b");
            
            // '실천서약' 버튼 클릭 시
            $("#pledgeBtn").click(function(){
                $(".pledge").show();
                $(".certification").hide();
                $("#pledgeBtn").css("background-color", "#5bbf5b");
                $("#certificationBtn").css("background-color", "rgb(200, 200, 200)");
            });

            // '실천인증' 버튼 클릭 시
            $("#certificationBtn").click(function(){
                $(".certification").show();
                $(".pledge").hide();
                $("#certificationBtn").css("background-color", "#5bbf5b");
                $("#pledgeBtn").css("background-color", "rgb(200, 200, 200)");
            });
        })
    </script>
</body>
</html>