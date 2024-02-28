<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>memberManagement</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/admin/memberManagement.css">
</head>
<jsp:include page="../common/header.jsp"/>
<body class="body">
    <jsp:include page="../common/sidebar.jsp"/>
    <div class="content-wrapper">
        <div class="content">
			<div class="practice-section">
			    <p>회원관리</p>
			    <p>member management</p>
			</div>
			<section class="content-section">
				<div class="content-container">
				    <div class="content-title-wrapper">
				        <div class="content-title">회원 리스트</div>
				        <div class="content-subtitle">총 <fmt:formatNumber type="number" pattern="#,##0" value="${cam}"/>명</div>
					</div>
					<div class="filter-wrapper">
					    <select name="condition" id="filter-select">
					        <option value="userNo" selected>번호</option>
					        <option value="userEmail">이메일</option>
					        <option value="userName">이름</option>
					        <option value="userNickname">닉네임</option>
					    </select>
					</div>
					<table class="content-table user-table">
					    <thead class="content-thead user-thead">
					    	<tr class="content-tr">
					    		<th>번호</th>
					    		<th>이메일</th>
					    		<th>이름</th>
					    		<th>닉네임</th>
					    	</tr>
					    </thead>
					    <tbody class="content-tbody user-list"></tbody>
					</table>
					<div class="search-wrapper">
						<select name="condition" id="search-filter-select">
			                <option value="userNo" selected>번호</option>
			                <option value="userName">이메일</option>
			                <option value="userName">이름</option>
			                <option value="userNickname">닉네임</option>
						</select>
						<input type="search" class="user-search-input search-input" placeholder="검색어를 입력하세요">
						<input type="button" class="user-search-button search-button" value="검색" onclick="search()">
					</div>
				</div>
				<div class="content-container">
				    <div class="content-title-wrapper">
				    	<div class="content-title">회원 요약</div>
				    </div>
				    <div class="user-detail-list list"></div>
				</div>
			</section>
	    </div>
	</div>
    <script>
	    var memberOffset = 0;
	    var filterValue = 'userNo';
	    var searchSelect = null;
	    var searchValue = null;

	    $(document).ready(function() {
	    	getMemberList(searchSelect, searchValue);
	    });
	    $('.user-list').scroll(function() {
	        if($(this).scrollTop() + $(this).innerHeight() + 70 >= $(this)[0].scrollHeight) {
	        	getMemberList(searchSelect, searchValue);
	        }
	    });
	    $('#filter-select').change(function(){
	    	filterValue = $(this).val();
	    	$('.user-list').empty();
	    	memberOffset = 0;
	    	getMemberList(searchSelect, searchValue);
	    });
	    function search(){
	    	searchSelect = $('#search-filter-select').val();
	    	searchValue = $('#user-search-input').val();
	    	$('#user-search-input').val('');
	    	$('.user-list').empty();
	    	offset = 0;
	    	getMemberList(searchSelect, searchValue);
	    }

	    function getMemberList(searchSelect, searchValue) {
	        $.ajax({
	            url: '${contextPath}/admin/getMemberList',
	            type: 'GET',
	            dataType: 'json',
	            data: { page: memberOffset, size: 20, sort: filterValue, searchSelect: searchSelect, searchValue: searchValue},
	            success: function(data) {
	            	if(data.content.length != 0){
		                updateMemberTable(data.content);
		                memberOffset += 1;
		                isLoading = false;
	            	}
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	                isLoading = false;
	            }
	        });
	    }

	    function updateMemberTable(data) {
	        let userList = document.querySelector('.user-list');
	        for (let i = 0; i < data.length; i++) {
	            let row = document.createElement('tr');
	            row.classList.add('content-tr');
	            
	            let cell1 = document.createElement('td');
	            cell1.textContent = data[i].userNo;
	            
	            let cell2 = document.createElement('td');
	            cell2.textContent = data[i].userEmail;
	            
	            let cell3 = document.createElement('td');
	            cell3.textContent = data[i].userName;
	            
	            let cell4 = document.createElement('td');
	            cell4.textContent = data[i].userNickname;
	            
	            row.appendChild(cell1);
	            row.appendChild(cell2);
	            row.appendChild(cell3);
	            row.appendChild(cell4);
	            
	            row.addEventListener('click', function() {
	                loadMemberDetail(data[i].userNo);
	            });
	            userList.appendChild(row);
	        }
	    }

	    function loadMemberDetail(userNo) {
	        $.ajax({
	            url: '${contextPath}/admin/getMemberListDetail',
	            type: 'GET',
	            dataType: 'json',
	            data: {userNo},
	            success: function(data) {
	            	let userList = document.querySelector('.user-detail-list');
	            	userList.innerHTML = '';
	            	
	            	let row1 = document.createElement('div');
	            	row1.classList.add('item');
	            	let cell1 = document.createElement('div');
	            	cell1.classList.add('title');
	            	cell1.textContent = '번호 : ';
	            	let cell2 = document.createElement('div');
	            	cell2.classList.add('subtitle');
	            	cell2.textContent = data.userNo;
	            	row1.appendChild(cell1);
	            	row1.appendChild(cell2);
	            	
	            	let row2 = document.createElement('div');
	            	row2.classList.add('item');
	            	let cell3 = document.createElement('div');
	            	cell3.classList.add('title');
	            	cell3.textContent = '이메일 : ';
	            	let cell4 = document.createElement('div');
	            	cell4.classList.add('subtitle');
	            	cell4.textContent = data.userEmail;
	            	row2.appendChild(cell3);
	            	row2.appendChild(cell4);

	            	let row3 = document.createElement('div');
	            	row3.classList.add('item');
	            	let cell5 = document.createElement('div');
	            	cell5.classList.add('title');
	            	cell5.textContent = '이름 : ';
	            	let cell6 = document.createElement('div');
	            	cell6.classList.add('subtitle');
	            	cell6.textContent = data.userName;
	            	row3.appendChild(cell5);
	            	row3.appendChild(cell6);

	            	let row4 = document.createElement('div');
	            	row4.classList.add('item');
	            	let cell7 = document.createElement('div');
	            	cell7.classList.add('title');
	            	cell7.textContent = '닉네임 : ';
	            	let cell8 = document.createElement('div');
	            	cell8.classList.add('subtitle');
	            	if(data.userNickname == null){
		            	cell8.textContent = '없음';
	            	} else {
		            	cell8.textContent = data.userNickname;
	            	}
	            	row4.appendChild(cell7);
	            	row4.appendChild(cell8);
	            	
	            	let row5 = document.createElement('div');
	            	row5.classList.add('item');
	            	let cell9 = document.createElement('div');
	            	cell9.classList.add('title');
	            	cell9.textContent = '주소 : ';
	            	let cell10 = document.createElement('div');
	            	cell10.classList.add('subtitle');
	            	if(data.address1 == null){
		            	cell10.textContent = '없음';
	            	} else{
		            	cell10.textContent = data.address1 +' '+ data.address2;
	            	}
	            	row5.appendChild(cell9);
	            	row5.appendChild(cell10);
	            	
	            	let row6 = document.createElement('div');
	            	row6.classList.add('item');
	            	let cell11 = document.createElement('div');
	            	cell11.classList.add('title');
	            	cell11.textContent = '생성일 : ';
	            	let cell12 = document.createElement('div');
	            	cell12.classList.add('subtitle');
	            	cell12.textContent = data.createDate;
	            	row6.appendChild(cell11);
	            	row6.appendChild(cell12);

	            	let button = document.createElement('input');
	            	button.setAttribute('type', 'button');
	            	button.setAttribute('value', '상세보기');
	            	button.classList.add('detail-button');
	            	button.addEventListener('click', function() {
	            	    memberDetail(data.userNo);
	            	});
	            	
    	            userList.appendChild(row1);
    	            userList.appendChild(row2);
    	            userList.appendChild(row3);
    	            userList.appendChild(row4);
    	            userList.appendChild(row5);
    	            userList.appendChild(row6);
    	            userList.appendChild(button);
    	        },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	                isLoading = false;
	            }
	        });
	    };

        function memberDetail(userNo){
            location.href="${contextPath}/admin/member/detail?userNo=" + userNo;
        }
    </script>
</body>
</html>