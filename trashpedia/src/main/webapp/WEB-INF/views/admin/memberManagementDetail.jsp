<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>memberManagementDetail</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/admin/memberManagementDetail.css">
</head>
<jsp:include page="../common/header.jsp"/>
<body class="body">
    <jsp:include page="../common/sidebar.jsp"/>
    <div class="content-wrapper">
        <div class="content">
            <section class="search-section">
                <div class="search-container">
                    <div class="search-title">회원 상세 정보</div>
                </div>
            </section>
            <section class="member-section">
                <div class="member-container">
                    <div class="grade-container">
                        <div class="grade-item-wrapper">
                            <div class="grade-item">
                                <div class="grade-item-icon">★</div>
                                <div class="grade-item-title">포인트</div>
                                <div class="grade-item-subtitle">150,000</div>
                            </div>
                            <div class="grade-item">
                                <div class="grade-item-icon">👑</div>
                                <div class="grade-item-title">등급</div>
                                <div class="grade-item-subtitle">일반회원</div>
                            </div>
                            <div class="grade-item">
                                <div class="grade-item-icon">🔒</div>
                                <div class="grade-item-title">권한</div>
                                <div class="grade-item-subtitle">일반사용자</div>
                            </div>
                            <div class="grade-item">
                                <div class="grade-item-icon"></div>
                                <div class="grade-item-title">생성일</div>
                                <div class="grade-item-subtitle">2023/05/01</div>
                            </div>
                            <div class="grade-item">
                                <div class="grade-item-icon"></div>
                                <div class="grade-item-title">수정일</div>
                                <div class="grade-item-subtitle">2024/01/17</div>
                            </div>
                        </div>
                    </div>
                    <div class="member-info-list">
                        <div class="member-item">
                            <div class="title">이메일</div>
                            <div class="subtitle">ghldnjs@trashpedia.com</div>
                        </div>
                        <div class="member-item">
                            <div class="title">이름</div>
                            <div class="subtitle">이슬이</div>
                        </div>
                        <div class="member-item">
                            <div class="title">닉네임</div>
                            <div class="subtitle">참이슬</div>
                        </div>
                        <div class="member-item">
                            <div class="title">전화번호</div>
                            <div class="subtitle">010-1111-2222</div>
                        </div>
                        <div class="member-item">
                            <div class="title">주소</div>
                            <div class="subtitle">인천특별시 연수구 송도동 트리플스트리트 5층 롯데시네마</div>
                        </div>
                    </div>
                </div>
                <div class="member-board-container">
                    <div class="board-container">
                        <div class="board-title-wrapper">
                            <div class="board-title">작성 게시글</div>
                            <div class="board-subtitle">총 22개</div>
                        </div>
                        <div class="list">
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글1</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글2</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글3</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글4</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글5</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글6</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글7</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글8</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글9</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글10</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글11</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글12</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글13</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글14</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글15</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글16</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글17</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글18</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글19</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글20</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글21</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글22</div>
                            </div>
                        </div>
                    </div>
                    <div class="board-container">
                        <div class="board-title">게시글 상세</div>
                        <div class="list">
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">title : </div>
                                <div class="subtitle">밥 먹었습니까</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">content : </div>
                                <div class="subtitle">저는 밥 먹었습니다 아주 맛있게요 냠냠쩝쩝</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">Created At : </div>
                                <div class="subtitle">2021-01-01</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">Updated At : </div>
                                <div class="subtitle">2021-02-01</div>
                            </div>
                            <div class="item">
                                <input type="button" onclick="boardDetail()" value="상세보기">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="member-board-container">
                    <div class="board-container">
                        <div class="board-title-wrapper">
                            <div class="board-title">작성 댓글</div>
                            <div class="board-subtitle">총 87개</div>
                        </div>
                        <div class="list">
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글1</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글2</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글3</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글4</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글5</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글6</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글7</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글8</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글9</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글10</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글11</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글12</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글13</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글14</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글15</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글16</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글17</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글18</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글19</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글20</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글21</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글22</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글17</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글18</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글19</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글20</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글21</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글22</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글17</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글18</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글19</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글20</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글21</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글22</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글17</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글18</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글19</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글20</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글21</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글22</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글17</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글18</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글19</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글20</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글21</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글22</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글17</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글18</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글19</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글20</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글21</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글22</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글17</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글18</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글19</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글20</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글21</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글22</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글17</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글18</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글19</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글20</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글21</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">게시글22</div>
                            </div>
                        </div>
                    </div>
                    <div class="board-container">
                        <div class="board-title">댓글 상세</div>
                        <div class="list">
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">title : </div>
                                <div class="subtitle">밥 먹었습니까</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">content : </div>
                                <div class="subtitle">저는 밥 먹었습니다 아주 맛있게요 냠냠쩝쩝</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">Created At : </div>
                                <div class="subtitle">2021-01-01</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">Updated At : </div>
                                <div class="subtitle">2021-02-01</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">reply : </div>
                                <div class="subtitle">저도 밥 먹었습니다 너보다 아주 맛있게요</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">Created At : </div>
                                <div class="subtitle">2021-01-01</div>
                            </div>
                            <div class="item">
                                <div class="icon">😃</div>
                                <div class="title">Updated At : </div>
                                <div class="subtitle">2021-02-01</div>
                            </div>
                            <div class="item">
                                <input type="button" onclick="boardDetail()" value="상세보기">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="point-container">
                    <div class="point-content">
                        <div class="point-title-wrapper">
                            <div class="board-title">포인트 적립 내역</div>
                        </div>
                        <table class="point-table">
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>포인트 적립 내역</th>
                                    <th>포인트 증감</th>
                                    <th>날짜</th>
                                </th>
                            </thead>
                            <tbody>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>출석체크</td>
                                    <td>10</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>출석체크</td>
                                    <td>10</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>출석체크</td>
                                    <td>10</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>출석체크</td>
                                    <td>10</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>출석체크</td>
                                    <td>10</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>출석체크</td>
                                    <td>10</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>출석체크</td>
                                    <td>10</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>출석체크</td>
                                    <td>10</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>출석체크</td>
                                    <td>10</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>출석체크</td>
                                    <td>10</td>
                                    <td>2024/02/01</td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="pageBar">
                            <div>&lt;&lt;</div>
                            <div>1</div>
                            <div>2</div>
                            <div>3</div>
                            <div>&gt;&gt;</div>
                        </div>
                    </div>
                </div>
                <div class="point-container">
                    <div class="point-content">
                        <div class="point-title-wrapper">
                            <div class="board-title">신고 접수 내역</div>
                        </div>
                        <table class="point-table">
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>신고 유형</th>
                                    <th>신고 제목</th>
                                    <th>신고 내용</th>
                                    <th>날짜</th>
                                </th>
                            </thead>
                            <tbody>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>게시글</td>
                                    <td>사기글 작성</td>
                                    <td>사기꾼입니다 이사람 산다해놓고 안사요</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>댓글</td>
                                    <td>욕설 작성</td>
                                    <td>아니 저를 언제 봤다고 욕부터 하네요;;</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>댓글</td>
                                    <td>사기글 작성</td>
                                    <td>사기꾼입니다 이사람 산다해놓고 안사요</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>게시글</td>
                                    <td>사기글 작성</td>
                                    <td>사기꾼입니다 이사람 산다해놓고 안사요</td>
                                    <td>2024/02/01</td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="pageBar">
                            <div>&lt;&lt;</div>
                            <div>1</div>
                            <div>2</div>
                            <div>3</div>
                            <div>&gt;&gt;</div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
    <script>
        function boardDetail(boardNo){
            location.href="/board/detail="+boardNo;
        }
    </script>
</body>