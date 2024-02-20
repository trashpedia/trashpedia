<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>trashManagement</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="resources/css/admin/trashManagement.css">
</head>
<jsp:include page="../common/header.jsp"/>
<body class="body">
    <jsp:include page="../common/sidebar.jsp"/>
    <div class="content-wrapper">
        <div class="content">
            <section class="search-section">
                <div class="search-container">
                    <div class="search-title">쓰레기 관리</div>
                    <div class="input">
                        <select name="condition" id="filterSelect">
                            <option value="userNo" selected>번호</option>
                            <option value="userName">제목</option>
                        </select>
                        <input type="search" name="search" id="search" placeholder="Search">
                        <input type="button" id="search" value="검색">
                    </div>
                </div>
            </section>
            <section class="trash-section">
                <div class="trash-board-container">
                    <div class="trash-content">
                        <div class="trash-board-title-wrapper">
                            <div class="trash-board-title">쓰레기 게시글</div>
                            <div class="trash-board-subtitle">총 150개</div>
                            <input class="trash-write" type="button" onclick="writeTrash()" value="글쓰기">
                        </div>
                        <table class="trash-table">
                            <thead>
                                <tr>
                                    <th>쓰레기 번호</th>
                                    <th>쓰레기 대분류</th>
                                    <th>쓰레기 소분류</th>
                                    <th>쓰레기 이름</th>
                                    <th>쓰레기 작성일</th>
                                    <th>쓰레기 수정일</th>
                                </th>
                            </thead>
                            <tbody>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>가전</td>
                                    <td>냉장고</td>
                                    <td>700L 냉장고</td>
                                    <td>2024/01/01</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>가전</td>
                                    <td>냉장고</td>
                                    <td>700L 냉장고</td>
                                    <td>2024/01/01</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>가전</td>
                                    <td>냉장고</td>
                                    <td>700L 냉장고</td>
                                    <td>2024/01/01</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>가전</td>
                                    <td>냉장고</td>
                                    <td>700L 냉장고</td>
                                    <td>2024/01/01</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>가전</td>
                                    <td>냉장고</td>
                                    <td>700L 냉장고</td>
                                    <td>2024/01/01</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>가전</td>
                                    <td>냉장고</td>
                                    <td>700L 냉장고</td>
                                    <td>2024/01/01</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>가전</td>
                                    <td>냉장고</td>
                                    <td>700L 냉장고</td>
                                    <td>2024/01/01</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>가전</td>
                                    <td>냉장고</td>
                                    <td>700L 냉장고</td>
                                    <td>2024/01/01</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>가전</td>
                                    <td>냉장고</td>
                                    <td>700L 냉장고</td>
                                    <td>2024/01/01</td>
                                    <td>2024/02/01</td>
                                </tr>
                                <tr onclick="detailPage(1)">
                                    <td>1</td>
                                    <td>가전</td>
                                    <td>냉장고</td>
                                    <td>700L 냉장고</td>
                                    <td>2024/01/01</td>
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
                <div class="trash-request-container">
                    <div class="trash-container">
                        <div class="trash-title-wrapper">
                            <div class="trash-title">신청 리스트</div>
                            <div class="trash-subtitle">총 5,000개</div>
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
                    <div class="trash-container">
                        <div class="trash-title-wrapper">
                            <div class="trash-title">수정 요청 리스트</div>
                            <div class="trash-subtitle">총 3,000개</div>
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
                </div>
            </section>
        </div>
    </div>
    <script>
        function detailPage(trashNo){
            location.href="/detail=" + trashNo;
        }
        function writeTrash(){
            location.href="/adminBoard.html";
        }
    </script>
</body>