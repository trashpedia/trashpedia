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
  
   	<form action="${contextPath}/write/${category.bigCategoryNo}/${category.subCategoryNo}" id="enrollForm" method="POST" enctype="multipart/form-data" onsubmit="submitForm()">

    <main>

        <div class="container">

            <div class="content-category-outer">
                <p class="container-title"> 게시글 등록 </p>
                <span class="categoryName">${category.bigCategoryName}</span>_
                <span class="categoryName">${category.subCategoryName}</span>
                <input type="hidden" name="bigCategoryNo" value="${category.bigCategoryNo}" disabled>
                <input type="hidden" name="subCategoryNo" value="${category.subCategoryNo}" disabled>
            </div>     
            
            <div class="content-input-outer">
                <input name="title" type="text" class="input-title" placeholder="제목을 입력하세요." required>
                <hr>
            </div>
            
            <div class="content-outer">
            	<div class="file-input-outer">
		            <!--실천하기/정보자료글  -->
		            <span>썸네일 이미지 선택 : <input type="file" name="thumbnail" id="imgAttachment"></span>
		            <!-- 공지/일반/건의 게시판 -->
					<span>파일 선택 : <input type="file" name="upfile" id="attachment"></span>
            	</div>
                
                <div id="writeBoard-content" name="contentBoard"></div>
				<input type="hidden" name="content" id="hiddenContentInput">
                
                <div class="post-buttons">
                    <a href="${contextPath}/pledge/list"><button type='button' class="btn-list">목록</button></a>
                    <button class="btn-edit" type='submit'>등록</button>
                    <button class="btn-reset" type="reset">초기화</button>
                </div>
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
	    
	    // editor 내용 hidden input에 담아서 submit    
	    function submitForm() {
			let content = editor.getHTML();
			$('#hiddenContentInput').val(content);
	    }
    </script>
</body>
</html>