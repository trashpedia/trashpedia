<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<c:set var="subCategoryNo" value="${param.subCategoryNo}" />
<c:set var="bigCategoryNo" value="${param.bigCategoryNo}" />
<c:set var="postNo" value="${param.postNo}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
    <link rel="stylesheet" href="${contextPath}/resources/css/board/boardDetail.css">
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
</head>


<body>

    <jsp:include page="../../common/header.jsp" />

    <main class="board_html">   

         <!-- 타이틀 부분-->
         <div class="practice-section">
            <p>커뮤니티</p>
            <p>Reduce Reuse Recycle Recovery</p>
        </div>
  
        <!--view-->
        <div class="board_wrap">
            <div class="board_title">
                <strong>상세게시글</strong>
                <p></p>
            </div>
            <div class="board_view_wrap">
                <div class="board_view">
                    <div class="title">
                        ${b.title}
                    </div>
                    <div class="info">
                        <dl>
                            <dt>번호</dt>
                            <dd>${b.boardNo}</dd>
                        </dl>
                        <dl>
                            <dt>글쓴이</dt>
                            <dd>${b.userName}</dd>
                        </dl>
                        <dl>
                            <dt>작성일</dt>
                            <dd>${b.createDate}</dd>
                        </dl>
                        <dl>
                            <dt>조회</dt>
                            <dd>33</dd>
                        </dl>
                    </div>
                    <div class="cont">
                       ${b.content}
                    </div>
                </div>
                <div class="bt_wrap">
                    <a href="${contextPath}/board/list?bigCategoryNo=1&subCategoryNo=${b.subCategoryNo}" class="on">목록</a>
                    <!-- 게시글 작성자만 수정/삭제 가능  -->
					<c:if test="${b.userName == authentication.userName}">
						<a href="${contextPath}/update?bigCategoryNo=${b.bigCategoryNo}&subCategoryNo=${b.subCategoryNo}&postNo=${b.postNo}&type=1">
							<button class="btn-edit">수정</button></a>
                    	<a href="${contextPath}/board/delete/{postNo}" class="delte">삭제</a>
					</c:if>
                </div>
            </div>
            <div class="reply-outer">
				<div class="reply-outer-top-area">
					<span class="reply_title"> 댓글 </span> | <span class="reply_count"
						id="rcount">224</span>
				</div>

				<!-- 댓글 작성 -->
				<div class="comment-section">
					<textarea class="comment-input" name="replyContent" id="replyContent" rows="2" cols="50"
						style="resize: none; width: 100%;" placeholder="댓글을 입력하세요"></textarea>
					<button class="comment-button" onclick="insertComment()">등록</button>
				</div>
		

				<div class="reply-outer-content-area">
					<table class="reply-table" id="replyArea">
						<thead>
							<tr class="reply-table-title">
								<th>작성자</th>
								<th>내용</th>
								<th>수정일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>댓글이 없습니다.</td>
							</tr>
						</tbody>
					</table>
					
					
					<!-- 페이징 -->
					<div class="paging-button">
						<button class="pagingBtn" id="prevBtn"><</button>
						<button class="pagingBtn">1</button>
						<button class="pagingBtn">2</button>
						<button class="pagingBtn">3</button>
						<button class="pagingBtn">4</button>
						<button class="pagingBtn">5</button>
						<button class="pagingBtn" id="nextBtn">></button>
					</div>
				</div>
			</div>
        </div>

        

    </main>
     <jsp:include page="../../common/footer.jsp" />

     <script>
  // 게시글삭제확인
