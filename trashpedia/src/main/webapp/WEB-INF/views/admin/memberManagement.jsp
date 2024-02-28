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
					    <select name="condition" id="filterSelect">
					        <option value="userNo" selected>번호</option>
					        <option value="userEmail">이메일</option>
					        <option value="userName">이름</option>
					        <option value="userNickname">닉네임</option>
					    </select>
					</div>
					<table class="content-table user-table">
					    <thead class="content-thead user-thead"></thead>
					    <tbody class="content-tbody user-list"></tbody>
					</table>
					<div class="search-wrapper">
						<select name="condition" id="searchFilterSelect">
			                <option value="userNo" selected>번호</option>
			                <option value="userName">이메일</option>
			                <option value="userName">이름</option>
			                <option value="userNickname">닉네임</option>
						</select>
						<input type="search" id="user-search" placeholder="검색어를 입력하세요">
						<input type="button" id="search" value="검색" onclick="search()">
					</div>
				</div>
				<div class="content-container">
				    <div class="content-title">회원 상세</div>
				    <div class="userDetailList list"></div>
				</div>
			</section>
	    </div>
	</div>
    <script>
	    var isLoading = false;
	    var offset = 0;
	    var selectedValue = 'userNo';
	    var searchSelect = '';
	    var searchValue = '';

	    $(document).ready(function() {
	    	loadData(searchSelect, searchValue);
	    });
	    $('.user-list').scroll(function() {
	        if($(this).scrollTop() + $(this).innerHeight() + 70 >= $(this)[0].scrollHeight) {
	            if (!isLoading) {
	                isLoading = true;
	                loadData(searchSelect, searchValue);
	            }
	        }
	    });
	    $('#filterSelect').change(function(){
	    	selectedValue = $(this).val();
	    	$('.user-list').empty();
	    	offset = 0;
	    	loadData(searchSelect, searchValue);
	    });
	    function search(){
	    	searchSelect = $('#searchFilterSelect').val();
	    	searchValue = $('#search').val();
	    	$('#search').val('');
	    	$('.user-list').empty();
	    	offset = 0;
	    	loadData(searchSelect, searchValue);
	    }

	    function loadData(searchSelect, searchValue) {
	    	if(searchSelect == undefined){
	    		searchSelect = null;
	    		searchValue = null;
	    	}
	        $.ajax({
	            url: '${contextPath}/admin/getMemberList',
	            type: 'GET',
	            dataType: 'json',
	            data: { page: offset, size: 20, sort: selectedValue, searchSelect, searchValue},
	            success: function(data) {
	            	if(data.content.length != 0){
		                updateTable(data);
		                offset += 1;
		                isLoading = false;
	            	}
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	                isLoading = false;
	            }
	        });
	    }

	    function updateTable(data) {
	    	let thead = document.querySelector('.user-thead');
	    	thead.innerHTML = '';
	    	let tr = document.createElement('tr');
	    	let th1 = document.createElement('th');
	    	th1.textContent = '번호';
	    	let th2 = document.createElement('th');
	    	th2.textContent = '이메일';
	    	let th3 = document.createElement('th');
	    	th3.textContent = '이름';
	    	let th4 = document.createElement('th');
	    	th4.textContent = '별명';

	    	tr.appendChild(th1);
	    	tr.appendChild(th2);
	    	tr.appendChild(th3);
	    	tr.appendChild(th4);
	    	thead.appendChild(tr);
	    	
	        let userList = document.querySelector('.user-list');
	        let list = data.content;
	        for (let i = 0; i < list.length; i++) {
	            let row = document.createElement('tr');
	            row.classList.add('content-tr');
	            
	            let cell1 = document.createElement('td');
	            cell1.textContent = list[i].userNo;
	            cell1.classList.add('td-no');
	            
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
	                loadDetailData(list[i].userNo);
	            });
	            userList.appendChild(row);
	        }
	    }

	    function loadDetailData(userNo) {
	        $.ajax({
	            url: '${contextPath}/admin/getMemberListDetail',
	            type: 'GET',
	            dataType: 'json',
	            data: {userNo},
	            success: function(data) {
	            	let userList = document.querySelector('.userDetailList');
	            	userList.innerHTML = '';
    	            let row = '<div class="item">';
    	            row += '<div class="title">번호 :</div>';
    	            row += '<div class="subtitle">'+data.userNo+'</div>';
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="title">이메일 : </div>';
    	            row += '<div class="subtitle">'+data.userEmail+'</div>';
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="title">이름 : </div>';
    	            row += '<div class="subtitle">'+data.userName+'</div>';
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="title">별명 : </div>';
    	            if(data.userNickname == null){
	    	            row += '<div class="subtitle">없음</div>';
    	            } else {
	    	            row += '<div class="subtitle">'+data.userNickname+'</div>';
    	            }
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="title">주소 : </div>';
    	            if(data.address1 == null){
    		            row += '<div class="subtitle">없음</div>';
    	            } else {
	    	            row += '<div class="subtitle">'+data.address1+data.address2+'</div>';
    	            }
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="title">생성일 : </div>';
    	            row += '<div class="subtitle">'+data.createDate+'</div>';
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<input type="button" value="상세보기" onclick="detailmember('+data.userNo+')"/>';
    	            row += '</div>';
    	            userList.innerHTML += row;
    	        },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	                isLoading = false;
	            }
	        });
	    };

        function detailmember(userNo){
            location.href="${contextPath}/admin/member/detail?userNo=" + userNo;
        }
    </script>
</body>
</html>