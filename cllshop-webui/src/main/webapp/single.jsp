<%--
  Created by IntelliJ IDEA.
  User: S1-02
  Date: 2019/6/10
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="commonheader.jsp"></jsp:include>
<script type="application/x-javascript">
    $(document).ready(function () {
        $("#addcart").click(function () {
            var cookietime = new Date();
            cookietime.setTime(cookietime.getTime() + (60 * 60 * 1000 * 12));//coockie保存一小时
            var id = $("#proId").val();
            var stocknum = $("#stock").html();
            var name = "id"+id;
            if(stocknum == 0){
                alert("所选商品无库存!")
            }else {
                alert("已添加至购物车!")
                $.cookie(name,id,{path:"/",expires:cookietime});
            }
            //alert(name+","+id);

        });
    });
</script>
<title>商品</title>
<div class="single">
    <div class="container">
        <c:forEach items="${product}" var="pro">
        <div class="col-md-9">
            <div class="col-md-5 grid">
                <div class="flexslider">
                    <ul class="slides">
                            <div class="thumb-image"> <img src="${pro.images}" data-imagezoom="true" class="img-responsive"> </div>
                    </ul>
                </div>
            </div>
            <div class="col-md-7 single-top-in">
                <div class="single-para simpleCart_shelfItem">
                    <h1>${pro.name}</h1>
                    <p>${pro.description}</p>
                    <input type="hidden" value="${pro.id}" id="proId">
                    <div class="star-on">
                        <ul>
                            <li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
                            <li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
                            <li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
                            <li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
                            <li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
                        </ul>

                        <div class="clearfix"> </div>
                    </div>

                    <label  class="add-to item_price">价格：￥${pro.price/100}</label>

                    <div class="available">
                        <h6>库存：</h6><h6 id="stock">${pro.stock}</h6>
                    </div>
                    <a href="#" id="addcart" class="cart item_add">加入购物车</a>
                </div>
            </div>
            <div class="clearfix"> </div>
            <div class="content-top1">
                <div class="clearfix"> </div>
            </div>
        </div>
        </c:forEach>
        <!----->
        <div class="col-md-3 product-bottom">
            <!--initiate accordion-->
            <script type="text/javascript">
                $(function() {
                    var menu_ul = $('.menu-drop > li > ul'),
                        menu_a  = $('.menu-drop > li > a');
                    menu_ul.hide();
                    menu_a.click(function(e) {
                        e.preventDefault();
                        if(!$(this).hasClass('active')) {
                            menu_a.removeClass('active');
                            menu_ul.filter(':visible').slideUp('normal');
                            $(this).addClass('active').next().stop(true,true).slideDown('normal');
                        } else {
                            $(this).removeClass('active');
                            $(this).next().stop(true,true).slideUp('normal');
                        }
                    });

                });
            </script>
            <!--//menu-->
            <!--seller-->
            <div class="product-bottom">
                <h3 class="cate">热门商品</h3>
                <c:forEach items="${hotList}" var="hot" begin="0" end="3">
                <div class="product-go">
                    <div class=" fashion-grid">
                        <a href="${pageContext.request.contextPath }/product/showPro/?productId=${hot.id}"><img class="img-responsive " src="${hot.images}" alt=""></a>
                    </div>
                    <div class=" fashion-grid1">
                        <h6 class="best2"><a href="${pageContext.request.contextPath }/product/showPro/?productId=${hot.id}" >${hot.name}</a></h6>
                        <span class=" price-in1">￥${hot.price/100}</span>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                </c:forEach>
            </div>

            <!--//seller-->

            <div class="clearfix"> </div>
        </div>
    </div>
    <jsp:include page="commonfooter.jsp"></jsp:include>
