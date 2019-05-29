<%--
  Created by IntelliJ IDEA.
  User: S1-02
  Date: 2019/5/28
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<jsp:include page="commonheader.jsp"></jsp:include>
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
                <div class="col-md-3 col-md2">
                    <div class="col-md1 simpleCart_shelfItem">
                        <a href="single.html">
                            <img class="img-responsive" src="images/pi.png" alt="" />
                        </a>
                        <h3><a href="single.html">Tops</a></h3>
                        <div class="price">
                            <h5 class="item_price">$300</h5>
                            <a href="#" class="item_add">Add To Cart</a>
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                </div>

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
                    <div class="col-md-3 col-md2">
                        <div class="col-md1 simpleCart_shelfItem">
                            <a href="single.html">
                                <img class="img-responsive" src="images/pi.png" alt="" />
                            </a>
                            <h3><a href="single.html">Tops</a></h3>
                            <div class="price">
                                <h5 class="item_price">$300</h5>
                                <a href="#" class="item_add">Add To Cart</a>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                    </div>

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