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
	src="${pageContext.request.contextPath}/assets/js/echarts.js"></script>
</head>
<body class="admin-body">

	<%@include file="../../common/manager_navbar.jsp"%>
	<div class="wrapper">
		<div class="content">
			<div class="right-content">
				<div class="normal-div">
					<ul id="myTab" class="nav nav-tabs">
						<li ><a
							href="http://localhost:8080/Hostel/sale/manager"
							data-toggle="tab"> 谈旺季分析</a></li>
						<li ><a
							href="http://localhost:8080/Hostel/sale/areaAnly"
							data-toggle="tab">地区分析</a></li>
						<li class="active"><a href="http://localhost:8080/Hostel/sale/CustRank"
							data-toggle="tab">客户排名</a></li>
						<li ><a href="http://localhost:8080/Hostel/sale/hotelRank"
							data-toggle="tab">客栈排名</a></li>
						
					</ul>
<div style="margin-bottom: 20px; margin-top: 20px;">
						<div class="alert alert-warning invalidAnalysis">
							建议对根据RFM模型综合计算得出的最佳客户进行相应奖励
						</div>
						<div class="clear-fix"></div>
						最佳顾客(前五)
						<div class="table-container">
							<table id="js-table" class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>姓名</th>
										<th>名次</th>
										<th>指数</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>张三</td>
										<td>第1名</td>
										<td>5040000</td>
									</tr>
									<tr>
										<td>李四</td>
										<td>第2名</td>
										<td>3400000</td>
									</tr>
									<tr>
										<td>王五</td>
										<td>第3名</td>
										<td>2040000</td>
									</tr>
									<tr>
										<td>二麻子</td>
										<td>第4名</td>
										<td>950400</td>
									</tr>
									<tr>
										<td>赵钱</td>
										<td>第5名</td>
										<td>576000</td>
									</tr>
									
								</tbody>
							</table>
			 <div style="margin-bottom: 20px; margin-top: 20px;">
                <div id="chart-area" style="width: 600px;height:400px;"></div>
                <script type="text/javascript">
                    var myChart = echarts.init(document.getElementById('chart-area'));
                    option = {
                    	    title: {
                    	        text: 'RFM雷达图',
                    	    },
                    	    tooltip: {},
                    	    legend: {
                    	        data: ['张三', '李四','王五','二麻子','赵钱' ]
                    	    },
                    	    radar: {
                    	        // shape: 'circle',
                    	        indicator: [
                    	           { name: '1/R（1/最后购买时间）', max: 1},
                    	           { name: 'F（购买次数）', max: 180},
                    	           { name: 'M（购买金额）', max: 28000},
                    	        ]
                    	    },
                    	    series: [{
                    	        name: '',
                    	        type: 'radar',
                    	        // areaStyle: {normal: {}},
                    	        data : [
                    	            {
                    	                value : [1, 180, 28000],
                    	                name : '张三'
                    	            },
                    	             {
                    	                value : [1, 170, 20000],
                    	                name : '李四'
                    	            },
                    	             {
                    	                value : [0.5, 170, 24000],
                    	                name : '王五'
                    	            },
                    	             {
                    	                value : [0.33, 160, 18000],
                    	                name : '二麻子'
                    	            },
                    	             {
                    	                value : [0.2, 160, 18000],
                    	                name : '赵钱'
                    	            }
                    	        ]
                    	    }]
                    	};
                    myChart.setOption(option);
                </script>

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
