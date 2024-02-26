<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>실천게시글</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/main/pledgeInsert.css">
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
</head>

<body>
    <jsp:include page="../common/header.jsp"/>
	<c:if test="${empty refBno}">
	   	<form action="${contextPath}/write" id="enrollForm" method="POST" enctype="multipart/form-data" onsubmit="submitForm()">
	</c:if>  
	<c:if test="${!empty refBno}">
	   	<form action="${contextPath}/update" id="enrollForm" method="POST" enctype="multipart/form-data" onsubmit="submitForm()">
	</c:if>

    <main>

        <div class="container">

            <div class="content-category-outer">
            	<c:if test="${empty refBno}">
                	<span class="container-title"> 게시글 등록 </span>
                </c:if>
            	<c:if test="${!empty refBno}">
                	<span class="container-title"> 게시글 편집 </span>
                </c:if>
                
                <span class="categoryName">${category.bigCategoryName}_</span>
                <span class="categoryName">${category.subCategoryName}게시판</span>
                <input type="hidden" name="bigCategoryNo" value="${category.bigCategoryNo}">
                <input type="hidden" name="subCategoryNo" value="${category.subCategoryNo}">
                <input type="hidden" name="type" value="${type}">
                <input type="hidden" name="refBno" value="${refBno}">
            </div>     
            
            <div class="content-input-outer">
                <input name="title" type="text" class="input-title" placeholder="제목을 입력하세요." value="${post.title}" required>
                <hr>
            </div>
            
            <div class="content-outer">
            	<div class="file-input-outer">
					<span>썸네일 이미지 선택 : <input type="file" name="thumbnail" id="imgAttachment"></span>
					<div></div>
					<span>파일 선택 : <input type="file" name="upfile" id="attachment"></span>
            	</div>
                
                <div id="writeBoard-content" name="contentBoard"></div>
				<input type="hidden" name="content" id="hiddenContentInput">
                <c:if test="${!empty refBno}">
	                <div class="post-buttons">
	                    <a href="${contextPath}/pledge/list"><button type='button' class="btn-list">목록</button></a>
	                    <button class="btn-edit" type='submit'>수정</button>
	                    <button class="btn-reset" type="reset">초기화</button>
	                </div>
                </c:if>
                <c:if test="${empty refBno}">
	                <div class="post-buttons">
	                    <a href="${contextPath}/pledge/list"><button type='button' class="btn-list">목록</button></a>
	                    <button class="btn-edit" type='submit'>등록</button>
	                    <button class="btn-reset" type="reset">초기화</button>
	                </div>
                </c:if>
            </div>
        </div>
    </main>
    </form>
    
    <jsp:include page="../common/footer.jsp"/>
    
    <script>
    
	    // editor
	    const editor = new toastui.Editor({
	        el: document.querySelector('#writeBoard-content'),
	        height: '500px',
	        initialEditType: 'wysiwyg',
	        initialValue: '',
	        previewStyle: 'vertical',
	        placeholder: '내용을 입력해 주세요.'
	    });
	    
	    //에디터내용 추가(편집때)
// 	    let content = document.querySelector('#writeBoard-content');
// 	    content.innerHTML("${post.content}");
	    
	    // editor 내용 hidden input에 담아서 submit    
	    function submitForm() {
			let content = editor.getHTML();
			$('#hiddenContentInput').val(content);
	    }
    </script>
</body>
</html>