//  	    function confirmDelete(postNo, boardNo, bigCategoryNo, subCategoryNo) {
// 	        var result = confirm("게시글을 삭제하시겠습니까?");
// 	        if (result) {
// 	            var deleteUrl = "${contextPath}/pledge/delete/" + postNo + "?boardNo=" + boardNo;
// 	            window.location.href = deleteUrl;
// 	        } 
// 	    } 
	
  		const loginUser = `${authentication}`;
		const loginUserNo = `${authentication.userNo}`;
  		

	    // 댓글 목록 조회 및 표시
		function selectCommentList(){
		    $.ajax({
		        url: "${contextPath}/board/selectCommentList",
		        data: { boardNo: ${b.boardNo}, userNo: ${b.userNo}},
		        success: function (result) {
		        	console.log("result" + result);
		            let commentsHtml = ""; // 댓글 목록을 담을 변수
		            for (let comment of result) {
		                commentsHtml += "<tr>";
		                commentsHtml += "<td>" + comment.userName + "</td>";
		                commentsHtml += "<td><p>" + comment.content + "</p>";
		                // 댓글 수정 및 삭제 버튼
		                commentsHtml += "<div class='comment-buttons'>" +
		                                "<button onclick='showCommentUpdateForm("+comment.commentNo+",this)' class='btn-edit'>수정</button>" +
		                                "<button onclick='deleteComment(" + comment.commentNo + ")' class='btn-delete'>삭제</button>" +
		                                "</div></td>";
		                commentsHtml += "<td>" + comment.modifyDate + "</td>";
		                commentsHtml += "</tr>";
		                
		                if('${authentication.userName}' == comment.userName){
			                // 여기에 대댓글 입력 필드 및 버튼 추가
			                commentsHtml += "<tr><td colspan='3' class='nested-comments-cell'>";
			                commentsHtml += "<textarea class='nested-comment-content' id='nestedCommentContent" + comment.commentNo + "' placeholder='대댓글을 입력하세요'></textarea>";
			                commentsHtml += "<button onclick='insertNC(" + comment.commentNo + ")' class='nested-comment-submit'>대댓글 등록</button>";
			                commentsHtml += "</td></tr>";
			                // 여기에 대댓글 목록 표시 영역 추가
			                commentsHtml += "<tr><td colspan='3' class='nested-comments-list' id='nestedCommentsList" + comment.commentNo + "'>";
			                // 대댓글 목록은 여기에 표시됩니다.
			                commentsHtml += "</td></tr>";
		                } 
		            }
		            $("#replyArea tbody").html(commentsHtml); // 테이블 바디에 댓글 목록 추가
		            $("#rcount").html(result.length); // 댓글 수 업데이트
		        },
		        error: function (xhr, status, error) {
		            console.log("댓글 조회 에러:", status, error);
		        }
		    })
		}
		selectCommentList(); // 함수 호출
		
		//대댓글 등록
		function insertNC(commentNo){
			
			console.log('edfdfdf');
			
			$.ajax({
				url : "${contextPath}/board/insertNC",
				type : 'post',
				data : {
					commentNo: commentNo,
					userNo: loginUserNo,
					content : $("#nestedCommentContent").val()
					
				},
				success : function(response){
					alert('대댓글이 등록되었습니다.');
					selectNestedCommentList(${b.boardNo});
				},
				error: function (xhr, status, error) {
						console.log(" 댓글등록에러:", status, error);
				} 
			})
		}

// 	   댓글등록
	   function insertComment(){
		   $.ajax({
			  url: "${contextPath}/board/insertComment",
			  data : {
				 boardNo: ${b.boardNo}, 
				 userNo: ${b.userNo},
				 content : $("#replyContent").val()
			  },
			  type : 'post',
			  success : function(result){
				  if(result>0){
					  alert("댓글이 등록되었습니다.");
				  }else{
					  alert("댓글등록이 실패하였습니다.");
				  }
				  $("#replyContent").val("");
				 selectCommentList();
			  },
			  error: function (xhr, status, error) {
				console.log(" 댓글등록에러:", status, error);
				}
		   })
	   }
	   
	   //댓글수정 form 생성
	   function showCommentUpdateForm(commentNo, btn){
		   
		   // 댓글 수정할 수 있는 textarea 생성
		   const textarea = document.createElement("textarea"); 
		   textarea.style.width = "100%"; // 너비 100%로 설정
		   textarea.style.height = "50px"; // 높이 50px로 설정
		   textarea.style.resize = "none"; // 리사이즈 비활성화
		   
		   const button = document.createElement("button");
		   button.innerText = "수정하기";
		   button.style.marginTop = "5px"; 
		   button.style.backgroundColor = "#5acb5a"; 
		   button.style.color = "white";
		   button.style.border = '0';
        button.style.padding = '3px 15px';
		   
		   //댓글내용 textarea에 복사
		   let td = btn.parentElement.parentElement;
		   let pTag = td.querySelector('p');
		   let content = pTag.innerText;
		   textarea.innerHTML = content; 
		   
		   //td 비우고 새로 추가
		   td.innerHTML = "";
		   td.append(textarea);
		   td.append(button);
		   
		   button.addEventListener("click",function(){
			   updateComment(commentNo,textarea);
			   })
	   }
	   
// 	   댓글수정
	   function updateComment(commentNo, textarea){
		   let comment = { commentNo, content : textarea.value };
		   
		   $.ajax({
				url: "${contextPath}/board/updateComment/" + commentNo,
				data : JSON.stringify(comment),
				contentType : 'application/json;charset=utf-8',
			  	type : 'put',
			  	success : function(result){
			  		if(result>0){
						alert("댓글이 수정되었습니다.");
					}else{
						alert("댓글수정 실패했습니다.");
					}
					selectCommentList(); 
			  	},
			  	error: function (xhr, status, error) {
		            console.error("댓글수정 오류 발생: ", status, error);
		        }
		   })
	   }
	   
	   
// 	   댓글삭제
	   function deleteComment(commentNo){
		   if(confirm('댓글을 삭제하시겠습니까?')){
			   $.ajax({
				  url: "${contextPath}/board/deleteComment/" + commentNo,
				  type : 'delete',
				  success : function(result){
					  if(result>0){
						alert("댓글이 삭제되었습니다.");
						selectCommentList();
					}else{
						alert("댓글삭제실패");
						}
					}
			   })
		   }
	   }
	   
    </script>
</body>
</html> 