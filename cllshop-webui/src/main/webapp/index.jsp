<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>首页</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Fashion Mania Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- start menu -->
    <link href="${pageContext.request.contextPath}/css/memenu.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/memenu.js"></script>
    <script>$(document).ready(function(){$(".memenu").memenu();});</script>
    <script src="${pageContext.request.contextPath}/js/simpleCart.min.js"> </script>
    <!-- slide -->
    <script src="${pageContext.request.contextPath}/js/responsiveslides.min.js"></script>
    <script>
        $(function () {
            $("#slider").responsiveSlides({
                auto: true,
                speed: 500,
                namespace: "callbacks",
                pager: true,
            });
        });
    </script>
</head>
<body>
<!--header-->
<div class="header">
    <div class="header-top">
        <div class="container">
            <div class="col-sm-4 world">
            </div>
            <div class="col-sm-4 logo">
                <a href="index.html"><img src="images/logo.png" alt=""></a>
            </div>

            <div class="col-sm-4 header-left">
                <p class="log"><a href="${pageContext.request.contextPath}/account.jsp"  >登录</a>
                    <span>or</span><a  href="${pageContext.request.contextPath}/register.jsp"  >注册</a></p>
                <div class="cart box_1">
                    <a href="checkout.html">
                        <h3> <div class="total">
                            <span class="simpleCart_total"></span></div>
                            <img src="images/cart.png" alt=""/></h3>
                    </a>
                    <p><a href="javascript:;" class="simpleCart_empty">Empty Cart</a></p>

                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
    <div class="container">
        <div class="head-top">
            <div class="col-sm-2 number">
                <span></span>
            </div>
            <div class="col-sm-8 h_menu4">
                <ul class="memenu skyblue">
                    <li class=" grid"><a  href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
                    <li><a  href="#">Men</a>
                        <div class="mepanel">
                            <div class="row">
                                <div class="col1">
                                    <div class="h_nav">
                                        <h4>All Clothing</h4>
                                        <ul>
                                            <li><a href="products.html">Shirts</a></li>
                                            <li><a href="products.html">Sports Wear</a></li>
                                            <li><a href="products.html">Shorts</a></li>
                                            <li><a href="products.html">Suits & Blazers</a></li>
                                            <li><a href="products.html">Formal Shirts</a></li>
                                            <li><a href="products.html">Sweatpants</a></li>
                                            <li><a href="products.html">Swimwear</a></li>
                                            <li><a href="products.html">Trousers & Chinos</a></li>
                                            <li><a href="products.html">T-Shirts</a></li>
                                            <li><a href="products.html">Underwear & Socks</a></li>

                                        </ul>
                                    </div>
                                </div>
                                <div class="col1">
                                    <div class="h_nav">
                                        <h4>Footwear</h4>
                                        <ul>
                                            <li><a href="products.html">Formal Shoes</a></li>
                                            <li><a href="products.html">Boots</a></li>
                                            <li><a href="products.html">Sports Shoes</a></li>
                                            <li><a href="products.html">Casual Shoes</a></li>
                                            <li><a href="products.html">Running Shoes</a></li>
                                            <li><a href="products.html">Sneakers</a></li>
                                            <li><a href="products.html">Loafers</a></li>
                                            <li><a href="products.html">Slippers</a></li>
                                            <li><a href="products.html">Sandals</a></li>
                                            <li><a href="products.html">Flip-flops</a></li>

                                        </ul>
                                    </div>
                                </div>
                                <div class="col1">
                                    <div class="h_nav">
                                        <h4>Popular Brands</h4>
                                        <ul>
                                            <li><a href="products.html">Levis</a></li>
                                            <li><a href="products.html">Persol</a></li>
                                            <li><a href="products.html">Nike</a></li>
                                            <li><a href="products.html">Edwin</a></li>
                                            <li><a href="products.html">New Balance</a></li>
                                            <li><a href="products.html">Jack & Jones</a></li>
                                            <li><a href="products.html">Paul Smith</a></li>
                                            <li><a href="products.html">Ray-Ban</a></li>
                                            <li><a href="products.html">Wood Wood</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="grid"><a  href="#">	Women</a>
                        <div class="mepanel">
                            <div class="row">
                                <div class="col1">
                                    <div class="h_nav">
                                        <h4>All Clothing</h4>
                                        <ul>
                                            <li><a href="products.html">Shirts & Tops</a></li>
                                            <li><a href="products.html">Sports Wear</a></li>
                                            <li><a href="products.html">Kurtas & Kurties</a></li>
                                            <li><a href="products.html">Suits & Blazers</a></li>
                                            <li><a href="products.html">Sarees</a></li>
                                            <li><a href="products.html">Sweatpants</a></li>
                                            <li><a href="products.html">Swimwear</a></li>
                                            <li><a href="products.html">Night-Suits</a></li>
                                            <li><a href="products.html">T-Shirts</a></li>
                                            <li><a href="products.html">Jeans</a></li>

                                        </ul>
                                    </div>
                                </div>
                                <div class="col1">
                                    <div class="h_nav">
                                        <h4>Footwear</h4>
                                        <ul>
                                            <li><a href="products.html">Heels</a></li>
                                            <li><a href="products.html">Flats</a></li>
                                            <li><a href="products.html">Sports Shoes</a></li>
                                            <li><a href="products.html">Casual Shoes</a></li>
                                            <li><a href="products.html">Running Shoes</a></li>
                                            <li><a href="products.html">Wedges</a></li>
                                            <li><a href="products.html">Boots</a></li>
                                            <li><a href="products.html">Pumps</a></li>
                                            <li><a href="products.html">Slippers</a></li>
                                            <li><a href="products.html">Flip-flops</a></li>

                                        </ul>
                                    </div>
                                </div>
                                <div class="col1">
                                    <div class="h_nav">
                                        <h4>Popular Brands</h4>
                                        <ul>
                                            <li><a href="products.html">Levis</a></li>
                                            <li><a href="products.html">Persol</a></li>
                                            <li><a href="products.html">Nike</a></li>
                                            <li><a href="products.html">Edwin</a></li>
                                            <li><a href="products.html">New Balance</a></li>
                                            <li><a href="products.html">Jack & Jones</a></li>
                                            <li><a href="products.html">Paul Smith</a></li>
                                            <li><a href="products.html">Ray-Ban</a></li>
                                            <li><a href="products.html">Wood Wood</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li><a  href="typo.html">Blog</a></li>
                    <li><a class="color6" href="contact.html">Conact</a></li>
                </ul>
            </div>
            <div class="col-sm-2 search">
                <a class="play-icon popup-with-zoom-anim" href="#small-dialog"><i class="glyphicon glyphicon-search"> </i> </a>
            </div>
            <div class="clearfix"> </div>
            <!---pop-up-box---->
            <script type="text/javascript" src="js/modernizr.custom.min.js"></script>
            <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
            <script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
            <!---//pop-up-box---->
            <div id="small-dialog" class="mfp-hide">
                <div class="search-top">
                    <div class="login">
                        <input type="submit" value="">
                        <input type="text" value="Type something..." onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '';}">
                    </div>
                    <p>	Shopping</p>
                </div>
            </div>
            <script>
                $(document).ready(function() {
                    $('.popup-with-zoom-anim').magnificPopup({
                        type: 'inline',
                        fixedContentPos: false,
                        fixedBgPos: true,
                        overflowY: 'auto',
                        closeBtnInside: true,
                        preloader: false,
                        midClick: true,
                        removalDelay: 300,
                        mainClass: 'my-mfp-zoom-in'
                    });

                });
            </script>
            <!---->
        </div>
    </div>
