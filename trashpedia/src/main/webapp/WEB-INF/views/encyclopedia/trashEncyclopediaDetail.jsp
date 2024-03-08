<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dictonary Detail&write</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/encyclopedia/trashEncyclopediaDetail.css">
<body>
	<jsp:include page="../common/header.jsp" />
	<main>
		<div class="contentBox">
			<c:if test="${type == 'insert'}">
				<form action="write" method="POST" id="enrollForm" class="form" enctype="multipart/form-data">
			</c:if>
			<c:if test="${type == 'update'}">
				<form action="update/${trash.trashNo}" method="POST" id="enrollForm" class="form" enctype="multipart/form-data">
			</c:if>
			<div class="content-wrapper">
				<div class="img-area">
					<c:if test="${type == 'read'}">
						<img src="<c:url value='/resources/attachFile/image/${trash.changeName}'/>" class="content-img">
					</c:if>
					<c:if test="${type != 'read'}">
						<span>이미지 첨부</span>
						<button type="button" class="updateButton" id="updateImgInputButton" onclick="$('#imgAttachment').click()">파일선택</button>
						<span class="nameArea" id="originFileName">${img.originName}</span>
						<span class="nameArea" id="updateFileName"></span>
						<input type="file" name="thumbnail" id="imgAttachment" style='display:none'>
						<c:if test="${!empty img}">
							<button  type="button" id="xImgButton" class="xButton">x</button>
						</c:if>
						<div id="img-box" style="display:none">
						    <img id="thumbNailImg" src="<c:url value='/resources/attachFile/image/${img.changeName}'/>">
					    </div>
					    <input type="hidden" name="deleteImg" id="deleteImg" value="" />
					    <input type="hidden" name="userNo" id="userNo" value="${authentication.userNo}" />
					</c:if>
				</div>
				<div class="trashInfo">
					<div class="category-filter-wrapper">
						<c:if test="${type == 'read'}">
							<span id="bigCategoryName">${trash.bigCategoryName}</span>
							<span>></span>
							<span id="subCategoryName">${trash.subCategoryName}</span>
						</c:if>
						<c:if test="${type != 'read'}">
							<select id="bigList" onchange="getSubList()" name="bigCategoryNo">
								<c:forEach var="big" items="${bigCategory}">
									<option value="${big.bigCategoryNo}">${big.bigCategoryName}</option>
								</c:forEach>
							</select>
							<span>></span>
							<select id="subList" name="subCategoryNo"></select>
						</c:if>
					</div>
					<div class="inner-content-wrapper">
						<c:if test="${type == 'read'}">
							<div class="title">${trash.trashTitle}</div>
							<div class="subtitle">버리는 방법</div>
							<div class="content"><pre>${trash.trashInfo}</pre></div>
							<div class="subtitle">알아두면 좋은점</div>
							<div class="content"><pre>${trash.trashExtraInfo}</pre></div>
						</c:if>
						<c:if test="${type != 'read'}">
							<div class="title">
								<input class="title-input" name="trashTitle" placeholder="제목을 입력하세요" value="${trash.trashTitle}">
							</div>
							<div class="subtitle">
								버리는 방법
							</div>
							<div class="content">
								<textarea class="trashInfo-input" name="trashInfo" placeholder="내용을 입력하세요">${trash.trashInfo}</textarea>
							</div>
							<div class="subtitle">
								알아두면 좋은점
							</div>
							<div class="content">
								<textarea class="trashExtraInfo-input" name="trashExtraInfo" placeholder="내용을 입력하세요">${trash.trashExtraInfo}</textarea>
							</div>
							<div class="button">
								<c:if test="${type == 'insert'}">
								<input type="submit" class="submit-button" value="작성">
								</c:if>
								<c:if test="${type == 'update'}">
								<input type="submit" class="submit-button" value="수정">
								</c:if>
							</div>
						</c:if>
					</div>
				</div>
			</div>
			<c:if test="${type != 'read'}">
			</form>
			</c:if>
		</div>
		<c:if test="${type == 'read'}">
			<div class="updateArea">
				<button id="updateBtn">수정요청</button>
			</div>
			<div class="recently-outer showEvent">
				<div id="recently-garbage-slider" class="recently-garbage-outer">
					<p id="recently-garbage-outer-title">비슷한 종류의 <strong>쓰레기</strong></p>
					<div class="recently-garbage-inner">
						<c:forEach var="post" items="${similarList}">
							<div class="recently-garbage">
								<div class="garbage-img-outer">
									<img class="recently-garbage-img" src="<c:url value='/resources/attachFile/image/${post.changeName}'/>" onclick="trashDetail(${post.trashPostNo})">
								</div>
								<p class="recently-garbage-title">${post.trashTitle}</p>
								<p class="recently-garbage-content">${post.trashContent}</p>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</c:if>
	</main>
	<c:if test="${type == 'read'}">
		<button id="scrollUpButton">
			<div class="material-symbols-outlined">arrow_upward</div>
		</button>
		<jsp:include page="../common/footer.jsp" />
	</c:if>
	<c:set var="type" value="{type}"/>
	<c:choose>
		<c:when test="${type == 'read'}">
			<script>
				let type = '${type}';
			    function trashDetail(trashNo) {
			     	location.href = "${contextPath}/trash/detail?trashNo=" + trashNo;
			  	}
				// 이미지 요소 생성
			    let imgElement = document.createElement('img');
			    imgElement.src = "${contextPath}/resources/attachFile/image/${trash.changeName}";
			    imgElement.className = 'content-img';
		
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
			  		//최근 업데이트 된 쓰레기,인기쓰레기
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
			    });
			    /*  <!-- 페이지 전환-->
			    
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
			    */
			</script>
		</c:when>
		<c:otherwise>
			<script>
			    // 쓰기, 수정 파일 스크립트
				$(document).ready(function() {
					const deleteList = document.querySelector("#deleteList");
				    
				    $('#xImgButton').click(function() {
				        if(confirm('정말로 이미지를 삭제하시겠습니까?')) {
				            $('#thumbNailImg').attr('src', '');
				            $('#originFileName').hide();
				            $('#imgAttachment').val('');
				            $('#xImgButton').hide();
				            $('#deleteImg').val($('#originFileName').text());
				        }
				    });
				    
				    $('#imgAttachment').change(function() {
				        const file = this.files[0];
				        if (file) {
				            const reader = new FileReader();
				            reader.onload = function(e) {
				            	$('#thumbNailImg').attr('src', e.target.result); 
				            	$('#originFileName').hide();
				            	$('#updateFileName').text(file.name);
				            	$('#img-box').css('display','block');
				            	$('#xImgButton').css('display','none');
				            	$('#deleteImg').val($('#originFileName').text());
				            };
				            reader.readAsDataURL(file);
				        }
				    });
				    
				    getSubList();
			    });
			    
			    function getSubList() {
			    	let bigCategoryNo = document.querySelector("#bigList").value;
			    	
			    	$.ajax({
			            url: '${contextPath}/trash/getSubcategoryList',
			            type: 'GET',
			            data: {bigCategoryNo},
			            success: function(data) {
			            	let subList = document.querySelector("#subList");
			            	subList.innerHTML = "";
			            	
			            	if(data.length != 0){
			            		for(let i = 0; i < data.length; i++){
			            			let option = document.createElement('option');
			            			option.value = data[i].subCategoryNo;
			            			option.innerHTML = data[i].subCategoryName;
			            			
			            			subList.append(option);
			            		}
			            	}
			            },
			            error: function(xhr, status, error) {
			                console.error('Error: ' + error);
			            }
			        });
			    };
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>