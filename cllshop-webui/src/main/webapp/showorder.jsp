<%--
  Created by IntelliJ IDEA.
  User: S1-02
  Date: 2019/6/17
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="commonheader.jsp"></jsp:include>
<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/css/gouwu.css">--%>
<div class="container">
    <div class="check-out">
        <h1>我的订单</h1>
        <table>
            <thead>
            <tr>
                <th class="tdone">订单编号</th>
                <th class="tdtwo">创建时间</th>
                <th class="tdthree">订单总价</th>
                <th class="tdfour">订单详情</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach items="${orders}" var="order">
                    <tr class="trclass">
                        <td class="tdone xuhao">${order.ordernum}</td>
                        <td class="tdone xuhao"><fmt:formatDate value="${order.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                        <td class="tdone xuhao">￥${order.cost/100}</td>
                        <td class="tdone xuhao"><a href="/orderDetails.html?oid=${order.id}">查看详情</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="clearfix"> </div>
    </div>
</div>
<jsp:include page="commonfooter.jsp"></jsp:include>