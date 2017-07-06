<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <title>财务分析 - HOSTEL</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/normalize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/datatables/datatables.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <script src="${pageContext.request.contextPath}/assets/js/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/echarts.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/china.js"></script>
</head>
<body>
<div class="wrapper">
    <div class="content">
      <%@include file="../../common/dashboard_left.jsp"%>
        <div class="right-content">
        <ul id="myTab" class="nav nav-tabs">
   <li class="active"><a href="#home" data-toggle="tab">
      Tutorial Point Home</a>
   </li>
   <li><a href="#ios" data-toggle="tab">iOS</a></li>
   <li class="dropdown">
      <a href="#" id="myTabDrop1" class="dropdown-toggle" 
         data-toggle="dropdown">Java <b class="caret"></b>
      </a>
      <ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
         <li><a href="#jmeter" tabindex="-1" data-toggle="tab">
            jmeter</a>
         </li>
         <li><a href="#ejb" tabindex="-1" data-toggle="tab">
            ejb</a>
         </li>
      </ul>
   </li>
</ul>
            <h3 class="title">财务分析</h3>
            <div class="normal-div"></div>
            <div style="margin-bottom: 20px; margin-top: 20px;">
                <div id="chart-area" style="width: 1000px;height:1000px;"></div>
                 <div id="chart-area1" style="width: 1000px;height:1000px;"></div>
<script type="text/javascript">
                    var myChart = echarts.init(document.getElementById('chart-area'));
                   
                    option = {
                    	    title : {
                    	        text: '未来一周气温变化',
                    	        subtext: '纯属虚构'
                    	    },
                    	    tooltip : {
                    	        trigger: 'axis'
                    	    },
                    	    legend: {
                    	        data:['最高气温','最低气温']
                    	    },
                    	    toolbox: {
                    	        show : true,
                    	        feature : {
                    	            mark : {show: true},
                    	            dataView : {show: true, readOnly: false},
                    	            magicType : {show: true, type: ['bar','line']},
                    	            restore : {show: true},
                    	            saveAsImage : {show: true}
                    	        }
                    	    },
                    	    calculable : true,
                    	    xAxis : [
                    	        {
                    	            type : 'category',
                    	            boundaryGap : false,
                    	            data : ['周一','周二','周三','周四','周五','周六','周日']
                    	        }
                    	    ],
                    	    yAxis : [
                    	        {
                    	            type : 'value',
                    	            axisLabel : {
                    	                formatter: '{value} °C'
                    	            }
                    	        }
                    	    ],
                    	    dataZoom: [
                                {
                                    type: 'slider',
                                    show: true,
                                    xAxisIndex: [0],
                                    handleSize: 20,//滑动条的 左右2个滑动条的大小
                                    height: 8,//组件高度
                                    left: 30, //左边的距离
                                    right: 40,//右边的距离
                                    bottom: 30,//右边的距离
                                    handleColor: '#ddd',//h滑动图标的颜色
                                    handleStyle: {
                                        borderColor: "#cacaca",
                                        borderWidth: "1",
                                        shadowBlur: 2,
                                        background: "#ddd",
                                        shadowColor: "#ddd",
                                    },
                                    fillerColor: new echarts.graphic.LinearGradient(1, 0, 0, 0, [{
                                        //给颜色设置渐变色 前面4个参数，给第一个设置1，第四个设置0 ，就是水平渐变
                                        //给第一个设置0，第四个设置1，就是垂直渐变
                                        offset: 0,
                                        color: '#1eb5e5'
                                    }, {
                                        offset: 1,
                                        color: '#5ccbb1'
                                    }]),
                                    backgroundColor: '#ddd',//两边未选中的滑动条区域的颜色
                                    showDataShadow: false,//是否显示数据阴影 默认auto
                                    showDetail: false,//即拖拽时候是否显示详细数值信息 默认true
                                    handleIcon: 'M-292,322.2c-3.2,0-6.4-0.6-9.3-1.9c-2.9-1.2-5.4-2.9-7.6-5.1s-3.9-4.8-5.1-7.6c-1.3-3-1.9-6.1-1.9-9.3c0-3.2,0.6-6.4,1.9-9.3c1.2-2.9,2.9-5.4,5.1-7.6s4.8-3.9,7.6-5.1c3-1.3,6.1-1.9,9.3-1.9c3.2,0,6.4,0.6,9.3,1.9c2.9,1.2,5.4,2.9,7.6,5.1s3.9,4.8,5.1,7.6c1.3,3,1.9,6.1,1.9,9.3c0,3.2-0.6,6.4-1.9,9.3c-1.2,2.9-2.9,5.4-5.1,7.6s-4.8,3.9-7.6,5.1C-285.6,321.5-288.8,322.2-292,322.2z',
                                    filterMode: 'filter',
                                },
                                //下面这个属性是里面拖到
                                {
                                    type: 'inside',
                                    show: true,
                                    xAxisIndex: [0],
                                    start: 1,
                                    end: 100
                                }
                            ],
                    	    series : [
                    	        {
                    	            name:'最高气温',
                    	            type:'line',
                    	            data:[11, 11, 15, 13, 12, 13, 10],
                    	            markPoint : {
                    	                data : [
                    	                    {type : 'max', name: '最大值'},
                    	                    {type : 'min', name: '最小值'}
                    	                ]
                    	            },
                    	            markLine : {
                    	                data : [
                    	                    {type : 'average', name: '平均值'}
                    	                ]
                    	            }
                    	        },
                    	        {
                    	            name:'最低气温',
                    	            type:'line',
                    	            data:[1, -2, 2, 5, 3, 2, 0],
                    	            markPoint : {
                    	                data : [
                    	                    {name : '周最低', value : -2, xAxis: 1, yAxis: -1.5}
                    	                ]
                    	            },
                    	            markLine : {
                    	                data : [
                    	                    {type : 'average', name : '平均值'}
                    	                ]
                    	            }
                    	        }
                    	    ]
                    	};
                    	                    
                    
