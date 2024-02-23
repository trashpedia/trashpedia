<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.kks.trashpedia.member.model.vo.*" %>
<% Member m = (Member)request.getAttribute("m"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Login Form</title>
	<link rel="stylesheet" href="resources/css/user/myPage.css">
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
</head>
<body class="body-login">
	<jsp:include page="../common/header.jsp"/>
	<main>
		 <div class="mypage-section">
            <p>마이페이지</p>
            <p>Mypage</p>
        </div>
		<ul class="tabs">
			<li class="tab"  id="activityTab">내 활동 내역</a>
			<li class="tab" id="alarmTab">내 알림</a>
			<li class="tab" id="memberInfoTab">내 정보 수정</a>
		</ul>
		
<!-- 내 게시글 리스트 -->
		<section id="activityList">
			<h2>활동 내역(내 게시글)</h2>
			<table>
				<thead>
					<tr>
						<th>날짜</th>
						<th>카테고리</th>
						<th>내가쓴글</th>
						<th>상세보기</th>
					</tr>
				</thead>
				<tbody>
					<!-- 여기에 활동 내역 데이터를 동적으로 추가하세요. -->
					<tr>
						<td>2024-02-15</td>
						<td>커뮤니티</td>
						<td>당근은 어떻게 버려요?당근은 어떻게 버려요?당근은 어떻게 버려요?당근은 어떻게 버려요?</td>
						<td><button id="detailBtn">상세보기</button></td>
					</tr>
					<tr>
						<td>2024-02-15</td>
						<td>커뮤니티</td>
						<td>당근은 어떻게 버려요?</td>
						<td><button id="detailBtn">상세보기</button></td>
					</tr>
					<tr>
						<td>2024-02-15</td>
						<td>커뮤니티</td>
						<td>당근은 어떻게 버려요?당근은 어떻게 버려요?</td>
						<td><button id="detailBtn">상세보기</button></td>
					</tr>
					<tr>
						<td>2024-02-15</td>
						<td>커뮤니티</td>
						<td>당근은 어떻게 버려요?</td>
						<td><button id="detailBtn">상세보기</button></td>
					</tr>
					<tr>
						<td>2024-02-15</td>
						<td>커뮤니티</td>
						<td>당근은 어떻게 버려요?</td>
						<td><button id="detailBtn">상세보기</button></td>
					</tr>
					<!-- 추가 활동 내역 행들 -->
				</tbody>
			</table>
		</section>
		<!-- 댓글리스트  -->
		<section id="replyList">
			<h2>활동 내역(내 댓글)</h2>
			<table>
				<thead>
					<tr>
						<th>날짜</th>
						<th>카테고리</th>
						<th>내 댓글</th>
						<th>상세보기</th>
					</tr>
				</thead>
				<tbody>
					<!-- 여기에 활동 내역 데이터를 동적으로 추가하세요. -->
					<tr>
						<td>2024-02-15</td>
						<td>커뮤니티</td>
						<td>당근은 어떻게 버려요?당근은 어떻게 버려요?당근은 어떻게 버려요?당근은 어떻게 버려요?</td>
						<td><button id="detailBtn">상세보기</button></td>
					</tr>
					<tr>
						<td>2024-02-15</td>
						<td>커뮤니티</td>
						<td>당근은 어떻게 버려요?</td>
						<td><button id="detailBtn">상세보기</button></td>
					</tr>
					<tr>
						<td>2024-02-15</td>
						<td>커뮤니티</td>
						<td>당근은 어떻게 버려요?당근은 어떻게 버려요?</td>
						<td><button id="detailBtn">상세보기</button></td>
					</tr>
					<tr>
						<td>2024-02-15</td>
						<td>커뮤니티</td>
						<td>당근은 어떻게 버려요?</td>
						<td><button id="detailBtn">상세보기</button></td>
					</tr>
					<tr>
						<td>2024-02-15</td>
						<td>커뮤니티</td>
						<td>당근은 어떻게 버려요?</td>
						<td><button id="detailBtn">상세보기</button></td>
					</tr>
				</tbody>
			</table>
		</section>
		
		<section id="alarmList">
			<h2>활동 내역(내 댓글)</h2>
			<table>
				<thead>
					<tr>
						<th>날짜</th>
						<th>카테고리</th>
						<th>내 댓글</th>
						<th>상세보기</th>
					</tr>
				</thead>
				<tbody>
					<!-- 여기에 활동 내역 데이터를 동적으로 추가하세요. -->
					<tr>
						<td>2024-02-15</td>
						<td>커뮤니티</td>
						<td>당근은 어떻게 버려요?당근은 어떻게 버려요?당근은 어떻게 버려요?당근은 어떻게 버려요?</td>
						<td><button id="detailBtn">상세보기</button></td>
					</tr>
					<tr>
						<td>2024-02-15</td>
						<td>커뮤니티</td>
						<td>당근은 어떻게 버려요?</td>
						<td><button id="detailBtn">상세보기</button></td>
					</tr>
					<tr>
						<td>2024-02-15</td>
						<td>커뮤니티</td>
						<td>당근은 어떻게 버려요?당근은 어떻게 버려요?</td>
						<td><button id="detailBtn">상세보기</button></td>
					</tr>
					<tr>
						<td>2024-02-15</td>
						<td>커뮤니티</td>
						<td>당근은 어떻게 버려요?</td>
						<td><button id="detailBtn">상세보기</button></td>
					</tr>
					<tr>
						<td>2024-02-15</td>
						<td>커뮤니티</td>
						<td>당근은 어떻게 버려요?</td>
						<td><button id="detailBtn">상세보기</button></td>
					</tr>
				</tbody>
			</table>
		</section>
		
<section id="memberInfo">
	<form id="enroll-form" action="update.me" method="POST" id="profileForm" >
	    <div class="member">
	        <!-- 1. 로고 -->
	        <div class="logo">프로필수정</div>
	        <!-- 2. 필드 -->
	        <div class="field">
	            <b>아이디</b>
	            <div id="id-1">
	                <!-- <input type="text" id="username" placeholder="이메일을 입력하세요">
	                <span class="id-a">@</span>
	                <input type="text" id="emailDomain"> -->
	                <input type="hidden" id ="hiddenUserEmail" name="userEmail">
	                 <input type="text" name="username" value="<%= m.getUserEmail() %>" readonly>
	            </div>
	        </div>
	         <div class="field">
	            <b>비밀번호</b>
	            <input class="userpw" type="password" id="passwordInput" oninput="updatePasswordNotice()" name="userPwd"  value="<%= m.getUserPwd() %>" readonly>
	        </div>
	        <div class="field">
	            <b>이름</b>
	            <input type="text" name="userName" value="<%=m.getUserName() %>" required>
	        </div>
	        <div class="field">
	            <b>닉네임</b>
	            <input type="text" name="userNickname" value="<%=m.getUserNickname() %>" required>
	        </div>
	        <div class="field tel-number">
	            <b>휴대전화</b>
	            <!-- <select>
	                <option value="">대한민국 +82</option>
	            </select>
	            <div>
	                <input type="tel" placeholder="전화번호 입력" name="phone">
	                <input type="button" value="인증번호 받기">
	            </div>
	            <input type="number" placeholder="인증번호를 입력하세요"> -->
	            <input type="tel"  name="phone" value="<%= m.getPhone() %>">
	        </div>
	        <!-- 주소입력  -->
	        <div class="field address">
	            <div class="zipcode-container">
	                <input type="text" id="sample6_postcode" placeholder="우편번호" name="zipCode" required readonly>
	                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" name="zipcode" value="<%= m.getZipcode()%>"/>
	            </div>
	            <div class="address-container">
	                <input type="text" id="sample6_address" name="address1" placeholder="주소" required readonly name="address1" value="<%= m.getAddress1()%>">
	            </div>
	            <div class="details-container">
	                <input type="text" id="sample6_detailAddress" name="address3" placeholder="상세주소" name="address2"  value="<%= m.getAddress2()%>">
	                <input type="text" id="sample6_extraAddress" name="address2" placeholder="참고항목" readonly name="address3"  value="<%= m.getAddress3()%>">
	            </div>
	        </div>
	        <!-- 6. 수정하기 버튼 -->
	        <a href="${contextPath}/update.me" class="btn btn-warning btn-sm">수정</a>
	        <!-- 7. 푸터 -->
	        <div class="member-footer">
	            <div>
	                <a href="#none">이용약관</a>
	                <a href="#none">개인정보처리방침</a>
	                <a href="#none">책임의 한계와 법적고지</a>
	                <a href="#none">회원정보 고객센터</a>
	            </div>
	            <span><a href="#none">Trashexpedia Corp.</a></span>
	        </div>
	    </div>
	    </form>
	    </section>
	</main>
	<jsp:include page="../common/footer.jsp"/>
	<script>
				function submitForm(){
					var username = document.getElementById("username").value;
					var emailDomain = document.getElementById("emailDomain").value;
					let content = username + "@" + emailDomain;
					alert(content);
					$('#hiddenUserEmail').val(content);
				}
	</script>
	<script>
	$(document).ready(function(){
    // 페이지 로드 시 활동 내역 섹션을 보이도록 설정
    $("#activityList").show();
    $("#replyList").show();
    $("#alarmList").hide();
    $("#memberInfo").hide();
    
    // 내활동내역탭을 클릭했을 때
    $("#activityTab").click(function(){
        $("#activityList").show();
        $("#replyList").show();
        $("#alarmList").hide();
        $("#memberInfo").hide();
    });
    
    // 내 알림 탭을 클릭했을 때
    $("#alarmTab").click(function(){
        $("#alarmList").show();
        $("#activityList").hide();
        $("#replyList").hide();
        $("#memberInfo").hide();
    });
    
    // 회원정보 탭을 클릭했을 때
    $("#memberInfoTab").click(function(){
        $("#memberInfo").show();
        $("#activityList").hide();
        $("#replyList").hide();
        $("#alarmList").hide();
    });
});
	</script>
</body>
</html>
