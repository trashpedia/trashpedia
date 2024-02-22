<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>네이버 회원가입 폼</title>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="resources/css/user/join.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <main>
    <form action="join.me" method="POST">
	    <div class="member">
	        <!-- 1. 로고 -->
	        <div class="logo">회원가입</div>
	        <!-- 2. 필드 -->
	        <div class="field">
	            <b>아이디</b>
	            <div id="id-1">
	                <input type="text" id="username" placeholder="아이디를 입력하세요" name="userEmail">
	                <span class="id-a">@</span>
	                <input type="text" id="emailDomain" placeholder="">
	                <!-- 
	                <input type="hidden" name="userEmail" id="userEmail"> -->
	                <br>
	            </div>
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
	        <!-- 4. 필드(성별) -->
	        <div class="field gender">
	            <b>성별</b>
	            <div style="border-radius: 5px;">
	                <label><input type="radio" name="gender">남자</label>
	                <label><input type="radio" name="gender">여자</label>
	                <label><input type="radio" name="gender">선택안함</label>
	            </div>
	        </div>
	        <!-- 5. 이메일_전화번호 -->
	        <div class="field">
	            <b>이메일</b>
	            <div id="email-1">
	                <input type="text" id="emailUseremail" placeholder="이메일">
	                <span class="email-a">@</span>
	                <input type="text" id="email" placeholder="">
	                <br>
	            </div>
	            <div>
	                <select id="emailSelect2" onchange="updateEmail()">
	                    <option value="직접입력" selected>직접입력</option>
	                    <option value="naver.com">@naver.com</option>
	                    <option value="gmail.com">@gmail.com</option>
	                    <option value="yahoo.com">@yahoo.com</option>
	                    <option value="daum.net">@daum.net</option>
	                    <option value="hanmail.net">@hanmail.net</option>
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
	</main>
	<jsp:include page="../common/footer.jsp"/>
	
	
	
	<script>
	// 유효성검사
	    function updateEmailDomain() {
	        var usernameInput = document.getElementById('username');
	        var emailDomainInput = document.getElementById('emailDomain');
	        var emailSelect = document.getElementById('emailSelect');
	        // 만약 "직접입력"이 선택되었을 때는 입력값을 그대로 사용
	        if (emailSelect.value === '직접입력') {
	            emailDomainInput.value = "";
	        } else {
	            // 선택된 주소를 입력란에 추가
	            emailDomainInput.value = emailSelect.value;
	        }
	    }
	    // 초기 설정 - 페이지 로딩 시 호출
	    updateEmailDomain();
	
	    function updateEmail() {
	        var emailUseremail = document.getElementById('emailUseremail');
	        var email = document.getElementById('email');
	        var emailSelect2 = document.getElementById('emailSelect2');
	
	        // 만약 "직접입력"이 선택되었을 때는 입력값을 그대로 사용
	        if (emailSelect2.value === '직접입력') {
	            email.value = "";
	        } else {
	            // 선택된 주소를 입력란에 추가
	            email.value = emailSelect2.value;
	        }
	    }
	
	    // 초기 설정 - 페이지 로딩 시 호출
	    updateEmailDomain();
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
	
	         // 기본적으로 모든 메시지를 숨김
	         passNotice.querySelectorAll('p').forEach(function (element) {
	             element.style.display = 'none';
	         });
	
	         // 비밀번호 입력란에 입력이 시작될 때 메시지 보이기
	         if (passwordInput.value !== "") {
	             // 비밀번호 유효성 검사
	             if (passwordValidation.isValid) {
	                 passNotice.querySelector('.ico-possible').style.display = 'block';
	             } else {
	                 passNotice.querySelector('.ico-possible').style.display = 'none';
	                 passNotice.querySelector('.ico-impossible').style.display = 'block';
	                 return; // 비밀번호 유효성 검사를 통과하지 못하면 이후의 검사를 진행하지 않음
	             }
	
	             // 비밀번호 재확인 일치 여부 검사
	             if (passwordValidation.isMatch && confirmPasswordInput.value !== "") {
	                 passNotice.querySelector('.ico-same').style.display = 'block';
	                 passNotice.querySelector('.ico-possible').style.display = 'none'; // 가능 문구는 지워줌
	             } else if (!passwordValidation.isMatch && confirmPasswordInput.value !== "") {
	                 passNotice.querySelector('.ico-notsame').style.display = 'block';
	                 passNotice.querySelector('.ico-possible').style.display = 'none';
	             }
	         }
	     }
        // function clearPasswordNotice() {
        //     // 포커스가 confirmPasswordInput에 가면 모든 문구를 숨김
        //     var passNotice = document.getElementById('passNotice');
        //     passNotice.querySelectorAll('p').forEach(function (element) {
        //         element.style.display = 'none';
        //     });
        // }

        // 이벤트 리스너 등록 (실시간으로 입력 값이 변경될 때마다 업데이트)
        var passwordInput = document.getElementById('passwordInput');
        var confirmPasswordInput = document.getElementById('confirmPasswordInput');
        passwordInput.addEventListener('input', updatePasswordNotice);
        confirmPasswordInput.addEventListener('input', updatePasswordNotice);

        // 페이지 로딩 시 초기 메시지 표시
        updatePasswordNotice();

        // 비밀번호 재확인 입력란에 focus가 갔을 때 가능 문구 지우기
        confirmPasswordInput.addEventListener('keyup', updatePasswordNotice);
        
        var yearSelect = document.getElementById('year');
        var monthSelect = document.getElementById('month');
        var daySelect = document.getElementById('day');

        // 현재 연도부터 1900년까지의 연도를 동적으로 생성
        var currentYear = new Date().getFullYear();
        for (var year = currentYear; year >= 1900; year--) {
            var option = document.createElement('option');
            option.value = year;
            option.text = year;
            yearSelect.add(option);
        }
        function updateDays() {
            var selectedMonth = monthSelect.value;
            var daysInMonth = new Date(yearSelect.value, selectedMonth, 0).getDate();

            // 일자 선택 옵션 초기화
            daySelect.innerHTML = '<option value="">일</option>';

            // 선택한 월에 따라 해당 월의 일자를 동적으로 생성
            for (var day = 1; day <= daysInMonth; day++) {
                var option = document.createElement('option');
                option.value = day;
                option.text = day;
                daySelect.add(option);
            }
        }
	    function updateEmailDomain() {
	        var emailUsernameInput = document.getElementById('emailUsername');
	        var emailDomainInput = document.getElementById('emailDomain');
	        var emailSelect = document.getElementById('emailSelect');
	
	        // 만약 "직접입력"이 선택되었을 때는 입력값을 그대로 사용
	        if (emailSelect.value === '직접입력') {
	            emailDomainInput.value = "";
	        } else {
	            // 선택된 주소를 입력란에 추가
	            emailDomainInput.value = emailSelect.value;
	        }
	    }
	
	    // 초기 설정 - 페이지 로딩 시 호출
	    updateEmailDomain();
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
            var isFormValid = true; // 폼 유효성 검사 결과를 저장하는 변수

            // 필드들을 확인하고 빈 칸이면 유효성 검사 실패로 표시하고 포커스 이동
            var fieldsToCheck = [
                { id: 'username', name: '아이디' },
                { id: 'passwordInput', name: '비밀번호' },
                { id: 'confirmPasswordInput', name: '비밀번호 확인' },
                { id: 'year', name: '생년월일 연도' },
                { id: 'month', name: '생년월일 월' },
                { id: 'day', name: '생년월일 일' },
                { id: 'emailUsername', name: '이메일 아이디' },
                { id: 'emailDomain', name: '이메일 도메인' },
                // 다른 필드들도 필요에 따라 추가
            ];

            for (var i = 0; i < fieldsToCheck.length; i++) {
                var field = fieldsToCheck[i];
                var element = document.getElementById(field.id);

                if (!element.value.trim()) {
                    alert(field.name + '을(를) 입력하세요.'); // 빈 칸이면 알림 표시
                    element.focus(); // 해당 칸으로 포커스 이동
                    isFormValid = false; // 유효성 검사 실패로 표시
                    break; // 하나의 빈 칸이라도 발견되면 더 이상 확인하지 않고 중단
                }
            }

            // 모든 필드가 유효한 경우에만 submit 처리
            if (isFormValid) {
                alert('가입이 완료되었습니다.'); // 실제로는 서버에 전송하거나 다른 처리를 수행해야 합니다.
            }
        }
    </script>
</body>
</html>