myChart.setOption(option);


var myChart = echarts.init(document.getElementById('chart-area'));

function randomData() {
    return Math.round(Math.random()*1000);
}

option = {
    title: {
        text: 'iphone销量',
        subtext: '纯属虚构',
        left: 'center'
    },
    tooltip: {
        trigger: 'item'
    },
    legend: {
        orient: 'vertical',
        left: 'left',
        data:['iphone3','iphone4','iphone5']
    },
    visualMap: {
        min: 0,
        max: 2500,
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
            name: 'iphone3',
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
                {name: '北京',value: randomData() },
                {name: '天津',value: randomData() },
                {name: '上海',value: randomData() },
                {name: '重庆',value: randomData() },
                {name: '河北',value: randomData() },
                {name: '河南',value: randomData() },
                {name: '云南',value: randomData() },
                {name: '辽宁',value: randomData() },
                {name: '黑龙江',value: randomData() },
                {name: '湖南',value: randomData() },
                {name: '安徽',value: randomData() },
                {name: '山东',value: randomData() },
                {name: '新疆',value: randomData() },
                {name: '江苏',value: randomData() },
                {name: '浙江',value: randomData() },
                {name: '江西',value: randomData() },
                {name: '湖北',value: randomData() },
                {name: '广西',value: randomData() },
                {name: '甘肃',value: randomData() },
                {name: '山西',value: randomData() },
                {name: '内蒙古',value: randomData() },
                {name: '陕西',value: randomData() },
                {name: '吉林',value: randomData() },
                {name: '福建',value: randomData() },
                {name: '贵州',value: randomData() },
                {name: '广东',value: randomData() },
                {name: '青海',value: randomData() },
                {name: '西藏',value: randomData() },
                {name: '四川',value: randomData() },
                {name: '宁夏',value: randomData() },
                {name: '海南',value: randomData() },
                {name: '台湾',value: randomData() },
                {name: '香港',value: randomData() },
                {name: '澳门',value: randomData() }
            ]
        },
        {
            name: 'iphone4',
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
                {name: '北京',value: randomData() },
                {name: '天津',value: randomData() },
                {name: '上海',value: randomData() },
                {name: '重庆',value: randomData() },
                {name: '河北',value: randomData() },
                {name: '安徽',value: randomData() },
                {name: '新疆',value: randomData() },
                {name: '浙江',value: randomData() },
                {name: '江西',value: randomData() },
                {name: '山西',value: randomData() },
                {name: '内蒙古',value: randomData() },
                {name: '吉林',value: randomData() },
                {name: '福建',value: randomData() },
                {name: '广东',value: randomData() },
                {name: '西藏',value: randomData() },
                {name: '四川',value: randomData() },
                {name: '宁夏',value: randomData() },
                {name: '香港',value: randomData() },
                {name: '澳门',value: randomData() }
            ]
        },
        {
            name: 'iphone5',
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
                {name: '北京',value: randomData() },
                {name: '天津',value: randomData() },
                {name: '上海',value: randomData() },
                {name: '广东',value: randomData() },
                {name: '台湾',value: randomData() },
                {name: '香港',value: randomData() },
                {name: '澳门',value: randomData() }
            ]
        }
    ]
};                

myChart.setOption(option);
</script>  
</div>  
        </div>
    </div>
</div>   
</body>
</html>