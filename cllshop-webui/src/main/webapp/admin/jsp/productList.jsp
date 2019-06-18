<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>商品列表</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/layui/css/layui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/global.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/icheck/minimal/red.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/javascript/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/icheck/icheck.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/javascript/dw.js"></script>
	<script type="text/javascript">
	$(document).ready(function () {
		$("#delBatchBtn").click(function () {
			var ids = new Array();
			$.each($('input:checkbox'),function(){
				if(this.checked){
					ids.push($(this).val());
				}
			});

			alert(ids);
			$.ajax({
                url:"${pageContext.request.contextPath}/product/delBatch",
                data:{ids:ids},
                dataType:"json",
                type:"post",
                success:function (result) {
                	alert(result.msg);
					window.location.reload();
                }
            })
		});
	});

	function changeHot(id) {
		$.post("/product/changeHotStatus",{id:id,hot:1},function (result) {
			window.location.reload();
		})
	}
	function changeNoHot(id) {
		$.post("/product/changeHotStatus",{id:id,hot:0},function (result) {
			window.location.reload();
		})
	}

	</script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
	<%@include file="common.jsp"%>
	<!-- 内容主体区域 -->
	<!--商品列表-->
	<div class="layui-body" id="page1" style="display: block;">
		<div style="padding: 15px;">
			<fieldset class="layui-elem-field">
				<legend>内容管理 - 商品列表</legend>
				<div class="layui-field-box">
					<div class="layui-btn-group">
						<button class="layui-btn layui-btn-xs layui-btn-normal dw-dailog" dw-url="${pageContext.request.contextPath}/admin/product-add.jsp" dw-title="新增商品" dw-width="100%" dw-height="100%">
							<i class="layui-icon">&#xe654;</i>新增
						</button>
						<button class="layui-btn layui-btn-xs dw-refresh">
							<i class="layui-icon">&#x1002;</i>刷新
						</button>
						<button class="layui-btn layui-btn-xs layui-btn-danger" id="delBatchBtn">
							<i class="layui-icon">&#xe640;</i>批量删除
						</button>
					</div>
					<hr>
					<table class="layui-table">
						<thead>
						<tr>
							<th></th>
							<th>编号</th>
							<th>商品名称</th>
							<th>描述</th>
							<th>价格(元)</th>
							<th>库存</th>
							<th>子类别</th>
							<th>父类别</th>
							<th>是否热销</th>
							<th>热销时间</th>
							<th>创建时间</th>
							<th>更新时间</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${pageInfo.data }" var="product" varStatus="v">
							<tr>
								<td><input type="checkbox" name="ids" value="${product.id}"></td>
								<td>${v.count }</td>
								<td>${product.name }</td>
								<td>${product.description }</td>
								<td>${product.price / 100 }</td>
								<td>${product.stock}</td>
								<td>${product.smallType.name}</td>
								<td>${product.bigType.name}</td>
								<td>
									<c:if test="${product.hot==0 }">
										<button class="layui-btn layui-btn-xs layui-btn-warm" id="setNoHotBtn" onclick="changeHot(${product.id})">
											<i class="layui-icon">&#xe642;</i>否
										</button>
									</c:if>
			   						<c:if test="${product.hot!=0 }">
										<button class="layui-btn layui-btn-xs layui-btn-normal" id="setHotBtn" onclick="changeNoHot(${product.id})">
											<i class="layui-icon">&#xe642;</i>是
										</button>
									</c:if>
								</td>
								<td><fmt:formatDate value="${product.hottime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td><fmt:formatDate value="${product.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td><fmt:formatDate value="${product.updatetime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td>
									<c:if test="${product.status==0 }">下架</c:if>
									<c:if test="${product.status==1 }">正常</c:if>
								</td>
								<td class="text-center">
									<div class="layui-btn-group">
										<button class="layui-btn layui-btn-xs layui-btn-normal dw-dailog" dw-url="${pageContext.request.contextPath}/product/goProdEditPage?id=${product.id}" dw-title="编辑用户" dw-width="80%" dw-height="80%">
											<i class="layui-icon">&#xe642;</i>编辑
										</button>
										<button class="layui-btn layui-btn-xs layui-btn-danger dw-delete" dw-url="#" dw-title="${product.name }">
											<i class="layui-icon">&#xe640;</i>删除
										</button>
									</div>
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="15" style="text-align: center">
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
</div>
 <script type="text/javascript">
	  	function _toPage(){
			var toPage = document.getElementById("toPage").value;
	    		var reg = /^[1-9][0-9]?$/;
	    		if(!reg.test(toPage)){
	    			alert("错误参数");
	    			document.getElementById("toPage").value="1";
	    			return;
	    		}
	    		//输入的页面不能大于总页码
	    		var totalPage = "${pageInfo.totalPage}";
	    		if(toPage>totalPage){
	    			alert("不能大于总页数!");
	    			document.getElementById("toPage").value="1";
	    			return;
	    		}
	    		var url = "${pageContext.request.contextPath }/book.action?method=bookList&curPage="+toPage;
	    		window.location.href = url;
		}

	  </script>
</body>
</html>
