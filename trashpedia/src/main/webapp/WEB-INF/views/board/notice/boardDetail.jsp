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
    <link rel="stylesheet" href="${contextPath}/resources/css/board/boardDetail.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<link rel="stylesheet" href="https://uicdn.toast.com/editor/3.0.2/toastui-editor.min.css" >
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
                    <div class="toast-custom-viewer"></div>
                </div>
                <div class="bt_wrap">
                    <a href="${contextPath}/board/list?subCategoryNo=${b.subCategoryNo}" class="on">목록</a>
					<c:if test="${b.userNo == authentication.userNo}">
						<a href="${contextPath}/update?subCategoryNo=${b.subCategoryNo}&postNo=${b.postNo}&type=1">수정</a>
						<button onclick="confirmDelete(${b.postNo})">삭제</button>
					</c:if>
                </div>
            </div>
            <div class="reply-outer">
				<div class="reply-outer-top-area">
					<span class="reply_title"> 댓글 </span> | <span class="reply_count" id="rcount">224</span>
				</div>
				<c:if test="${not empty authentication}">
					<div class="comment-section">
						<textarea class="comment-input" name="replyContent" id="replyContent" rows="2" cols="50"
							style="resize: none;" placeholder="댓글을 입력하세요"></textarea>
						<button class="comment-button" onclick="insertComment()">등록</button>
					</div>
				</c:if>
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
     	//에디터 뷰어
  		const editor = toastui.Editor.factory({
            el : document.querySelector(".toast-custom-viewer"),
            viewer:true,
            initialValue :  `${b.content}`
        });
 
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
		            let commentsHtml = "<div class='comment-list'>";
		            for (let comment of result) {
		                commentsHtml += "<div class='comment-item'>";
		                commentsHtml += "<div class='comment-user'>" + comment.userName + "</div>";
		                commentsHtml += "<div class='comment-content'><p>" + comment.content + "</p></div>";
		                commentsHtml += "<div class='comment-buttons'>"
		                if(comment.userNo == loginUserNo){
		                	commentsHtml += "<button onclick='showCommentUpdateForm(" + comment.commentNo + ",this)' class='btn-edit'>수정</button>" +
                            				"<button onclick='deleteComment(" + comment.commentNo + ")' class='btn-delete'>삭제</button>"
		                }
		                commentsHtml += "<button onclick='toggleReply(" + comment.commentNo + ")' class='btn-reply'>답글보기</button>"
		                if(loginUser != ''){
		                	commentsHtml += "<button onclick='toggleReplyInput(" + comment.commentNo + ")' class='btn-reply-write'>답글 작성</button>"
		                }
		                commentsHtml += "</div>";
		                commentsHtml += "<div class='comment-date'>" + comment.modifyDate + "</div>";
		                commentsHtml += "</div>";

		                commentsHtml += "<div class='nested-comments-cell' id='replyInputArea" + comment.commentNo + "' style='display: none;'>";
		                commentsHtml += "<textarea class='nested-comment-content' id='nestedCommentContent" + comment.commentNo + "' placeholder='대댓글을 입력하세요'></textarea>";
		                commentsHtml += "<button onclick='insertNC(" + comment.commentNo + ")' class='nested-comment-submit'>대댓글 등록</button>";
		                commentsHtml += "</div>";

		                commentsHtml += "<div class='nested-comments-list' id='nestedCommentsList" + comment.commentNo + "' style='display: none;'>  </div>";
		            }

		            commentsHtml += "</div>";
		            $("#replyArea").html(commentsHtml);
		            $("#rcount").text(result.length);
		        },
		        error: function (xhr, status, error) {
		            console.log("댓글 조회 에러:", status, error);
		        }
		    })
		}
		selectCommentList();
		
		function toggleReply(commentNo) {
		    var nestedCommentsList = document.getElementById('nestedCommentsList' + commentNo);
		    if (nestedCommentsList) {
		        if (nestedCommentsList.style.display === 'none') {
		            nestedCommentsList.style.display = 'block';
		            viewNC(commentNo);
		        } else {
		            nestedCommentsList.style.display = 'none';
		        }
		    } else {
		        console.log('Nested comments list not found for commentNo:', commentNo);
		    }
		}

		function toggleReplyInput(commentNo) {
		    var replyInputArea = document.getElementById('replyInputArea' + commentNo);
		    if (replyInputArea.style.display === 'none') {
		        replyInputArea.style.display = 'block';
		    } else {
		        replyInputArea.style.display = 'none';
		    }
		}

		//대댓글 보기
		function viewNC(commentNo) {
		    $.ajax({
		        url: "${contextPath}/board/viewNC/" + commentNo,
		        success: function (NCList) {
		            let commentsHtml = "<div class='nested-comments-container'>";
		            if (NCList && NCList.length > 0) {
		                for (let nComment of NCList) {
		                    commentsHtml += "<div class='nested-comment'>";
		                    commentsHtml += "<div class='nested-comment-user'>" + nComment.userName + "</div>";
		                    commentsHtml += "<div class='nested-comment-date'>" + nComment.modifyDate + "</div>";
		                    commentsHtml += "<div class='nested-comment-content'>" + nComment.content + "</div>";
		                    commentsHtml += "<div class='nested-comment-actions'>";
		                    if(nComment.userNo == loginUserNo){
		                    	commentsHtml += "<button onclick='showNCommentUpdateForm(" + nComment.nestedCommentNo + ", \"" + nComment.content.replace(/"/g, '&quot;') + "\", this, "+ commentNo +")' class='btn-edit-nc'>수정</button>";
		                    }
		                    commentsHtml += "<button onclick='deleteNC(" + nComment.nestedCommentNo + ")' class='btn-delete-nc'>삭제</button>";
		                    commentsHtml += "</div>";
		                    commentsHtml += "</div>";
		                }
		            } else {
		                commentsHtml += "<div class='no-nested-comments'>대댓글이 없습니다.</div>";
		            }

		            commentsHtml += "</div>";
		            $('#nestedCommentsList' + commentNo).html(commentsHtml).show();
		        },
		        error: function (xhr, status, error) {
		            console.log("대댓글 조회 에러 : ", status, error);
		        }
		    });
		}

		function insertNC(commentNo){
			var content = document.getElementById('nestedCommentContent' + commentNo).value;
			$.ajax({
				url : "${contextPath}/board/insertNC",
				type : 'post',
				contentType: "application/json",
		        dataType: 'json',
				data : JSON.stringify({
		            commentNo: commentNo,
		            userNo: loginUserNo,
		            content : content
		        }),
				success : function(response){
					alert('대댓글이 등록되었습니다.');
					$('.nested-comment-content').val('');
					$('.nested-comments-cell').css('display', 'none');
					viewNC(commentNo);
				},
				error: function (xhr, status, error) {
						console.log(" 댓글등록에러:", status, error);
				} 
			})
		}
		
		function deleteNC(nCommentNo) {
		    var result = confirm("대댓글을 삭제하시겠습니까?");
		    if (result) {
		        $.ajax({
		            url: "${contextPath}/board/deleteNC/" + nCommentNo,
		            type: 'delete',
		            success: function(response) {
		                if(response > 0) {
		                    alert('대댓글이 삭제되었습니다.');
		                    selectCommentList();
		                    $('#nestedCommentsList'+nCommentNo).css('display', 'block');
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
		//대댓글 수정폼
		function showNCommentUpdateForm(nestedCommentNo, nestedContent, btn, commentNo) {
			
			var $nestedCommentDiv = $(btn).closest('.nested-comment');
			
			$nestedCommentDiv.find('.btn-edit-nc').hide();
		    $nestedCommentDiv.find('.nested-comment-content').hide();
		    if ($nestedCommentDiv.find('.edit-textarea').length === 0) {
		        var textareaHtml = '<textarea class="edit-textarea">' + nestedContent + '</textarea>';
		        var saveButtonHtml = '<button class="btn-save-nc" onclick="updateNC(' + nestedCommentNo + ','+ commentNo +')">저장</button>';
		        $nestedCommentDiv.find('.nested-comment-actions').prepend(textareaHtml + saveButtonHtml);
		    }
		}
		
		//대댓글 수정
		function updateNC(nestedCommentNo, commentNo) {
			let content = document.querySelector(".edit-textarea").value;
	        $.ajax({
	            url: "${contextPath}/board/updateNC/" + nestedCommentNo,
	            type: 'post',
	            data:{content},
	            success: function(data) {
	                if(data > 0) {
	                    alert('댓글이 수정되었습니다.');
	                    viewNC(commentNo);
	                } else {
	                    alert('댓글 수정에 실패했습니다.');
	                }
	            },
	            error: function(xhr, status, error) {
	                console.log("댓글 수정 에러:", status, error);
	            }
	        });
		}
		
		
	//댓글등록
	   function insertComment(){
		   $.ajax({
			  url: "${contextPath}/board/insertComment",
			  data : {
				 boardNo: ${b.boardNo}, 
				 userNo: loginUserNo,
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
	   
	   function showCommentUpdateForm(commentNo, btn) {
	       const commentDiv = btn.closest('.comment-item');
	       const contentP = commentDiv.querySelector('.comment-content p');
	       const content = contentP.innerText;

	       contentP.style.display = 'none';

	       const editDiv = document.createElement("div");
	       editDiv.classList.add('comment-edit');

	       const textarea = document.createElement("textarea");
	       textarea.classList.add('edit-textarea');
	       textarea.value = content;

	       const updateButton = document.createElement("button");
	       updateButton.innerText = "수정하기";
	       updateButton.classList.add('btn-update');

	       editDiv.appendChild(textarea);
	       editDiv.appendChild(updateButton);

	       commentDiv.appendChild(editDiv);

	       updateButton.addEventListener("click", function() {
	           updateComment(commentNo, textarea);
	       });
	   }

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