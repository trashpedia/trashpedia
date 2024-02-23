<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>실천게시글</title>
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="${contextPath}/resources/css/main/pledgeDetail.css">
</head>

<body>

	<jsp:include page="../common/header.jsp"/>
    <main>
        <div class="container">
            <div class="content-title-outer">
                <p> 실천서약 게시글 상세페이지 제목 </p>
                <span id="">작성일</span>
                <span id="">2024/02/01</span>
                <span id="view">조회수</span>
                <span id="view-count">1,234</span>
<!--                 <span id="like">추천수</span>
                <span id="like-count">5</span> -->
                <hr>
            </div>
            <div class="content-outer">
                <textarea class="content-inner">
내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용apfhdap
내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
                </textarea>
                <div class="post-buttons">
                    <a href="${contextPath}/pledge/list"><button class="btn-list">목록</button></a>
                    <a href="${contextPath}/pledge/modify"><button class="btn-edit">수정(삭)</button></a>
                    <!--<a href=""><button class="btn-delete">삭제</button></a> -->
                </div>
            </div>
            <div class="reply-outer">
                <div class="reply-outer-top-area">
                    <span class="reply_title"> 댓글 </span> |
                    <span class="reply_count">224</span>
                </div>
                
                <!-- 댓글 작성 -->
                <div class="comment-section">
                    <textarea class="comment-input" name="replyContent" id="replyContent" rows="2" cols="50" style="resize: none; width: 100%;" placeholder="댓글을 입력하세요"></textarea>
                    <button class="comment-button">등록</button>
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
                                    <p>안녕하세요. 반갑습니다. </p>
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
                                    <p>다른사람이 쓴 댓글 </p>
                                </td>
                                <td>2023-02-18</td>
                            </tr>
                            <tr>
                                <td>User</td>
                                <td>
                                    <p> 나랏말싸미 듕귁에 달아
                                        문자와로 서로 사맛디 아니할쎄 </p>
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
                                    <p>댓글 내용 </p>
                                </td>
                                <td>2023-02-18</td>
                            </tr>
                            <tr>
                                <td>User</td>
                                <td>
                                    <p>댓글 내용 </p>
                                </td>
                                <td>2023-02-18</td>
                            </tr>
                            <tr>
                                <td>User</td>
                                <td>
                                    <p>댓글 내용 </p>
                                </td>
                                <td>2023-02-18</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="paging-button">
                        <button class="pagingBtn" id="prevBtn"> < </button>
                        <button class="pagingBtn">1</button>
                        <button class="pagingBtn">2</button>
                        <button class="pagingBtn">3</button>
                        <button class="pagingBtn">4</button>
                        <button class="pagingBtn">5</button>
                        <button class="pagingBtn" id="nextBtn"> > </button>
                    </div>
                </div>
            </div>
        </div>
    </main>
    
	<jsp:include page="../common/footer.jsp"/>
	
    <script>
alert()
    </script>
</body>
</html>