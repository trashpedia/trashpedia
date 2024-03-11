<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>trashManagement</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/admin/trashManagement.css">
</head>
<jsp:include page="../common/header.jsp"/>
<body class="body">
    <jsp:include page="../common/sidebar.jsp"/>
    <div class="content-wrapper">
        <div class="content">
            <div class="practice-section">
			    <p>쓰레기 관리</p>
			    <p>trash management</p>
			</div>
			<section class="content-section">
                <div class="content-container">
                	<div class="content-title-wrapper">
                    	<div class="content-title">쓰레기</div>
	                   	<div class="filter-wrapper">
						    <select name="condition" id="trash-filter-select">
						        <option value="trashNo" selected>번호</option>
						        <option value="subCategoryName">분류</option>
						        <option value="trashTitle">제목</option>
						        <option value="hit">조회수</option>
						    </select>
						    <input type="button" class="write-button" value="글쓰기" onclick="trashWrite()">
						</div>
                   	</div>
					<table class="long-table trash-table">
					    <thead class="long-thead trash-thead">
					    	<tr class="long-tr">
					    		<th>번호</th>
                                <th>대분류</th>
                                <th>소분류</th>
                                <th>이름</th>
                                <th>작성일</th>
                                <th>수정일</th>
                                <th>조회수</th>
                                <th>비고</th>
					    	</tr>
					    </thead>
					    <tbody class="long-tbody trash-list"></tbody>
					</table>
					<div class="search-wrapper">
						<select name="condition" id="trash-search-filter-select">
			                <option value="trashNo" selected>번호</option>
			                <option value="subCategoryName">분류</option>
			                <option value="trashTitle">이름</option>
						</select>
						<input type="search" class="search-input trash-search-input" placeholder="검색어를 입력하세요">
						<input type="button" class="search-button trash-search-button" value="검색" onclick="trashSearch()">
					</div>
                	<div class="trash-pageBar pageBar"></div>
                </div>
			</section>
			<section class="content-section">
                <div class="content-container">
                	<div class="content-title-wrapper">
                    	<div class="content-title">건의</div>
	                   	<div class="filter-wrapper">
						    <select name="condition" id="suggestion-filter-select">
						        <option value="suggestionNo" selected>번호</option>
						        <option value="suggestionTitle">제목</option>
						        <option value="processingStatus">처리상태</option>
						        <option value="processingDate">처리일</option>
						    </select>
						</div>
                   	</div>
					<table class="long-table suggestion-table">
					    <thead class="long-thead suggestion-thead">
					    	<tr class="long-tr">
					    		<th>번호</th>
                                <th>요청자 번호</th>
                                <th>제목</th>
                                <th>작성일</th>
                                <th>처리상태</th>
                                <th>처리일</th>
                                <th>비고</th>
					    	</tr>
					    </thead>
					    <tbody class="long-tbody suggestion-list"></tbody>
					</table>
					<div class="search-wrapper">
						<select name="condition" id="suggestion-search-filter-select">
			                <option value="suggestionNo" selected>번호</option>
			                <option value="userNo">건의자 번호</option>
			                <option value="suggestionTitle">제목</option>
						</select>
						<input type="search" class="search-input suggestion-search-input" placeholder="검색어를 입력하세요">
						<input type="button" class="search-button suggestion-search-button" value="검색" onclick="suggestionSearch()">
					</div>
                	<div class="suggestion-pageBar pageBar"></div>
                </div>
			</section>
			<section class="content-section">
                <div class="content-container">
                	<div class="content-title-wrapper">
                    	<div class="content-title">요청</div>
	                   	<div class="filter-wrapper">
						    <select name="condition" id="request-filter-select">
						        <option value="requestNo" selected>번호</option>
						        <option value="userNo">작성자</option>
						        <option value="trashTitle">쓰레기</option>
						        <option value="requestTitle">제목</option>
						        <option value="processingStatus">처리상태</option>
						        <option value="processingDate">처리일</option>
						    </select>
						</div>
                   	</div>
					<table class="long-table request-table">
					    <thead class="long-thead request-thead">
					    	<tr class="long-tr">
					    		<th>번호</th>
                                <th>쓰레기</th>
                                <th>작성자</th>
                                <th>제목</th>
                                <th>작성일</th>
                                <th>처리상태</th>
                                <th>처리일</th>
                                <th>비고</th>
					    	</tr>
					    </thead>
					    <tbody class="long-tbody request-list"></tbody>
					</table>
					<div class="search-wrapper">
						<select name="condition" id="request-search-filter-select">
			                <option value="requestNo" selected>번호</option>
					        <option value="userNo">작성자 번호</option>
					        <option value="trashTitle">쓰레기</option>
					        <option value="requestTitle">제목</option>
						</select>
						<input type="search" class="search-input request-search-input" placeholder="검색어를 입력하세요">
						<input type="button" class="search-button request-search-button" value="검색" onclick="requestSearch()">
					</div>
                	<div class="request-pageBar pageBar"></div>
                </div>
                <div id="modal" class="modal">
				    <div class="modal-content-wrapper"></div>
				</div>
			</section>
        </div>
    </div>
    <script>
	    var trashFilterValue = 'trashNo';
	    var suggestionFilterValue = 'suggestionNo';
	    var requestFilterValue = 'requestNo';
	    var trashSearchSelect = null;
	    var suggestionSearchSelect = null;
	    var requestSearchSelect = null;
	    var trashSearchValue = null;
	    var suggestionSearchValue = null;
	    var requestSearchValue = null;
		
	    $(document).ready(function() {
	    	getTrashList(0, trashSearchSelect, trashSearchValue);
	    	getSuggestionList(0, suggestionSearchSelect, suggestionSearchValue);
	    	getRequestList(0, requestSearchSelect, requestSearchValue);
	    });
	    
	    $('#trash-filter-select').change(function(){
	    	trashFilterValue = $(this).val();
	    	$('.trash-list').empty();
	    	getTrashList(0, trashSearchSelect, trashSearchValue);
	    });
	
	    $('#suggestion-filter-select').change(function(){
	    	suggestionFilterValue = $(this).val();
	    	$('.suggestion-list').empty();
	    	getSuggestionList(0, suggestionSearchSelect, suggestionSearchValue);
	    });
	    
	    $('#request-filter-select').change(function(){
	    	requestFilterValue = $(this).val();
	    	$('.request-list').empty();
	    	getRequestList(0, requestSearchSelect, requestSearchValue);
	    });
	    
	    function trashSearch(){
	    	trashSearchSelect = $('#trash-search-filter-select').val();
	    	trashSearchValue = $('.trash-search-input').val();
	    	$('.trash-search-input').val('');
	    	$('.trash-list').empty();
	    	getTrashList(0, trashSearchSelect, trashSearchValue);
	    }
	    
	    function suggestionSearch(){
	    	suggestionSearchSelect = $('#suggestion-search-filter-select').val();
	    	suggestionSearchValue = $('.suggestion-search-input').val();
	    	$('.suggestion-search-input').val('');
	    	$('.suggestion-list').empty();
	    	getSuggestionList(0, suggestionSearchSelect, suggestionSearchValue);
	    }
	    
	    function requestSearch(){
	    	requestSearchSelect = $('#request-search-filter-select').val();
	    	requestSearchValue = $('.request-search-input').val();
	    	$('.request-search-input').val('');
	    	$('.request-list').empty();
	    	getRequestList(0, requestSearchSelect, requestSearchValue);
	    }
	    
	    function getTrashList(page, trashSearchSelect, trashSearchValue) {
	        $.ajax({
	            url: '${contextPath}/admin/getTrashList',
	            type: 'GET',
	            dataType: 'json',
	            data: {page: page, size: 10, sort: trashFilterValue, searchSelect: trashSearchSelect, searchValue: trashSearchValue},
	            success: function(data) {
	            	if(data.content.length != 0){
		                updateTrashTable(data.content);
		                updateTrashPagination(data);
	            	}
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	            }
	        });
	    }
	
	    function updateTrashTable(data) {
	    	let userList = document.querySelector('.trash-list');
	        userList.innerHTML = '';
	        for (let i = 0; i < data.length; i++) {
	            let row = document.createElement('tr');
	            row.classList.add('long-tr');

	            let cell1 = document.createElement('td');
	            cell1.textContent = data[i].trashNo;
	            
	            let cell2 = document.createElement('td');
	            cell2.innerHTML = data[i].bigCategoryName;
	            
	            let cell3 = document.createElement('td');
	            cell3.textContent = data[i].subCategoryName;
	            
	            let cell4 = document.createElement('td');
	            cell4.textContent = data[i].trashTitle;
	
	            let cell5 = document.createElement('td');
	            cell5.textContent = data[i].createDate;
	            
	            let cell6 = document.createElement('td');
	            cell6.textContent = data[i].modifyDate;
	
	            let cell7 = document.createElement('td');
	            cell7.textContent = data[i].hit;
	            
	            let cell8 = document.createElement('td');
	    		
	            let button1 = document.createElement('input');
	        	button1.setAttribute('type', 'button');
	        	button1.setAttribute('value', '상세보기');
	        	button1.classList.add('detail-button');
	        	button1.addEventListener('click', function() {
	        	    trashDetail(data[i].trashNo);
	        	});
	        	
	            let button2 = document.createElement('input');
	        	button2.setAttribute('type', 'button');
	        	button2.setAttribute('value', '수정');
	        	button2.classList.add('detail-button');
	        	button2.addEventListener('click', function() {
	        	    trashUpdate(data[i].trashNo, 'move');
	        	});
	        	
	            let button3 = document.createElement('input');
	        	button3.setAttribute('type', 'button');
	        	button3.classList.add('detail-button');

	        	if(data[i].status == 'Y'){
		        	button3.setAttribute('value', '삭제');
		        	button3.classList.add('delete');
		        	button3.addEventListener('click', function() {
		        	    trashDelete(data[i].trashNo, $(this));
		        	});
	        	} else{
		        	button3.setAttribute('value', '원복');
		        	button3.classList.add('undelete');
		        	button3.addEventListener('click', function() {
		        	    trashUndelete(data[i].trashNo, $(this));
		        	});
	        	}
	        	
	        	cell8.appendChild(button1);
	        	cell8.appendChild(button2);
	        	cell8.appendChild(button3);
	        	
	            row.appendChild(cell1);
	            row.appendChild(cell2);
	            row.appendChild(cell3);
	            row.appendChild(cell4);
	            row.appendChild(cell5);
	            row.appendChild(cell6);
	            row.appendChild(cell7);
	            row.appendChild(cell8);
	            
	            userList.appendChild(row);
	        }
	    }
	    
	    function updateTrashPagination(data) {
	        let userPaging = document.querySelector('.trash-pageBar');
	        let pagination = '';
	        
	        if (!data.empty) {
	            if (!data.first) {
	                pagination += '<div onclick="getTrashList(' + (data.number - 1) + ',\'' + trashSearchSelect + '\',\'' + trashSearchValue + '\')">이전</div>';
	            }
	            for (let i = 0; i < data.totalPages; i++) {
	                if (i >= data.number - 5 && i <= data.number + 5) {
	                    pagination += '<div';
	                    if (i === data.number) {
	                        pagination += ' class="active"';
	                    }
	                    pagination += ' onclick="getTrashList(' + i + ',\'' + trashSearchSelect + '\',\'' + trashSearchValue + '\')">' + (i + 1) + '</div>';
	                }
	            }
	            if (!data.last) {
	                pagination += '<div onclick="getTrashList(' + (data.number + 1) + ',\'' + trashSearchSelect + '\',\'' + trashSearchValue + '\')">다음</div>';
	            }
	        }
	        userPaging.innerHTML = pagination;
	    }
	    
	    function getSuggestionList(page, suggestionSearchSelect, suggestionSearchValue) {
	        $.ajax({
	            url: '${contextPath}/admin/getSuggestionList',
	            type: 'GET',
	            dataType: 'json',
	            data: {page: page, size: 10, sort: suggestionFilterValue, searchSelect: suggestionSearchSelect, searchValue: suggestionSearchValue},
	            success: function(data) {
	            	if(data.content.length != 0){
		                updateSuggestionTable(data.content);
		                updateSuggestionPagination(data);
	            	}
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	            }
	        });
	    }
	
	    function updateSuggestionTable(data) {
	    	let userList = document.querySelector('.suggestion-list');
	        userList.innerHTML = '';
	        for (let i = 0; i < data.length; i++) {
	            let row = document.createElement('tr');
	            row.classList.add('long-tr');
	            
	            let cell1 = document.createElement('td');
	            cell1.textContent = data[i].suggestionNo;
	            
	            let cell2 = document.createElement('td');
	            cell2.innerHTML = data[i].userNo;
	            
	            let cell3 = document.createElement('td');
	            cell3.textContent = data[i].suggestionTitle;
	            
	            let cell4 = document.createElement('td');
	            cell4.textContent = data[i].createDate;
	
	            let cell5 = document.createElement('td');
	            cell5.textContent = data[i].processingStatus;
	            
	            let cell6 = document.createElement('td');
	            cell6.textContent = data[i].processingDate;
	
	            let cell7 = document.createElement('td');
	    		
	            let button1 = document.createElement('input');
	        	button1.setAttribute('type', 'button');
	        	button1.setAttribute('value', '상세보기');
	        	button1.classList.add('detail-button');
	        	button1.addEventListener('click', function() {
	        	    suggestionDetail(data[i].suggestionNo);
	        	});
	        	
	        	cell7.appendChild(button1);
	        	
	            row.appendChild(cell1);
	            row.appendChild(cell2);
	            row.appendChild(cell3);
	            row.appendChild(cell4);
	            row.appendChild(cell5);
	            row.appendChild(cell6);
	            row.appendChild(cell7);
	            
	            userList.appendChild(row);
	        }
	    }
	    
	    function updateSuggestionPagination(data) {
	        let userPaging = document.querySelector('.suggestion-pageBar');
	        let pagination = '';
	        
	        if (!data.empty) {
	            if (!data.first) {
	                pagination += '<div onclick="getSuggestionList(' + (data.number - 1) + ',\'' + suggestionSearchSelect + '\',\'' + suggestionSearchValue + '\')">이전</div>';
	            }
	            for (let i = 0; i < data.totalPages; i++) {
	                if (i >= data.number - 5 && i <= data.number + 5) {
	                    pagination += '<div';
	                    if (i === data.number) {
	                        pagination += ' class="active"';
	                    }
	                    pagination += ' onclick="getSuggestionList(' + i + ',\'' + suggestionSearchSelect + '\',\'' + suggestionSearchValue + '\')">' + (i + 1) + '</div>';
	                }
	            }
	            if (!data.last) {
	                pagination += '<div onclick="getSuggestionList(' + (data.number + 1) + ',\'' + suggestionSearchSelect + '\',\'' + suggestionSearchValue + '\')">다음</div>';
	            }
	        }
	        userPaging.innerHTML = pagination;
	    }
	    
	    function getRequestList(page, requestSearchSelect, requestSearchValue) {
	        $.ajax({
	            url: '${contextPath}/admin/getRequestList',
	            type: 'GET',
	            dataType: 'json',
	            data: {page: page, size: 10, sort: requestFilterValue, searchSelect: requestSearchSelect, searchValue: requestSearchValue},
	            success: function(data) {
	            	if(data.content.length != 0){
		                updateRequestTable(data.content);
		                updateRequestPagination(data);
	            	}
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	            }
	        });
	    }
	
	    function updateRequestTable(data) {
	    	let userList = document.querySelector('.request-list');
	        userList.innerHTML = '';
	        for (let i = 0; i < data.length; i++) {
	            let row = document.createElement('tr');
	            row.classList.add('long-tr');

	            let cell1 = document.createElement('td');
	            cell1.textContent = data[i].requestNo;
	            
	            let cell2 = document.createElement('td');
	            cell2.innerHTML = data[i].trashTitle;
	            
	            let cell3 = document.createElement('td');
	            cell3.textContent = data[i].userName;
	            
	            let cell4 = document.createElement('td');
	            cell4.textContent = data[i].requestTitle;
	
	            let cell5 = document.createElement('td');
	            cell5.textContent = data[i].createDate;
	            
	            let cell6 = document.createElement('td');
	            cell6.textContent = data[i].processingStatus;
	
	            let cell7 = document.createElement('td');
	            cell7.textContent = data[i].processingDate;
	    		
	            let cell8 = document.createElement('td');
	            
	            let button1 = document.createElement('input');
	        	button1.setAttribute('type', 'button');
	        	button1.setAttribute('value', '상세보기');
	        	button1.classList.add('detail-button');
	        	button1.addEventListener('click', function() {
	        	    requestDetail(data[i].requestNo);
	        	});
	        	
	        	cell8.appendChild(button1);
	        	
	            row.appendChild(cell1);
	            row.appendChild(cell2);
	            row.appendChild(cell3);
	            row.appendChild(cell4);
	            row.appendChild(cell5);
	            row.appendChild(cell6);
	            row.appendChild(cell7);
	            row.appendChild(cell8);
	            
	            userList.appendChild(row);
	        }
	    }
	    
	    function updateRequestPagination(data) {
	        let userPaging = document.querySelector('.request-pageBar');
	        let pagination = '';
	        
	        if (!data.empty) {
	            if (!data.first) {
	                pagination += '<div onclick="getRequestList(' + (data.number - 1) + ',\'' + requestSearchSelect + '\',\'' + requestSearchValue + '\')">이전</div>';
	            }
	            for (let i = 0; i < data.totalPages; i++) {
	                if (i >= data.number - 5 && i <= data.number + 5) {
	                    pagination += '<div';
	                    if (i === data.number) {
	                        pagination += ' class="active"';
	                    }
	                    pagination += ' onclick="getRequestList(' + i + ',\'' + requestSearchSelect + '\',\'' + requestSearchValue + '\')">' + (i + 1) + '</div>';
	                }
	            }
	            if (!data.last) {
	                pagination += '<div onclick="getRequestList(' + (data.number + 1) + ',\'' + requestSearchSelect + '\',\'' + requestSearchValue + '\')">다음</div>';
	            }
	        }
	        userPaging.innerHTML = pagination;
	    }

	    function trashWrite(){
	        location.href="${contextPath}/trash/write";
	    }
	    function trashDetail(trashNo){
	        location.href="${contextPath}/trash/detail?trashNo="+trashNo;
	    }
	    function trashUpdate(trashNo, type) {
	        if (type === 'move') {
	            location.href = "${contextPath}/trash/update/" + trashNo;
	        } else if (type === 'blank') {
	            window.open("${contextPath}/trash/update/" + trashNo);
	        }
	    }
	    function trashDelete(trashNo, buttonElement){
	        $.ajax({
	            url: '${contextPath}/trash/delete/'+trashNo,
	            type: 'GET',
	            success: function(data) {
	            	if(data > 0){
						alert("삭제에 성공했습니다");
                        let parent = buttonElement.parent();
                        buttonElement.remove();
                        let button = document.createElement('input');
                    	button.setAttribute('type', 'button');
                    	button.classList.add('detail-button');
       	            	button.setAttribute('value', '원복');
       	            	button.classList.add('undelete');
       	            	button.addEventListener('click', function() {
      	            	    trashUndelete(trashNo, $(this));
                        });
       	            	parent.append(button);
	            	}
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	            }
	        });
	    }
	    function trashUndelete(trashNo, buttonElement){
	        $.ajax({
	            url: '${contextPath}/trash/undelete/'+trashNo,
	            type: 'GET',
	            success: function(data) {
	            	if(data > 0){
						alert("원복에 성공했습니다");
                        let parent = buttonElement.parent();
                        buttonElement.remove();
                        let button = document.createElement('input');
                    	button.setAttribute('type', 'button');
                    	button.classList.add('detail-button');
       	            	button.setAttribute('value', '삭제');
       	            	button.classList.add('delete');
       	            	button.addEventListener('click', function() {
      	            	    trashDelete(trashNo, $(this));
                        });
       	            	parent.append(button);
	            	}
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	            }
	        });
	    }
	    
	    function requestDetail(requestNo){
	        $('#modal').show();
	        
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
	        
	        $.ajax({
	            url: '${contextPath}/trash/request/' + requestNo,
	            type: 'GET',
	            success: function(data) {
	                if (data != null) {
	                    let mcw = document.querySelector('.modal-content-wrapper');
	                    let processingContentHTML = '';
	                    if (data.processingStatus == "N") {
	                        processingContentHTML = '<textarea id="processingContent" name="processingContent" placeholder="처리 내용을 입력하세요"></textarea>';
	                    } else {
	                        processingContentHTML = '<pre> 처리 내용 : ' + data.processingContent + '</pre>';
	                    }
	                    let htmlContent =
	                        '<div>' +
	                        '<div class="modal-title">수정 요청</div>' +
	                        '<div> 요청일 : ' + data.createDate + '</div>' +
	                        '<div class="request-title"> 제목 : ' + data.requestTitle + '</div>' +
	                        '<div class="request-content">' +
	                        '<pre> 요청 내용 : ' + data.requestContent + '</pre>' +
	                        '</div>' +
	                        '<div class="request-content">' + processingContentHTML + '</div>';
	                    if (data.processingStatus == "N") {
	                        htmlContent +=
	                            '<button id="updateBtn" class="requestBtn" onclick="trashUpdate(' + data.trashNo + ',\'blank\')">쓰레기 수정하기</button>' +
	                            '<button id="processingBtn" class="requestBtn" onclick="processingRequest(' + data.requestNo + ')">처리하기</button>';
	                    } else {
	                        htmlContent += '<button id="trashBtn" class="requestBtn" onclick="trashDetail(' + data.trashNo + ')">게시글 보기</button>';
	                    }
	                    htmlContent += '</div></div>';
	                    mcw.innerHTML = htmlContent;
	                }
	            }
	        });
	    }
	    
	    function processingRequest(requestNo){
	    	let processingContent = document.querySelector('#processingContent').value;
	    	if(processingContent.trim() === ""){
	    		alert("내용을 입력해주세요");
	    		$('#processingContent').focus();
	    		return;
	    	}
	    	$.ajax({
	        	url: '${contextPath}/trash/request/update',
	        	type: 'GET',
	        	data:{requestNo, processingContent},
	        	success: function(data){
		        	if(data > 0){
						alert("처리 완료했습니다.");
						$('#modal').hide();
		        	} else {
		        		alert("처리에 실패했습니다. 다시시도해주세요.");
		        	}
	        	}
	        });
	    }
    </script>
</body>
</html>