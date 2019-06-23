<%--
  Created by IntelliJ IDEA.
  User: Macbook
  Date: 2019/5/25
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <script type="text/javascript">
        $(document).ready(function () {
            $("#logout").click(function () {
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/exit",
                    type:"post",
                    async:true,
                    success:function () {
                        window.location.href = "${pageContext.request.contextPath}/adminLogin.jsp"
                    },
                    error:function () {
                        window.location.href = "${pageContext.request.contextPath}/adminLogin.jsp"
                    }
                });
            })
        })
    </script>
</head>
<body class="layui-layout-body">
<div class="layui-header">
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <div class="layui-logo">
        CLLShop后台管理
    </div>

    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a href="javascript:;">
                <%--<img src="${pageContext.request.contextPath}/uploadProImg/1.bmp" class="layui-nav-img">--%>
                ${userInfo1.username}
            </a>
            <dl class="layui-nav-child">
                <dd><a href="">基本资料</a></dd>
                <dd><a href="">安全设置</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a id="logout" href="">退出</a></li>
    </ul>
</div>

<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree" lay-filter="test">
            <li class="layui-nav-item"><a class="layui" href="${pageContext.request.contextPath}/admin/jsp/index.jsp">控制台</a></li>
            <c:if test="${userInfo1.role == 0}">
                <li class="layui-nav-item"><a class="layui" href="${pageContext.request.contextPath}/store/showAudstoreList">入驻审核</a></li>
            </c:if>
            <c:if test="${userInfo1.role != 0}">
                <li class="layui-nav-item"><a class="layui" href="${pageContext.request.contextPath}/store/showOrders.html">订单列表</a></li>
                <li class="layui-nav-item"><a class="layui" href="${pageContext.request.contextPath}/product/store_manage.html">商品列表</a></li>
            </c:if>
        </ul>
    </div>
</div>
</body>
</html>
