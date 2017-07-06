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
						<li ><a href="http://localhost:8080/Hostel/sale/dayOrderNum" data-toggle="tab">
								订单数量</a></li>
						<li ><a href="http://localhost:8080/Hostel/admin/fiance/hotelDay" data-toggle="tab">订单金额</a></li>
						<li ><a href="http://localhost:8080/Hostel/admin/fiance" data-toggle="tab">客户分析</a></li>
						<li class="active"><a href="http://localhost:8080/Hostel/sale/areaRank"
							data-toggle="tab">地区排名</a></li>
					</ul>


					<div style="margin-bottom: 20px; margin-top: 20px;">
						<div id="chart-area" style="width: 600px; height: 400px;"></div>
						<script type="text/javascript">
							var myChart = echarts.init(document
									.getElementById('chart-area'));

							function randomData() {
								return Math.round(Math.random() * 1000);
							}

							option = {
								title : {
									text : '销量',
									subtext : '',
									left : 'center'
								},
								tooltip : {
									trigger : 'item'
								},
								legend : {
									orient : 'vertical',
									left : 'left',
									data : [ '标准间', '套房', '所有' ]
								},
								visualMap : {
									min : 0,
									max : 2500,
									left : 'left',
									top : 'bottom',
									text : [ '高', '低' ], // 文本，默认为数值文本
									calculable : true
								},
								toolbox : {
									show : true,
									orient : 'vertical',
									left : 'right',
									top : 'center',
									feature : {
										dataView : {
											readOnly : false
										},
										restore : {},
										saveAsImage : {}
									}
								},
								series : [ {
									name : '标准间',
									type : 'map',
									mapType : 'china',
									roam : false,
									label : {
										normal : {
											show : true
										},
										emphasis : {
											show : true
										}
									},
									data : [ {
										name : '北京',
										value : randomData()
									}, {
										name : '天津',
										value : randomData()
									}, {
										name : '上海',
										value : randomData()
									}, {
										name : '重庆',
										value : randomData()
									}, {
										name : '河北',
										value : randomData()
									}, {
										name : '河南',
										value : randomData()
									}, {
										name : '云南',
										value : randomData()
									}, {
										name : '辽宁',
										value : randomData()
									}, {
										name : '黑龙江',
										value : randomData()
									}, {
										name : '湖南',
										value : randomData()
									}, {
										name : '安徽',
										value : randomData()
									}, {
										name : '山东',
										value : randomData()
									}, {
										name : '新疆',
										value : randomData()
									}, {
										name : '江苏',
										value : randomData()
									}, {
										name : '浙江',
										value : randomData()
									}, {
										name : '江西',
										value : randomData()
									}, {
										name : '湖北',
										value : randomData()
									}, {
										name : '广西',
										value : randomData()
									}, {
										name : '甘肃',
										value : randomData()
									}, {
										name : '山西',
										value : randomData()
									}, {
										name : '内蒙古',
										value : randomData()
									}, {
										name : '陕西',
										value : randomData()
									}, {
										name : '吉林',
										value : randomData()
									}, {
										name : '福建',
										value : randomData()
									}, {
										name : '贵州',
										value : randomData()
									}, {
										name : '广东',
										value : randomData()
									}, {
										name : '青海',
										value : randomData()
									}, {
										name : '西藏',
										value : randomData()
									}, {
										name : '四川',
										value : randomData()
									}, {
										name : '宁夏',
										value : randomData()
									}, {
										name : '海南',
										value : randomData()
									}, {
										name : '台湾',
										value : randomData()
									}, {
										name : '香港',
										value : randomData()
									}, {
										name : '澳门',
										value : randomData()
									} ]
								}, {
									name : '套房',
									type : 'map',
									mapType : 'china',
									label : {
										normal : {
											show : true
										},
										emphasis : {
											show : true
										}
									},
									data : [ {
										name : '北京',
										value : randomData()
									}, {
										name : '天津',
										value : randomData()
									}, {
										name : '上海',
										value : randomData()
									}, {
										name : '重庆',
										value : randomData()
									}, {
										name : '河北',
										value : randomData()
									}, {
										name : '安徽',
										value : randomData()
									}, {
										name : '新疆',
										value : randomData()
									}, {
										name : '浙江',
										value : randomData()
									}, {
										name : '江西',
										value : randomData()
									}, {
										name : '山西',
										value : randomData()
									}, {
										name : '内蒙古',
										value : randomData()
									}, {
										name : '吉林',
										value : randomData()
									}, {
										name : '福建',
										value : randomData()
									}, {
										name : '广东',
										value : randomData()
									}, {
										name : '西藏',
										value : randomData()
									}, {
										name : '四川',
										value : randomData()
									}, {
										name : '宁夏',
										value : randomData()
									}, {
										name : '香港',
										value : randomData()
									}, {
										name : '澳门',
										value : randomData()
									} ]
								}, {
									name : '所有',
									type : 'map',
									mapType : 'china',
									label : {
										normal : {
											show : true
										},
										emphasis : {
											show : true
										}
									},
									data : [ {
										name : '北京',
										value : randomData()
									}, {
										name : '天津',
										value : randomData()
									}, {
										name : '上海',
										value : randomData()
									}, {
										name : '广东',
										value : randomData()
									}, {
										name : '台湾',
										value : randomData()
									}, {
										name : '香港',
										value : randomData()
									}, {
										name : '澳门',
										value : randomData()
									} ]
								} ]
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
