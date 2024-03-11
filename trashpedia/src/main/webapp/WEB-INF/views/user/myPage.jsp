<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.kks.trashpedia.member.model.vo.*"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>member mypage</title>
<link rel="stylesheet"
	href="${contextPath}/resources/css/user/myPage.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/user/update.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
    var authentication = "${authentication}";
    var loginUser = JSON.parse(authentication);
</script>


<script type="text/javascript">
	console.log(authentication);
// 	console.log(member);

		$(document).ready(function() {
			// 페이지 로드 시 활동 내역 섹션을 보이도록 설정
			$("#activityList").show();
			$("#replyList").show();
			$("#memberInfo").hide();
			$("#reportList").hide();

			// 내활동내역탭을 클릭했을 때
			$("#activityTab").click(function() {
				$("#activityList").show();
				$("#replyList").show();
				$("#memberInfo").hide();
				$("#reportList").hide();
			});
			
			// 내 신고내역탭을 클릭했을 때
			$("#reportTab").click(function() {
				$("#activityList").hide();
				$("#replyList").hide();
				$("#memberInfo").hide();
				$("#reportList").show();
			});
			
			$("#reportDetail").click(function(){
				$("#activityList").hide();
				$("#replyList").hide();
				$("#memberInfo").hide();
				$("#reportList").show();
				$("#reportComment").show();
			});

			// 회원정보 탭을 클릭했을 때
			$("#memberInfoTab").click(function() {
				$("#pwdAuth").show();
				$("#activityList").show();
				$("#replyList").show();
				$("#reportList").hide();
			});
			
			$("#reportclose").click(function(){
				$("#reportComment").hide();
			});
			
			
			$("#close").click(function(){
				$("#pwdAuth").hide();
			});
		});

// 카테고리
    function getCategoryName(categoryNumber) {
        switch(categoryNumber) {
            case '1':
                return "공지게시판";
            case '2':
                return "일반게시판";
            case '3':
                return "건의게시판";
            case '4':
                return "무료나눔게시판";
            case '5':
                return "실천서약";
            case '6':
                return "실천인증";
            case '7':
                return "홍보교육자료";
            case '8':
                return "제도교육자료";
            default:
                return "Unknown";
        }
    }
    
    function boardDetail(postNo, subCategory){
        switch(subCategory) {
            case '1':
            case '2':
            case '3':
            case '4':
                location.href= "${contextPath}/board/community/detail/" + postNo;
                break;
            case '5':
            case '6':
                location.href= "${contextPath}/pledge/detail/" + postNo;
                break;
            case '7':
            case '8':
                location.href= "${contextPath}/information/detail/" + postNo;
                break;
            default:
                console.error("Unknown subCategory: " + subCategory);
        }   
    }
</script>

<style>
.panel {
	border-radius: 0;
}

.panel-body-content {
	padding: 20px;
}

.form-group {
	margin-bottom: 20px;
}

.form-control {
	border-radius: 0;
}

.btn {
	border-radius: 0;
	margin-right: 10px;
}

#pwdAuthCheck {
	background-color: #d9534f; /* 버튼 배경색 */
	border-color: #d43f3a; /* 버튼 테두리 색 */
	color: #fff; /* 버튼 텍스트 색상 */
}

#deletee:hover {
	background-color: #c9302c; /* 버튼 hover 배경색 */
	border-color: #ac2925; /* 버튼 hover 테두리 색 */
}

.btn-default {
	color: #333; /* 버튼 텍스트 색상 */
	background-color: #fff; /* 버튼 배경색 */
	border-color: #ccc; /* 버튼 테두리 색 */
}

