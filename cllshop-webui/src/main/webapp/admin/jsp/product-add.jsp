<%--
  Created by IntelliJ IDEA.
  User: Macbook
  Date: 2019/6/5
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>用户信息编辑</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/admin/javascript/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/admin/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/admin/javascript/dw_form_submit.js"></script>

</head>

<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-lg12">
            <fieldset class="layui-elem-field">
                <legend>商品管理 - 新增商品</legend>
                <div class="layui-field-box">
                    <form class="layui-form" action="${pageContext.request.contextPath}/product/create" method="post">
                        <div class="layui-form-item">
                            <label class="layui-form-label">商品名</label>
                            <div class="layui-input-block">
                                <input type="text" name="name" required lay-verify="required" placeholder="请输入商品名称"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">描述</label>
                            <div class="layui-input-block">
                                <input type="text" name="description" required lay-verify="required" placeholder="请输入商品描述"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">价格(元)</label>
                            <div class="layui-input-block">
                                <input type="text" name="price" required lay-verify="required" placeholder="请输入价格"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">图片</label>
                            <div class="layui-input-block">
                                <button type="button" class="layui-btn" id="upload1">上传图片</button>
                                <input type="hidden" id="img_pic" name="images"/>
                                <div class="layui-upload-list">
                                    <img class="layui-upload-img" width="100px" height="80px" id="demo1"/>
                                    <p id="demoText"></p>
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">库存</label>
                            <div class="layui-input-block">
                                <input type="text" name="stock" required lay-verify="required" placeholder="请输入库存数量"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">类别</label>
                            <div class="layui-input-inline">
                                <select id="btype" name="bigtypeid" lay-filter="btype">
                                    <option value="">请选择类别</option>
                                    <c:forEach items="${bigTypes}" var="bigtype">
                                        <option value="${bigtype.id}">${bigtype.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="layui-input-inline">
                                <select name="smalltypeid" id="stype" class="field">
                                    <option value="1">请选择类别</option>
                                </select>
                            </div>
                        </div>
                        <!--类别-->

                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit lay-filter="go">立即提交</button>
                                <button type="reset" class="layui-btn">重置</button>
                            </div>
                        </div>
                    </form>
                </div>
            </fieldset>
            <label class="layui-form-lable">${msg }</label>
        </div>
    </div>
</div>
<script type="text/javascript">
    layui.use(['form','upload'], function(){
        var upload = layui.upload;
        var $ = layui.jquery;
        var form=layui.form;
        var uploadInst = upload.render({
            elem: '#upload1', //绑定元素
            url: '/product/uploadPic', //上传接口
            before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            ,done: function(res){
                //如果上传失败
                if(res.code > 0){
                    return layer.msg('上传失败');
                }
                //上传成功
                alert("上传成功"+res.pic);
                document.getElementById("img_pic").value = res.pic;
            }
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });
        form.on('select(btype)', function(data){
            var url = "/stype/getAll";
            var bid = data.value;
            $.ajax({
                url:url,
                data:{bid:bid},
                dataType:"json",
                type:"post",
                async:true,
                success:function (result) {
                    $("#stype").prop("length",1);
                    for(var i = 0; i < result.length; i++){
                        $("#stype").append($("<option>").val(result[i].id).html(result[i].name));
                    }
                    form.render();
                }
            });
        });
        from.on('submit(go)',function (data) {
            layui.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            });
            return false;
        });
    });
</script>
</body>
</html>


