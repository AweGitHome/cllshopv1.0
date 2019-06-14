<%--
  Created by IntelliJ IDEA.
  User: S1-02
  Date: 2019/6/13
  Time: 8:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="commonheader.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/gouwu.js"></script>
<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/css/gouwu.css">--%>
<div class="container">
    <div class="check-out">
        <h1>购物车</h1>
        <table>
            <thead>
            <tr>
                <th class="tdone">序号</th>
                <th class="tdtwo">商品详情</th>
                <th class="tdthree">数量</th>
                <th class="tdfour">单价</th>
                <th class="tdfive">小计</th>
                <th class="tdsix">操作</th>
            </tr>
            </thead>
            <tbody>
            <tr class="trclass">
                <td class="tdone xuhao">1</td>
                <td class="ring-in"><a href="single.html" class="at-in"><img src="images/ce.jpg" class="img-responsive" alt=""></a>
                    <div class="sed">
                        <h5>Sed ut perspiciatis unde</h5>
                        <p>(At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium) </p>
                    </div>
                    <div class="clearfix"> </div></td>
                <td class="tdthree"><span class="jiajie"><input type="button" value="-"><span class="num">0</span><input type="button" value="+"></span></td>
                <td class="tdfour"><span class="unit">2</span></td>
                <td class="tdfive"><span class="subtal">0</span></td>
                <td class="tdsix"><button class="del">删除</button></td>
            </tr>
            <%--<tr><td   colspan="6"; class="talast"><span>商品一共 <span class="goods_num">0</span> 件; 共计花费 <span class="pricetal">0</span> 元; 其中最贵的商品单价是 <span class="pricest">0</span> 元</span></td></tr>--%>
            </tbody>
        </table>
        <a href="#" class=" to-buy">提交订单</a>
        <div class="clearfix"> </div>
    </div>
</div>
<jsp:include page="commonfooter.jsp"></jsp:include>