.btn-default:hover {
	color: #333; /* 버튼 hover 텍스트 색상 */
	background-color: #e6e6e6; /* 버튼 hover 배경색 */
	border-color: #adadad; /* 버튼 hover 테두리 색 */
}
</style>
</head>
<body class="body-login">
	<jsp:include page="../common/header.jsp" />
	<main>
		<div class="mypage-section">
			<p>마이페이지</p>
			<p>Mypage</p>
		</div>
		<ul class="tabs">
			<li class="tab" id="activityTab">내 활동 내역</a>
			<li class="tab" id="reportTab">내 신고 내역</a>
			<li class="tab" id="memberInfoTab">내 정보 수정</a>
		</ul>

		<!-- 내 게시글 리스트 -->
		<section id="activityList"
			style="max-height: 800px; overflow-y: auto; scroll-margin-top: 50px;">
			<h3>활동 내역(내 게시글)</h3>
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
					<c:if test="${not empty myPost}">
						<c:forEach var="activity" items="${myPost}">
							<tr>
								<td>${activity.createDate}</td>
								<td><script>document.write(getCategoryName('${activity.subCategoryNo}'));</script></td>
								<td>${fn:substring(activity.title, 0, 65)}</td>
								<td>
									<button class="detailBtn"
										onclick="boardDetail(${activity.postNo}, '${activity.subCategoryNo}')">상세보기</button>
								</td>
							</tr>
						</c:forEach>

					</c:if>
					<c:if test="${empty activityList}">
						<tr>
							<td colspan="4">활동 내역이 없습니다.</td>
						</tr>
					</c:if>

					<!-- 추가 활동 내역 행들 -->
				</tbody>
			</table>
		</section>

		<!-- 내 신고 리스트  -->
		<section id="reportList"
			style="max-height: 800px; overflow-y: auto; scroll-margin-top: 50px;">
			<h3>활동 내역(내 댓글)</h3>
			<table>
				<thead>
					<tr>
						<th>신고일</th>
						<th>처리일</th>
						<th>내 신고내용</th>
						<th>처리내용</th>
					</tr>
				</thead>
				<tbody>
					<!-- 여기에 활동 내역 데이터를 동적으로 추가하세요. -->
					<c:if test="${not empty reportList}">
						<c:forEach var="activity" items="${reportList}">
							<tr>
								<td>${activity.reportDate}</td>
								<td>${activity.processingDate}</td>
								<td>${fn:substring(activity.reportContent,0,65)}</td>
								<%-- <td>${fn:substring(activity.processingContent,0,65)}</td> --%>
								<td><button class="detailBtn" id="reportDetail" style="box-sizing:border"
										onclick="reportDetail(${activity.processingContent})">상세보기</button></td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty list}">
						<tr>
							<td colspan="4">활동 내역이 없습니다.</td>
						</tr>
					</c:if>

				</tbody>
			</table>
		</section>




		<!-- 댓글리스트  -->
		<section id="replyList"
			style="max-height: 800px; overflow-y: auto; scroll-margin-top: 50px;">
			<h3>활동 내역(내 댓글)</h3>
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
					<c:if test="${not empty myComment}">
						<c:forEach var="activity" items="${myComment}">
							<tr>
								<td>${activity.createDate}</td>
								<td><script>document.write(getCategoryName('${activity.subCategoryNo}'));</script></td>
								<td>${fn:substring(activity.content,0,65)}</td>
								<td><button class="detailBtn"
										onclick="boardDetail(${activity.postNo}, '${activity.subCategoryNo}')">상세보기</button></td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty list}">
						<tr>
							<td colspan="4">활동 내역이 없습니다.</td>
						</tr>
					</c:if>

				</tbody>
			</table>
		</section>



		<section id="memberInfo" style="padding: 0px;">
			<form id="enroll-form" action="update.me" method="POST"
				id="profileForm">
				<div class="member">
					<!-- 1. 로고 -->
					<div class="logo">프로필수정</div>
					<!-- 2. 필드 -->
					<div class="field">
						<b>아이디</b>
						<div id="id-1">
							<input type="hidden" value="${member.userNo}" name="userNo">
							<input type="text" value="${authentication.userEmail}"
								placeholder="${member.userEmail}" readonly>
						</div>
					</div>
					<div class="field">
						<b>비밀번호</b> <input type="password" name="userPwd" class="userpw"
							id="passwordInput" oninput="updatePasswordNotice()"
							name="userPwd" placeholder="${member.userPwd}" value="${member.userPwd}">
					</div>
					<div class="field">
						<div class="title">
							<p>* 비밀번호 확인</p>
						</div>
						<input class="userpw-confirm" type="password"
							id="confirmPasswordInput" oninput="updatePasswordNotice()">
						<div class="info-pwd">6-15자 이내 영문(대,소문자), 숫자, 특수문자를 조합하셔서
							작성해 주세요.</div>
						<!-- 비밀번호 안내 문구 -->
						<div id="passNotice" class="on-cont">
							<p class="ico-possible">가능</p>
							<p class="ico-impossible">불가능</p>
							<p class="ico-same">일치</p>
							<p class="ico-notsame">불일치</p>
						</div>
					</div>
					<div class="field">
						<b>이름</b> <input type="text" name="userName"
							placeholder="${member.userName}" value="${member.userName}">
					</div>
					<div class="field">
						<b>닉네임</b> <input type="text" name="userNickname"
							placeholder="${authentication.userNickname}"
							value="${member.userNickname}">
					</div>
					<div class="field tel-number">
						<b>휴대전화</b> <input type="tel" name="phone"
							placeholder="${member.phone}" value="${member.phone}">
					</div>
					<!-- 주소입력  -->
					<div class="field address">
						<b>주소</b>
						<div class="zipcode-container">
							<input type="text" id="sample6_postcode" placeholder="우편번호"
								name="zipcode" value="${member.zipcode}" required readonly>
							<input type="button" onclick="sample6_execDaumPostcode();"
								value="우편번호 찾기" name="zipcodeButton" id="findZipBtn">
						</div>
						<div class="address-container">
							<input type="text" id="sample6_address" name="address1"
								placeholder="주소" required readonly name="address1"
								value="${member.address1}">
						</div>
						<div class="details-container">
							<input type="text" id="sample6_detailAddress" name="address3"
								placeholder="상세주소" name="address2" value="${member.address2}">
							<input type="text" id="sample6_extraAddress" name="address2"
								placeholder="참고항목" readonly name="address3"
								value="${member.address3}">
						</div>
					</div>
					<!-- 6. 수정하기 버튼 -->
					<div class="twoBtn">
						<button type="submit" id="updateBtn">수정하기</button>

						<button type="submit" class="btn btn-danger btn-sm"
							data-toggle="modal" data-target="#deleteForm" id="deleteBtn">회원탈퇴</button>
					</div>
				</div>
			</form>
		</section>

		<!-- 신고내용 / 신고처리내용 인증 Modal -->
		<div class="modal" id="reportComment" style="hegith: 250px;">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- 					Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">신고처리 내용</h4>
						<button type="button" class="close" data-dismiss="modal"
							id="reportclose">&times;</button>
					</div>
					<!-- 					Modal body -->
					<form action="pwdAuth.me" method="post" style="margin-top: 50px;"
						id="pwdAuth-userPwd">

						<table class="modalTable">
							<tr>
						

								<input style="border: 1px solid black; height: 200px" readonly value="${processingContentInput}">
							</tr>
						</table>
						<br>


					</form>
				</div>`
			</div>
		</div>


		<!-- 		비밀번호 인증 Modal -->
		<div class="modal" id="pwdAuth" style="hegith: 250px;">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- 					Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">비밀번호 인증</h4>
						<button type="button" class="close" data-dismiss="modal"
							id="close">&times;</button>
					</div>
					<!-- 					Modal body -->
					<form action="pwdAuth.me" method="post" style="margin-top: 50px;"
						id="pwdAuth-userPwd">
						<input type="hidden" value="${authentication.userNo}"
							name="userNo">
						<table class="modalTable">
							<tr>
								<td id="tdPwd">비밀번호</td>

								<td><input type="password" name="userPwd" required
									id="pwdInput"></td>
							</tr>
						</table>
						<br>
						<button class="btn" type="submit" id="pwdAuthCheck">확인</button>

					</form>
				</div>
			</div>
		</div>


	</main>




	<jsp:include page="../common/footer.jsp" />




	<script>
		function submitForm() {
			var username = document.getElementById("username").value;
			var emailDomain = document.getElementById("emailDomain").value;
			let content = username + "@" + emailDomain;
			alert(content);
			$('#hiddenUserEmail').val(content);
		}
	</script>


	<script>
		$(document).ready(function() {
			// 페이지 로드 시 활동 내역 섹션을 보이도록 설정
			$("#activityList").show();
			$("#replyList").show();
			$("#memberInfo").hide();
			$("#reportList").hide();

			// 내활동내역탭을 클릭했을 때
			$("#activityTab").click(function() {
				$("#activityList").show();
				$("#replyList").show();
				$("#memberInfo").hide();
				$("#reportList").hide();
			});
			
			// 내 신고내역탭을 클릭했을 때
			$("#reportTab").click(function() {
				$("#activityList").hide();
				$("#replyList").hide();
				$("#memberInfo").hide();
				$("#reportList").show();
			});
			
			$("#reportDetail").click(function(){
				$("#activityList").hide();
				$("#replyList").hide();
				$("#memberInfo").hide();
				$("#reportList").show();
				$("#reportComment").show();
			});

			// 회원정보 탭을 클릭했을 때
			$("#memberInfoTab").click(function() {
				$("#pwdAuth").show();
				$("#activityList").show();
				$("#replyList").show();
				$("#reportList").hide();
			});
			
			$("#reportclose").click(function(){
				$("#reportComment").hide();
			});
			
			
			$("#close").click(function(){
				$("#pwdAuth").hide();
			});
		});
	</script>

	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							let addr = '';
							let extraAddr = '';

							if (data.userSelectedType === 'R') {
								addr = data.roadAddress;
							} else {
								addr = data.jibunAddress;
							}

							if (data.userSelectedType === 'R') {
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								document.getElementById("sample6_extraAddress").value = extraAddr;
							} else {
								document.getElementById("sample6_extraAddress").value = '';
							}
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}
	</script>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
	</script>


	<script type="text/javascript">
	
	
	// 비밀번호 유효성검사
    function validatePassword() {
         var passwordInput = document.getElementById('passwordInput').value;
         var confirmPasswordInput = document.getElementById('confirmPasswordInput').value;

         var passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[a-zA-Z\d!@#$%^&*]{6,15}$/;
         var passwordMatch = passwordInput === confirmPasswordInput;

         return { isValid: passwordRegex.test(passwordInput), isMatch: passwordMatch };
     }

	function updatePasswordNotice() {
		var passNotice = document.getElementById('passNotice');
		var passwordValidation = validatePassword();
		var passwordInput = document.getElementById('passwordInput');
		var confirmPasswordInput = document.getElementById('confirmPasswordInput');

		passNotice.querySelectorAll('p').forEach(function (element) {
		    element.style.display = 'none';
		});

		if (passwordInput.value !== "") {
			// 비밀번호 유효성 검사
			if (passwordValidation.isValid) {
			    passNotice.querySelector('.ico-possible').style.display = 'block';
			} else {
			    passNotice.querySelector('.ico-possible').style.display = 'none';
			    passNotice.querySelector('.ico-impossible').style.display = 'block';
			    return;
			}

			if (passwordValidation.isMatch && confirmPasswordInput.value !== "") {
			    passNotice.querySelector('.ico-same').style.display = 'block';
			    passNotice.querySelector('.ico-possible').style.display = 'none';
			} else if (!passwordValidation.isMatch && confirmPasswordInput.value !== "") {
			    passNotice.querySelector('.ico-notsame').style.display = 'block';
			    passNotice.querySelector('.ico-possible').style.display = 'none';
			}
		}
    }

	var passwordInput = document.getElementById('passwordInput');
    var confirmPasswordInput = document.getElementById('confirmPasswordInput');
    passwordInput.addEventListener('input', updatePasswordNotice);
    confirmPasswordInput.addEventListener('input', updatePasswordNotice);

    updatePasswordNotice();

    confirmPasswordInput.addEventListener('keyup', updatePasswordNotice);
	
	
	</script>


	<script type="text/javascript">
	// 업데이트
    document.getElementById('updateBtn').addEventListener('click', function(event) {
        event.preventDefault();

        $.ajax({
            url: '/trashpedia/member/update.me', // 업데이트를 처리하는 서버의 엔드포인트
            method: 'POST',
            data: $('#enroll-form').serialize(), // 폼 데이터 직렬화
            success: function(response) {
            	alert('회원님의 정보가 수정되었습니다.');
            	location.reload(); // 페이지 새로고침
            },
            error: function(xhr, status, error) {
                console.error('회원 정보 업데이트 실패:', error);
            }
        });
    });
	
	// 비밀번호 인증
    document.getElementById('pwdAuthCheck').addEventListener('click', function(event) {
        event.preventDefault();

        $.ajax({
            url: '/trashpedia/member/pwdAuth.me', 
            method: 'POST',
            data:   $('#pwdAuth-userPwd').serialize(),
            success: function(response) {
                alert('페스워드 인증 성공');
                $("#memberInfo").show();
                $("#pwdAuth").hide();
                $("#activityList").hide();
                $("#replyList").hide();
            },
            error: function(xhr, status, error) {
            	alert('잘못된 비밀번호입니다.');
            }
        });
    });
	
	
	// 탈퇴하기
    document.getElementById('deleteBtn').addEventListener('click', function(event) {
        event.preventDefault();

        $.ajax({
            url: '/trashpedia/member/delete.me', // 업데이트를 처리하는 서버의 엔드포인트
            method: 'POST',
            data:   $('#enroll-form').serialize(), 
            success: function(response) {
            	alert('회원님이 정상적으로 탈퇴되었습니다.');
            	location.reload(); // 페이지 새로고침
            },
            error: function(xhr, status, error) {
                console.error('회원 탈퇴실패:', error);
            }
        });
    });
	</script>

	<script>
 

    	function reportDetail(processingContent){
				
    	   document.getElementById('processingContentInput').value = processingContent;
    	        
    	}
	</script>






</body>
</html>
