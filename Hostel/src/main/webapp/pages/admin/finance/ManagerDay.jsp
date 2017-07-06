<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<html>
<head>
<title>销售管理 - HOSTEL</title>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/assets/favicon.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/normalize.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/plugins/datatables/datatables.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/style.css">
<script
	src="${pageContext.request.contextPath}/assets/js/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/echarts.js"></script>
</head>
<body class="admin-body">

	<%@include file="../../common/manager_navbar.jsp"%>
	<div class="wrapper">
		<div class="content">
			<div class="right-content">
				<div class="normal-div">
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a
							href="http://localhost:8080/Hostel/sale/manager"
							data-toggle="tab"> 谈旺季分析</a></li>
						<li ><a
							href="http://localhost:8080/Hostel/sale/areaAnly"
							data-toggle="tab">地区分析</a></li>
						<li><a href="http://localhost:8080/Hostel/sale/CustRank"
							data-toggle="tab">客户排名</a></li>
						<li ><a href="http://localhost:8080/Hostel/sale/hotelRank"
							data-toggle="tab">客栈排名</a></li>
						
					</ul>


					<div style="margin-bottom: 20px; margin-top: 20px;">
					
						<div class="alert alert-warning invalidAnalysis">
							据统计<span class="label label-warning">4月</span>入住Hostel连锁客栈的人数最多，<span
								class="label label-warning">3月</span>入住Hostel连锁客栈的人数最少，<span
								class="label label-warning">星期五</span>入住Hostel连锁客栈的人数最多，<span
								class="label label-warning">星期二</span>入住Hostel连锁客栈的人数最少，建议在热门时间上调价格，在冷门时间增加促销提升销量。<br /> 

						</div>




						<div class="chart-div" id="chart-div"></div>
					</div>
					<div id="chart-area" style="width: 700px; height: 430px;"></div>
					
					<script type="text/javascript">
							var myChart = echarts.init(document
									.getElementById('chart-area'));
							
							function getVirtulData(year) {
							    year = year || '2017';
							    var date = +echarts.number.parseDate(year + '-01-01');
							    var end = +echarts.number.parseDate(year  + '-06-29');
							    var dayTime = 3600 * 24 * 1000;
							    var data = [];
							    for (var time = date; time < end; time += dayTime) {
							        data.push([
							            echarts.format.formatTime('yyyy-MM-dd', time),
							            Math.floor(Math.random() * 1000000)
							        ]);
							    }
							    return data;
							}



							option = {
							    tooltip: {
							        position: 'top'
							    },
							    visualMap: {
							        min: 0,
							        max: 1000000,
							        calculable: true,
							        orient: 'horizontal',
							        left: 'center',
							        top: 'top'
							    },

							    calendar: [
							    {
							        range: '2017',
							        cellSize: ['auto', 20]
							    }],

							    series: [{
							        type: 'heatmap',
							        coordinateSystem: 'calendar',
							        calendarIndex: 0,
							        data: getVirtulData(2017)
							    }]

							};


                            
							myChart.setOption(option);
						</script>

				</div>
			</div>
		</div>
	</div>
	</div>
	<%@include file="/pages/common/toaster.jsp"%>
</body>

<style>
.book-item {
	margin-bottom: 20px;
	border-bottom: 1px solid #b6b6b6;
	padding-bottom: 10px;
}
</style>
<script>
	$(document).ready(function() {
	});
</script>
</html>
