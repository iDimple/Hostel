<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="admin-navbar">
    <div class="content">
        <span class="navbar-title">HOSTEL经理后台</span>
        <ul id="admin-nav-items" class="nav-items">
            <li class="nav-item" onclick="window.location.href='http://localhost:8080/Hostel/admin/manager/vip'">销售管理</li>
            <li class="nav-item" onclick="window.location.href='http://localhost:8080/Hostel/admin/plan'">客户管理</li>
            <li class="nav-item" onclick="window.location.href='http://localhost:8080/Hostel/sale/manager'">销售管理</li>
            <li class="nav-item" onclick="window.location.href='http://localhost:8080/Hostel/admin/manager/fiance'">财务统计</li>
            <li class="nav-item" onclick="window.location.href='http://localhost:8080/Hostel/admin/manager/approval'">开店审批</li>
            <li class="nav-item" onclick="window.location.href='http://localhost:8080/Hostel/admin/manager/settlement'">线上结算</li>
        </ul>
        <span class="right-items">
            <i class="right-item fa fa-sign-out" title="登出" onclick="window.location.href='http://localhost:8080/Hostel/logout'"></i>
        </span>
    </div>
</div>