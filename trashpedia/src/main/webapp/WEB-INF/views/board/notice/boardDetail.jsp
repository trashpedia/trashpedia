<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<c:set var="subCategoryNo" value="${param.subCategoryNo}" />
<c:set var="bigCategoryNo" value="${param.bigCategoryNo}" />
<c:set var="boardNo" value="${param.boardNo}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>board detail</title>
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
    <link rel="stylesheet" href="${contextPath}/resources/css/board/boardDetail.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
    <jsp:include page="../../common/header.jsp" />
    <main class="board_html">   
         <div class="practice-section">
            <p>커뮤니티</p>
            <p>Reduce Reuse Recycle Recovery</p>
        </div>
        <div class="board_wrap">
            <div class="board_title"><strong>상세게시글</strong></div>
            <div class="board_view_wrap">
                <div class="board_view">
                    <div class="title">${b.title}</div>
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
                            <dd>${b.hits}</dd>
                        </dl>
                    </div>
                    <div class="cont">${b.content}</div>
                </div>
                <div class="bt_wrap">
                    <a href="${contextPath}/board/list?bigCategoryNo=1&subCategoryNo=${b.subCategoryNo}" class="on">목록</a>
					<c:if test="${b.userName == authentication.userName}">
						<a href="${contextPath}/update?subCategoryNo=${b.subCategoryNo}&postNo=${b.postNo}&type=1">수정</a>
						<button onclick="confirmDelete(${b.postNo})">삭제</button>
					</c:if>
                </div>
            </div>
                                	
            
            <div class="reply-outer">
				<div class="reply-outer-top-area">
					<span class="reply_title"> 댓글 </span> | <span class="reply_count" id="rcount">224</span>
				</div>
				<div class="comment-section">
					<textarea class="comment-input" name="replyContent" id="replyContent" rows="2" cols="50"
						style="resize: none; width: 100%;" placeholder="댓글을 입력하세요"></textarea>
					<button class="comment-button" onclick="insertComment()">등록</button>
				</div>
				<div class="reply-outer-content-area">
					<div class="reply-area" id="replyArea">
					    <div class="reply-table-title">
					        <div class="reply-header">작성자</div>
					        <div class="reply-header">내용</div>
					        <div class="reply-header">수정일</div>
					    </div>
					    <div class="reply-content">
					        <div class="reply-row">
					            <div class="reply-cell">댓글이 없습니다.</div>
					        </div>
					    </div>
					</div>
				</div>
			</div>
        </div>
    </main>
     <jsp:include page="../../common/footer.jsp" />
     <script>
  		const loginUser = `${authentication}`;
		const loginUserNo = `${authentication.userNo}`;
  		
		 // 게시글삭제확인
	    function confirmDelete(postNo) {
	        var result = confirm("게시글을 삭제하시겠습니까?");
	        if (result) {
	            var deleteUrl = "${contextPath}/board/delete/" + postNo;
	            window.location.href = deleteUrl;
	        } 
	    }

	    // 댓글 목록 조회 및 표시
		function selectCommentList(){
		    $.ajax({
		        url: "${contextPath}/board/selectCommentList",
		        data: { boardNo: ${b.boardNo} },
		        success: function (result) {
		            let commentsHtml = "<div class='comment-list'>"; // 전체 댓글 목록을 감싸는 div 시작

		            for (let comment of result) {
		                commentsHtml += "<div class='comment-item'>"; // 각 댓글 항목을 위한 div 시작
		                commentsHtml += "<div class='comment-user'>" + comment.userName + "</div>";
		                commentsHtml += "<div class='comment-content'><p>" + comment.content + "</p></div>";

		                // 댓글 수정 및 삭제 버튼
		                commentsHtml += "<div class='comment-buttons'>" +
		                                "<button onclick='showCommentUpdateForm(" + comment.commentNo + ",this)' class='btn-edit'>수정</button>" +
		                                "<button onclick='deleteComment(" + comment.commentNo + ")' class='btn-delete'>삭제</button>" +
		                                "<button onclick='toggleReply(" + comment.commentNo + ")' class='btn-reply'>답글보기</button>" +
		                                "<button onclick='toggleReplyInput(" + comment.commentNo + ")' class='btn-reply-write'>답글 작성</button>" +
		                                "</div>"; // comment-buttons div 종료
		                commentsHtml += "<div class='comment-date'>" + comment.modifyDate + "</div>";
		                commentsHtml += "</div>"; // comment-item div 종료

		                // 대댓글 입력 필드 및 버튼 추가 (초기에 숨김 처리)
		                commentsHtml += "<div class='nested-comments-cell' id='replyInputArea" + comment.commentNo + "' style='display: none;'>";
		                commentsHtml += "<textarea class='nested-comment-content' id='nestedCommentContent" + comment.commentNo + "' placeholder='대댓글을 입력하세요'></textarea>";
		                commentsHtml += "<button onclick='insertNC(" + comment.commentNo + ")' class='nested-comment-submit'>대댓글 등록</button>";
		                commentsHtml += "</div>"; // nested-comments-cell div 종료

		                // 대댓글 목록 표시 영역 추가
		                commentsHtml += "<div class='nested-comments-list' id='nestedCommentsList" + comment.commentNo + "' style='display: none;'>  </div>"; // nested-comments-list div 종료
		            }

		            commentsHtml += "</div>"; // comment-list div 종료
		            $("#replyArea").html(commentsHtml); // 댓글 목록 추가
		            $("#rcount").text(result.length); // 댓글 수 업데이트
		        },
		        error: function (xhr, status, error) {
		            console.log("댓글 조회 에러:", status, error);
		        }
		    })
		}
		selectCommentList(); // 함수 호출
		
		// 대댓글 보기 토글 기능
		function toggleReply(commentNo) {
		    // 대댓글 목록을 직접 선택합니다.
		    var nestedCommentsList = document.getElementById('nestedCommentsList' + commentNo);
		    // 해당 요소가 존재하는지 확인합니다.
		    if (nestedCommentsList) {
		    	console.log("대댓글목록 : " + nestedCommentsList)
		        // 요소의 현재 display 상태에 따라 표시 상태를 토글합니다.
		        if (nestedCommentsList.style.display === 'none') {
		            nestedCommentsList.style.display = 'block'; // 요소를 표시합니다.
		            viewNC(commentNo);
		        } else {
		            nestedCommentsList.style.display = 'none'; // 요소를 숨깁니다.
		        }
		    } else {
		        // 요소를 찾을 수 없는 경우 콘솔에 메시지를 출력합니다.
		        console.log('Nested comments list not found for commentNo:', commentNo);
		    }
		}

		//대댓글 등록 토글
		function toggleReplyInput(commentNo) {
		    var replyInputArea = document.getElementById('replyInputArea' + commentNo);
		    if (replyInputArea.style.display === 'none') {
		        replyInputArea.style.display = 'block'; // 요소를 표시합니다.
		    } else {
		        replyInputArea.style.display = 'none'; // 요소를 숨깁니다.
		    }
		}

		// 대댓글 조회
		function viewNC(commentNo) {
		    $.ajax({
		        url: "${contextPath}/board/viewNC/" + commentNo,
		        success: function (NCList) {
		            let commentsHtml = "<div class='nested-comments-container'>"; // 대댓글 목록을 감싸는 div 시작
		            if (NCList && NCList.length > 0) {
		                for (let nComment of NCList) {
		                    commentsHtml += "<div class='nested-comment'>"; // 각 대댓글 항목을 위한 div 시작
		                    commentsHtml += "<div class='nested-comment-user'>" + nComment.userName + "</div>"; // 대댓글 작성자
		                    commentsHtml += "<div class='nested-comment-date'>" + nComment.modifyDate + "</div>"; // 대댓글 날짜
		                    commentsHtml += "<div class='nested-comment-content'>" + nComment.content + "</div>"; // 대댓글 내용
		                    commentsHtml += "<div class='nested-comment-actions'>"; // 대댓글 액션 버튼들
// 		                    commentsHtml += "<button onclick='editNC(" + nComment.nestedCommentNo + ")' class='btn-edit-nc'>수정</button>";
		                    commentsHtml += "<button onclick='deleteNC(" + nComment.nestedCommentNo + ")' class='btn-delete-nc'>삭제</button>";
		                    commentsHtml += "</div>"; // nested-comment-actions div 종료
		                    commentsHtml += "</div>"; // nested-comment div 종료
		                }
		            } else {
		                commentsHtml += "<div class='no-nested-comments'>대댓글이 없습니다.</div>";
		            }

		            commentsHtml += "</div>"; // nested-comments-container div 종료
		            $('#nestedCommentsList' + commentNo).html(commentsHtml).show();
		        },
		        error: function (xhr, status, error) {
		            console.log("대댓글 조회 에러 : ", status, error);
		        }
		    });
		}

		//대댓글 등록
		function insertNC(commentNo){
			var content = document.getElementById('nestedCommentContent' + commentNo).value;
			$.ajax({
				url : "${contextPath}/board/insertNC",
				type : 'post',
				contentType: "application/json", // 컨텐트 타입 명시
		        dataType: 'json', // 서버로부터 응답 받을 데이터 타입
				data : JSON.stringify({
		            commentNo: commentNo,
		            userNo: loginUserNo,
		            content : content
		        }),
				success : function(response){
					alert('대댓글이 등록되었습니다.');
// 					selectCommentList(${b.boardNo});
					viewNC(commentNo);
				},
				error: function (xhr, status, error) {
						console.log(" 댓글등록에러:", status, error);
				} 
			})
		}
		
		//대댓글 삭제
		function deleteNC(nCommentNo) {
			console.log("대댓글번호 : ",nCommentNo);
		    var result = confirm("대댓글을 삭제하시겠습니까?");
		    if (result) {
		        $.ajax({
		            url: "${contextPath}/board/deleteNC/" + nCommentNo,
		            type: 'delete',
		            success: function(response) {
		                if(response > 0) {
		                    alert('대댓글이 삭제되었습니다.');
		                    selectCommentList(); // 댓글 목록을 다시 로드하여 변경사항을 반영
		                } else {
		                    alert('대댓글 삭제에 실패했습니다.');
		                }
		            },
		            error: function(xhr, status, error) {
		                console.log("대댓글 삭제 에러:", status, error);
		            }
		        });
		    }
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
	   
	// 댓글 수정 form 생성
	   function showCommentUpdateForm(commentNo, btn) {
	       // 기존 내용을 담고 있는 요소를 찾습니다.
	       const commentDiv = btn.closest('.comment-item');
	       const contentP = commentDiv.querySelector('.comment-content p');
	       const content = contentP.innerText;

	       // 기존 내용을 담고 있는 요소를 숨깁니다.
	       contentP.style.display = 'none';

	       // 수정 form을 생성합니다.
	       const editDiv = document.createElement("div");
	       editDiv.classList.add('comment-edit');

	       // textarea를 생성하고 스타일을 지정합니다.
	       const textarea = document.createElement("textarea");
	       textarea.classList.add('edit-textarea');
	       textarea.value = content; // innerHTML 대신 value를 사용합니다.

	       // 수정 버튼을 생성합니다.
	       const updateButton = document.createElement("button");
	       updateButton.innerText = "수정하기";
	       updateButton.classList.add('btn-update');

	       // 수정 form 내부에 textarea와 버튼을 추가합니다.
	       editDiv.appendChild(textarea);
	       editDiv.appendChild(updateButton);

	       // 수정 form을 페이지에 삽입합니다.
	       commentDiv.appendChild(editDiv);

	       // 수정 버튼 클릭 이벤트를 추가합니다.
	       updateButton.addEventListener("click", function() {
	           updateComment(commentNo, textarea);
	       });
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