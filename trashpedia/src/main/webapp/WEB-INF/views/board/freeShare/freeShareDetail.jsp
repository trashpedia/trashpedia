<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dictonary</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<!-- Swiper -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<!-- css -->
<link rel="stylesheet"
	href="resources/css/board/freshShare/freeShareDetail.css">
</head>
<body>
	<jsp:include page="../../common/header.jsp" />

	<div class="practice-section">
		<p>무료 나눔 상세 페이지</p>
		<p>Reduce Reuse Recycle Recovery</p>
	</div>



	<div class="inner">

		<main>
			<!--view-->
			<div class="board_wrap">
				<div class="board_title">
					<strong>제목</strong>
				</div>

				<div class="board_view_wrap">
					<div class="board_view">
						<div class="info">
							<dl>
								<dt>번호</dt>
								<dd>${trashNo}</dd>
							</dl>
							<dl>
								<dt>글쓴이</dt>
								<dd>${trashWriter}</dd>
							</dl>
							<dl>
								<dt>작성일</dt>
								<dd>${trashCreate}</dd>
							</dl>
							<dl>
								<dt>조회</dt>
								<dd>${trashViews}</dd>
							</dl>
						</div>
						<div class="cont">
							<div class="list_wrap">
								<div class="container">
									<img
										src="${imageUrl}"
										alt="">
									<div class="content">
										<span>${trashContent}</span>
									</div>

								</div>

							</div>



						</div>
					</div>
					<div class="bt_wrap">
						<a href="/community/board_list.html" class="on">목록</a> <a
							href="/community/board_edit.html">수정</a>
					</div>
				</div>




				<div class="reply-outer">
					<div class="reply-outer-top-area">
						<span class="reply_title"> 댓글 </span> | <span class="reply_count">224</span>
					</div>

					<div class="reply-outer-content-area">
						<table class="reply-table">
							<thead>
								<tr class="reply-table-title">
									<th>작성자</th>
									<th>내용</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>User</td>
									<td>
										<p>안녕하세요. 반갑습니다.</p>
										<div class="comment-buttons">
											<button class="btn-edit">수정</button>
											<button class="btn-delete">삭제</button>
										</div>
									</td>
									<td>2023-02-18</td>
								</tr>
								<tr>
									<td>User</td>
									<td>
										<p>다른사람이 쓴 댓글</p>
									</td>
									<td>2023-02-18</td>
								</tr>
								<tr>
									<td>User</td>
									<td>
										<p>나랏말싸미 듕귁에 달아 문자와로 서로 사맛디 아니할쎄</p>
										<div class="comment-buttons">
											<button class="btn-edit">수정</button>
											<button class="btn-delete">삭제</button>
										</div>
									</td>
									<td>2023-02-18</td>
								</tr>
								<tr>
									<td>User</td>
									<td>
										<p>댓글 내용</p>

									</td>
									<td>2023-02-18</td>
								</tr>
								<tr>
									<td>User</td>
									<td>
										<p>댓글 내용</p>
									</td>
									<td>2023-02-18</td>
								</tr>
								<tr>
									<td>User</td>
									<td>
										<p>댓글 내용</p>

									</td>
									<td>2023-02-18</td>
								</tr>

							</tbody>
						</table>

						<div class="paging-button">
							<button class="pagingBtn" id="prevBtn"><</button>
							<button class="pagingBtn">1</button>
							<button class="pagingBtn">2</button>
							<button class="pagingBtn">3</button>
							<button class="pagingBtn">4</button>
							<button class="pagingBtn">5</button>
							<button class="pagingBtn" id="nextBtn">></button>
						</div>

					</div>
				</div>

			</div>
		</main>
	</div>
	
	<jsp:include page="../../common/footer.jsp" />
	<script>
		var swiper = new Swiper(".swiper-container", {
			spaceBetween : 10,
			centeredSlides : true,
			autoplay : {
				delay : 500,
				disableOnInteraction : false,
			},
			slidesPerView : 3,
			pagination : {
				el : ".swiper-pagination",
				clickable : true,
			},
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev",
			},

			scrollbar : {
				el : '.swiper-scrollerbar',
			},
		});
	</script>
</body>
</html>