<%--
  Created by IntelliJ IDEA.
  User: S1-02
  Date: 2019/5/28
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="commonheader.jsp"></jsp:include>
<title>注册</title>
    <script type="application/x-javascript">
        $(document).ready(function () {

            $("#username").change(function () {
                var username = $("#username").val();
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/check",
                    type:"post",
                    dataType:"json",
                    data:{username:username},
                    async:true,
                    success:function (result) {
                        if(result.msg != '可注册的用户'){
                            // $("#rightUsername").html("");
                            $("#errorUsername").html(result.msg);
                        }else{
                            $("#errorUsername").html("");
                            // $("#rightUsername").html(result.msg);
                        }

                    }
                });
            });
            $("#submit").click(function () {
                var username = $("#username").val();
                var password = $("#password").val();
                var email = $("#email").val();
                var cfmpass = $("#cfmpassword").val();
                var user = {username:username,password:password,email:email};
                if(username==''){
                    $("#rightUsername").html("");
                    $("#errorUsername").html("用户名不能为空");
                }else if(password==''){
                    $("#errorPass").html("密码不能为空");
                }else if(cfmpass==''){
                    $("#Regpasswordd").html('请确认密码');
                }else if($("#errorUsername").html()!= ''){
                    alert('请输入可注册的用户');
                }else if($("#errorMail").html()!= ''){
                    alert('请输入正确的验证码');
                }else if($("#errorTips").html()!= ''){
                    alert('请输入正确的邮箱格式');
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
            $("#cfmpassword").change(function(){
                var password = $("#password").val();
                var repass = $("#cfmpassword").val();
                if(password!=repass){
                    $("#Regpasswordd").html('两次密码不一致');
                }else{
                    $("#Regpasswordd").html('');
                }
            });
            $("#getCodeBtn").click(function () {
                var email = $("#email").val();
                var data = {"email":email};
                var tips = $("#errorTips").html();
                if(tips.indexOf("失败")==-1&&tips!=""){
                    alert("请检查邮箱格式或者该邮箱是否已被注册");
                }else{
                    $.ajax({
                        url:"${pageContext.request.contextPath}/user/checkEmail",
                        data:data,
                        dataType:"json",
                        type:"post",
                        async:true,
                        success:function (result) {
                            if(result.msg=="发送成功"){
                                $("#errorTips").html("");
                                // $("#successTips").html(result.msg);
                                resetCode();
                            }else if(result.msg=='发送失败'){
                                // $("#successTips").html("");
                                $("#errorTips").html(result.msg);
                                resetCode();
                            }else{
                                // $("#successTips").html("");
                                $("#errorTips").html(result.msg);
                            }
                        }
                    });
                }
            });
            $("#code").change(function () {
                var code = $("#code").val();
                var data = {"code":code};
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/checkCode",
                    data:data,
                    dataType:"json",
                    type:"post",
                    async:true,
                    success:function (result) {
                        if(result.msg=="验证成功"){
                            $("#errorMail").html("");
                            // $("#trueMail").html(result.msg);
                        }else{
                            // $("#trueMail").html("");
                            $("#errorMail").html(result.msg);
                        }
                    }
                });
            });
            $("#email").change(function () {
                var email = $("#email").val();
                var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
                if(!myreg.test(email)){
                    $("#errorTips").html("请输入正确的邮箱格式");
                    //$("#successTips").html("");
                }else{
                    $("#errorTips").html("");
                    //$("#successTips").html("格式正确");
                }
            });
        });
        addEventListener("load", function() {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
        function resetCode(){
            $('#getCodeBtn').hide();
            $('#getTime').html('30');
            $('#getTimeCode').show();
            var second = 30;
            var timer = null;
            timer = setInterval(function(){
                second -= 1;
                if(second >0 ){
                    $('#getTime').html(second);
                }else{
                    clearInterval(timer);
                    $('#getCodeBtn').show();
                    $('#getTimeCode').hide();
                }
            },1000);
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
                <form class="form-horizontal"  method="post">
                    <fieldset>
                        <div class="form-group">
                            <label class="control-label" for="username">用户名</label><br/>
                            <input type="text"  style="width: 65%;display: inline" class="form-control" name="username" id="username"
                                   placeholder="Username">
                            <%--<span id="rightUsername" style="color:green;display:inline;"></span>--%>
                            <span id="errorUsername" style="color:red;display:inline;"></span>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="password">密码</label><br/>
                            <input type="password" style="width: 65%;display: inline" class="form-control" name="password" id="password" placeholder="Password">
                            <span id="errorPass" style="color:red;display:inline;"></span>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="cfmpassword">确认密码</label><br/>
                            <input type="password" style="width: 65%;display: inline" class="form-control" id="cfmpassword"
                                   placeholder="Confirm password">
                            <span id="Regpasswordd" style="color:red;display:inline;"></span>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="email">邮箱</label><br/>
                            <input style="width: 65%;display: inline" type="text" class="form-control" name="email" id="email" placeholder="Email">
                            <%--<input type="button" id="getCodeBtn" class="btn-info" value="获取验证码" />--%>
                            <span id="errorTips" style="color:red;display:inline;"></span>
                            <%--<span id="successTips" style="color:green;display:inline;"></span>--%>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="code">验证码</label><br/>
                            <input type="text" style="width: 65%;display: inline" class="form-control" name="code" id="code" placeholder="Code">
                            <span id="errorMail" style="color:red;display:inline;"></span>
                            <%--<span id="trueMail" style="color:green;display:inline;"></span>--%>
                            <div>
                            <span id="getTimeCode" style="display:none;">
                                没收到验证码？<span id="getTime"  style="display: inline;color: cadetblue;font-size: 20px">30</span>秒后重发
                            </span>
                            </div>
                            <input type="button" id="getCodeBtn" class="acount-btn" style="display: inline" value="获取验证码" />
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
