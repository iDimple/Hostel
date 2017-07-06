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
<script src="${pageContext.request.contextPath}/assets/js/ecStat.js"></script>
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
						<li><a href="http://localhost:8080/Hostel/sale/areaRank"
							data-toggle="tab">地区排名</a></li>
						<li class="active"><a
							href="http://localhost:8080/Hostel/admin/fiance/predictpage"
							data-toggle="tab">销售额预测</a></li>
					</ul>


					<div style="margin-bottom: 20px; margin-top: 20px;">
						<div class="alert alert-warning invalidAnalysis">
							根据<span class="label label-warning">线性回归</span>预测，销售额方程为<span
								class="label label-warning">y=290.41x+1004.25</span>。根据<span
								class="label label-warning">多项式拟合</span>预测，销售额方程为<span
								class="label label-warning">y=-0.0047x^3+1.259x^2+198.57x+2478.11</span>。<span
								class="label label-warning">线性回归方程</span>和<span
								class="label label-warning">多项式拟合方程</span>的斜率均大于0，因此销售额呈<span
								class="label label-warning">上升趋势</span>根据两个方程综合预测明天的销售额为<span
								class="label label-warning">48923.43</span>元。
						</div>


<!-- 49212.31 48634.5428 -->

						<div class="chart-div" id="chart-div"></div>
						<div id="chart-area" style="width: 600px; height: 430px;"></div>
						
					<div class="chart-div" id="chart-div1"></div>
				<div id="chart-area1" style="width: 600px; height: 430px;"></div>
				<script type="text/javascript">
							var myChart = echarts.init(document
									.getElementById('chart-area'));
							var base = +new Date(2016, 12, 1);
							var oneDay = 24 * 3600 * 1000;
							var date = [];
							for (var i = 1; i < 20000; i++) {
							    
							    date.push(i);
							}
							var data = [	];
							var i=0;
							<c:forEach items="${vo}" var="item">
			                data.push([date[i],${item.all}]);
			                i++;
			                </c:forEach>
							// See https://github.com/ecomfe/echarts-stat
							var myRegression = ecStat.regression('linear', data);

							myRegression.points.sort(function(a, b) {
							    return a[0] - b[0];
							});

							option = {
							    title: {
							        text: '线性回归预测',
							        subtext: '历史数据起始与2017-1-1',
							        left: 'center'
							    },
							    tooltip: {
							        trigger: 'axis',
							        axisPointer: {
							            type: 'cross'
							        }
							    },
							    xAxis: {
							        type: 'value',
							        splitLine: {
							            lineStyle: {
							                type: 'dashed'
							            }
							        },name : '销售天数'
							    },
							    yAxis: {
							        type: 'value',
							        min: 1.5,
							        splitLine: {
							            lineStyle: {
							                type: 'dashed'
							            }
							        },name : '销售额'
							    },
							    series: [{
							        name: 'scatter',
							        type: 'scatter',
							        label: {
							            emphasis: {
							                show: true,
							                position: 'left',
							                textStyle: {
							                    color: 'blue',
							                    fontSize: 16
							                }
							            }
							        },
							        data: data
							    }, {
							        name: 'line',
							        type: 'line',
							        showSymbol: false,
							        data: myRegression.points,
							        markPoint: {
							            itemStyle: {
							                normal: {
							                    color: 'transparent'
							                }
							            },
							            label: {
							                normal: {
							                    show: true,
							                    position: 'left',
							                    formatter: myRegression.expression,
							                    textStyle: {
							                        color: '#333',
							                        fontSize: 14
							                    }
							                }
							            },
							            data: [{
							                coord: myRegression.points[myRegression.points.length - 1]
							            }]
							        }
							    }]
							};

							myChart.setOption(option);
							
							
							
							
							
							var myChart1 = echarts.init(document
									.getElementById('chart-area1'));
							var data = [	];
							var i=0;
							<c:forEach items="${vo}" var="item">
			                data.push([date[i],${item.all}]);
			                i++;
			                </c:forEach>
							var myRegression = ecStat.regression('polynomial', data, 3);

							myRegression.points.sort(function(a, b) {
							    return a[0] - b[0];
							});

							option1 = {

							    tooltip: {
							        trigger: 'axis',
							        axisPointer: {
							            type: 'cross'
							        }
							    },
							    title: {
							        text: '多项式拟合预测',
							        subtext: '历史数据起始与2017-1-1',
							        left: 'center',
							        top: 16
							    },
							    xAxis: {
							        type: 'value',
							        splitLine: {
							            lineStyle: {
							                type: 'dashed'
							            }
							        },
							        splitNumber: 20
							    },
							    yAxis: {
							        type: 'value',
							        min: -40,
							        splitLine: {
							            lineStyle: {
							                type: 'dashed'
							            }
							        }
							    },
							    grid: {
							        top: 90
							    },
							    series: [{
							        name: 'scatter',
							        type: 'scatter',
							        label: {
							            emphasis: {
							                show: true,
							                position: 'right',
							                textStyle: {
							                    color: 'blue',
							                    fontSize: 16
							                }
							            }
							        },
							        data: data
							    }, {
							        name: 'line',
							        type: 'line',
							        smooth: true,
							        showSymbol: false,
							        data: myRegression.points,
							        markPoint: {
							            itemStyle: {
							                normal: {
							                    color: 'transparent'
							                }
							            },
							            label: {
							                normal: {
							                    show: true,
							                    position: 'left',
							                    formatter: myRegression.expression,
							                    textStyle: {
							                        color: '#333',
							                        fontSize: 14
							                    }
							                }
							            },
							            data: [{
							                coord: myRegression.points[myRegression.points.length - 1]
							            }]
							        }
							    }]
							};
							myChart1.setOption(option1);
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
