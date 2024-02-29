<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
	<link rel="stylesheet" href="/src/main/webapp/resources/css/board/boardWrite.css">
	<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
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
		
		
	</script>
</body>
</html>
