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
<link rel="stylesheet" href="${contextPath}/resources/css/encyclopedia/trashEncyclopediaResult.css">

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
        <div class="section-area">
            <span> <a href="${contextPath}/trash/allList">전체보기</a></span>
            <span> <a href="#" id="generalTrashLink">일반쓰레기</a></span>
            <span> <a href="#" id="foodWasteLink">음식물쓰레기</a></span>
            <span> <a href="#" id="largeWasteLink">대형폐기물</a></span>
        </div>
        <div class="outer">
            <div class="content">
                <c:forEach var="big" items="${bigCategory}">
                    <h1 class="topic">${big.bigCategoryName}</h1>
                    <div class="trashList" id="trashList_${big.bigCategoryNo}">
                        <c:forEach var="sub" items="${subCategory}">
                            <c:if test="${big.bigCategoryNo == sub.bigCategoryNo}">
                                <c:forEach var="trash" items="${trash}">
                                    <c:if test="${sub.subCategoryNo == trash.subCategoryNo}">
                                        <div class="trash">
                                            <div class="imgArea">
                                                <img src="<c:url value='/resources/attachFile/image/${trash.changeName}'/>"
                                                    onclick="trashDetail(${trash.trashNo})">
                                            </div>
                                            <div class="trashInfo">
                                                <div id="trashCategory">
                                                    <h5>${big.bigCategoryName} > ${sub.subCategoryName}</h5>
                                                </div>
                                                <div id="trashNo">
                                                    <h4>trashNo: ${trash.trashNo}</h4>
                                                </div>
                                                <div id="trashTitle">
                                                    <h2>${trash.trashTitle}</h2>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                    </div>
                </c:forEach>
            </div>
        </div>
    </main>
    <button id="scrollUpButton">
        <span class="material-symbols-outlined">arrow_upward</span>
    </button>

    <jsp:include page="../common/footer.jsp" />

	<script>
	$(document).ready(function() {
	    $("#generalTrashLink").click(function() {
	        $(".trashList").hide(); // 모든 쓰레기 목록 숨기기
	        $("#trashList_1").show(); // 일반쓰레기 목록 보이기

	        // 대분류 이름 업데이트
	        $(".topic").each(function() {
	            if ($(this).next(".trashList").attr("id") === "trashList_1") {
	                $(this).text("일반쓰레기");
	            } else {
	                $(this).text("");
	            }
	        });
	    });
	    $("#foodWasteLink").click(function() {
	        $(".trashList").hide(); // 모든 쓰레기 목록 숨기기
	        // 음식물쓰레기 목록 보이기
	        $("#trashList_2").show();

	        // 대분류 이름 업데이트
	        $(".topic").each(function() {
	            if ($(this).next(".trashList").attr("id") === "trashList_2") {
	                $(this).text("음식물쓰레기");
	            } else {
	                $(this).text("");
	            }
	        });
	    });

	    $("#largeWasteLink").click(function() {
	        $(".trashList").hide(); // 모든 쓰레기 목록 숨기기
	        // 대형폐기물 목록 보이기
	        $("#trashList_3").show();

	        // 대분류 이름 업데이트
	        $(".topic").each(function() {
	            if ($(this).next(".trashList").attr("id") === "trashList_3") {
	                $(this).text("대형폐기물");
	            } else {
	                $(this).text("");
	            }
	        });

	    });

	    // 대분류 카테고리 링크 클릭 시 이벤트 처리
	    $(".category-link").click(function() {
	        var bigCategoryNo = $(this).data("big-category-no"); // 선택한 대분류 카테고리 번호 가져오기
	        var bigCategoryName = $(this).text(); // 선택한 대분류 카테고리 이름 가져오기

	        // 대분류 이름 업데이트
	        $(".topic").text("");

	        // 선택한 대분류 카테고리에 해당하는 쓰레기 목록 보이기
	        $("#trashList_" + bigCategoryNo).show();

	        // 대분류 이름 업데이트
	        $(".topic").each(function() {
	            if ($(this).next(".trashList").attr("id") === "trashList_" + bigCategoryNo) {
	                $(this).text(bigCategoryName);
	            }
	        });
	    });
	});

	// 상세페이지로 이동
	function trashDetail(trashNo) {
	    location.href = "${contextPath}/trash/detail?trashNo=" + trashNo;
	}
	</script>
</body>
</html>
