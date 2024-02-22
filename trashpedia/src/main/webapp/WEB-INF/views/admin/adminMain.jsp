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
                            <div class="list-data"><fmt:formatNumber type="number" pattern="#,##0" value="${am}"/></div>
                        </div>
                        <div class="statistics-list">
                            <div class="statistics-list-title">신규 가입자</div>
                            <div class="list-data"><fmt:formatNumber type="number" pattern="#,##0" value="${nm}"/></div>
							<c:set var="percentChange" value="${(nm / om) * 100}" />
							<div class="change">
								<c:choose>
									<c:when test="${difference == 0}">
							            +<fmt:formatNumber type="number" pattern="0.00" value="${difference}" />%
							        </c:when>
									<c:when test="${difference > 0}">
							            +<fmt:formatNumber type="number" pattern="0.00" value="${percentChange}" />%
							        </c:when>
									<c:otherwise>
							            -<fmt:formatNumber type="number" pattern="0.00" value="${percentChange}" />%
							        </c:otherwise>
								</c:choose>
							</div>
                        </div>
                        <div class="statistics-list">
                            <div class="statistics-list-title">신규 게시글</div>
                            <div class="list-data"><fmt:formatNumber type="number" pattern="#,##0" value="${ab}"/></div>
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
	    // 회원 그래프
	    google.charts.load('current', {'packages':['corechart']});
	    google.charts.setOnLoadCallback(drawMemberChart);
	
	    function drawMemberChart() {
	        $.ajax({
	            url: 'admin/getMemberChartsData',
	            type: 'GET',
	            dataType: 'json',
	            success: function(data) {
	                console.log(data);
	                var chartData = new google.visualization.DataTable();
	                chartData.addColumn('number', '일');
	                chartData.addColumn('number', '회원');
	                
	                data.forEach(function(item) {
	                    var orderDay = parseInt(item.orderDay);
	                    chartData.addRow([orderDay, item.countMember]);
	                });

	                var options = {
	                    title : '회원 가입 현황',
	                    width : 1100,
	                    height : 400,
	                    vAxis: {title: '회원수'},
	                    hAxis: {title: '일별'},
	                };

	                var chart = new google.visualization.LineChart(document.getElementById('member_chart_div'));
	                chart.draw(chartData, options);
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	            }
	        });
	    }
	    // 게시글/댓글 그래프
	    google.charts.load('current', {'packages':['corechart']});
	    google.charts.setOnLoadCallback(drawBoardChart);
	
	    function drawBoardChart() {
	    	$.ajax({
	            url: 'admin/getBoardChartsData',
	            type: 'GET',
	            dataType: 'json',
	            success: function(data) {
	                console.log(data);
	                var chartData = new google.visualization.DataTable();
	                chartData.addColumn('number', '일별 게시 수');
	                chartData.addColumn('number', '게시글');
	                chartData.addColumn('number', '댓글');
	                
	                data.forEach(function(item) {
	                    var orderDay = parseInt(item.orderDay);
	                    chartData.addRow([orderDay, item.countBoard, item.countComment]);
	                });

	                var options = {
	                    title : '게시글 및 댓글 수 현황',
	                    width : 1100,
	                    height : 400,
	                    vAxis: {title: '게시수'},
	                    hAxis: {title: '일별'},
	                    bars: 'vertical',
	                    seriesType: 'bars',
	                    series: {1: {type: 'line'}}
	                };

	                var chart = new google.visualization.ComboChart(document.getElementById('board_chart_div'));
	                chart.draw(chartData, options);
	            },
	            error: function(xhr, status, error) {
	                console.error('Error: ' + error);
	            }
	        });
	    }
    </script>
</body>
</html>