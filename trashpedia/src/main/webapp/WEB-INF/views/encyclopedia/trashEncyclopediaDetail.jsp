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
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
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
				<form action="${trash.trashNo}" method="POST" id="enrollForm" class="form" enctype="multipart/form-data">
			</c:if>
			<div class="content-wrapper">
				<div class="img-area">
					<c:if test="${type == 'read'}">
						<img src="<c:url value='/resources/attachFile/image/${trash.changeName}'/>" class="content-img">
					</c:if>
					<c:if test="${type != 'read'}">
						<div>
							<span>이미지 첨부</span>
							<button type="button" class="updateButton" id="updateImgInputButton" onclick="$('#imgAttachment').click()">파일선택</button>
							<span class="nameArea" id="originFileName">${img.originName}</span>
							<span class="nameArea" id="updateFileName"></span>
							<input type="file" name="thumbnail" id="imgAttachment" style='display:none'>
						</div>
						<div id="img-box" style="${empty img ? 'display:none' : ''}">
						    <img id="thumbNailImg" src="<c:url value='/resources/attachFile/image/${img.changeName}'/>">
					    </div>
					    <input type="hidden" name="deleteImg" id="deleteImg" value="" />
					    <input type="hidden" name="trahPostNo" id="trashPostNo" value="${trash.trashPostNo}" />
					    <input type="hidden" name="trashNo" id="trashNo" value="${trash.trashNo}" />
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
									<option value="${big.bigCategoryNo}" ${trash.bigCategoryNo == big.bigCategoryNo ? "selected" : "" }>${big.bigCategoryName}</option>
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
			<c:if test="${authentication != null}">
				<div class="updateArea">
					<button id="updateBtn">수정요청</button>
				</div>
			</c:if>
			<div class="recently-outer showEvent">
				<div id="recently-garbage-slider" class="recently-garbage-outer">
					<p id="recently-garbage-outer-title">비슷한 종류의 <strong>쓰레기</strong></p>
					<div class="recently-garbage-inner">
						<c:forEach var="post" items="${similarList}">
							<div class="recently-garbage">
								<div class="garbage-img-outer">
									<img class="recently-garbage-img" src="<c:url value='/resources/attachFile/image/${post.changeName}'/>" onclick="trashDetail(${post.trashNo})">
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
	
	<script>
			 //상세페이지로 이동
		     	function trashDetail(trashNo) {
		     		console.log("trashNo:", trashNo);
				     	location.href = "${contextPath}/trash/detail?trashNo=" + trashNo;
				  	}
				let type = '${type}';
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
	
	

	<c:if test="${type == 'read'}">
		<div id="modal" class="modal">
		    <div class="modal-content-wrapper">
		        <div>
			        <div class="modal-title">수정 요청</div>
			        <div class="request-title">
				        <input type="text" id="requestTitle" name="requestTitle" placeholder="제목을 입력하세요">
			        </div>
			        <div class="request-content">
				        <textarea id="requestContent" name="requestContent" placeholder="내용을 입력하세요"></textarea>
			        </div>
			        <div>
			        	<button type="submit" id="requestBtn" class="requestBtn">제출</button>
			        </div>
		        </div>
		        <span id="closeModalBtn" class="close">&times;</span>
		    </div>
		</div>
		<button id="scrollUpButton">
			<div class="material-symbols-outlined">arrow_upward</div>
		</button>
		<jsp:include page="../common/footer.jsp" />
	</c:if>
	<c:if test="${type == 'read'}">
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
		    	$('#updateBtn').click(function(){
		            $('#modal').show();
		        });
		        
		        $('#closeModalBtn').click(function(){
		            $('#modal').hide();
		        });

		        $(document).mouseup(function(e){
		            let modalContent = $('.modal-content-wrapper');
		            let modal = $('#modal');
		            if (!modalContent.is(e.target) && modalContent.has(e.target).length === 0 && !$('#closeModalBtn').is(e.target)) {
	                	$('#requestTitle').val('');
	                	$('#requestContent').val('');
		            	modal.hide();
		            }
		        });
		    	
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
		        
		        let imgCount = $('.recently-garbage-inner').children().length;
		        if(imgCount > 3){

			        $('#recently-garbage-slider .recently-garbage-inner').slick({
			            slide: 'div',
			        	infinite: true,
			        	slidesToShow: 4,
			            slidesToScroll: 1,
			            autoplay: true,
			            autoplaySpeed: 2000, // 2초마다 슬라이드 전환
			            arrows : true,
			            dots: true,
			            prevArrow: '<div class="custom-prev"></div>',
			            nextArrow: '<div class="custom-next"></div>'
					});
		        }
		    });
		    
		    $('#requestBtn').click(function(){
		    	let requestTitle = $('#requestTitle').val();
		    	let requestContent = $('#requestContent').val();
		    	let userNo = ${authentication == null ? 0 : authentication.userNo};
		    	let trashNo = ${trash.trashNo};
		    	
		    	$.ajax({
		    		url: 'request/write',
		    		type: 'POST',
		    		data: {requestTitle, requestContent, userNo, trashNo},
		    		success: function(data){
		    			if(data > 0){
		    				$('#requestTitle').val('');
		                	$('#requestContent').val('');
			            	modal.hide();
			    			alert("제출에 성공했습니다");
		    			} else {
		    				alert("제출에 실패했습니다. 다시 시도해주세요");
		    			}
		    		},
		    		error: function(xhr, status, error){
		    			console.error(error);
		    		}
		    	});
		    	
		    })
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
	</c:if>
	<c:if test="${type != 'read'}">
		<script>
		    // 쓰기, 수정 파일 스크립트
			$(document).ready(function() {
				const deleteList = document.querySelector("#deleteList");
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
            	let scNo = ${trash.subCategoryNo};
		    	
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
		            			if(data[i].subCategoryNo == scNo){
		            				option.selected = true;
		            			}
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
	</c:if>
</body>
</html>