</div>
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
    <!--//content-->
    <!--footer-->
    <div class="footer">

        <div class="footer-bottom">
            <div class="container">
                <div class="col-sm-3 footer-bottom-cate">
                    <h6>Categories</h6>
                    <ul>
                        <li><a href="#">Curabitur sapien</a></li>
                        <li><a href="#">Dignissim purus</a></li>
                        <li><a href="#">Tempus pretium</a></li>
                        <li><a href="#">Dignissim neque</a></li>
                        <li><a href="#">Ornared id aliquet</a></li>

                    </ul>
                </div>
                <div class="col-sm-3 footer-bottom-cate">
                    <h6>Feature Projects</h6>
                    <ul>
                        <li><a href="#">Curabitur sapien</a></li>
                        <li><a href="#">Dignissim purus</a></li>
                        <li><a href="#">Tempus pretium</a></li>
                        <li><a href="#">Dignissim neque</a></li>
                        <li><a href="#">Ornared id aliquet</a></li>

                    </ul>
                </div>
                <div class="col-sm-3 footer-bottom-cate">
                    <h6>Top Brands</h6>
                    <ul>
                        <li><a href="#">Curabitur sapien</a></li>
                        <li><a href="#">Dignissim purus</a></li>
                        <li><a href="#">Tempus pretium</a></li>
                        <li><a href="#">Dignissim neque</a></li>
                        <li><a href="#">Ornared id aliquet</a></li>
                        <li><a href="#">Ultrices id du</a></li>
                        <li><a href="#">Commodo sit</a></li>

                    </ul>
                </div>
                <div class="col-sm-3 footer-bottom-cate cate-bottom">
                    <h6>Our Address</h6>
                    <ul>
                        <li>Aliquam metus  dui. </li>
                        <li>orci, ornareidquet</li>
                        <li> ut,DUI.</li>
                        <li>nisi, dignissim</li>
                        <li>gravida at.</li>
                        <li class="phone">PH : 6985792466</li>
                    </ul>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
</div>
    <!--//footer-->
</body>
</html>