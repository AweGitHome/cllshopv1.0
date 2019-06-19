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
<script>
    $(document).ready(function () {
        $("#tui").click(function () {
            var orderid = document.getElementById("oid").innerHTML;
            var st = 2;
            $.ajax({
                url:"${pageContext.request.contextPath}/returnorder.html",
                data:{id:orderid,status:st},
                dataType:"json",
                type:"post",
                async:false,
                success: function(result) {
                    if(result.msg == "提交成功"){
                        alert("提交成功");
                        window.location.href = "${pageContext.request.contextPath}/orders.html?uid=${userInfo.id}";
                    }else{
                        window.location.href = "${pageContext.request.contextPath}/orders.html?uid=${userInfo.id}";
                    }
                },
                error:function (result) {
                    if(result.msg == "提交成功"){
                        window.location.href = "${pageContext.request.contextPath}/orders.html?uid=${userInfo.id}";
                    }else{
                        window.location.href = "${pageContext.request.contextPath}/orders.html?uid=${userInfo.id}";
                    }
                }
            })
        });
    });
</script>
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
                <span id="oid" style="display: none">${od.orderid}</span>
            </c:forEach>
            </tbody>
        </table>
        <c:if test="${order.status == 1}">
            <input id="tui" type="button" class="acount-btn" value="取消订单">
        </c:if>
        <c:if test="${order.status == 0 || order.status == 2}">
            <input id="tui" type="button" class="acount-btn" style="display: none" value="">
        </c:if>
        <c:if test="${order.status == 3}">
            <input id="tui" type="button" class="acount-btn" value="退货">
        </c:if>
        <div class="clearfix"> </div>
    </div>
</div>
<jsp:include page="commonfooter.jsp"></jsp:include>
