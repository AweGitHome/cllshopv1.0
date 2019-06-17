<%--
  Created by IntelliJ IDEA.
  User: S1-02
  Date: 2019/6/15
  Time: 21:51
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="commonheader.jsp"></jsp:include>
<script type="application/x-javascript">
    $(document).ready(function () {
        $("#submit").click(function () {
            var userId = $("#userId").html();
            var truename = $("#truename").val();
            var gender = $("#gender").val();
            var birthday = $("#birthday").val();
            var error = $("#errorBirthday").html();
            var user = {id:userId,truename:truename,gender:gender,birthday_:birthday};
            if(truename==''){
                $("#rightTruename").html("");
                $("#errorTruename").html("请填写真实姓名");
            }else if(gender==''){
                $("#errorGender").html("请填写性别");
            }else if(birthday=='' || error!=''){
                $("#errorBirthday").html('请填写合法生日');
            }else{
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/upadateinfo",
                    data:user,
                    dataType:"json",
                    type:"post",
                    async:true,
                    success:function (result) {
                        if(result.msg=='更新成功'){
                            window.location.href = "${pageContext.request.contextPath}/user/showinfo?userName=${user.username}"
                            $("#updateSuccess").html(result.msg);
                        }else{
                            $("#updateFail").html(result.msg);
                        }
                    }
                });
            }
        });
        $("#birthday").change(function () {
            var birthday = $("#birthday").val();
            var myreg = /^((?:19|20)\d\d)-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/;
            if(!myreg.test(birthday)){
                $("#errorBirthday").html("请输入正确的日期格式");
                $("#submit").disabled();
                //$("#successTips").html("");
            }else{
                $("#errorBirthday").html("");
                //$("#successTips").html("格式正确");
            }
        });
    });
</script>
<div class="account">
    <div class="container">
        <h1>修改信息</h1>
        <div class="account_grid">
            <div class="col-md-6 login-right">
                <form class="form-horizontal"  method="post">
                    <fieldset>
                        <div class="form-group">
                            <label class="control-label" for="truename">真实姓名</label><br/>
                            <input type="text"  style="width: 65%;display: inline" class="form-control" name="truename" id="truename"
                                   placeholder="真实姓名" value="${user.truename}">
                            <span id="rightTruename" style="color:green;display:inline;"></span>
                            <span id="errorTruename" style="color:red;display:inline;"></span>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="Gender">性别</label><br/>
                            <input type="text" style="width: 65%;display: inline" class="form-control" name="gender" id="gender" placeholder="男/女" value="${user.gender}">
                            <span id="errorGender" style="color:red;display:inline;"></span>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="birthday">生日</label><br/>
                            <fmt:formatDate value="${user.birthday}" var="time" pattern="yyyy-MM-dd"/><input  type="text" style="width: 65%;display: inline" class="form-control" name="birthday" id="birthday"
                                   placeholder="格式：xxxx-xx-xx" value="${time}">
                            <span id="errorBirthday" style="color:red;display:inline;"></span>
                        </div>
                        <div><span style="color:red;display:inline;" id="updateFail"></span>
                            <span style="color:green;display:inline;" id="updateSuccess"></span>
                        </div>
                        <span id="userId" style="display:none">${user.id}</span>
                    </fieldset>
                    <br />
                    <div class="buttons kiosk-input-area">
                        <input class="acount-btn" type="button" value="修改" id="submit">
                    </div>
                </form>
            </div>
            <div class="col-md-6 login-left">
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<jsp:include page="commonfooter.jsp"/>


