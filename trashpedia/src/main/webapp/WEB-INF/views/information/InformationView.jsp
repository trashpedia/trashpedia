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
<%--  	<link rel="stylesheet" href="${contextPath}/resources/css/main/pledge.css"> --%>
 	<link rel="stylesheet" href="${contextPath}/resources/css/information/InformationView.css">
</head>
<body>

    <jsp:include page="../common/header.jsp"/>
    
    <main>
        <div class="practice-section">
            <p>정보자료글</p>
        </div>
        <div>
        </div>

        <div class="content-section">
        
            <div class="content-section-outer">
                <div class="content-title"> 
                   <div class="content-search">
	                    <select name="condition" id="board-search-filter-select">
			                <option value="title" selected>제목</option>
			                <option value="content">내용</option>
			                <option value="postNo" >번호</option>
						</select>
                        <input type="search" class="board-search-input" name="keyword" id="keyword" placeholder="검색어를 입력하세요.">
                        <button type="button" class="board-search-button" onclick="boardSearch()">
                        	<span id="searchButton" class="material-symbols-outlined icon">search</span>
                        </button> 
                    </div>
                </div>
            </div>
            
            <!-- 게시글 -->
			<div class="pledge">
				<div class="content-img-area">
					<div class="img-area" onclick="pledgeDetail(${post.postNo})">
						<input type="hidden" value="${post.title}"> 
						<input type="hidden" name="subCategoryNo" value="${post.subCategoryNo} ">
						<img src="<c:url value='/resources/attachFile/image/f0d86288-b110-4d02-8c38-75e597f70140.gif'/>" class="content-img">
					</div>
					<div class="img-area" onclick="pledgeDetail(${post.postNo})">
						<input type="hidden" value="${post.title}"> 
						<input type="hidden" name="subCategoryNo" value="${post.subCategoryNo} ">
						<img src="<c:url value='/resources/attachFile/image/f0d86288-b110-4d02-8c38-75e597f70140.gif'/>" class="content-img">
					</div>
					<div class="img-area" onclick="pledgeDetail(${post.postNo})">
						<input type="hidden" value="${post.title}"> 
						<input type="hidden" name="subCategoryNo" value="${post.subCategoryNo} ">
						<img src="<c:url value='/resources/attachFile/image/f0d86288-b110-4d02-8c38-75e597f70140.gif'/>" class="content-img">
					</div>
				</div>
			</div>

			<div class="board-pageBar paging-button"></div>
			<div class="insert-area">
				<a
					href="${pageContext.request.contextPath}/write?bigCategoryNo=${bigCategoryNo}&subCategoryNo=${subCategoryNo}&type=1">
					<button id="insertButton">게시글 등록 </button>
				</a>
			</div>
		</div>
    </main>
    
    
    <jsp:include page="../common/footer.jsp"/>
    
    <script>
        
        //페이징,검색
        var boardFilterValue = 'boardNo';
	    var boardSearchSelect = null;
	    var boardSearchValue = null;
	    
	    $(document).ready(function () {
	    	  getBoardList(0, boardSearchSelect, boardSearchValue);
	    });
	    
        //누른 option값으로 필터링하기
// 	    $('#board-filter-select').change(function(){
// 	    	boardFilterValue = $(this).val();
// 	    	$('.board-list').empty();  //tbody영역 지우기-비동기일때만
// 	    	getBoardList(0, boardSearchSelect, boardSearchValue);
// 	    });
        
        /* 검색 */
	    function boardSearch(){
	    	boardSearchSelect = $('#board-search-filter-select').val();
	    	boardSearchValue = $('.board-search-input').val();
	    	$('.board-search-input').val('');
	    	$('.board-list').empty();
	    	getBoardList(0, boardSearchSelect, boardSearchValue);
	    }
        
	    /* 게시글 리스트 조회 */
	    function getBoardList(page, boardSearchSelect, boardSearchValue) {
	        $.ajax({
	            url: '${contextPath}/pledge/loadListData',
	            type: 'GET',
	            dataType: 'json',
	            data: {
	            	page: page, size: 8, sort: boardFilterValue, 
	            	searchSelect: boardSearchSelect, 
	            	searchValue: boardSearchValue,
	            	subCategoryNo : ${subCategoryNo}	
	            },
	            success: function(data) {
 	            	if(data.content.length != 0){
 		                updateBoardTable(data.content);
 		                updateBoardPagination(data);
 	            	}
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	            }
	        });
	    }
	    
