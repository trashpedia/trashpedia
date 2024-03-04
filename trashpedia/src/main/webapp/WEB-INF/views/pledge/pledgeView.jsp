<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<c:url var="currentUrl" value="/trashpedia/pledge/list">
    <c:param name="subCategoryNo" value="${currentSubCategoryNo}" />
    <c:param name="bigCategoryNo" value="${currentBigCategoryNo}" />
</c:url>
<c:set var="subCategoryNo" value="${param.subCategoryNo}" />
<c:set var="bigCategoryNo" value="${param.bigCategoryNo}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>실천하기</title>
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="${contextPath}/resources/css/main/pledge.css">
</head>
<body>

	<c:if test="${not empty alert}">
		<script>
		    alert("${alert}");
		</script>
		<c:remove var="alert" />
	</c:if>

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
                    	<a href="${contextPath}/pledge/list?bigCategoryNo=2&subCategoryNo=5">
                        	<span id="pledgeBtn" onclick="pledgeShow"> 실천서약 </span>
                        </a>
                        <a href="${contextPath}/pledge/list?bigCategoryNo=2&subCategoryNo=6">
                        	<span id="certificationBtn" onclick="certificationShow"> 실천인증 </span>
                        </a>
                    </div>
                    <div class="content-search">
                        <input type="text" name="keyword" id="keyword" placeholder="제목검색">
                        <span id="searchButton" class="material-symbols-outlined icon">search</span> 
                    </div>
                </div>
                
                <!-- 실천서약 -->
                <div class="pledge">
                    <div class="content-outer">
                    	<c:forEach var="post" items="${list}">
							<div class="img-area" onclick ="pledgeDetail(${post.postNo})">
							 	<input type="hidden" value="${post.title}">
							 	<input type="hidden" name="subCategoryNo" value="${post.subCategoryNo} ">
							 	<img src="<c:url value='/resources/attachFile/image/${post.changeName}'/>"  class="content-img">
                        	</div>
                    	</c:forEach>

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
						<c:forEach var="post" items="${list}">
							<div class="img-area" onclick ="pledgeDetail(${post.postNo})">
							 	<input type="hidden" value="${post.title}">
							 	<input type="hidden" name="subCategoryNo"value="${post.subCategoryNo} ">
							 	<input type="hidden" name="postNo" value="${post.postNo}">
							 	<img src="<c:url value='/resources/attachFile/image/${post.changeName}'/>"  class="content-img">
                        	</div>
                    	</c:forEach>
                     
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
                <a href="${pageContext.request.contextPath}/write?bigCategoryNo=${bigCategoryNo}&subCategoryNo=${subCategoryNo}&type=1">
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
		    <c:choose>
		        <c:when test="${subCategoryNo eq 5}">
		            $(".pledge").show();
		            $(".certification").hide();
		            $("#pledgeBtn").css("background-color", "#5bbf5b");
		            $("#certificationBtn").css("background-color", "rgb(200, 200, 200)");
		        </c:when>
		        <c:when test="${subCategoryNo eq 6}">
		            $(".certification").show();
		            $(".pledge").hide();
		            $("#certificationBtn").css("background-color", "#5bbf5b");
		            $("#pledgeBtn").css("background-color", "rgb(200, 200, 200)");
		        </c:when>
		        <c:otherwise>
		            <!-- 기본적으로 보여질 탭 설정 -->
		            $(".pledge").show();
		            $(".certification").hide();
		            $("#pledgeBtn").css("background-color", "#5bbf5b");
		            $("#certificationBtn").css("background-color", "rgb(200, 200, 200)");
		        </c:otherwise>
		    </c:choose>
		})
		
		//상세보기 이동
		function pledgeDetail(postNo){
        	location.href= "${contextPath}/pledge/detail/${postNo}"+postNo;
        }
		
		
		
    </script>
</body>
</html>