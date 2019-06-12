<%--
  Created by IntelliJ IDEA.
  User: S1-02
  Date: 2019/6/11
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="commonheader.jsp"></jsp:include>
<title>商品</title>
<!--content-->
<div class="content">
    <div class="container">
        <div class="content-top">
            <h1>${smalltype.name}</h1>
            <div class="content-top1">
                <c:forEach items="${products }" var="pro">
                    <div class="col-md-3 col-md2" >
                        <div class="col-md1 simpleCart_shelfItem" >
                            <a href="${pageContext.request.contextPath }/product/showPro/?productId=${pro.id}">
                                <img class="img-responsive" src="${pro.images}" alt="" />
                            </a>
                            <h3><a href="single.html">${pro.name}</a></h3>
                            <div class="price">
                                <h5 class="item_price">￥${pro.price/100}</h5>
                                <a href="#" class="item_add">加入购物车</a>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
</div>
<%--<div class="products">--%>
<%--<div class="container">--%>
<%--<h1>已入驻商家</h1>--%>
<%--<div class="col-md-9">--%>
<%--<div class="content-top1">--%>
<%--<c:forEach items="${stores }" var="store">--%>
<%--<div class="col-md-4 col-md3">--%>
<%--<div class="col-md1 simpleCart_shelfItem">--%>
<%--<a href="single.html">--%>
<%--<img class="img-responsive" src="${store.storepic}" alt=""/>--%>
<%--</a>--%>
<%--<h3><a href="single.html">${store.name}</a></h3>--%>
<%--<div class="price">--%>
<%--<h5 class="item_price"></h5>--%>
<%--<div class="clearfix"></div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</c:forEach>--%>
<%--<div class="clearfix"></div>--%>
<%--</div>--%>
<%--<div class="col-md-3 product-bottom">--%>
<%--<!--initiate accordion-->--%>
<%--<script type="text/javascript">--%>
<%--$(function () {--%>
<%--var menu_ul = $('.menu-drop > li > ul'),--%>
<%--menu_a = $('.menu-drop > li > a');--%>
<%--menu_ul.hide();--%>
<%--menu_a.click(function (e) {--%>
<%--e.preventDefault();--%>
<%--if (!$(this).hasClass('active')) {--%>
<%--menu_a.removeClass('active');--%>
<%--menu_ul.filter(':visible').slideUp('normal');--%>
<%--$(this).addClass('active').next().stop(true, true).slideDown('normal');--%>
<%--} else {--%>
<%--$(this).removeClass('active');--%>
<%--$(this).next().stop(true, true).slideUp('normal');--%>
<%--}--%>
<%--});--%>

<%--});--%>
<%--</script>--%>
<%--<!--//menu-->--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="clearfix"></div>--%>
<%--</div>--%>
<%--</div>--%>
<!--//content-->
<jsp:include page="commonfooter.jsp"></jsp:include>
