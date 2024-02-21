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
					<p>부제목</p>
				</div>

				<div class="board_view_wrap">
					<div class="board_view">
						<div class="info">
							<dl>
								<dt>번호</dt>
								<dd>1</dd>
							</dl>
							<dl>
								<dt>글쓴이</dt>
								<dd>김이름</dd>
							</dl>
							<dl>
								<dt>작성일</dt>
								<dd>2021.1.16</dd>
							</dl>
							<dl>
								<dt>조회</dt>
								<dd>33</dd>
							</dl>
						</div>
						<div class="cont">
							<div class="list_wrap">
								<div class="container">
									<img
										src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg"
										alt="">
									<div class="content">
										<span>재판의 심리와 판결은 공개한다. 다만, 심리는 국가의 안전보장 또는 안녕질서를 방해하거나
											선량한 풍속을 해할 염려가 있을 때에는 법원의 결정으로 공개하지 아니할 수 있다.... 대통령은 조국의 평화적
											통일을 위한 성실한 의무를 진다. 법관은 헌법과 법률에 의하여 그 양심에 따라 독립하여 심판한다.
											대통령후보자가 1인일 때에는 그 득표수가 선거권자 총수의 3분의 1 이상이 아니면 대통...</span>
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