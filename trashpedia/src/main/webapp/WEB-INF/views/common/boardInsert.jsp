<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>실천게시글</title>
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="${contextPath}/resources/css/common/boardInsert.css">
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
</head>

<body>

	<jsp:include page="../common/header.jsp" />

	<main>
		<c:if test="${empty post}">
			<form action="${contextPath}/write" id="enrollForm" method="POST" enctype="multipart/form-data" onsubmit="submitForm()">
		</c:if>
		<c:if test="${!empty post}">
			<form action="${contextPath}/update" id="enrollForm" method="POST" enctype="multipart/form-data" onsubmit="submitForm()">
		</c:if>

		<div class="container">
			<div class="content-category-outer">
				<span class="container-title"> 
					<c:if test="${empty post}"> 게시글 등록 </c:if>
					<c:if test="${!empty post}"> 
						게시글 편집 <input type="hidden" name="postNo" value="${post.postNo}">  
					</c:if>
				</span> 
				<span class="categoryName">${category.bigCategoryName}_</span> 
				<span class="categoryName">${category.subCategoryName} </span> 
				<input type="hidden" name="bigCategoryNo" value="${category.bigCategoryNo}"> 
				<input type="hidden" name="subCategoryNo" value="${category.subCategoryNo}"> 
				<input type="hidden" name="type" value="${type}">
				<input type="text" name="type" value="${type}">
			</div>

			<div class="content-input-outer">
				<input name="title" type="text" class="input-title" placeholder="제목을 입력하세요." value="${post.title}" required>
				<hr>
			</div>

			<div class="content-outer">
				<div class="file-input-outer">
					<table class="content-attach-inner">
						<tr>
							<td width="100px;" class="not-empty-title">썸네일 이미지</td>
							<td class="thumbnailBox">
								<c:if test="${empty img}">
									<input type="file" name="thumbnail" id="imgAttachment">
									<img id="thumbNailImg">
								</c:if>
								<c:if test="${not empty img}">
								    <input type="file" name="thumbnail" id="imgAttachment">
								    <div>
									    <img id="thumbNailImg" src="<c:url value='/resources/attachFile/image/${img.changeName}'/>">
									    <button type="button" id="xImgButton" class="xButton">x</button>
								    </div>
								</c:if>
							</td>
						</tr>
						<tr>
							<td>첨부파일 </td>
							<td id="attachFile"> 
								<c:if test="${empty attachment}">
									<input type="file" name="upfile" id="attachment">
								</c:if>
								<c:if test="${not empty attachment}">
									<a 
										href="<c:url value='/resources/attachFile/file/${attachment.changeName}'/>"
										download="${attachment.originName}">${attachment.originName}
									</a>
									<button type="button" id="xAttachButton" class="xButton">x</button>
								</c:if>
							</td>
						</tr>
					</table>
				</div>

				<div id="maxLength"><span id="charCount">0</span> / 2,000,000 </div> 
				<div id="writeBoard-content" name="contentBoard">${post.content}</div>

				<input type="hidden" name="content" id="hiddenContentInput">
				<div class="post-buttons">
					<a
						href="${contextPath}/returnList?bigCategoryNo=${category.bigCategoryNo}&subCategoryNo=${category.subCategoryNo}">
						<button type='button' class="btn-list">목록</button>
					</a>
					<button class="btn-edit" type='submit'>
						<c:if test="${!empty post}">수정</c:if>
						<c:if test="${empty post}"> 등록</c:if>
					</button>
					<button class="btn-reset" type="reset">초기화</button>
				</div>
			</div>
		</div>
		</form>
	</main>

	<jsp:include page="../common/footer.jsp" />

	<script>
		// 에디터 생성
		const editor = new toastui.Editor({
		    el: document.querySelector('#writeBoard-content'),
		    height: '600px',
		    initialEditType: 'wysiwyg',
		    initialValue: '',
		    previewStyle: 'vertical',
		    placeholder: '내용을 입력해 주세요.',
		});
	
		// 에디터 내용 변경 이벤트 핸들러
		function handleChange() {
			
			// 최대 글자수 설정
			const MAX_LENGTH = 2000000;
			
			//글자수세기
		    let content = editor.getMarkdown();
		    let count = content.length;
		    document.getElementById('charCount').textContent = count.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	
		    if (content.length > MAX_LENGTH) {
		        // 이벤트 핸들러 일시 해제 
		        editor.off('change', handleChange);
	
		      	alert(`최대 2,000,000자까지 입력 가능합니다.`);
		        editor.setMarkdown(content.substring(0, MAX_LENGTH));
	
		        // 이벤트들러 다시 등록
		        setTimeout(() => {   editor.on('change', handleChange); }, 0);
		    }
		}
	
		// 이벤트 핸들러 등록
		editor.on('change', handleChange);
    
		
		$(document).ready(function() {
		    // editor 내용 hidden input에 담아서 submit
		    $('#enrollForm').on('submit', function() {
		        let content = editor.getHTML();
		        $('#hiddenContentInput').val(content);
		    });
		    
			// 이미지 삭제 버튼 클릭 이벤트
		    $('#xImgButton').click(function() {
		        if(confirm('정말로 이미지를 삭제하시겠습니까?')) {
		            $('#thumbNailImg').attr('src', '');
		            $('#imgAttachment').val('');
		        }
		    });

		 // 파일 삭제 버튼 클릭 이벤트
		    $('#xAttachButton').click(function() {
		        if(confirm('정말로 첨부파일을 삭제하시겠습니까?')) {
		            // 첨부파일 영역 비우기
		            $('#attachFile').empty();
		            $('#xAttachButton').hide();

		            // 파일 업로드 input 초기화 및 새로운 input 생성
		            const newInput = $('<input type="file" name="upfile" id="attachment">');
		            $('#attachFile').append(newInput);
		        }
		    });
		    
		 	// 이미지 미리보기 연결
		    $('#imgAttachment').change(function() {
		        const file = this.files[0];
		        if (file) {
		            const reader = new FileReader();
		            reader.onload = function(e) {  $('#thumbNailImg').attr('src', e.target.result); };
		            reader.readAsDataURL(file);
		        }
		    });
		    
		    
		});
		
		
	</script>
</body>
</html>