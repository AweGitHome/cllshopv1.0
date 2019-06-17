<%--
  Created by IntelliJ IDEA.
  User: S1-02
  Date: 2019/5/28
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="commonheader.jsp"></jsp:include>
<title>首页</title>
<!--banner-->
<div class="banner">
    <div class="col-sm-3 banner-mat">
        <img class="img-responsive"	src="images/ba1.jpg" alt="">
    </div>
    <div class="col-sm-6 matter-banner">
        <div class="slider">
            <div class="callbacks_container">
                <ul class="rslides" id="slider">
                    <li>
                        <img src="images/1.jpg" alt="">
                    </li>
                    <li>
                        <img src="images/2.jpg" alt="">
                    </li>
                    <li>
                        <img src="images/1.jpg" alt="">
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="col-sm-3 banner-mat">
        <img class="img-responsive" src="images/ba.jpg" alt="">
    </div>
    <div class="clearfix"> </div>
</div>
<!--//banner-->
<!--content-->
<div class="content">
    <div class="container">
        <div class="content-top">
            <h1>热门商品</h1>
            <div class="content-top1">
                <c:forEach var="hot" items="${hotList}">
                <div class="col-md-3 col-md2">
                    <div class="col-md1 simpleCart_shelfItem" style="width: 250px;height: 250px">
                        <a href="${pageContext.request.contextPath }/product/showPro/?productId=${hot.id}">
                            <img class="img-responsive" width="50%" src="${hot.images}" alt="" />
                        </a>
                        <h3><a href="${pageContext.request.contextPath }/product/showPro/?productId=${hot.id}">${hot.name}</a></h3>
                        <div class="price">
                            <h5 class="item_price">￥${hot.price/100}</h5>
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
<!--//content-->
<!--content-->
<div class="footer-bottom">
    <div class="content">
        <div class="container">
            <div class="content-top">
                <h1>最新商品</h1>
                <div class="content-top1">
                    <c:forEach var="newlist" items="${newList}">
                        <div class="col-md-3 col-md2">
                            <div class="col-md1 simpleCart_shelfItem" style="width: 250px;height: 250px">
                                <a href="${pageContext.request.contextPath }/product/showPro/?productId=${newlist.id}">
                                    <img class="img-responsive" width="50%" src="${newlist.images}" alt="" />
                                </a>
                                <h3><a href="${pageContext.request.contextPath }/product/showPro/?productId=${newlist.id}">${newlist.name}</a></h3>
                                <div class="price">
                                    <h5 class="item_price">￥${newlist.price/100}</h5>
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
<div>
</div>
    <!--//content-->
<jsp:include page="commonfooter.jsp"></jsp:include>