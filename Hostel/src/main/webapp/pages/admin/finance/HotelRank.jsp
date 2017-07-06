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

	<%@include file="../../common/manager_navbar.jsp"%>
	<div class="wrapper">
		<div class="content">
			<%@include file="../../common/admin_left.jsp"%>
			<div class="right-content">
				<div class="normal-div">
					<ul id="myTab" class="nav nav-tabs">
						<li ><a
							href="http://localhost:8080/Hostel/sale/manager"
							data-toggle="tab"> 谈旺季分析</a></li>
						<li ><a
							href="http://localhost:8080/Hostel/sale/areaAnly"
							data-toggle="tab">地区分析</a></li>
						<li><a href="http://localhost:8080/Hostel/sale/CustRank"
							data-toggle="tab">客户排名</a></li>
						<li class="active"><a href="http://localhost:8080/Hostel/sale/hotelRank"
							data-toggle="tab">客栈排名</a></li>
						
					</ul>

					<div style="margin-bottom: 20px; margin-top: 20px;">
						<div class="alert alert-warning invalidAnalysis">
							建议对排名靠前的客栈做出奖励措施，以提高他们的积极性
						</div>
						<div class="clear-fix"></div>
						今日最佳(前十)
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
										<td >全季酒店</td>
										<td >第9名</td>
										<td >48800</td>
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
							建议对一下销售不佳的客栈做出惩罚措施，以提高他们的积极性
						</div>
						<div class="clear-fix"></div>
						<div class="clear-fix"></div>
						今日最差(前十)
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
										<td bgcolor="red">小花客栈</td>
										<td bgcolor="red">第1名</td>
										<td bgcolor="red">100</td>
									</tr>
									<tr>
										<td bgcolor="red">小草花园</td>
										<td bgcolor="red">第2名</td>
										<td bgcolor="red">200</td>
									</tr>
									<tr>
										<td bgcolor="red">一棵树酒店</td>
										<td bgcolor="red">第3名</td>
										<td bgcolor="red">300</td>
									</tr>
									<tr>
										<td bgcolor="red">石家花园</td>
										<td bgcolor="red">第4名</td>
										<td bgcolor="red">400</td>
									</tr>
									<tr>
										<td bgcolor="red">鹦鹉客栈</td>
										<td bgcolor="red">第5名</td>
										<td bgcolor="red">500</td>
									</tr>
									<tr>
										<td  bgcolor="red">小河客栈</td>
										<td bgcolor="red">第6名</td>
										<td bgcolor="red">600</td>
									</tr>
									<tr>
										<td bgcolor="red">老王酒店</td>
										<td bgcolor="red">第7名</td>
										<td bgcolor="red">700</td>
									</tr>
									<tr>
										<td bgcolor="red">美丽花园</td>
										<td bgcolor="red">第8名</td>
										<td bgcolor="red">800</td>
									</tr>
									<tr>
										<td bgcolor="red">小牛酒店</td>
										<td bgcolor="red">第9名</td>
										<td bgcolor="red">900</td>
									</tr>
									<tr>
										<td bgcolor="red">苹果客栈</td>
										<td bgcolor="red">第10名</td>
										<td bgcolor="red">1205</td>
									</tr>
								</tbody>
							</table>
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
