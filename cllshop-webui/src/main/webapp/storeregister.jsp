<%--
  Created by IntelliJ IDEA.
  User: S1-02
  Date: 2019/5/28
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="commonheader.jsp"/>
<title>商家入驻</title>
<script type="application/x-javascript">
    $(document).ready(function () {
        $("#name").blur(function () {
            var name = $("#name").val();
            $.ajax({
                url: "${pageContext.request.contextPath}/store/check",
                type: "post",
                dataType: "json",
                data: {name: name},
                async: true,
                success: function (result) {
                    if (result.msg != '该店铺名可使用') {
                        $("#rightStorename").html("");
                        $("#errorStorename").html(result.msg);
                    } else {
                        $("#errorStorename").html("");
                        $("#rightStorename").html(result.msg);
                    }

                }
            });
        });
        $("#submit").click(function () {
            var name = $("#name").val();
            var info = $("#info").val();
            var store = {name: name,info:info};
            if (name == '') {
                $("#rightStorename").html("");
                $("#errorStorename").html("店铺名不能为空");
            } else if ($("#rightStorename").html() != '该店铺名可使用') {
                alert('请输入可使用的店铺名');
            } else {
                $.ajax({
                    url: "${pageContext.request.contextPath}/store/register",
                    data: store,
                    dataType: "json",
                    type: "post",
                    async: true,
                    success: function (result) {
                        if (result.msg == '入驻申请提交成功') {
                            alert("入驻申请提交成功！审核将在三个工作日内完成！")
                            window.location.href = "storeregister.jsp"
                        } else {
                            alert("入驻申请提交失败！请重新提交申请！")
                            window.location.href = "storeregister.jsp"
                        }
                    }
                });
            }
        });
    });
    addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    }
</script>
<script>
    $(document).ready(function () {
        $(".memenu").memenu();
    });
</script>
<div class="account">
    <div class="container">
        <h1>商家入驻</h1>
        <div class="account_grid">
            <div class="col-md-6 login-right">
                <form class="form-horizontal" method="post">
                    <fieldset>
                        <div class="form-group">
                            <label class="control-label" for="name">店铺名称</label>
                            <input type="text" class="form-control" name="name" id="name"
                                   placeholder="Storename">
                            <div id="rightStorename" style="color:green;display:inline;"></div>
                            <div id="errorStorename" style="color:red;display:inline;"></div>
                            <div>
                            <label class="control-label" for="info"></label>
                            </div>
                            <label class="control-label" for="info">店铺详情</label>
                            <input type="text" class="form-control" name="info" id="info"
                                   placeholder="Information">
                        </div>
                    </fieldset>
                    <br/>
                    <div class="buttons kiosk-input-area">
                        <input class="acount-btn" type="button" value="提交申请" id="submit">
                    </div>
                </form>
            </div>
            <div class="col-md-6 login-left">
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<jsp:include page="commonfooter.jsp"></jsp:include>
