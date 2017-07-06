<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>我的首页 - HOSTEL</title>
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
    <script src="${pageContext.request.contextPath}/assets/js/echarts.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/china.js"></script>
</head>
<body class="admin-body">
	<%@include file="../common/navbar.jsp"%>
	<%@include file="../common/dashboard_header.jsp"%>
	<div class="wrapper">
		<div class="content">
			<%@include file="../common/dashboard_left.jsp"%>
			<div class="memright-content">
<div style="margin-bottom: 20px; margin-top: 20px;">
						<div class="alert alert-warning invalidAnalysis">
							我总共在Hostel客栈连锁入住过<span class="label label-warning">100</span>天，足迹涉及到<span class="label label-warning">17</span>个省市自治区，我最爱入住<span
								class="label label-warning">北京、上海和浙江</span>的<span
								class="label label-warning">标准间</span>。赶快入住Hostel客栈，点亮地图吧！<br />
								</div></div>
				<div class="chart-div" id="chart-div"></div>
				<div id="chart-area" style="width: 700px; height: 430px;"></div>
				
				<script type="text/javascript">
					var myChart = echarts.init(document.getElementById('chart-area'));

					function randomData() {
					    return Math.round(Math.random()*1000);
					}

					option = {
					    title: {
					        text: '我的足迹',
					        subtext: '全国Hostel客栈历史入住情况',
					        left: 'center'
					    },
					    tooltip: {
					        trigger: 'item'
					    },
					    legend: {
					        orient: 'vertical',
					        left: 'left',
					        data:['标准间','套房']
					    },
					    visualMap: {
					        min: 0,
					        max: 30,
					        left: 'left',
					        top: 'bottom',
					        text: ['高','低'],           // 文本，默认为数值文本
					        calculable: true
					    },
					    toolbox: {
					        show: true,
					        orient: 'vertical',
					        left: 'right',
					        top: 'center',
					        feature: {
					            dataView: {readOnly: false},
					            restore: {},
					            saveAsImage: {}
					        }
					    },
					    series: [
					        {
					            name: '标准间',
					            type: 'map',
					            mapType: 'china',
					            roam: false,
					            label: {
					                normal: {
					                    show: true
					                },
					                emphasis: {
					                    show: true
					                }
					            },
					            data:[
					                {name: '北京',value: 15 },
					                {name: '天津',value: 1 },
					                {name: '上海',value: 12 },
					                {name: '河北',value: 1 },
					                {name: '湖南',value: 1 },
					                {name: '安徽',value: 1 },
					                {name: '山东',value: 1 },
					                {name: '新疆',value: 3 },
					                {name: '江苏',value: 8 },
					                {name: '浙江',value: 10 },
					                {name: '陕西',value: 1 },
					                {name: '吉林',value: 1 },
					                {name: '福建',value: 1 },
					                {name: '广东',value: 1 },
					                {name: '四川',value: 2 },
					                {name: '台湾',value: 4 },
					                {name: '香港',value: 3 },
					            ]
					        },
					        {
					            name: '套房',
					            type: 'map',
					            mapType: 'china',
					            label: {
					                normal: {
					                    show: true
					                },
					                emphasis: {
					                    show: true
					                }
					            },
					            data:[
					                {name: '北京',value: 15 },
					                {name: '天津',value: 1 },
					                {name: '上海',value: 12 },
					                {name: '河北',value: 1 },
					                {name: '湖南',value: 1 },
					                {name: '安徽',value: 1 },
					                {name: '山东',value: 1 },
					                {name: '新疆',value: 1 },
					                {name: '江苏',value: 8 },
					                {name: '浙江',value: 10 },
					                {name: '陕西',value: 1 },
					                {name: '吉林',value: 1 },
					                {name: '福建',value: 1 },
					                {name: '广东',value: 1 },
					                {name: '四川',value: 2 },
					                {name: '台湾',value: 4 },
					                {name: '香港',value: 3 },
					            ]
					        }
					    ]
					};                

					myChart.setOption(option);
						</script>

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

