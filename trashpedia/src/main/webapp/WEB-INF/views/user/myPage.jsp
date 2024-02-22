<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<li class="tab" onclick="showTab('activity')"><a href="myPage_activity.html">내 활동 내역</a>
			<li class="tab" onclick="showTab('notification')"><a href="myPage_alarm.html">내 알림</a>
			<li class="tab" onclick="showTab('profile')"><a href="myPage_update.html">내 정보 수정</a>
		</ul>
		<!-- 활동 내역 -->
		<section id="activityTab">
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
		<section id="replyListTab">
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
		
		<section id="replyListTab">
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
		
		<section>
		<form action="join.me" method="POST">
	    <div class="member">
	        <!-- 1. 로고 -->
	        <div class="logo">회원가입</div>
	        <!-- 2. 필드 -->
	        <div class="field">
	            <b>아이디</b>
	            <div id="id-1">
				    <input type="text" id="username" placeholder="이메일을 입력하세요" name="userEmail" >
				    <span class="id-a">@</span>
				    <input type="text" id="emailDomain">
				</div>
				<script>
				function getEmail(){
					var username = document.getElementById("username").value;
					var emailDomain = document.getElementById("emailDomain").value;
					var email = username + "@" + emailDomain;
					return email;
				}
				</script>
	            <div>
	                <select id="emailSelect" onchange="updateEmailDomain()">
	                    <option value="직접입력" selected>직접입력</option>
	                    <option value="naver.com">naver.com</option>
	                    <option value="gmail.com">gmail.com</option>
	                    <option value="yahoo.com">yahoo.com</option>
	                    <option value="daum.net">daum.net</option>
	                    <option value="hanmail.net">hanmail.net</option>
	                </select>
	            </div>
	        </div>
	        <div class="field">
	            <b>비밀번호</b>
	            <input class="userpw" type="password" id="passwordInput" oninput="updatePasswordNotice()" name="userPwd">
	        </div>
	        <div class="field">
	            <b>비밀번호 재확인</b>
	            <input class="userpw-confirm" type="password" id="confirmPasswordInput" oninput="updatePasswordNotice()">
	            <div class="info-pwd">6-15자 이내 영문(대,소문자), 숫자, 특수문자를 조합하셔서 작성해 주세요.</div>
	            <!-- 비밀번호 안내 문구 -->
	            <div id="passNotice" class="on-cont">
	                <p class="ico-possible">가능</p>
	                <p class="ico-impossible">불가능</p>
	                <p class="ico-same">일치</p>
	                <p class="ico-notsame">불일치</p>
	            </div>
	        </div>
	        <div class="field">
	            <b>이름</b>
	            <input type="text" name="userName">
	        </div>
	        <div class="field">
	            <b>닉네임</b>
	            <input type="text" name="userNickname">
	        </div>
	        <!-- 3. 필드(생년월일) -->
	        <div class="field birth">
	            <b>생년월일</b>
	            <div>
	                <select id="year" name="year">
	                    <option value="">연도</option>
	                    <!-- 1900년부터 현재 연도까지의 옵션을 생성 -->
	                </select>
	                <select id="month" name="month" onchange="updateDays()">
	                    <option value="">월</option>
	                    <option value="1">1월</option>
	                    <option value="2">2월</option>
	                    <option value="3">3월</option>
	                    <option value="4">4월</option>
	                    <option value="5">5월</option>
	                    <option value="6">6월</option>
	                    <option value="7">7월</option>
	                    <option value="8">8월</option>
	                    <option value="9">9월</option>
	                    <option value="10">10월</option>
	                    <option value="11">11월</option>
	                    <option value="12">12월</option>
	                </select>
	                <select id="day" name="day">
	                    <option value="">일</option>
	                    <!-- 일자는 월이 선택되면 자바스크립트로 동적으로 생성 -->
	                </select>
	            </div>
	        </div>
	       
	        <div class="field tel-number">
	            <b>휴대전화</b>
	            <select>
	                <option value="">대한민국 +82</option>
	            </select>
	            <div>
	                <input type="tel" placeholder="전화번호 입력" name="phone">
	                <input type="button" value="인증번호 받기">
	            </div>
	            <input type="number" placeholder="인증번호를 입력하세요">
	        </div>
	        <!-- 주소입력  -->
	        <div class="field address">
	            <div class="zipcode-container">
	                <input type="text" id="sample6_postcode" placeholder="우편번호" name="zipCode" required readonly>
	                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" name="zipcode">
	            </div>
	            <div class="address-container">
	                <input type="text" id="sample6_address" name="address1" placeholder="주소" required readonly name="address1">
	            </div>
	            <div class="details-container">
	                <input type="text" id="sample6_detailAddress" name="address3" placeholder="상세주소" name="address2">
	                <input type="text" id="sample6_extraAddress" name="address2" placeholder="참고항목" readonly name="address3">
	            </div>
	        </div>
	        <!-- 6. 가입하기 버튼 -->
	        <input type="submit" value="가입하기" onclick="validateForm()">
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

	</script>
</body>
</html>
