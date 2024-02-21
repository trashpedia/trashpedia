<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>adminMainPage</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
    <link rel="stylesheet" href="${contextPath}/resources/css/admin/adminMain.css">
</head>
<jsp:include page="../common/header.jsp"/>
<body class="body">
    <jsp:include page="../common/sidebar.jsp"/>
    <div class="content-wrapper">
        <div class="content">
            <section class="statistics-section">
                <div class="statistics-container">
                    <div class="statistics-list-wrapper">
                        <div class="statistics-list">
                            <div class="statistics-list-title">총 가입자</div>
                            <div class="list-data"><fmt:formatNumber type="number" pattern="#,##0" value="${allMember}"/></div>
                        </div>
                        <div class="statistics-list">
                            <div class="statistics-list-title">신규 가입자</div>
                            <div class="list-data"><fmt:formatNumber type="number" pattern="#,##0" value="${newMember}"/></div>
                            <c:set var="difference" value="${allMember - newMember}" />
							<c:set var="percentChange" value="${(difference / allMember) * 100}" />
							<div class="change">
								<c:choose>
									<c:when test="${difference == 0}">
							            +<fmt:formatNumber type="number" pattern="0.00" value="${difference}" />%
							        </c:when>
									<c:when test="${difference > 0}">
							            +<fmt:formatNumber type="number" pattern="0.00" value="${percentChange}" />%
							        </c:when>
									<c:otherwise>
							            -<fmt:formatNumber type="number" pattern="0.00" value="${-percentChange}" />%
							        </c:otherwise>
								</c:choose>
							</div>
                        </div>
                        <div class="statistics-list">
                            <div class="statistics-list-title">신규 게시글</div>
                            <div class="list-data"><fmt:formatNumber type="number" pattern="#,##0" value="${allBoard}"/></div>
                        </div>
                    </div>
                    <div class="graph-container-wrapper">
                        <div class="graph-container">
                            <div id="member_chart_div"></div>
                            <div class="tab-group">
                                <input type="button" value="일">
                                <input type="button" value="주">
                                <input type="button" value="월">
                            </div>
                        </div>
                    </div>
                    <div class="graph-container-wrapper">
                        <div class="graph-container">
                            <div id="board_chart_div"></div>
                            <div class="tab-group">
                                <input type="button" value="일">
                                <input type="button" value="주">
                                <input type="button" value="월">
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- <section class="section">
                <div class="container">
                    <div class="title">최근 활동</div>
                    <div class="member-list">
                        <div class="row">
                            <div class="article">
                                <div class="imageContainer">
                                    <div class="image"></div>
                                </div>
                                <div class="frame">
                                    <div class="title">루피</div>
                                    <div class="subtitle">roopy</div>
                                    <div class="subtitle">신규가입</div>
                                    <div class="user">
                                        <div class="avatar-wrapper">
                                            <div class="avatar"></div>
                                            <div class="frame">
                                                <div class="title">Admin</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="article">
                                <div class="imageContainer">
                                    <div class="image"></div>
                                </div>
                                <div class="frame">
                                    <div class="title">신규 게시글</div>
                                    <div class="subtitle">루피</div>
                                    <div class="subtitle">야 싸우자</div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="article">
                                <div class="imageContainer">
                                    <div class="image"></div>
                                </div>
                                <div class="frame">
                                    <div class="title">신규 오쓰완</div>
                                    <div class="subtitle">Product A</div>
                                    <div class="subtitle">호호홓 오늘의 분리수거 완</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section> -->
        </div>
    </div>
    <script>
	    $.ajax({
	        url: "${contextPath}/admin/getMemberData",
	        method: "GET",
	        dataType: "json",
	        success: function(responseData) {
	            var data = google.visualization.arrayToDataTable(responseData);
	            var options = {
	                title: '가입자 / 탈퇴자 현황',
	                width: 1100,
	                height: 400,
	                vAxis: {title: '유저수'},
	                hAxis: {title: '일별 가입자 수'},
	                seriesType: 'bars'
	            };
	            var chart = new google.visualization.ComboChart(document.getElementById('member_chart_div'));
	            chart.draw(data, options);
	        },
	        error: function(xhr, status, error) {
	            console.error("AJAX request error:", status, error);
	        }
	    });

        function drawStuff() {
        var data = google.visualization.arrayToDataTable([
            ['일', '가입자', '탈퇴자'],
            ['1',  160,      14],
            ['2',  132,      2],
            ['3',  151,      23],
            ['4',  129,      9],
            ['5',  132,      15],
            ['6',  113,      23]
        ]);

        var options = {
            title : '가입자 / 탈퇴자 현황',
            width : 1100,
            height : 400,
            vAxis: {title: '유저수'},
            hAxis: {title: '일별 가입자 수'},
            seriesType: 'bars'
        };
        var chart = new google.visualization.ComboChart(document.getElementById('member_chart_div'));
        chart.draw(data, options);
        };
        // 게시글 그래프
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawVisualization);

        function drawVisualization() {
        var data = google.visualization.arrayToDataTable([
            ['일', '게시글', '댓글'],
            ['1',  165,      614],
            ['2',  135,      682],
            ['3',  157,      623],
            ['4',  139,      609],
            ['5',  136,      569],
            ['6',  136,      569]
        ]);

        var options = {
            title : '게시글 / 댓글 작성 현황',
            width : 1100,
            height : 400,
            vAxis: {title: '작성수'},
            hAxis: {title: '일별 작성 수'},
            seriesType: 'bars'
        };
        var chart = new google.visualization.ComboChart(document.getElementById('board_chart_div'));
        chart.draw(data, options);
        };
    </script>
</body>
</html>