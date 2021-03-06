<%--
  Created by IntelliJ IDEA.
  User: S1-02
  Date: 2019/5/29
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
<script>$(document).ready(function(){$(".memenu").memenu();});</script>
<script src="${pageContext.request.contextPath}/js/simpleCart.min.js"> </script>
<!-- slide -->
<script src="${pageContext.request.contextPath}/js/responsiveslides.min.js"></script>
<script src="${pageContext.request.contextPath}/js/fileinput.min.js"></script>
<link href="${pageContext.request.contextPath}/css/fileinput.min.css" rel="stylesheet" type="text/css" media="all"/>
<script>
    $(function () {
        $("#slider").responsiveSlides({
            auto: true,
            speed: 500,
            namespace: "callbacks",
            pager: true,
        });
        $("#logout").click(function () {
            $.ajax({
                url:"${pageContext.request.contextPath}/user/exit",
                type:"post",
                async:true,
                success:function (result) {
                        window.location.href = "${pageContext.request.contextPath}/"
                }
            });
        })
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
                <a href="index.html"><img src="${pageContext.request.contextPath}/images/logo.png" alt=""></a>
            </div>
            <div class="col-sm-4 header-left">
                <c:choose>
                    <c:when test="${userInfo!=null}">
                        <p class="log"><a style="width: 20%" href="${pageContext.request.contextPath}/user/showinfo?userName=${userInfo.username}">${userInfo.username}</a>&nbsp;<a style="width: 20%" href="${pageContext.request.contextPath}/orders.html?uid=${userInfo.id}" id="mylist">我的订单</a>&nbsp;<a style="width: 20%" href="#" id="logout">退出登录</a></p>
                    </c:when>
                    <c:otherwise>
                        <p class="log"><a href="${pageContext.request.contextPath}/login.jsp">登录</a>
                            <span>or</span><a  href="${pageContext.request.contextPath}/register.jsp">注册</a></p>
                    </c:otherwise>
                </c:choose>
                <div class="cart box_1">
                    <a href="${pageContext.request.contextPath}/cart.html">
                        <h3> <div class="total">
                            <br/>
                            <span >购物车</span></div>
                            <img src="${pageContext.request.contextPath}/images/cart.png" alt=""/></h3>
                    </a>
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
                    <li class=" grid"><a  href="${pageContext.request.contextPath}/">首页</a></li>
                        <li><a  href="#">商品分类</a>
                                <div class="mepanel">
                                    <div class="row">
                                        <c:forEach items="${bigTypes}" var="bigType">
                                        <div class="col1">
                                            <div class="h_nav">
                                                <h4>${bigType.name}</h4>
                                                <ul>
                                                    <c:forEach items="${bigType.smallTypes}" var="smallType">
                                                        <li><a href="${pageContext.request.contextPath}/product/showProByType?smallTypeId=${smallType.id}">${smallType.name}</a></li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                        </c:forEach>
                                    </div>
                                </div>
                    </li>
                    <li class="grid"><a  href="${pageContext.request.contextPath}/storeregister.jsp">商家入驻</a></li>
                    <li><a class="color6" href="${pageContext.request.contextPath}/store/showStore">商铺展示</a></li>
                </ul>
            </div>
            <div class="col-sm-2 search">
                <a class="play-icon popup-with-zoom-anim" href="#small-dialog"><i class="glyphicon glyphicon-search"> </i> </a>
            </div>
            <div class="clearfix"> </div>
            <!---pop-up-box---->
            <script type="text/javascript" src="${pageContext.request.contextPath}/js/modernizr.custom.min.js"></script>
            <link href="${pageContext.request.contextPath}/css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
            <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.js" type="text/javascript"></script>
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
