<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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
	src="${pageContext.request.contextPath}/assets/js/echarts.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/china.js"></script>
</head>
<body class="admin-body">

	<%@include file="../../common/admin_navbar.jsp"%>
	<div class="wrapper">
		<div class="content">
			<%@include file="../../common/sale_left.jsp"%>
			<div class="right-content">
				<div class="normal-div">
					<ul id="myTab" class="nav nav-tabs">
						<li><a href="http://localhost:8080/Hostel/sale/dayOrderNum"
							data-toggle="tab"> 订单数量</a></li>
						<li><a
							href="http://localhost:8080/Hostel/admin/fiance/hotelDay"
							data-toggle="tab">订单金额</a></li>
						<li><a href="http://localhost:8080/Hostel/admin/fiance"
							data-toggle="tab">客户分析</a></li>
						<li class="active"><a
							href="http://localhost:8080/Hostel/sale/areaRank"
							data-toggle="tab">地区排名</a></li>
							<li><a href="http://localhost:8080/Hostel/admin/fiance/predictpage"
							data-toggle="tab">销售额预测</a></li>
					</ul>

					<div style="margin-bottom: 20px; margin-top: 20px;">
						<div class="alert alert-warning invalidAnalysis">
							今天排名第<span class="label label-warning">9</span>位，恭喜上榜了！加把油，销售额还差<span class="label label-warning">200</span>
							就能超过上一名 <span
								class="label label-warning">七色阳光花园</span>啦！
						</div>
						<div class="clear-fix"></div>
						今日排行榜(前十)
						<div class="table-container">
							<table id="js-table" class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>酒店</th>
										<th>名次</th>
										<th>销售额</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>香格里拉</td>
										<td>第1名</td>
										<td>72900</td>
									</tr>
									<tr>
										<td>新城花园</td>
										<td>第2名</td>
										<td>68000</td>
									</tr>
									<tr>
										<td>五棵松酒店</td>
										<td>第3名</td>
										<td>62700</td>
									</tr>
									<tr>
										<td>宜家花园</td>
										<td>第4名</td>
										<td>55005</td>
									</tr>
									<tr>
										<td>花筑客栈</td>
										<td>第5名</td>
										<td>52765</td>
									</tr>
									<tr>
										<td>水墨客栈</td>
										<td>第6名</td>
										<td>52705</td>
									</tr>
									<tr>
										<td>云府酒店</td>
										<td>第7名</td>
										<td>51250</td>
									</tr>
									<tr>
										<td>七色阳光花园</td>
										<td>第8名</td>
										<td>50000</td>
									</tr>
									<tr>
										<td bgcolor="pink">全季酒店（我）</td>
										<td bgcolor="pink">第9名</td>
										<td bgcolor="pink">48800</td>
									</tr>
									<tr>
										<td >丽江客栈</td>
										<td>第10名</td>
										<td>12705</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div style="margin-bottom: 20px; margin-top: 20px;">
						<div class="alert alert-warning invalidAnalysis">
							历史最高排名<span class="label label-warning">50</span>最低排名<span class="label label-warning">10</span>
						</div>
						<div class="clear-fix"></div>

						<div style="margin-bottom: 20px; margin-top: 20px;">
							<div id="chart-area" style="width: 600px; height: 400px;"></div>
							<script type="text/javascript">
							var myChart = echarts.init(document
									.getElementById('chart-area'));
							var base = +new Date(2016, 12, 1);
							var oneDay = 24 * 3600 * 1000;
							var date = [];

							var data = [Math.random() * 300];

							for (var i = 1; i < 20000; i++) {
							    var now = new Date(base += oneDay);
							    date.push([now.getFullYear(), now.getMonth() + 1, now.getDate()].join('/'));
							    data.push(Math.round((Math.random() - 0.5) * 20 + data[i - 1]));
							}
							function randomData() {
								return Math.round(Math.random() * 1000);
							}

							option = {
								    title: {
								        text: '我的排名'
								    },
								    tooltip: {
								        trigger: 'axis'
								    },
								    legend: {
								        data:['排名']
								    },
								    toolbox: {
								        show: true,
								        feature: {
								            dataZoom: {
								                yAxisIndex: 'none'
								            },
								            dataView: {readOnly: false},
								            magicType: {type: ['line', 'bar']},
								          
								        }
								    },
								    xAxis:  {
								        type: 'category',
								        data:  date
								    },
								    yAxis: {
								        type: 'value'
								    },
								    series: [
								        {
								            name:'历史排名',
								            type:'line',
								            data:[50, 49, 48, 48, 47, 40, 39,
								            	38, 49, 48, 48, 47, 40, 37,
								            	40, 39, 38, 38, 37, 30, 29,
								            	29,40, 39, 38, 38, 37, 30, 29,
								            	28,27,27,27,26,25,25,26,27,26,25,27,27,27,26,25,25,26,27,26,25,27,27,27,26,25,25,26,27,26,25
								            	,27,27,27,26,25,25,26,27,26,25,24,24,24,23,23,24,23,23,22,22,21,20,20,21,21,20,19,18
								            	,23,23,22,22,21,20,20,21,21,20,19,18,17,17,16,16,15,15,16,16,15,14,14,15,16,15,14,13,13,14,14,12,13,13,12
								            	,14,15,16,15,14,13,13,14,14,12,13,13,12,14,15,16,15,14,13,13,14,14,12,13,13,12,14,15,16,15,14,13,13,14,14,12,13,13,12,14,15,16,10],
								            markPoint: {
								                data: [
								                    {type: 'max', name: '最大值'},
								                    {type: 'min', name: '最小值'}
								                ]
								            },
								            markLine: {
								                data: [
								                    {type: 'average', name: '平均值'}
								                ]
								            }
								        }
								    ]
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
