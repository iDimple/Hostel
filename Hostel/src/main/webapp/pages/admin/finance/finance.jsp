<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
</head>
<body class="admin-body">

<%@include file="../../common/admin_navbar.jsp" %>
<div class="wrapper">
		<div class="content">
			<%@include file="../../common/sale_left.jsp"%>
			<div class="right-content">
				<div class="normal-div">
					<ul id="myTab" class="nav nav-tabs">
						<li ><a href="http://localhost:8080/Hostel/sale/dayOrderNum" data-toggle="tab">
								订单数量</a></li>
						<li ><a href="http://localhost:8080/Hostel/admin/fiance/hotelDay" data-toggle="tab">订单金额</a></li>
						<li class="active"><a href="http://localhost:8080/Hostel/admin/fiance" data-toggle="tab">客户分析</a></li>
						<li><a href="http://localhost:8080/Hostel/sale/areaRank"
							data-toggle="tab">地区排名</a></li>
							<li><a href="http://localhost:8080/Hostel/admin/fiance/predictpage"
							data-toggle="tab">销售额预测</a></li>
					</ul>
					<div style="margin-bottom: 20px; margin-top: 20px;">
						<div class="alert alert-warning invalidAnalysis">
							今天的销售额中<span class="label label-warning">会员</span>占比<span class="label label-warning">76.92%</span>多于<span
								class="label label-warning">非会员</span>的<span
								class="label label-warning">23.08%</span>，<span class="label label-warning">会员</span>是入住本店的主力，应大力发展会员。<br />
								其中<span class="label label-warning">非会员现金</span>占比<span class="label label-warning">19.35％</span>，<span
								class="label label-warning">会员账户</span>占比最多<span
								class="label label-warning">64.52%</span>，
								<span class="label label-warning">会员现金</span>占比<span class="label label-warning">16.13%</span>。应鼓励会员多充值。
						</div>
            <div style="margin-bottom: 20px; margin-top: 20px;">
                <div id="chart-area" style="width: 600px;height:400px;"></div>
                <script type="text/javascript">
                    var myChart = echarts.init(document.getElementById('chart-area'));
                    var d = new Date();
                    var month = d.getMonth() + 1;
                    var vipTotal = ${vo.vipAccount+vo.vipCash};
                    option = {
                        title: {
                            text:  '今日销售额分析（单位：RMB）',
                            left: 'center',
                            top: 25,
                            textStyle: {
                                color: '#111'
                            }
                        },

                        tooltip: {
                            trigger: 'item',
                            formatter: "{a} <br/>{b}: {c} ({d}%)"
                        },
                        legend: {
                            orient: 'vertical',
                            x: 'left',
                            data: ['会员账户', '会员现金', '非会员现金']
                        },
                        series: [
                            {
                                name: '销售额',
                                type: 'pie',
                                selectedMode: 'single',
                                radius: [0, '30%'],

                                label: {
                                    normal: {
                                        position: 'inner'
                                    }
                                },
                                labelLine: {
                                    normal: {
                                        show: false
                                    }
                                },
                                data: [
                                    {value: 4000, name: '会员', selected: true},
                                    {value:1200, name: '非会员'}
                                ]
                            },
                            {
                                name: '支付渠道',
                                type: 'pie',
                                radius: ['40%', '55%'],

                                data: [
                                    {value:4000, name: '会员账户'},
                                    {value:1000, name: '会员现金'},
                                    {value:1200, name: '非会员现金'}
                                ]
                            }
                        ]
                    };
                    myChart.setOption(option);
                </script>
               <%--  <div class="clear-fix"></div>
                <c:choose>
                    <c:when test="${list.size() == 0}">
                        <h1>无报表</h1>
                    </c:when>
                    <c:when test="${list.size() > 0}">
                        <div class="table-container">
                            <table id="js-table" class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th width="15%">日期</th>
                                    <th width="15%">类型</th>
                                    <th width="25%">预订单</th>
                                    <th width="25%">现金单</th>
                                    <th width="15%">入住人</th>
                                    <th width="15%">金额</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${list}" var="item">
                                    <tr>
                                        <td>${item.date}</td>
                                        <td>${item.type}</td>
                                        <td>${item.bookid}</td>
                                        <td>${item.cashid}</td>
                                        <td>${item.names}</td>
                                        <td>${item.amount}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:when>
                </c:choose>
                <div class="clear-fix"></div> --%>
            </div>

        </div>
    </div>
</div>
<%@include file="/pages/common/toaster.jsp" %>
</body>

<style>
    .book-item {
        margin-bottom: 20px;
        border-bottom: 1px solid #b6b6b6;
        padding-bottom: 10px;
    }
</style>
<script>
    $(document).ready(function () {
    });

</script>
</html>
