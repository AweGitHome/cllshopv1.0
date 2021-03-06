<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>后台系统登录界面</title>
    <link type="text/css" href="${pageContext.request.contextPath}/admin/layui/css/layui.css" rel="stylesheet" />
    <link type="text/css" href="${pageContext.request.contextPath}/admin/css/self/login-normal.css" rel="stylesheet"/>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/md5.js"></script>
    <script>
        function login(){
            var username = $("#username").val();
            temp = $("#password").val();
            if (username != "" && temp != ""){
                var password= $.md5(temp);
                console.log(password);
                $("#password").val(password);
                $("#loginForm").submit();
            }else{
                alert("用户名或密码不能为空！");
            }
        }
    </script>
<body>
<div id="self_header">
    跨境电商借卖平台后台系统
</div>
<div id="self_loginItem">
    <!--自定义div装form,可调整位置-->
    <label class="self-form-label">用户登录</label>
    <!--layui-form表单提交-->
    <form class="layui-form" action="${pageContext.request.contextPath}/admin1/login" id="loginForm">
        <div class="layui-form-item">
            <div class="layui-input-inline">
                <input type="text" name="username" id="username" lay-verify="required" autocomplete="off" placeholder="请输入用户名" class="layui-input" style="width:250px;height:30px">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-inline">
                <input type="password" name="password" id="password" lay-verify="pass" autocomplete="off" placeholder="请输入密码" class="layui-input" style="width:250px;height:30px">
            </div>
        </div>
        <!--layui-form-input/label样式布局-->
        <div id="submitItem">
            <input type="button" value="登录" class="layui-btn layui-btn-fluid" onclick="login()"/>
        </div>
        <div>
            <span class="layui-text">${msg}</span>
        </div>
    </form>
</div>
</body>
</html>
