<%--
  Created by IntelliJ IDEA.
  User: S1-02
  Date: 2019/5/28
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="commonheader.jsp"></jsp:include>
    <title>登录</title>
    <script type="application/x-javascript">
        function login(){
            temp = $("#password").val();
            var password= $.md5(temp);
            console.log(password);
            $("#password").val(password);
            $("#loginForm").submit();
        }
        addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); }
    </script>
    <script src="${pageContext.request.contextPath}/js/md5.js"></script>
    <script>$(document).ready(function(){$(".memenu").memenu();});</script>
<div class="account">
    <div class="container">
        <h1>登录</h1>
        <div class="account_grid">
            <div class="col-md-6 login-right">
                <form action="${pageContext.request.contextPath}/user/login" method="post" id="loginForm">
                    <div class="form-group">
                        <label class="control-label">用户名</label>
                        <input type="text" name="username" id="username"
                               placeholder="Username"  onfocus=""
                               onblur="" class="form-control">
                        <span style="color: red" id="YHMerror"></span>
                    </div>
                    <div class="form-group">
                        <label class="control-label">密码</label>
                        <input type="password" name="password" id="password"
                               placeholder="Password"  class="form-control">
                        <span style="color: red; "></span>
                    </div>
                    <div class="form-group">
                        <input type="checkbox" id="remember" name="remember" value="off">记住用户名与密码
                    </div>
                    <div id="errorTips" style="color:red;display:inline;">${msg}</div>
                    <div id="rightTips" style="color:green;display:inline;">${msg1}</div>
                    <br />
                    <input class="acount-btn" type="button" value="登录Login"  onclick="login()">
                    <a class="acount-btn" href="${pageContext.request.contextPath}/register.jsp">注册Register</a>

                </form>
            </div>
            <div class="col-md-6 login-left">
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<jsp:include page="commonfooter.jsp"></jsp:include>