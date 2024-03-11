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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/admin/memberManagement.css">
</head>
<%-- <jsp:include page="../common/header.jsp"/> --%>
<body class="body">
    <jsp:include page="../common/sidebar.jsp"/>
    <div class="content-wrapper">
        <div class="content">
			<div class="practice-section">
			    <p id="practice-section-title"><span class="material-symbols-outlined">patient_list</span>회원관리</p>
			    <p>Member management</p>
			</div>
			<section class="content-section">
				<div class="content-container">
				    <div class="content-title-wrapper"></div>
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
	    	getMemberList(0, searchSelect, searchValue);
	    });
	    
	    $('.user-list').off('scroll').on('scroll', function() {
	        if($(this).scrollTop() + $(this).innerHeight() + 70 >= $(this)[0].scrollHeight) {
	            getMemberList(memberOffset, searchSelect, searchValue);
	        }
	    });

	    $('#filter-select').change(function(){
	        filterValue = $(this).val();
	        $('.user-list').empty();
	        memberOffset = 0;
	        getMemberList(0, searchSelect, searchValue);
	    });

	    function search(){
	        memberOffset = 0;
	        searchSelect = $('#search-filter-select').val();
	        searchValue = $('.user-search-input').val();
	        $('.user-search-input').val('');
	        $('.user-list').empty();
	        getMemberList(memberOffset, searchSelect, searchValue);
	    }

	    function getMemberList(page, searchSelect, searchValue) {
	        $.ajax({
	            url: '${contextPath}/admin/getMemberList',
	            type: 'GET',
	            dataType: 'json',
	            data: { page: page, size: 20, sort: filterValue, searchSelect: searchSelect, searchValue: searchValue},
	            success: function(data) {
	            	if(data.content.length != 0){
		                memberOffset += 1;
		                updateMemberTable(data);
	            	}
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	            }
	        });
	    }

	    function updateMemberTable(data) {
	    	let list = data.content;
	        let title = document.querySelector('.content-title-wrapper');
	        title.innerHTML = '';
	        
	        let div1 = document.createElement('div');
	        div1.classList.add('content-title');
	        div1.textContent = '회원 리스트';
	        
	        let div2 = document.createElement('div');
	        div2.classList.add('content-subtitle');
	        div2.textContent = '총'+data.totalElements+'명';
	        
	        title.appendChild(div1);
	        title.appendChild(div2);
	        
	        let userList = document.querySelector('.user-list');
	        for (let i = 0; i < list.length; i++) {
	            let row = document.createElement('tr');
	            row.classList.add('content-tr');
	            
	            let cell1 = document.createElement('td');
	            cell1.textContent = list[i].userNo;
	            
	            let cell2 = document.createElement('td');
	            cell2.textContent = list[i].userEmail;
	            
	            let cell3 = document.createElement('td');
	            cell3.textContent = list[i].userName;
	            
	            let cell4 = document.createElement('td');
	            cell4.textContent = list[i].userNickname;
	            
	            row.appendChild(cell1);
	            row.appendChild(cell2);
	            row.appendChild(cell3);
	            row.appendChild(cell4);
	            
	            row.addEventListener('click', function() {
	                loadMemberDetail(list[i].userNo);
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
                    
                    let userDetails = ['userNo', 'userEmail', 'userName', 'userNickname', 'address1', 'address2', 'createDate'];
                    for(let i = 0; i < userDetails.length; i++) {
                        let row = document.createElement('div');
                        row.classList.add('item');
                        let title = document.createElement('div');
                        title.classList.add('title');
                        title.textContent = userDetails[i] + ' : ';
                        let subtitle = document.createElement('div');
                        subtitle.classList.add('subtitle');
                        if(data[userDetails[i]] == null){
                            subtitle.textContent = '없음';
                        } else {
                            subtitle.textContent = data[userDetails[i]];
                        }
                        row.appendChild(title);
                        row.appendChild(subtitle);
                        userList.appendChild(row);
                    }
                    
                    let button = document.createElement('input');
                    button.setAttribute('type', 'button');
                    button.setAttribute('value', '상세보기');
                    button.classList.add('detail-button');
                    button.addEventListener('click', function() {
                        memberDetail(data.userNo);
                    });
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