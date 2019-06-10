<%--
  Created by IntelliJ IDEA.
  User: Macbook
  Date: 2019/5/25
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台大布局 - Layui</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/admin/javascript/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/admin/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/admin/icheck/icheck.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/admin/javascript/dw.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-header">
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
        <li class="layui-nav-item"><a href="#">内容管理</a></li>
        <li class="layui-nav-item"><a href="#">订单管理</a></li>
    </ul>
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="${pageContext.request.contextPath}/uploadProImg/1.bmp" class="layui-nav-img">
                贤心
            </a>
            <dl class="layui-nav-child">
                <dd><a href="">基本资料</a></dd>
                <dd><a href="">安全设置</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="">退了</a></li>
    </ul>
</div>

<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree" lay-filter="test">
            <li class="layui-nav-item"><a class="layui-this" href="index.jsp">控制台</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">网页内容管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="#">商品列表</a></dd>
                    <dd><a href="#">大类别列表</a></dd>
                    <dd><a href="#">小类别列表</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">订单管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="#">订单列表</a></dd>
                </dl>
            </li>
        </ul>
    </div>
</div>
</body>
</html>
