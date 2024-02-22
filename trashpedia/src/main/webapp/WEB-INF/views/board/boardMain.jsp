<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>커뮤니티</title>
<link rel="stylesheet" href="resources/css/board/boardMain.css">
<link rel="stylesheet" href="/src/main/webapp/resources/css/board/boardMain.css">
</head>
<body>
	<main class="community_html">
		<div id="container">
			<section class="main_top_banner">
				<div id="idx_top">
					<strong>커<span>뮤</span>니<span>티</span></strong>
					<p>안녕하세요. 감사합니다.</p>
				</div>
			</section>
			<section class="main_nav">
				<header>
					<div>
						<ul class="gnb">
							<li><a href="/community/board_list.html">공지사항</a></li>
							<li><a href="#">무료나눔게시판</a></li>
							<li><a href="/community/board_list.html">일반게시판</a></li>
							<li><a href="/information/information_list.html">정보자료실</a></li>
						</ul>
					</div>
				</header>
			</section>
			<section id="idx_board_wrap">
				<div>
					<div class="idx_board">
						<div class="title">
							<a href="/community/board_list.html" class="name">공지사항</a> <a
								href="#" class="more"><img src="img/more.png" alt="더 보기"></a>
						</div>
						<div class="list">
							<ul>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
							</ul>
						</div>
					</div>
					<div class="idx_board">
						<div class="title">
							<a href="/community/board_list.html" class="name">일반게시판</a> <a
								href="#" class="more"><img src="img/more.png" alt="더 보기"></a>
						</div>
						<div class="list">
							<ul>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
							</ul>
						</div>
					</div>
					<div class="idx_board">
						<div class="title">
							<a href="#" class="name">무료나눔게시판</a> <a href="#" class="more"><img
								src="img/more.png" alt="더 보기"></a>
						</div>
						<div class="list">
							<ul>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
							</ul>
						</div>
					</div>
					<div class="idx_board">
						<div class="title">
							<a href="/information/information_list.html" class="name">정보자료실</a>
							<a href="#" class="more"><img src="img/more.png" alt="더 보기"></a>
						</div>
						<div class="list">
							<ul>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
								<li><a href="#">글 제목이 들어갑니다.</a> <span>2019-11-14</span></li>
							</ul>
						</div>
					</div>
				</div>
			</section>
		</div>
	</main>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			// 모든 .idx_board .list를 선택
			var lists = document.querySelectorAll('.idx_board .list ul');

			// 각 리스트에 대하여 실행
			lists.forEach(function(list) {
				// 리스트 내의 모든 항목(li)을 선택
				var items = list.querySelectorAll('li');

				// 6개를 초과하는 항목들을 숨김
				if (items.length > 6) {
					for (var i = 6; i < items.length; i++) {
						items[i].style.display = 'none';
					}
				}
			});
		});
	</script>
</body>
</html>