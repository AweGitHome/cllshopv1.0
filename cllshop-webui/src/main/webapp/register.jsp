<%--
  Created by IntelliJ IDEA.
  User: S1-02
  Date: 2019/5/28
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="commonheader.jsp"></jsp:include>
    <script type="application/x-javascript">
        $(document).ready(function () {
            $("#username").blur(function () {
                var username = $("#username").val();
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/check",
                    type:"post",
                    dataType:"json",
                    data:{username:username},
                    async:true,
                    success:function (result) {
                        $("#errorUsername").html(result.msg);
                    }
                });
            });
            $("#submit").click(function () {
                var username = $("#username").val();
                var password = $("#password").val();
                var cfmpass = $("#cfmpassword").val();
                var user = {username:username,password:password};
                if(username==''){
                    $("#errorUsername").html("用户名不能为空");
                }else if(password==''){
                    $("#errorPass").html("密码不能为空");
                }else if(cfmpass==''){
                    $("#Regpasswordd").html('请确认密码');
                }else if($("#rightUsername").html()!='可注册的用户'){
                    alert('请输入可注册的用户');
                }else{
                    $.ajax({
                        url:"${pageContext.request.contextPath}/user/register",
                        data:user,
                        dataType:"json",
                        type:"post",
                        async:true,
                        success:function (result) {
                            if(result.msg=='注册成功'){
                                window.location.href = "${pageContext.request.contextPath}/login.jsp"
                                $("#regSuccess").html(result.msg);
                            }else{
                                $("#regFail").html(result.msg);
                            }
                        }
                    });
                }
            });
            $("#cfmpassword").blur(function(){
                var password = $("#password").val();
                var repass = $("#cfmpassword").val();
                if(password!=repass){
                    $("#Regpasswordd").html('两次密码不一致');
                }else{
                    $("#Regpasswordd").html('');
                }
            });
        });
        addEventListener("load", function() {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <script>
        $(document).ready(function() {
            $(".memenu").memenu();
        });
    </script>
<div class="account">
    <div class="container">
        <h1>注册</h1>
        <div class="account_grid">
            <div class="col-md-6 login-right">
                <form class="form-horizontal" method="post">
                    <fieldset>
                        <div class="form-group">
                            <label class="control-label" for="username"><span class="require">*</span>用户名</label>
                            <input type="text" class="form-control" name="username" id="username"
                                   placeholder="Username">
                            <div id="rightUsername" style="color:green;display:inline;"></div>
                            <div id="errorUsername" style="color:red;display:inline;"></div>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="password"><span class="require">*</span>密码</label>
                            <input type="password" class="form-control" name="password" id="password" placeholder="Password">
                            <div id="errorPass" style="color:red;display:inline;"></div>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="cfmpassword"><span class="require">*</span>确认密码</label>
                            <input type="password" class="form-control" id="cfmpassword"
                                   placeholder="Confirm password">
                            <div id="Regpasswordd" style="color:red;display:inline;"></div>
                        </div>
                        <div><span style="color:red;display:inline;" id="regFail"></span>
                            <span style="color:green;display:inline;" id="regSuccess"></span>
                        </div>
                    </fieldset>
                    <br />
                    <div class="buttons kiosk-input-area">
                        <input class="acount-btn" type="button" value="注册Register" id="submit">
                        <a class="acount-btn"  href="login.jsp">登录Login</a>
                    </div>
                </form>
            </div>
            <div class="col-md-6 login-left">
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<jsp:include page="commonfooter.jsp"></jsp:include>
