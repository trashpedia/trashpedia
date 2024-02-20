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
		<div class="banner">
			<p class="mypage-logo">마이페이지</p>
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
	</main>
	<jsp:include page="../common/footer.jsp"/>
	<script>

	</script>
</body>
</html>
