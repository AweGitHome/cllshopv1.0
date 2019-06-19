<%--
  Created by IntelliJ IDEA.
  User: S1-02
  Date: 2019/6/19
  Time: 0:03
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>订单管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="common.jsp"></jsp:include>
    <script>
        layui.use(['form', 'layedit', 'laydate','element','jquery'], function() {
            var form = layui.form,
                layer = layui.layer,
                element=layui.element,
                $=layui.jquery;
            $(document).on('click','#passBtn',function(){
                var audid = $("#audid").html();
                var store = {id:audid};
                $.ajax({
                    url:"${pageContext.request.contextPath}/store/passRegister",
                    data:{id:audid},
                    dataType:"json",
                    //
                    // type:"post",
                    async:false,
                    success:function (result) {
                        if(result.msg == "提交成功"){
                            alert("提交成功!");
                            window.location.href = "${pageContext.request.contextPath}/store/showAudstoreList";
                        }else {
                            alert(result.msg);
                        }
                    }
                });
            });
        });
    </script>
    <script>
        function changeCancle(id) {
            $.post("/store/changeOrderStatus",{id:id,status:0},function (result) {
                window.location.reload();
            })
        }
        function changeOk(id) {
            $.post("/store/changeOrderStatus",{id:id,status:3},function (result) {
                window.location.reload();
            })
        }
    </script>
    <%--<script>--%>
    <%--layui.use(['form', 'layedit', 'laydate','element','jquery'], function() {--%>
    <%--var form = layui.form,--%>
    <%--layer = layui.layer,--%>
    <%--element=layui.element,--%>
    <%--$=layui.jquery;--%>
    <%--$(document).on('click','#passBtn',function(){--%>
    <%--var audid = $("#audid").html();--%>
    <%--layui.msg(audid);--%>
    <%--var store = {id:audid};--%>
    <%--$.ajax({--%>
    <%--url:"${pageContext.request.contextPath}/store/passRegister",--%>
    <%--data:store,--%>
    <%--dataType:"json",--%>
    <%--// type:"post",--%>
    <%--async:true,--%>
    <%--success:function (result) {--%>
    <%--if(result == 1){--%>
    <%--window.location.href = "${pageContext.request.contextPath}/admin/auditing.jsp"--%>
    <%--}else{--%>
    <%--window.location.href = "${pageContext.request.contextPath}/admin/auditing.jsp"--%>
    <%--}--%>
    <%--}--%>
    <%--});--%>
    <%--});--%>
    <%--});--%>
    <%--</script>--%>
    <!--商家申请入驻-->
    <div class="layui-body">
        <div style="padding: 15px;">
            <fieldset class="layui-elem-field">
                <legend>系统管理 - 订单管理</legend>
                <div class="layui-field-box">
                    <hr>
                    <table class="layui-table">
                        <thead>
                        <tr>
                            <th style="text-align:center;">序号</th>
                            <th style="text-align:center;">订单编号</th>
                            <th style="text-align:center;">创建时间</th>
                            <th style="text-align:center;">订单状态</th>
                            <th style="text-align:center;">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${orders}" varStatus="v" var="os">
                            <tr>
                                <td style="text-align:center;">${v.count}</td>
                                <td id="audid" style="text-align:center;">${os.ordernum}</td>
                                <td id="audname" style="text-align:center;"><fmt:formatDate value="${os.createtime }"  pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td id="audinfo" style="text-align:center;">
                                    <c:if test="${os.status == 0}">
                                        订单已取消
                                    </c:if>
                                    <c:if test="${os.status == 1}">
                                        待发货
                                    </c:if>
                                    <c:if test="${os.status == 2}">
                                        退货中
                                    </c:if>
                                    <c:if test="${os.status == 3}">
                                        已发货
                                    </c:if>
                                </td>
                                <td class="text-center">
                                    <div class="layui-btn-group">
                                        <c:if test="${os.status == 0}">
                                        </c:if>
                                        <c:if test="${os.status == 1}">
                                            <button class="layui-btn layui-btn-xs layui-btn-normal" id="passBtn" onclick="changeOk(${os.id})"  dw-width="80%" dw-height="80%">
                                                <i class="layui-icon">&#xe642;</i>发货
                                            </button>
                                        </c:if>
                                        <c:if test="${os.status == 2}">
                                            <button class="layui-btn layui-btn-xs layui-btn-danger" id="passBtn" onclick="changeCancle(${os.id})" dw-width="80%" dw-height="80%">
                                                <i class="layui-icon">&#xe642;</i>同意
                                            </button>
                                        </c:if>
                                        <c:if test="${os.status == 3}">
                                        </c:if>
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
                                        <a href="${pageContext.request.contextPath }/store/showAudstoreList?curPage=${pageInfo.firstPage }">首页</a>&nbsp;
                                        <a href="${pageContext.request.contextPath }/store/showAudstoreList?curPage=${pageInfo.prePage }">上一页</a>&nbsp;
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${pageInfo.curPage==pageInfo.totalPage }">
                                        下一页&nbsp;
                                        尾页
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${pageContext.request.contextPath }/store/showAudstoreList?curPage=${pageInfo.nextPage }">下一页</a>&nbsp;
                                        <a href="${pageContext.request.contextPath }/store/showAudstoreList?curPage=${pageInfo.totalPage }">尾页</a>&nbsp;
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
<!-- 	<script type="text/javascript">
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

	  </script> -->
</body>
</html>
