<%--
  Created by IntelliJ IDEA.
  User: S1-02
  Date: 2019/6/17
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="commonheader.jsp"></jsp:include>
<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/css/gouwu.css">--%>
<div class="container">
    <div class="check-out">
        <h1>订单详情</h1>
        <table>
            <thead>
            <tr>
                <th class="tdtwo">商品详情</th>
                <th class="tdfour">单价</th>
                <th class="tdfive">数量</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orderDetails}" var="od">
                <tr class="trclass">
                    <td class="ring-in"><a href="single.html" class="at-in"><img src="${od.product.images}" class="img-responsive" alt=""></a>
                        <div class="sed">
                            <h5>${od.product.name}</h5>
                            <p>${od.product.description}</p>
                        </div>
                        <div class="clearfix"> </div></td>
                    <td class="tdfour"><span class="unit" name="unit">￥${od.product.price/100}</span></td>
                    <td class="tdfour"><span class="#">${od.num}</span></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="clearfix"> </div>
    </div>
</div>
<jsp:include page="commonfooter.jsp"></jsp:include>
