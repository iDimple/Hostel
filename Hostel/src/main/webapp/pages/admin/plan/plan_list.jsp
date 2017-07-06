<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>房源计划 - HOSTEL</title>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/assets/favicon.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/normalize.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/plugins/datatables/datatables.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/style.css">
<script
	src="${pageContext.request.contextPath}/assets/js/jquery-2.1.4.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/plugins/datatables/datatables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/echarts.min.js"></script>
</head>
<body class="admin-body">
	<%@include file="../../common/admin_navbar.jsp"%>
	<div class="wrapper">
		<div class="content">
			<div class="admin-panel">
				<h3 class="title">客户价值RFM模型分析</h3>

				<div class="normal-div">店面：${product.name}</div>

				<div class="table-container">
					<table id="js-table" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>R:最后购买时间</th>
								<th>F：成功的单数</th>
								<th>M：平均订单价</th>
								<th>P：客户数量</th>
								<th>W：成交总金额</th>
								<th>W：策略</th>
							</tr>
						</thead>
						<tbody>
								<tr>
									<td >小于等于100天</td>
									<td>大于2次</td>
									<td>大于80元</td>
									<td>256人</td>
									<td>325713元</td>
									<td>
										重要保持
									</td>
								</tr>
								<tr>
									<td >小于等于100天</td>
									<td>小于等于2次</td>
									<td>小于等于80元</td>
									<td>165人</td>
									<td>291290元</td>
									<td>
										重要发展
									</td>
								</tr>
								<tr>
									<td >小于等于100天</td>
									<td>小于等于2次</td>
									<td>大于80元</td>
									<td>137人</td>
									<td>283306元</td>
									<td>
										重要价值
									</td>
								</tr>
								<tr>
									<td >大于100天</td>
									<td>大于2次</td>
									<td>大于80元</td>
									<td>356人</td>
									<td>169800元</td>
									<td>
										重要挽留
									</td>
								</tr>
								<tr>
									<td >小于等于100天</td>
									<td>大于2次</td>
									<td>小于等于80元</td>
									<td>56人</td>
									<td>6400元</td>
									<td>
										一般重要
									</td>
								</tr>
								<tr>
									<td >大于100天</td>
									<td>小于等于2次</td>
									<td>大于80元</td>
									<td>298人</td>
									<td>29000元</td>
									<td>
										一般客户
									</td>
								</tr>
								<tr>
									<td >大于100天</td>
									<td>大于2次</td>
									<td>小于等于80元</td>
									<td>98人</td>
									<td>10250元</td>
									<td>
										一般挽留
									</td>
								</tr>
								<tr>
									<td >大于100天</td>
									<td>小于等于2次</td>
									<td>小于等于80元</td>
									<td>192人</td>
									<td>2050元</td>
									<td>
										无价值
									</td>
								</tr>
						</tbody>
					</table>
				</div>
<div class="chart-div" id="chart-div"></div>
					<div id="chart-area" style="width: 700px; height: 430px;"></div>
					<script type="text/javascript">
							var myChart = echarts.init(document
									.getElementById('chart-area'));
							option = {
								    backgroundColor: '#2c343c',

								    title: {
								        text: '各类型客户比例',
								        left: 'center',
								        top: 20,
								        textStyle: {
								            color: '#ccc'
								        }
								    },

								    tooltip : {
								        trigger: 'item',
								        formatter: "{a} <br/>{b} : {c} ({d}%)"
								    },

								    visualMap: {
								        show: false,
								        min: 80,
								        max: 600,
								        inRange: {
								            colorLightness: [0, 1]
								        }
								    },
								    series : [
								        {
								            name:'比例',
								            type:'pie',
								            radius : '55%',
								            center: ['50%', '50%'],
								            data:[
								                {value:100, name:'重要保持'},
								                {value:200, name:'重要发展'},
								                {value:300, name:'重要价值'},
								                {value:400, name:'重要挽留'},
								                {value:500, name:'一般重要'},
								                {value:600, name:'一般客户'},
								                {value:700, name:'一般挽留'},
								                {value:480, name:'无价值'}
								            ].sort(function (a, b) { return a.value - b.value; }),
								            roseType: 'radius',
								            label: {
								                normal: {
								                    textStyle: {
								                        color: 'rgba(255, 255, 255, 0.3)'
								                    }
								                }
								            },
								            labelLine: {
								                normal: {
								                    lineStyle: {
								                        color: 'rgba(255, 255, 255, 0.3)'
								                    },
								                    smooth: 0.2,
								                    length: 10,
								                    length2: 20
								                }
								            },
								            itemStyle: {
								                normal: {
								                    color: '#c23531',
								                    shadowBlur: 200,
								                    shadowColor: 'rgba(0, 0, 0, 0.5)'
								                }
								            },

								            animationType: 'scale',
								            animationEasing: 'elasticOut',
								            animationDelay: function (idx) {
								                return idx * 200;
								            }
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
table .button {
	margin-right: 5px;
}
</style>
<script>
    $(document).ready(function () {

    });
</script>
</html>
