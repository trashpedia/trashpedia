<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
	<link rel="stylesheet" href="/css/board/css.css">
	<link rel="stylesheet" href="/css/board/board_common.css">
	<link rel="stylesheet" href="../css/community/community.css">
	<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<!-- css -->
	<!-- slick 라이브러리 CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
	<!-- slick 라이브러리 테마 CSS (선택사항) -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
	<!-- slick 라이브러리 JS -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<main class="board_html">
		<!-- write -->
		<div class="board_wrap">
			<div class="board_title">
				<strong>게시글 등록하기</strong>
				<p>분리수고 잘합시다</p>
			</div>
			<div id="writeBoard-content"></div>
			<div class="bt_wrap">
				<a href="/community/board_list.html" class="on">등록</a><a href="/community/board_list.html">취소</a>
			</div>
		</div>
	</main>
	<jsp:include page="../common/footer.jsp"/>
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<script>
		const editor = new toastui.Editor({
			el : document.querySelector('#writeBoard-content'),
			height : '600px',
			initialEditType : 'wysiwyg',
			initialValue : '',
			previewStyle : 'vertical'
		});
		//  header footer 로딩 , 나중에 지울거
		$(function() {
			$("#header").load("../home/header.html");
			$("#footer").load("footer.html");
		})
		// 최근 업데이트 된 쓰레기 슬라이드
		$(document).ready(function() {
			$('#recently-garbage-slider .recently-garbage-inner').slick({
				slidesToShow : 4,
				slidesToScroll : 1,
				autoplay : true,
				autoplaySpeed : 2500, // 2.5초마다 슬라이드 전환
				dots : true,
				appendDots : $('#recently-garbage-slider .slick-dots')
			});
		});
		// 스크롤 버튼 클릭 시  body를 1005px 아래로 스크롤
		$(document).ready(function() {
			$("#scrollButton").click(function() {
				$("body, html").animate({
					scrollTop : 1005
				}, 1000);
			});
		});
		// 스크롤 변화에 따른 header 스타일 변경
		window.addEventListener('scroll',function() {
			var header = document.querySelector('.header');
			var headerLinks = document
					.querySelectorAll('.header-nav ul li a');
			var headerRihtLink = document
					.querySelectorAll('.header-right li a, .header-right li span');

			if (window.scrollY > 100) {
				header.classList.add('header-scroll');
				headerLinks.forEach(function(link) {
					link.style.color = 'black';
					link.style.fontWeight = '600';
				});
				headerRihtLink.forEach(function(link) {
					link.style.color = 'rgb(88, 88, 88)';
				});

			} else {
				header.classList.remove('header-scroll');
				headerLinks.forEach(function(link) {
					link.style.color = ''; // 링크 텍스트 색상 초기화
				});
				headerRihtLink.forEach(function(link) {
					link.style.color = ''; // 링크 텍스트 색상 초기화
				});

			}
		});
		document.addEventListener("DOMContentLoaded", function() {
			var img = document.querySelector('.backgroundImg img');

			img.addEventListener('load', function() {
				img.classList.add('loaded');
			});
		});
	</script>
</body>
</html>