//       	<c:forEach var="post" items="${list}">
// 	        <div class="img-area" onclick ="pledgeDetail(${post.postNo})">
// 				<input type="hidden" value="${post.title}">
// 				<input type="hidden" name="subCategoryNo" value="${post.subCategoryNo} ">
// 				<img src="<c:url value='/resources/attachFile/image/${post.changeName}'/>"  class="content-img">
// 			</div>
// 		</c:forEach>
	    
	    
	    /* 게시글 반복문돌리기 */
	    function updateBoardTable(data) {
		    let userList = document.querySelector('.content-img-area');
		    userList.innerHTML = '';
		
		    for (let i = 0; i < data.length; i++) {
		    	
		        let post = data[i];
		        let postNo = post.postNo;
		        
		        // 게시글 요소 생성
		        let postElement = document.createElement('div');
		        postElement.className = 'img-area';
		     	postElement.setAttribute('onclick', 'pledgeDetail(' + postNo + ')');
		        
		        // 숨겨진 input 요소 추가
		        let titleInput = document.createElement('input');
		        titleInput.type = 'hidden';
		        titleInput.value = post.title;
		
		        let subCategoryNoInput = document.createElement('input');
		        subCategoryNoInput.type = 'hidden';
		        subCategoryNoInput.name = 'subCategoryNo';
		        subCategoryNoInput.value = post.subCategoryNo;
		
		        // 이미지 요소 생성
		        let imgElement = document.createElement('img');
		        imgElement.src = '${contextPath}/resources/attachFile/image/' + post.changeName;
		        imgElement.className = 'content-img';
		
		        // 생성한 요소들을 게시글 요소에 추가
		        postElement.appendChild(titleInput);
		        postElement.appendChild(subCategoryNoInput);
		        postElement.appendChild(imgElement);
		
		        // 게시글 요소를 userList에 추가
		        userList.appendChild(postElement);
		    }
		}

	    /* 페이징바 추가 */
	    function updateBoardPagination(data) {
	        let userPaging = document.querySelector('.board-pageBar');
	        // userPaging이 null인지 확인
	        if (userPaging) {
	            let pagination = '';
	            if (!data.empty) {
	                if (!data.first) {
	                    pagination += '<button class="pagingBtn" onclick="getBoardList(' + (data.number - 1) + ',\'' + boardSearchSelect + '\',\'' + boardSearchValue + '\')"><</button>';
	                }
	                for (let i = 0; i < data.totalPages; i++) {
	                    if (i >= data.number - 5 && i <= data.number + 5) {
	                        pagination += '<button ';
	                        if (i === data.number) {
	                            pagination += 'class="pagingBtn active"';
	                        }
	                        pagination += 'class="pagingBtn" onclick="getBoardList(' + i + ',\'' + boardSearchSelect + '\',\'' + boardSearchValue + '\')">' + (i + 1) + '</button>';
	                    }
	                }
	                if (!data.last) {
	                    pagination += '<button class="pagingBtn" onclick="getBoardList(' + (data.number + 1) + ',\'' + boardSearchSelect + '\',\'' + boardSearchValue + '\')">></button>';
	                }
	            }
	            userPaging.innerHTML = pagination;
	        } else {
	            console.error('Error: .board-pageBar element not found.');
	        }
	    }
        
	    function pledgeDetail(postNo) {
	    	location.href = "${contextPath}/pledge/detail/" + postNo;
    	}
		
		
    </script>
</body>
</html>