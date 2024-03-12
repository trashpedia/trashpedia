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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
    <link rel="stylesheet" href="${contextPath}/resources/css/admin/adminMain.css">
</head>
<%-- <jsp:include page="../common/header.jsp"/> --%>
<body class="body">
    <jsp:include page="../common/sidebar.jsp"/>
    <div class="content-wrapper">
        <div class="content">
            <section class="statistics-section">
                <div class="statistics-container">
                    <div class="statistics-list-wrapper">
                        <div class="statistics-list">
                            <div class="statistics-list-title">
                            	<span class="material-symbols-outlined">group</span>총 가입자
                            </div>
                            <div class="list-data"><fmt:formatNumber type="number" pattern="#,##0" value="${am}"/></div>
                        </div>
                        <div class="statistics-list">
                            <div class="statistics-list-title">
                            	<span class="material-symbols-outlined">person_add</span>신규 가입자
                            </div>
                            <div class="list-data"><fmt:formatNumber type="number" pattern="#,##0" value="${nm}"/></div>
							<c:set var="m" value="${nm - om}" />
								<c:choose>
								    <c:when test="${m >= 0}">
										<div class="change" style="color : red;">
									        +<fmt:formatNumber type="number" pattern="#,##0" value="${Math.abs(m)}" />
										</div>
								    </c:when>
								    <c:otherwise>
									  	<div class="change" style="color : blue;">
									       -<fmt:formatNumber type="number" pattern="#,##0" value="${Math.abs(m)}" />
								       </div>
								    </c:otherwise>
								</c:choose>
                        </div>
                        <div class="statistics-list">
                            <div class="statistics-list-title">
                           		<span class="material-symbols-outlined">contract</span>총 게시글
                            </div>
                            <div class="list-data"><fmt:formatNumber type="number" pattern="#,##0" value="${ab}"/></div>
                        </div>
                        <div class="statistics-list">
                            <div class="statistics-list-title">
                            	<span class="material-symbols-outlined">post_add</span>신규 게시글
                            </div>
                            <div class="list-data"><fmt:formatNumber type="number" pattern="#,##0" value="${nb}"/></div>
							<c:set var="b" value="${nb - ob}" />
								<c:choose>
								    <c:when test="${b >= 0}">
									    <div class="change" style="color : red;">
									        +<fmt:formatNumber type="number" pattern="#,##0" value="${Math.abs(b)}" />
									    </div>
								    </c:when>
								    <c:otherwise>
								    	<div class="change" style="color : blue;">
								       	-<fmt:formatNumber type="number" pattern="#,##0" value="${Math.abs(b)}" />
								    	</div>
								    </c:otherwise>
								</c:choose>
                        </div>
                    </div>
                    <div class="graph-container-wrapper">
                        <div class="graph-container">
                            <div id="member_chart_div"></div>
                        </div>
                    </div>
                    <div class="graph-container-wrapper">
                        <div class="graph-container">
                            <div id="board_chart_div"></div>
                        </div>
                    </div>
                </div>
            </section>
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
	    function processData(data) {
		    var groupedData = new Map();
		
		    data.forEach(function(item) {
		        var orderDay = item.orderDay;
		        var countBoard = item.countBoard;
		        var countComment = item.countComment;
		
		        if (groupedData.has(orderDay)) {
		            var existingData = groupedData.get(orderDay);
		            existingData.countBoard += countBoard;
		            existingData.countComment += countComment;
		        } else {
		            groupedData.set(orderDay, { orderDay: orderDay, countBoard: countBoard, countComment: countComment });
		        }
		    });
		    var processedData = Array.from(groupedData.values());
		
		    processedData.sort(function(a, b) {
		        return a.orderDay - b.orderDay;
		    });
		    return processedData;
		}
	    
	    google.charts.load('current', {'packages':['corechart']});
	    google.charts.setOnLoadCallback(drawBoardChart);
	
	    function drawBoardChart() {
	    	$.ajax({
	            url: 'admin/getBoardChartsData',
	            type: 'GET',
	            dataType: 'json',
	            success: function(data) {
	            	var processedData = processData(data);
	    			console.log(processedData);

	                var chartData = new google.visualization.DataTable();
	                chartData.addColumn('number', '일별');
	                chartData.addColumn('number', '게시글');
	                chartData.addColumn('number', '댓글');
					
	                processedData.forEach(function(item) {
	                    chartData.addRow([item.orderDay, item.countBoard, item.countComment]);
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