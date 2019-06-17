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
<div class="account">
    <div class="container">
        <h1>个人中心</h1>
        <div class="account_grid">
            <div class="col-md-6 login-right">
               <div>
                    <fieldset>
                        <div class="form-group">
                            <label class="control-label" >真实姓名</label><br/>
                            <input type="text" disabled style="width: 65%;display: inline" class="form-control" name="gender"
                                    placeholder="${user.truename}">
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="gender">性别</label><br/>
                            <input type="text" disabled style="width: 65%;display: inline" class="form-control" name="gender"
                                   id="gender" placeholder="${user.gender}">
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="birthday">生日</label><br/>
                            <fmt:formatDate value="${user.birthday}" var="time" pattern="yyyy-MM-dd"/><input type="text" disabled style="width: 65%;display: inline" class="form-control" id="birthday"
                                   placeholder="${time}">
                        </div>
                    </fieldset>
                    <br/>
                    <div class="buttons kiosk-input-area">
                        <a class="acount-btn" href="${pageContext.request.contextPath}/user/showinfo2?userId=${user.id}">修改信息</a>
                    </div>
               </div>
            </div>
            <div class="col-md-6 login-left">
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<jsp:include page="commonfooter.jsp"/>

