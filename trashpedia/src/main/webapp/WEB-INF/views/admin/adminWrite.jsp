<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>adminWrite</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
    <link rel="stylesheet" href="../resoutces/css/admin/adminWrite.css">
</head>
<jsp:include page="../../common/header.jsp"/>
<body class="body">
    <jsp:include page="../../common/sidebar.jsp"/>
    <div class="content-wrapper">
        <div class="content">
            <section class="writeBoard-section">
                <div class="writeBoard-container">
                    <div class="writeBoard-title">공지사항</div>
                    <form action="write.tr" method="post">
                        <div class="writeTitle-wrapper">
                            <span>제목 : </span><input type="text" name="title" class="writeTitle">
                        </div>
                        <div id="writeBoard-content"></div>
                        <input type="submit" class="submit" value="제출">
                    </form>
                </div>
            </section>
        </div>
    </div>
    <script>
        $(function () {
            $("#header").load("header.html");
            $("#sidebar").load("sidebar.html");
        });
        const editor = new toastui.Editor({
            el: document.querySelector('#writeBoard-content'),
            height: '600px',
            initialEditType: 'wysiwyg',
            initialValue: '',
            previewStyle: 'vertical'
        });
    </script>
</body>
</html>