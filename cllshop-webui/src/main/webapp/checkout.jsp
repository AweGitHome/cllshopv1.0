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
<script>
    $(document).ready(function () {
       $("#submitOrder").click(function () {
           var idList = document.getElementsByName("id");
           var numList = document.getElementsByName("num");
           var unitList = document.getElementsByName("unit");
           var num = 0;
           for(var j = 0; j < numList.length; j++){
                num += numList[j].innerHTML;
           }
           if (num == 0){
               alert("请选择购买数量!");
           } else {
               var param = [];
               for(var i = 0; i < idList.length; i++){
                   if (numList[i] == undefined){
                       continue;
                   }
                   param.push({productid:idList[i].innerHTML,num:numList[i].innerHTML,unit:unitList[i].innerHTML});
               }
               $.ajax({
                   url:"${pageContext.request.contextPath}/submitOrder",
                   data:JSON.stringify(param),
                   contentType: "application/json",//响应数据格式
                   dataType: "json", // 响应数据类型
                   type:"post",
                   success: function(data) {
                       if(data.status==200){
                           alert("提交订单成功");
                           window.location.reload();
                       }else{
                           alert("失败");
                       }
                   },
                   error:function () {
                       window.location.href = "/login.jsp";
                   }
               })
           }
       });
    });
</script>
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
                <th class="tdthree">库存</th>
                <th class="tdfour">单价</th>
                <th class="tdfive">小计</th>
                <th class="tdsix">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${order_products}" var="prod" varStatus="v">
                <span style="display: none" name="id">${prod.id}</span>
                <tr class="trclass">
                    <td class="tdone xuhao">${v.count}</td>
                    <td class="ring-in"><a href="single.html" class="at-in"><img src="${prod.images}" class="img-responsive" alt=""></a>
                        <div class="sed">
                            <h5>${prod.name}</h5>
                            <p>${prod.description}</p>
                        </div>
                        <div class="clearfix"> </div></td>
                    <td class="tdthree"><span class="jiajie"><input type="button" value="-"><span class="num" name="num">0</span><span class="stock" style="display: none">${prod.stock}</span><input type="button" value="+"></span></td>
                    <td class="tdfour"><span class="#">${prod.stock}</span></td>
                    <td class="tdfour"><span>￥</span><span class="unit" name="unit">${prod.price/100}</span></td>
                    <td class="tdfive"><span class="subtal">0</span></td>
                    <td class="tdsix"><button class="del">删除</button></td>
                </tr>
            </c:forEach>
            <tr><td   colspan="6"; class="talast"><span>商品一共 <span class="goods_num">0</span> 件; 共计花费 <span class="pricetal" id="cost">0</span> 元; 其中最贵的商品单价是 <span class="pricest">0</span> 元</span></td></tr>
            </tbody>
        </table>
        <a href="#" id="submitOrder" class=" to-buy">提交订单</a>
        <div class="clearfix"> </div>
    </div>
</div>
<jsp:include page="commonfooter.jsp"></jsp:include>
