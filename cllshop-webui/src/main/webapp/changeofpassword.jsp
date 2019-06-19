<%--
  Created by IntelliJ IDEA.
  User: S1-02
  Date: 2019/6/19
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="commonheader.jsp"></jsp:include>
<title>修改密码</title>
<script src="${pageContext.request.contextPath}/js/md5.js"></script>
<script type="application/x-javascript">
    $(document).ready(function () {
        $("#oldpassword").change(function () {
            temp1 = $("#oldpassword").val();
            var oldpassword = $.md5(temp1);
            var uid = $("#uid").html();
            var user = {id:uid,password:oldpassword};
            $.ajax({
                url:"${pageContext.request.contextPath}/user/checkpassword",
                type:"post",
                dataType:"json",
                data:user,
                async:true,
                success:function (result) {
                    if(result.msg != '原密码错误!'){
                        // $("#rightUsername").html("");
                        $("#errorOldPass").html("");
                    }else{
                        $("#errorOldPass").html("原密码错误!");
                        // $("#rightUsername").html(result.msg);
                    }

                }
            });
        });
        $("#submit").click(function () {
            temp = $("#password").val();
            var uname = $("#uname").html();
            if (temp != "")
            {
                var password= $.md5(temp);
                var cfmpass = $("#cfmpassword").val();
                var user = {username:uname,password:password};
                if(oldpassword==''){
                    $("#errorOldPass").html("请输入原密码!");
                }else if(password==''){
                    $("#errorPass").html("新密码不能为空!");
                }else if(cfmpass==''){
                    $("#Regpasswordd").html('请确认密码!');
                }else if($("#errorOldPass").html()!= ''){
                    alert('原密码错误！');
                }
                else{
                    $.ajax({
                        url:"${pageContext.request.contextPath}/user/updatepassword",
                        data:user,
                        dataType:"json",
                        type:"post",
                        async:true,
                        success:function (result) {
                            if(result.msg=='修改成功'){
                                window.location.href = "login.jsp";
                                $("#regSuccess").html(result.msg);
                            }else{
                                $("#regFail").html(result.msg);
                            }
                        }
                    });
                }
            }
            else {
                alert("原密码或新密码不能为空！");
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
        <h1>修改密码</h1>
        <div class="account_grid">
            <div class="col-md-6 login-right">
                <form class="form-horizontal"  method="post">
                    <fieldset>
                        <span id="uid" style="display: none">${userInfo.id}</span>
                        <span id="uname" style="display: none">${userInfo.username}</span>
                        <div class="form-group">
                            <label class="control-label" for="oldpassword">原密码</label><br/>
                            <input type="password" style="width: 65%;display: inline" class="form-control" name="oldpassword" id="oldpassword" placeholder="Password">
                            <span id="errorOldPass" style="color:red;display:inline;"></span>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="password">新密码</label><br/>
                            <input type="password" style="width: 65%;display: inline" class="form-control" name="password" id="password" placeholder="Password">
                            <span id="errorPass" style="color:red;display:inline;"></span>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="cfmpassword">确认新密码</label><br/>
                            <input type="password" style="width: 65%;display: inline" class="form-control" id="cfmpassword"
                                   placeholder="Confirm password">
                            <span id="Regpasswordd" style="color:red;display:inline;"></span>
                        </div>
                        <div><span style="color:red;display:inline;" id="regFail"></span>
                            <span style="color:green;display:inline;" id="regSuccess"></span>
                        </div>
                    </fieldset>
                    <br />
                    <div class="buttons kiosk-input-area">
                        <input class="acount-btn" type="button" value="提交" id="submit">
                    </div>
                </form>
            </div>
            <div class="col-md-6 login-left">
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<jsp:include page="commonfooter.jsp"/>
