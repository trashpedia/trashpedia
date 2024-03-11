<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>join member</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/user/join.css">
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <main>
    <form id="enroll-form" action="${sns != null ? 'socialJoin' : 'join'}" method="post">
	    <div class="member">
	        <div class="logo"><p>회원가입</p></div>
        	<div class="field">
	        	<div class="title"><p>* 이메일</p></div>
	            <div class="id-wrapper">
	            <div>
	            	<div class="id-content">
		            	<c:if test="${sns != null}">
			                <input type="text" id="id" placeholder="이메일을 입력하세요" value="${sns != null ? sns.email.split('@')[0] : ''}" disabled>
			                <span class="id-a">@</span>
			                <input type="text" id="emailDomain" value="${sns != null ? sns.email.split('@')[1] : ''}" disabled>
		                </c:if>
		            	<c:if test="${sns == null}">
			                <input type="text" id="id" placeholder="이메일을 입력하세요">
			                <span class="id-a">@</span>
			                <input type="text" id="emailDomain">
		                </c:if>
		                <input type="hidden" id ="hiddenUserEmail" name="userEmail">
		                <input type="hidden" id ="socialId" name="socialId" value="${socialId}">
		                <input type="hidden" id ="socialType" name="socialType" value="${socialType}">
	            	</div>
	            </div>
	            	<c:if test="${sns != null}">
		                <select id="emailSelect" onchange="updateEmailDomain()" disabled>
		                    <option value="직접입력" selected>직접입력</option>
		                    <option value="naver.com">naver.com</option>
		                    <option value="gmail.com">gmail.com</option>
		                    <option value="yahoo.com">yahoo.com</option>
		                    <option value="daum.net">daum.net</option>
		                    <option value="hanmail.net">hanmail.net</option>
		                </select>
			            <button type="button" onclick="emailCheck()" class="doubleCheckBtn" id ="emailCheckBtn" disabled>이메일인증</button>
		            </c:if>
	            	<c:if test="${sns == null}">
		                <select id="emailSelect" onchange="updateEmailDomain()">
		                    <option value="직접입력" selected>직접입력</option>
		                    <option value="naver.com">naver.com</option>
		                    <option value="gmail.com">gmail.com</option>
		                    <option value="yahoo.com">yahoo.com</option>
		                    <option value="daum.net">daum.net</option>
		                    <option value="hanmail.net">hanmail.net</option>
		                </select>
			            <button type="button" onclick="emailCheck()" class="doubleCheckBtn" id ="emailCheckBtn">이메일인증</button>
		            </c:if>
	            </div>
	            <div id="code-input">
	                <input type="text" id="code" class="code-input" placeholder="코드를 입력하세요">
	                <c:if test="${sns != null}">
		            	<button type="button" onclick="codeCheck()" class="doubleCheckBtn" id ="codeCheckBtn" disabled>인증확인</button>
		            </c:if>
	                <c:if test="${sns == null}">
		            	<button type="button" onclick="codeCheck()" class="doubleCheckBtn" id ="codeCheckBtn">인증확인</button>
		            </c:if>
	            </div>
	        </div>
	        <div class="field">
	            <div class="title"><p>* 비밀번호</p></div>
	            <input class="userpw" type="password" id="passwordInput" oninput="updatePasswordNotice()" name="userPwd">
	        </div>
	        <div class="field">
	            <div class="title"><p>* 비밀번호 확인</p></div>
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
	            <div class="title"><p>* 이름</p></div>
	            <c:if test="${sns != null}">
	            	<input type="text" id="userName" name="userName" value="${sns.name}" disabled>
	        	</c:if>
	            <c:if test="${sns == null}">
	            	<input type="text" id="userName" name="userName">
	        	</c:if>
	        </div>
	        <div class="field">
	            <div class="title"><p>닉네임</p></div>
	            <input type="text" name="userNickname">
        	</div>
	        <div class="field tel-number">
	            <div class="title"><p>* 휴대전화</p></div>
	            <div>
	            	<c:if test="${socialType == 'kakao'}">
						<c:set var="formattedPhoneNumber" value="${fn:replace(fn:replace(fn:replace(sns.phone_number, '+82', '0'), '-', ''), ' ', '')}" />
					</c:if>
					<c:if test="${socialType == 'naver'}">
						<c:set var="formattedPhoneNumber" value="${fn:replace(fn:replace(sns.mobile, '-', ''), ' ', '')}" />
					</c:if>
	            	<c:if test="${sns != null}">
		                <input type="tel" placeholder="전화번호 입력" name="phone" id="phone" value="${formattedPhoneNumber}" disabled>
		                <input type="button" value="인증번호 받기">
		            </c:if>
	            	<c:if test="${sns == null}">
		                <input type="tel" placeholder="전화번호 입력" name="phone" id="phone">
		                <input type="button" value="인증번호 받기">
		            </c:if>
	            </div>
	            <input type="number" placeholder="인증번호를 입력하세요">
	        </div>
	        <div class="field address">
	        	<div class="title"><p>주소</p></div>
	            <div class="zipcode-container">
	                <input type="number" id="sample6_postcode" placeholder="우편번호" name="zipcode" readonly>
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
	        <input type="button" value="가입하기" onclick="validateForm()">
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
	</main>
	<jsp:include page="../common/footer.jsp"/>
	<script>
		let emailCodeCheck = '';
		$(document).ready(function() {
			$("#code-input").hide();
		});
		
		document.querySelectorAll('input').forEach(function(input) {
		    input.addEventListener('keydown', function(event) {
		        if (event.key === 'Enter') {
		            event.preventDefault();
		        }
		    });
		});
		
		function validateEmailId() {
		    var idInput = document.getElementById('id').value;
		    var koreanRegex = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

		    if (koreanRegex.test(idInput)) {
		        alert('한글은 입력할 수 없습니다.');
		        document.getElementById('id').value = '';
		        return false;
		    }
		    return true;
		}
	
		function emailCheck(){
			let id = document.getElementById("id").value;
			let emailDomain = document.getElementById("emailDomain").value;
			let userEmail = id + "@" + emailDomain;

			if (id.trim() === "" || emailDomain.trim() === "") {
				$("#id").focus();
	            alert("이메일을 입력해주세요.");
	            return
	        }
			
			if (!validateEmailId()) {
				$("#id").focus();
		        return;
		    }
			
			$.ajax({
				url: "emailCheck",
				data:{userEmail : userEmail},
				success:function(result){
					if(result > 0){
						alert("이미 사용 중입니다.");
						$("#id").val("");
			            $("#id").focus();
			            $("#emailDomain").prop("disabled", false);
					} else {
						$.ajax({
							url: "/trashpedia/auth/emailCode",
							data: {userEmail : userEmail},
							success: function(result){
								alert(userEmail + "로 코드를 보냈습니다");
								emailCodeCheck = result;
								$("#id").prop("disabled", true);
					            $("#emailDomain").prop("disabled", true);
					            $("#emailSelect").prop("disabled", true);
					            $("#emailCheckBtn").prop("disabled", true);
					            $("#code-input").show();
							},
							error: function (xhr, status, error){
								console.log("이메일 중복 에러 :", status, error);
							}
						})
					}
				},
				error:function (xhr, status, error){
					console.log("이메일 중복 에러 :", status, error);
				}
			});
		};
		
		function codeCheck(){
			let inputCode = document.getElementById("code").value;
			if(emailCodeCheck === inputCode){
				$("#code").prop("disabled", true);
	            $("#codeCheckBtn").prop("disabled", true);
				$("#passwordInput").focus();
				alert("인증에 성공했습니다");
			} else {
				alert("코드 확인에 실패했습니다. 코드를 확인해주세요");
			}
		}
		
	
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
        
        function updateEmailDomain() {
	        var emailUsernameInput = document.getElementById('emailUsername');
	        var emailDomainInput = document.getElementById('emailDomain');
	        var emailSelect = document.getElementById('emailSelect');
	
	        if (emailSelect.value === '직접입력') {
	            emailDomainInput.value = "";
	        } else {
	            emailDomainInput.value = emailSelect.value;
	        }
	    }
	
		function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                let addr = '';
	                let extraAddr = '';
	
	                if (data.userSelectedType === 'R') {
	                    addr = data.roadAddress;
	                } else {
	                    addr = data.jibunAddress;
	                }
	
	                if(data.userSelectedType === 'R'){
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
		function validateForm() {
		    var isFormValid = true;

		    var fieldsToCheck = [
		        { id: 'id', name: '이메일' },
		        { id: 'emailDomain', name: '이메일 도메인' },
		        { id: 'passwordInput', name: '비밀번호' },
		        { id: 'confirmPasswordInput', name: '비밀번호 확인' },
		        { id: 'userName', name: '이름' },
		        { id: 'phone', name: '번호' }
		    ];

		    for (var i = 0; i < fieldsToCheck.length; i++) {
		        var field = fieldsToCheck[i];
		        var element = document.getElementById(field.id);

		        if (!element || !element.value.trim()) {
		            alert(field.name + '을(를) 입력하세요.');
		            if (element) {
		                element.focus();
		            }
		            isFormValid = false;
		            return;
		        }
		    };
		    
		    var doubleCheckBtn = document.getElementById('emailCheckBtn');
		    if (!doubleCheckBtn.disabled) {
		        alert('이메일 중복 확인을 먼저 해주세요.');
		        return;
		    }

		    var codeCheckBtn = document.getElementById('codeCheckBtn');
		    if (!codeCheckBtn.disabled) {
		        alert('이메일 인증을 해주세요.');
		        return;
		    }
		    
		    var passwordInput = document.getElementById('passwordInput');
			var confirmPasswordInput = document.getElementById('confirmPasswordInput');
			if(confirmPasswordInput.value != passwordInput.value){
				alert('비밀번호를 확인해주세요');
				passwordInput.focus();
				return;
			}

		    if (isFormValid) {
		        var username = document.getElementById("id").value;
		        var emailDomain = document.getElementById("emailDomain").value;
		        var content = username + "@" + emailDomain;
		        $('#hiddenUserEmail').val(content);
		        $("#userName").prop("disabled", false);
		        $("#phone").prop("disabled", false);
		        
		        document.getElementById("enroll-form").submit();
		    }
		}
    </script>
</body>
</html>

