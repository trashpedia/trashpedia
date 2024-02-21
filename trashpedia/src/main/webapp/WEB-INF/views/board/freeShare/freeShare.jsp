<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FREESHARING</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
	
<!-- css -->
<link rel="stylesheet" href="resources/css/board/freeShare/freeShare.css">

	
<!-- slick 라이브러리 CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<!-- slick 라이브러리 테마 CSS (선택사항) -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<!-- slick 라이브러리 JS -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!-- GoogleFonts -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<!-- jQuery -->
<body>
	<jsp:include page="../../common/header.jsp" />


	<!-- 상단바 -->
	<div class="practice-section">
		<p>무료 나눔 게시판</p>
		<p>Reduce Reuse Recycle Recovery</p>
	</div>
	<!-- 상단바 -->


	<!-- 본문 -->
	<div class="inner">
		<main>

			<div class="Content">
				<div class="Container">
					<div class="Title">
						<!-- 무료 나눔 게시판 -->
					</div>
					<button class="btn">
						<a href="./information_write.html">글쓰기</a>
					</button>

					<div class="List">

						<div class="Card">
							<!-- Front -->
							<div class="Front">
								<div class="Image">
									<img
										src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg"
										alt="">
									<div class="Tag">
										<div class="Text">New</div>
									</div>
								</div>
								<div class="TextContent">
									<!-- <div class="Title">
                                        지역
                                    </div> -->
									<div class="Subtitle">상품명</div>
									<div class="IconButtons">
										<div class="Icon">😃</div>
										<div class="Icon">👍</div>
										<div class="Icon">🔥</div>
									</div>
								</div>
							</div>


							<!-- Back -->
							<div class="Back">
								<img
									src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg"
									alt=""> <span> 헌법재판소는 법관의 자격을 가진 9인의 재판관으로 구성하며,
									재판관은 대통령이 임명한다. 국민의 모든 자유와 권리는 국가안전보장·질서유지 또는 공공복리를 위하여 필요한 경우에
									한하여 법률로써 제한할 수 ... 국가는 전통문화의 계승·발전과 민족문화의 창달에 노력하여야 한다. 헌법재판소
									재판관은 정당에 가입하거나 정치에 관여할 수 없다. 모든 국민은 보건에 관하여 국가의 보호를 받는다.... </span>
							</div>


						</div>
						<div class="Card">
							<!-- Front -->
							<div class="Front">
								<div class="Image">
									<img
										src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg"
										alt="">
									<div class="Tag">
										<div class="Text">New</div>
									</div>
								</div>
								<div class="TextContent">
									<!-- <div class="Title">
                                        지역
                                    </div> -->
									<div class="Subtitle">상품명</div>
									<div class="IconButtons">
										<div class="Icon">😃</div>
										<div class="Icon">👍</div>
										<div class="Icon">🔥</div>
									</div>
								</div>
							</div>


							<!-- Back -->
							<div class="Back">
								<img
									src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg"
									alt=""> <span> 헌법재판소는 법관의 자격을 가진 9인의 재판관으로 구성하며,
									재판관은 대통령이 임명한다. 국민의 모든 자유와 권리는 국가안전보장·질서유지 또는 공공복리를 위하여 필요한 경우에
									한하여 법률로써 제한할 수 ... 국가는 전통문화의 계승·발전과 민족문화의 창달에 노력하여야 한다. 헌법재판소
									재판관은 정당에 가입하거나 정치에 관여할 수 없다. 모든 국민은 보건에 관하여 국가의 보호를 받는다.... </span>
							</div>


						</div>
						<div class="Card">
							<!-- Front -->
							<div class="Front">
								<div class="Image">
									<img
										src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg"
										alt="">
									<div class="Tag">
										<div class="Text">New</div>
									</div>
								</div>
								<div class="TextContent">
									<!-- <div class="Title">
                                        지역
                                    </div> -->
									<div class="Subtitle">상품명</div>
									<div class="IconButtons">
										<div class="Icon">😃</div>
										<div class="Icon">👍</div>
										<div class="Icon">🔥</div>
									</div>
								</div>
							</div>


							<!-- Back -->
							<div class="Back">
								<img
									src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg"
									alt=""> <span> 헌법재판소는 법관의 자격을 가진 9인의 재판관으로 구성하며,
									재판관은 대통령이 임명한다. 국민의 모든 자유와 권리는 국가안전보장·질서유지 또는 공공복리를 위하여 필요한 경우에
									한하여 법률로써 제한할 수 ... 국가는 전통문화의 계승·발전과 민족문화의 창달에 노력하여야 한다. 헌법재판소
									재판관은 정당에 가입하거나 정치에 관여할 수 없다. 모든 국민은 보건에 관하여 국가의 보호를 받는다.... </span>
							</div>


						</div>
						<div class="Card">
							<!-- Front -->
							<div class="Front">
								<div class="Image">
									<img
										src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg"
										alt="">
									<div class="Tag">
										<div class="Text">New</div>
									</div>
								</div>
								<div class="TextContent">
									<!-- <div class="Title">
                                        지역
                                    </div> -->
									<div class="Subtitle">상품명</div>
									<div class="IconButtons">
										<div class="Icon">😃</div>
										<div class="Icon">👍</div>
										<div class="Icon">🔥</div>
									</div>
								</div>
							</div>


							<!-- Back -->
							<div class="Back">
								<img
									src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg"
									alt=""> <span> 헌법재판소는 법관의 자격을 가진 9인의 재판관으로 구성하며,
									재판관은 대통령이 임명한다. 국민의 모든 자유와 권리는 국가안전보장·질서유지 또는 공공복리를 위하여 필요한 경우에
									한하여 법률로써 제한할 수 ... 국가는 전통문화의 계승·발전과 민족문화의 창달에 노력하여야 한다. 헌법재판소
									재판관은 정당에 가입하거나 정치에 관여할 수 없다. 모든 국민은 보건에 관하여 국가의 보호를 받는다.... </span>
							</div>


						</div>





					</div>
					<div class="List">

						<div class="Card">
							<!-- Front -->
							<div class="Front">
								<div class="Image">
									<img
										src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg"
										alt="">
									<div class="Tag">
										<div class="Text">New</div>
									</div>
								</div>
								<div class="TextContent">
									<div class="Title">지역</div>
									<div class="Subtitle">상품명</div>
									<div class="IconButtons">
										<div class="Icon">😃</div>
										<div class="Icon">👍</div>
										<div class="Icon">🔥</div>
									</div>
								</div>
							</div>


							<!-- Back -->
							<div class="Back">
								<img
									src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg"
									alt=""> <span> 헌법재판소는 법관의 자격을 가진 9인의 재판관으로 구성하며,
									재판관은 대통령이 임명한다. 국민의 모든 자유와 권리는 국가안전보장·질서유지 또는 공공복리를 위하여 필요한 경우에
									한하여 법률로써 제한할 수 ... 국가는 전통문화의 계승·발전과 민족문화의 창달에 노력하여야 한다. 헌법재판소
									재판관은 정당에 가입하거나 정치에 관여할 수 없다. 모든 국민은 보건에 관하여 국가의 보호를 받는다.... </span>
							</div>


						</div>
						<div class="Card">
							<!-- Front -->
							<div class="Front">
								<div class="Image">
									<img
										src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg"
										alt="">
									<div class="Tag">
										<div class="Text">New</div>
									</div>
								</div>
								<div class="TextContent">
									<div class="Title">지역</div>
									<div class="Subtitle">상품명</div>
									<div class="IconButtons">
										<div class="Icon">😃</div>
										<div class="Icon">👍</div>
										<div class="Icon">🔥</div>
									</div>
								</div>
							</div>


							<!-- Back -->
							<div class="Back">
								<img
									src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg"
									alt=""> <span> 헌법재판소는 법관의 자격을 가진 9인의 재판관으로 구성하며,
									재판관은 대통령이 임명한다. 국민의 모든 자유와 권리는 국가안전보장·질서유지 또는 공공복리를 위하여 필요한 경우에
									한하여 법률로써 제한할 수 ... 국가는 전통문화의 계승·발전과 민족문화의 창달에 노력하여야 한다. 헌법재판소
									재판관은 정당에 가입하거나 정치에 관여할 수 없다. 모든 국민은 보건에 관하여 국가의 보호를 받는다.... </span>
							</div>


						</div>
						<div class="Card">
							<!-- Front -->
							<div class="Front">
								<div class="Image">
									<img
										src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg"
										alt="">
									<div class="Tag">
										<div class="Text">New</div>
									</div>
								</div>
								<div class="TextContent">
									<div class="Title">지역</div>
									<div class="Subtitle">상품명</div>
									<div class="IconButtons">
										<div class="Icon">😃</div>
										<div class="Icon">👍</div>
										<div class="Icon">🔥</div>
									</div>
								</div>
							</div>


							<!-- Back -->
							<div class="Back">
								<img
									src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg"
									alt=""> <span> 헌법재판소는 법관의 자격을 가진 9인의 재판관으로 구성하며,
									재판관은 대통령이 임명한다. 국민의 모든 자유와 권리는 국가안전보장·질서유지 또는 공공복리를 위하여 필요한 경우에
									한하여 법률로써 제한할 수 ... 국가는 전통문화의 계승·발전과 민족문화의 창달에 노력하여야 한다. 헌법재판소
									재판관은 정당에 가입하거나 정치에 관여할 수 없다. 모든 국민은 보건에 관하여 국가의 보호를 받는다.... </span>
							</div>


						</div>
						<div class="Card">
							<!-- Front -->
							<div class="Front">
								<div class="Image">
									<img
										src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg"
										alt="">
									<div class="Tag">
										<div class="Text">New</div>
									</div>
								</div>
								<div class="TextContent">
									<div class="Title">지역</div>
									<div class="Subtitle">상품명</div>
									<div class="IconButtons">
										<div class="Icon">😃</div>
										<div class="Icon">👍</div>
										<div class="Icon">🔥</div>
									</div>
								</div>
							</div>


							<!-- Back -->
							<div class="Back">
								<img
									src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg"
									alt=""> <span> 헌법재판소는 법관의 자격을 가진 9인의 재판관으로 구성하며,
									재판관은 대통령이 임명한다. 국민의 모든 자유와 권리는 국가안전보장·질서유지 또는 공공복리를 위하여 필요한 경우에
									한하여 법률로써 제한할 수 ... 국가는 전통문화의 계승·발전과 민족문화의 창달에 노력하여야 한다. 헌법재판소
									재판관은 정당에 가입하거나 정치에 관여할 수 없다. 모든 국민은 보건에 관하여 국가의 보호를 받는다.... </span>
							</div>


						</div>





					</div>
					<div class="List">

						<div class="Card">
							<!-- Front -->
							<div class="Front">
								<div class="Image">
									<img
										src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg"
										alt="">
									<div class="Tag">
										<div class="Text">New</div>
									</div>
								</div>
								<div class="TextContent">
									<div class="Title">지역</div>
									<div class="Subtitle">상품명</div>
									<div class="IconButtons">
										<div class="Icon">😃</div>
										<div class="Icon">👍</div>
										<div class="Icon">🔥</div>
									</div>
								</div>
							</div>


							<!-- Back -->
							<div class="Back">
								<img
									src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg"
									alt=""> <span> 헌법재판소는 법관의 자격을 가진 9인의 재판관으로 구성하며,
									재판관은 대통령이 임명한다. 국민의 모든 자유와 권리는 국가안전보장·질서유지 또는 공공복리를 위하여 필요한 경우에
									한하여 법률로써 제한할 수 ... 국가는 전통문화의 계승·발전과 민족문화의 창달에 노력하여야 한다. 헌법재판소
									재판관은 정당에 가입하거나 정치에 관여할 수 없다. 모든 국민은 보건에 관하여 국가의 보호를 받는다.... </span>
							</div>


						</div>
						<div class="Card">
							<!-- Front -->
							<div class="Front">
								<div class="Image">
									<img
										src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg"
										alt="">
									<div class="Tag">
										<div class="Text">New</div>
									</div>
								</div>
								<div class="TextContent">
									<div class="Title">지역</div>
									<div class="Subtitle">상품명</div>
									<div class="IconButtons">
										<div class="Icon">😃</div>
										<div class="Icon">👍</div>
										<div class="Icon">🔥</div>
									</div>
								</div>
							</div>


							<!-- Back -->
							<div class="Back">
								<img
									src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg"
									alt=""> <span> 헌법재판소는 법관의 자격을 가진 9인의 재판관으로 구성하며,
									재판관은 대통령이 임명한다. 국민의 모든 자유와 권리는 국가안전보장·질서유지 또는 공공복리를 위하여 필요한 경우에
									한하여 법률로써 제한할 수 ... 국가는 전통문화의 계승·발전과 민족문화의 창달에 노력하여야 한다. 헌법재판소
									재판관은 정당에 가입하거나 정치에 관여할 수 없다. 모든 국민은 보건에 관하여 국가의 보호를 받는다.... </span>
							</div>


						</div>
						<div class="Card">
							<!-- Front -->
							<div class="Front">
								<div class="Image">
									<img
										src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg"
										alt="">
									<div class="Tag">
										<div class="Text">New</div>
									</div>
								</div>
								<div class="TextContent">
									<div class="Title">지역</div>
									<div class="Subtitle">상품명</div>
									<div class="IconButtons">
										<div class="Icon">😃</div>
										<div class="Icon">👍</div>
										<div class="Icon">🔥</div>
									</div>
								</div>
							</div>


							<!-- Back -->
							<div class="Back">
								<img
									src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg"
									alt=""> <span> 헌법재판소는 법관의 자격을 가진 9인의 재판관으로 구성하며,
									재판관은 대통령이 임명한다. 국민의 모든 자유와 권리는 국가안전보장·질서유지 또는 공공복리를 위하여 필요한 경우에
									한하여 법률로써 제한할 수 ... 국가는 전통문화의 계승·발전과 민족문화의 창달에 노력하여야 한다. 헌법재판소
									재판관은 정당에 가입하거나 정치에 관여할 수 없다. 모든 국민은 보건에 관하여 국가의 보호를 받는다.... </span>
							</div>


						</div>
						<div class="Card">
							<!-- Front -->
							<div class="Front">
								<div class="Image">
									<img
										src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg"
										alt="">
									<div class="Tag">
										<div class="Text">New</div>
									</div>
								</div>
								<div class="TextContent">
									<div class="Title">지역</div>
									<div class="Subtitle">상품명</div>
									<div class="IconButtons">
										<div class="Icon">😃</div>
										<div class="Icon">👍</div>
										<div class="Icon">🔥</div>
									</div>
								</div>
							</div>


							<!-- Back -->
							<div class="Back">
								<img
									src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg"
									alt=""> <span> 헌법재판소는 법관의 자격을 가진 9인의 재판관으로 구성하며,
									재판관은 대통령이 임명한다. 국민의 모든 자유와 권리는 국가안전보장·질서유지 또는 공공복리를 위하여 필요한 경우에
									한하여 법률로써 제한할 수 ... 국가는 전통문화의 계승·발전과 민족문화의 창달에 노력하여야 한다. 헌법재판소
									재판관은 정당에 가입하거나 정치에 관여할 수 없다. 모든 국민은 보건에 관하여 국가의 보호를 받는다.... </span>
							</div>


						</div>





					</div>











				</div>

			</div>

			<div class="PagingArea">
				<button id="btn">prev</button>
				<div class="Number">
					<span>1</span>
				</div>
				<div class="Number">
					<span>1</span>
				</div>
				<div class="Number">
					<span>1</span>
				</div>
				<button id="btn">next</button>
			</div>

			<div id="searchPlace">
				<input class="search" type="text" placeholder="검색어 입력"> <span
					class="material-symbols-outlined"> search</span>
			</div>
		</main>
	</div>
	
	<jsp:include page="../../common/footer.jsp" />
	<script>

    </script>
</body>
</html>	