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
</head>
<body class="admin-body">

	<%@include file="../../common/admin_navbar.jsp"%>
	<div class="wrapper">
		<div class="content">
			<%@include file="../../common/sale_left.jsp"%>
			<div class="right-content">
				<div class="normal-div">
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a
							href="http://localhost:8080/Hostel/sale/dayOrderNum"
							data-toggle="tab"> 订单数量</a></li>
						<li><a
							href="http://localhost:8080/Hostel/admin/fiance/hotelDay"
							data-toggle="tab">订单金额</a></li>
						<li><a href="http://localhost:8080/Hostel/admin/fiance"
							data-toggle="tab">客户分析</a></li>
						<li><a href="http://localhost:8080/Hostel/sale/areaRank"
							data-toggle="tab">地区排名</a></li>
						<li><a
							href="http://localhost:8080/Hostel/admin/fiance/predictpage"
							data-toggle="tab">销售额预测</a></li>
					</ul>


					<div style="margin-bottom: 20px; margin-top: 20px;">
						<div class="alert alert-warning invalidAnalysis">
							今天<span class="label label-warning">标准间</span>有<span
								class="label label-warning">${today.standR}</span>笔预定订单，实际成交<span
								class="label label-warning">${today.standO}</span>笔,如果挽回这些被取消的订单，则可以挽回<span
								class="label label-warning">${wanhui1}</span>元。<br /> <span
								class="label label-warning">套间</span>有<span
								class="label label-warning">${today.taoR}</span>笔预定订单，实际成交<span
								class="label label-warning">${today.taoO}</span>笔,如果挽回这些被取消的订单，则可以挽回<span
								class="label label-warning">${wanhui2}</span>元。<br /> <span
								class="label label-warning">共记</span>有<span
								class="label label-warning">${gongjiyuding}</span>笔预定订单，实际成交<span
								class="label label-warning">${gongjichengjiao}</span>笔,如果挽回这些被取消的订单，则可以挽回<span
								class="label label-warning">${wanhuiall}</span>元。<br /> <span
								class="label label-warning">标准间</span>成交预定比为<span
								class="label label-warning">${today.ratea}</span>,<span
								class="label label-warning">套间</span> 成交预定比为<span
								class="label label-warning">${today.rateb}</span>,<span
								class="label label-warning">共记</span>成交预定比为<span
								class="label label-warning">${today.ratee}</span>。 <span
								class="label label-warning">标准间</span>表现较差，赶紧提升<span
								class="label label-warning">标准间</span>服务，挽回客人吧。
						</div>




						<div class="chart-div" id="chart-div"></div>
					</div>
					<div id="chart-area" style="width: 600px; height: 430px;"></div>
					<div class="chart-div" id="chart-div1"></div>
					<div style="margin-bottom: 20px; margin-top: 20px;">
						<div class="alert alert-warning invalidAnalysis">
							今天成交订单数量中<span class="label label-warning">套房</span>占比大于<span
								class="label label-warning">标准间</span>，<span
								class="label label-warning">套房</span>销售量的比较好，要注意提升<span
								class="label label-warning">标准间</span>的销售量了。<br />
						</div>
					</div>
					<div id="chart-area1" style="width: 700px; height: 430px;"></div>
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
							option = {
								    tooltip : {
								        trigger: 'axis',
								        axisPointer: {
								            type: 'cross',
								            crossStyle: {
								                color: '#999'
								            }
								        }
								    },
								    legend: {
								        data: ['标准间预定', '套房预定','标准间成交','套房成交',
								        	'标准间成交预定比','套间成交预定比','成交预定比'],
								        selected: {
							                '套房预定': false, '套房成交': false, '套间成交预定比': false, '成交预定比': false
							            }
								    }, 
								    toolbox: {
								        show : true,
								        feature : {
								          //  mark : {show: true},
								          //  dataZoom : {show: true},
								           // dataView : {show: true},
								           // restore : {show: true},
								          //  saveAsImage : {show: true}
								        }
								    },
								   // calculable : true,
								    dataZoom : {
								        show : true,
								        realtime : true,
								        start : 95,
								        end : 100
								    },
								    
								    xAxis:  {
								    	type : 'category',
								    	
							                 //boundaryGap: false,
							                 data: date  
								    },
								    yAxis: [{
								    	type: 'value'
								    	
								    //	,name : '订单数量（笔）'
								    }
								    ,
								    {
								    	type: 'value',
								    //	name : '百分比'
								    } 
								    ],
								    series: [
								        {
								            name: '标准间预定',
								            type: 'bar',
								            stack: '预定',
								            label: {
								                normal: {
								                    show: true,
								                    position: 'insideRight'
								                }
								            },
								            data:  (function (){
								                var res = [];
								                <c:forEach items="${vo}" var="item">
								                res.push(${item.standR});
								                </c:forEach>
								                /* var len = 0;
								                while (len++) {
								                	 res.push( ${vo[len].standR});
								                } */
								                return res;
								            })()
								        },
								        {
								            name: '套房预定',
								            type: 'bar',
								            stack: '预定',
								            label: {
								                normal: {
								                    show: true,
								                    position: 'insideRight'
								                }
								            },
								            data: (function (){
								                var res = [];
								                <c:forEach items="${vo}" var="item">
								                res.push(${item.taoR});
								                </c:forEach>
								                return res;
								            })()
								        },
								        {
								            name: '标准间成交',
								            type: 'bar',
								            stack: '成交',
								            label: {
								                normal: {
								                    show: true,
								                    position: 'insideRight'
								                }
								            },
								            data: (function (){
								                var res = [];
								                <c:forEach items="${vo}" var="item">
								                res.push(${item.standO});
								                </c:forEach>
								                return res;
								            })()
								        },
								        
								        {
								            name: '套房成交',
								            type: 'bar',
								            stack: '成交',
								            label: {
								                normal: {
								                    show: true,
								                    position: 'insideRight'
								                }
								            },
								            data: (function (){
								                var res = [];
								                <c:forEach items="${vo}" var="item">
								                res.push(${item.taoO});
								                </c:forEach>
								                return res;
								            })()
								        },{
								            name:'标准间成交预定比',
								            type:'line',
								            yAxisIndex: 1,
								            data: (function (){
								                var res = [];
								                <c:forEach items="${vo}" var="item">
								                res.push(${item.ratea});
								                </c:forEach>
								                return res;
								            })()
								        },{
								            name:'套间成交预定比',
								            type:'line',
								            yAxisIndex: 1,
								            data: (function (){
								                var res = [];
								                <c:forEach items="${vo}" var="item">
								                res.push(${item.rateb});
								                </c:forEach>
								                return res;
								            })()
								        },{
								            name:'成交预定比',
								            type:'line',
								            yAxisIndex: 1,
								            data: (function (){
								                var res = [];
								                <c:forEach items="${vo}" var="item">
								                res.push(${item.ratee});
								                </c:forEach>
								                return res;
								            })()
								        }
								        
								    ]
								};
							myChart.setOption(option);
							var myChart1 = echarts.init(document
									.getElementById('chart-area1'));
							var idx = 1;
							option1 = {
							    timeline : {
							        data : [
							            
							            '2017/6/11', '2017/6/12', '2017/6/13', '2017/6/14', '2017/6/15'
							        ]
							    },
							    options : [
							        {
							            title : {
							                text: '房型占比变化',
							                subtext: '成交数'
							            },
							            tooltip : {
							                trigger: 'item',
							                formatter: "{a} <br/>{b} : {c} ({d}%)"
							            },
							            legend: {
							                data:['标准间','套房']
							            },
							           
							            series : [
							                {
							                    name:'房型',
							                    type:'pie',
							                    center: ['50%', '45%'],
							                    radius: '50%',
							                    data:[
							                        {value: 164,  name:'标准间'},
							                        {value: 163,  name:'套房'}
							                    ]
							                }
							            ]}
							        ,{series : [
						                {
						                    name:'房型',
						                    type:'pie',
						                    center: ['50%', '45%'],
						                    radius: '50%',
						                    data:[
						                        {value: 172,  name:'标准间'},
						                        {value: 166,  name:'套房'}
						                    ]
						                }
						            ]}
						        ,{series : [
					                {
					                    name:'房型',
					                    type:'pie',
					                    center: ['50%', '45%'],
					                    radius: '50%',
					                    data:[
					                        {value: 169,  name:'标准间'},
					                        {value: 166,  name:'套房'}
					                    ]
					                }
					            ]}
					        ,{series : [
				                {
				                    name:'房型',
				                    type:'pie',
				                    center: ['50%', '45%'],
				                    radius: '50%',
				                    data:[
				                        {value: 174,  name:'标准间'},
				                        {value: 170,  name:'套房'}
				                    ]
				                }
				            ]}
				        ,{series : [
			                {
			                    name:'房型',
			                    type:'pie',
			                    center: ['50%', '45%'],
			                    radius: '50%',
			                    data:[
			                        {value: 160,  name:'标准间'},
			                        {value: 164,  name:'套房'}
			                    ]
			                }
			            ]
			        }
								            ]
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
