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
            <section class="search-section">
                <div class="search-container">
                    <div class="search-title">회원 관리</div>
                </div>
            </section>
            <section class="member-section">
                <div class="member-container">
                    <div class="member-title-wrapper">
                        <div class="member-title">회원 리스트</div>
                        <div class="member-subtitle">총 <fmt:formatNumber type="number" pattern="#,##0" value="${cam}"/>명</div>
                    </div>
                    <div class="input">
                        <select name="condition" id="filterSelect">
                            <option value="userNo" selected>번호</option>
                            <option value="userEmail">이메일</option>
                            <option value="userName">이름</option>
                            <option value="userNickname">닉네임</option>
                        </select>
                    </div>
					<table>
					    <thead class="user-thead"></thead>
					    <tbody class="userList list"></tbody>
					</table>
					<select name="condition" id="searchFilterSelect">
                        <option value="userNo" selected>번호</option>
                        <option value="userName">이메일</option>
                        <option value="userName">이름</option>
                        <option value="userNickname">닉네임</option>
                    </select>
                    <input type="search" name="search" id="search" placeholder="Search">
                    <input type="button" id="search" value="검색" onclick="search()">
	            </div>
                <div class="member-container">
                    <div class="member-title">회원 상세</div>
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
	    $('.userList').scroll(function() {
	        if($(this).scrollTop() + $(this).innerHeight() + 70 >= $(this)[0].scrollHeight) {
	            if (!isLoading) {
	                isLoading = true;
	                loadData(searchSelect, searchValue);
	            }
	        }
	    });
	    $('#filterSelect').change(function(){
	    	selectedValue = $(this).val();
	    	$('.userList').empty();
	    	offset = 0;
	    	loadData(searchSelect, searchValue);
	    });
	    function search(){
	    	searchSelect = $('#searchFilterSelect').val();
	    	searchValue = $('#search').val();
	    	$('#search').val('');
	    	$('.userList').empty();
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
	        let userList = document.querySelector('.userList');
	        let list = data.content;
	        for (let i = 0; i < list.length; i++) {
	            let row = document.createElement('tr');
	            
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
    	            row += '<div class="icon">😃</div>';
    	            row += '<div class="title">번호 :</div>';
    	            row += '<div class="subtitle">'+data.userNo+'</div>';
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<div class="title">이메일 : </div>';
    	            row += '<div class="subtitle">'+data.userEmail+'</div>';
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<div class="title">이름 : </div>';
    	            row += '<div class="subtitle">'+data.userName+'</div>';
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<div class="title">별명 : </div>';
    	            if(data.userNickname == null){
	    	            row += '<div class="subtitle">없음</div>';
    	            } else {
	    	            row += '<div class="subtitle">'+data.userNickname+'</div>';
    	            }
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<div class="title">주소 : </div>';
    	            if(data.address1 == null){
    		            row += '<div class="subtitle">없음</div>';
    	            } else {
	    	            row += '<div class="subtitle">'+data.address1+data.address2+'</div>';
    	            }
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="icon">😃</div>';
    	            row += '<div class="title">생성일 : </div>';
    	            row += '<div class="subtitle">'+data.createDate+'</div>';
    	            row += '</div>';
    	            row += '<div class="item">';
    	            row += '<div class="icon">😃</div>';
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