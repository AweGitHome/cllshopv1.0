<%--
  Created by IntelliJ IDEA.
  User: Macbook
  Date: 2019/6/5
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!--订单列表-->
<div class="layui-body" id="page2" style="display: none;">
    <div style="padding: 15px;">
        <fieldset class="layui-elem-field">
            <legend>订单管理 - 订单列表</legend>
            <div class="layui-field-box">
                <form action="#" style="text-align: center">
                    <input type="hidden" name="method" value="queryData">
                    订单查询:<select name="cid" id="c_id">
                    <option value="">请选择</option>
                    <c:forEach items="${categoryList }" var="category">
                        <option value="${category.cid }">${category.cname }</option>
                    </c:forEach>
                </select>
                    <div class="layui-inline" style="text-align:left;">
                        <div class="layui-input-inline">
                            <button class="layui-btn"><i class="layui-icon">&#xe615;</i>查询</button>
                        </div>
                    </div>
                </form>
                <hr>
                <div class="layui-btn-group">
                    <button class="layui-btn layui-btn-xs layui-btn-normal dw-dailog" dw-url="#" dw-title="新增商品" dw-width="100%" dw-height="100%">
                        <i class="layui-icon">&#xe654;</i>新增
                    </button>
                    <button class="layui-btn layui-btn-xs dw-refresh">
                        <i class="layui-icon">&#x1002;</i>刷新
                    </button>
                </div>
                <hr>
                <table class="layui-table">
                    <thead>
                    <tr>
                        <th>订单</th>
                        <th>订单号</th>
                        <th>用户id</th>
                        <th>订单价格</th>
                        <th>创建时间</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageInfo.data }" var="product" varStatus="v">
                        <tr>
                            <td>${v.count }</td>
                            <td>${product.name }</td>
                            <td>${product.price / 100 }</td>
                            <td>${product.images }</td>
                            <td><fmt:formatDate value="${product._date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td>${book.category.cname }</td>
                            <td class="text-center">
                                <div class="layui-btn-group">
                                    <button class="layui-btn layui-btn-xs layui-btn-normal dw-dailog" dw-url="${pageContext.request.contextPath }/book.action?method=goEditPage&bid=${book.bid}" dw-title="编辑用户" dw-width="80%" dw-height="80%">
                                        <i class="layui-icon">&#xe642;</i>编辑
                                    </button>
                                    <button class="layui-btn layui-btn-xs layui-btn-danger dw-delete" dw-url="${pageContext.request.contextPath }/book.action?method=deleteBook&bid=${book.bid}" dw-title="${book.bname }">
                                        <i class="layui-icon">&#xe640;</i>删除
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="9" style="text-align: center">
                            <c:choose>
                                <c:when test="${pageInfo.curPage==1 }">
                                    首页&nbsp;
                                    上一页
                                </c:when>
                                <c:otherwise>
                                    <a href="${pageContext.request.contextPath }/book.action?method=bookList&curPage=${pageInfo.firstPage }">首页</a>&nbsp;
                                    <a href="${pageContext.request.contextPath }/book.action?method=bookList&curPage=${pageInfo.prePage }">上一页</a>&nbsp;
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${pageInfo.curPage==pageInfo.totalPage }">
                                    下一页&nbsp;
                                    尾页
                                </c:when>
                                <c:otherwise>
                                    <a href="${pageContext.request.contextPath }/book.action?method=bookList&curPage=${pageInfo.nextPage }">下一页</a>&nbsp;
                                    <a href="${pageContext.request.contextPath }/book.action?method=bookList&curPage=${pageInfo.totalPage }">尾页</a>&nbsp;
                                </c:otherwise>
                            </c:choose>
                            当前第${pageInfo.curPage }页/共${pageInfo.totalPage }页&nbsp;
                            共${pageInfo.totalCount }条数据&nbsp;
                            每页显示${pageInfo.pageSize }条&nbsp;
                            跳转到第<input type="text" size="2" id="toPage" name="toPage" onblur="_toPage()"/>页
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </fieldset>
    </div>
</div>
</body>
</html>
