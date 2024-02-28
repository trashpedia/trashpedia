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
	<!-- toast ui editor css -->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/3.0.2/toastui-editor.min.css" >
</head>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
    <main>
        <div class="container">
            <!-- 제목 -->
            <div class="content-title-outer">
                <p> ${post.title} </p>
                <span>작성일</span>
                <span class="title-count"> ${post.createDate} </span>
                <span>수정일</span>
                <span class="title-count"> ${post.modifyDate} </span>
                <span>조회수</span>
                <span class="title-count">${post.hitsNo}</span>
               <!--  <hr> -->
            </div>
            
            <!-- 이미지/첨부파일  -->
            <div class="content-attach-outer">
            <%-- 	<div class="content-attach-inner">
	            	<span>썸네일</span>
	            	<img id="thumbNailImg" src="<c:url value='/resources/attachFile/image/${img.changeName}'/>" >
            	</div> --%> 
            	<div class="content-attach-inner">
	            	<span><strong>첨부파일</strong></span>
	            	<c:if test="${attachment eq null}">
	            		<span>첨부파일 없음</span>
	            	</c:if>
	            	<c:if test="${not empty attachment}">
	            		<span>
							<a href="<c:url value='/resources/attachFile/file/${attachment.changeName}'/>" download="${attachment.originName}">${attachment.originName}</a>
						</span>
					</c:if> 
            	</div>
            </div>
            
            <!-- 내용  -->
            <div class="content-outer">
            	<div class="toast-custom-viewer"> ${post.content} </div>
                <div class="post-buttons">
                    <a href="${contextPath}/pledge/list?bigCategoryNo=${post.bigCategoryNo}&subCategoryNo=${post.subCategoryNo}"><button class="btn-list">목록</button></a>
                    <a href="${contextPath}/pledge/modify"><button class="btn-edit">수정</button></a>
                    <button onclick="confirmDelete(${post.postNo}, ${post.boardNo}, ${post.bigCategoryNo}, ${post.subCategoryNo})">삭제</button>
                </div>
            </div>
            
            <!-- 댓글  -->
            <div class="reply-outer">
                <div class="reply-outer-top-area">
                    <span class="reply_title"> 댓글 </span> |
                    <span class="reply_count" id="rcount">224</span>
                </div>
                
                <!-- 댓글 작성 -->
                <div class="comment-section">
                    <textarea class="comment-input" name="replyContent" id="replyContent" rows="2" cols="50" style="resize: none; width: 100%;" placeholder="댓글을 입력하세요"></textarea>
                    <button class="comment-button" onclick="insertComment()">등록</button>
                </div>
                
                <div class="reply-outer-content-area">
                    <table class="reply-table" id="replyArea">
                        <thead>
                            <tr class="reply-table-title">
                                <th>작성자</th>
                                <th>내용</th>
                                <th>작성일</th>
                            </tr>
                        </thead>
                        <tbody>
                           <!--  <tr>
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
                                    <p>댓글 내용 </p>
                                </td>
                                <td>2023-02-18</td>
                            </tr> -->
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
	     
	    // 삭제확인
	    function confirmDelete(postNo, boardNo, bigCategoryNo, subCategoryNo) {
	        var result = confirm("게시글을 삭제하시겠습니까?");
	        if (result) {
	            var deleteUrl = "${contextPath}/pledge/delete/" + postNo + "?boardNo=" + boardNo;
	            window.location.href = deleteUrl;
	        } 
	    }
	
	    //댓글목록조회
 	    function selectCommentList(){
	    	$.ajax({
    		 	url: "${contextPath}/pledge/selectCommentList",
    		    data: { boardNo: ${post.boardNo}, userNo: ${post.userNo}},
    		    success: function (result) {
    		        let comments = "";
    		        for (let comment of result) {
    		            comments += "<tr>";
    		            comments += "<td>" + comment.userName + "</td>";
    		            comments += "<td><p>" + comment.content + "</p>";
    		            comments += "<div class='comment-buttons'>" +
    		                        "<button onClick='showCommentUpdateForm("+comment.commentNo+",this)' class='btn-edit'> 수정 </button>" +
    		                        "<button class='btn-delete'> 삭제 </button>" +
    		                        "</div></td>";
    		            comments += "<td>" + comment.modifyDate + "</td>";
    		            comments += "</tr>";
    		        }
    		        $("#replyArea tbody").html(comments);
    		        $("#rcount").html(result.length);
    		    },
    		    error: function (xhr, status, error) {
    		        console.log(" 댓글조회에러:", status, error);
    		    }
	    	})
	    }
 	   selectCommentList();
 	   
 	   //댓글등록
 	   function insertComment(){
 		   $.ajax({
 			  url: "${contextPath}/pledge/insertComment",
 			  data : {
 				 boardNo: ${post.boardNo}, 
 				 userNo: ${post.userNo},
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
 	   
 	   
 	   //댓글수정
 	   function updateComment(commentNo, textarea){
 		   let comment = { commentNo, content : textarea.value };
 		   
 		   $.ajax({
				url: "${contextPath}/pledge/updateComment/" + commentNo,
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
 	   
 	   
 	   
    
    </script>
</body>
</html>