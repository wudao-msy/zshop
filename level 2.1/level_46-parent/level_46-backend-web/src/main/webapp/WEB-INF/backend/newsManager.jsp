<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>backend</title>
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/index.css" />
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/file.css" />
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/userSetting.js"></script>
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/zshop.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrapValidator.min.css" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-paginator.js"></script>

    <script>
        $(function(){


            //服务器端校验
            let successMsg='${successMsg}';
            let errorMsg='${errorMsg}';
            if(successMsg!=''){
                layer.msg(successMsg,{
                    time:2000,
                    skin:'successMsg'
                });
            }
            if(errorMsg!=''){
                layer.msg(errorMsg,{
                    time:2000,
                    skin:'errorMsg'
                });
            }

            //使用bootstrap校验框架进行客户端数据校验
            $('#frmAddNews').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields:{
                    title: {
                        validators: {
                            notEmpty: {
                                message: '新闻标题不能为空'
                            },
                            remote:{
                                //get请求
                                url:'${pageContext.request.contextPath}/backend/news/checkName'
                            }

                        }
                    },
                    content:{
                        validators:{
                            notEmpty:{
                                message:'新闻内容不能为空'
                            }
                        }
                    }

                }
            });
            //修改窗口客户端校验
            $('#frmModifyNews').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields:{
                    title: {
                        validators: {
                            notEmpty: {
                                message: '新闻标题不能为空'
                            },
                            remote:{
                                //get请求
                                url:'${pageContext.request.contextPath}/backend/news/checkName'
                            }

                        }
                    },
                    content:{
                        validators:{
                            notEmpty:{
                                message:'新闻内容不能为空'
                            }
                        }
                    }

                }
            });



            $('#pagination').bootstrapPaginator({
                //主版本号
                bootstrapMajorVersion: 3,
                //当前页
                currentPage:${data.pageNum},
                //总页数
                totalPages:${data.pages},
                //单击条目执行的请求url

                pageUrl: function (type, page, current) {
                    return '${pageContext.request.contextPath}/backend/news/findAll?pageNum='+page;
                },
                //显示分页条信息
                itemTexts: function (type, page, current) {
                    switch (type) {
                        case "first":
                            return "首页";
                        case "prev":
                            return "上一页";
                        case "next":
                            return "下一页";
                        case "last":
                            return "尾页";
                        case "page":
                            return page;
                    }
                }

            });

        });



        function showNews(id){
            $.post(
                "${pageContext.request.contextPath}/backend/news/findById",
                {"id":id},
                function(result){
                    $('#detail_id').html(result.data.id);
                    $('#detail_title').html(result.data.title);
                    $('#detail_content').html(result.data.content);
                    $('#newsDetail').modal('show');
                }
            );

        }

        function modifyNews(id){
            $.post(
                "${pageContext.request.contextPath}/backend/news/findById",
                {"id":id},
                function(result){
                    $('#modify_id').val(result.data.id);
                    $('#modify_title').val(result.data.title);
                    $('#modify_content').val(result.data.content);
                }
            );

        }

        //显示删除窗口
        function showDeleteModal(id){
            //alert(id);
            //将id，存放在该对话框的隐藏表单域
            $('#deleteProductId').val(id);
            //显示该删除对话框
            $('#deleteProductModal').modal('show');
        }

        //删除商品
        function deleteProduct(){
            $.post('${pageContext.request.contextPath}/backend/news/removeById',
                {"id":$('#deleteProductId').val()},function(result){
                    if(result.status==1){
                        layer.msg(result.message,{
                                time:2000,
                                skin:'successMsg'
                            },
                            function(){
                                location.href='${pageContext.request.contextPath}/backend/news/findAll?pageNum='+${data.pageNum};
                            }
                        );
                    }
                    else{
                        layer.msg(result.message,{
                            time:2000,
                            skin:'errorMsg'
                        });
                    }
                });
        }



    </script>

</head>

<body>
<div class="panel panel-default" id="userInfo" id="homeSet">
    <div class="panel-heading">
        <h3 class="panel-title">新闻管理</h3>
    </div>
    <div class="panel-body">

        <input type="button" value="添加新闻" class="btn btn-primary" id="doAddPro">
        <br>
        <div class="text-center" style="position: relative;top: 30px;">
            <table class="table table-bordered table-hover" style='text-align: center;'>
                <thead>
                <tr class="text-danger">
                    <th class="text-center">序号</th>
                    <th class="text-center">标题</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody id="tb">
                <c:forEach items="${data.list}" var="news">
                        <tr>
                        <td>${news.id}</td>
                        <td>${news.title}</td>
                        <td class="text-center">
                            <input type="button" class="btn btn-info btn-sm " value="详情" onclick="showNews(${news.id})">
                            <input type="button" class="btn btn-warning btn-sm doModify" value="修改" onclick="modifyNews(${news.id})">
                            <input type="button" class="btn btn-danger btn-sm doProDelete" value="删除"
                                   onclick="showDeleteModal(${news.id})">
                         </td>
                    </tr>
                </c:forEach>


                </tbody>
            </table>
            <ul id="pagination"></ul>
        </div>
    </div>
</div>

<!-- 添加news start -->
<div class="modal fade" tabindex="-1" id="Product">
    <!-- 窗口声明 -->
    <div class="modal-dialog modal-lg">

        <form action="${pageContext.request.contextPath}/backend/news/add" class="form-horizontal" method="post"  id="frmAddNews">
            <input type="hidden" name="pageNum" value="${data.pageNum}">
            <div class="modal-content">
                <!-- 头部、主体、脚注 -->
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">添加新闻</h4>
                </div>
                <div class="modal-body text-center row">
                    <div class="col-sm-8">
                        <div class="form-group">
                            <label for="news_add_name" class="col-sm-4 control-label">新闻标题：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="news_add_name" name="title">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="news_add_content" class="col-sm-4 control-label">新闻内容：</label>
                            <div class="col-sm-8">
                                <textarea class="form-control" rows="10" style="resize:none;" id="news_add_content" name="content" >

				                </textarea>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" type="submit">添加</button>
                    <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- 添加商品 end -->



<div class="modal fade" id="newsDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">新闻详情</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <div class="row text-right">
                        <label class="col-sm-3 control-label">编号：</label>
                        <div class="col-sm-6">
                            <p id="detail_id"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row text-right">
                        <label class="col-sm-3 control-label">标题：</label>
                        <div class="col-sm-6">
                            <p id="detail_title"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row text-right">
                        <label class="col-sm-3 control-label">内容：</label>
                        <div class="col-sm-6">
                            <p id="detail_content"/>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- MODEL结束 -->

<!-- 修改news信息 start -->
<div class="modal fade" tabindex="-1" id="myModal">
    <!-- 窗口声明 -->
    <div class="modal-dialog modal-lg">
        <!-- 内容声明 -->
        <form action="${pageContext.request.contextPath}/backend/news/modify" class="form-horizontal" method="post" id="frmModifyNews">
        <div class="modal-content">
            <!-- 头部、主体、脚注 -->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">修改新闻</h4>
            </div>
            <div class="modal-body text-center">
                <input type="hidden" name="pageNum" value="${data.pageNum}">
                <div class="row text-right">
                    <label for="modify_id" class="col-sm-4 control-label">编号：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="modify_id" name="id" readonly="readonly">
                    </div>
                </div>
                <br>
                <div class="row text-right">
                    <label for="modify_title" class="col-sm-4 control-label">新闻标题：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="modify_title" name="title">
                    </div>
                </div>
                <br>
                <div class="row text-right">
                    <label for="modify_content" class="col-sm-4 control-label">新闻内容：</label>
                    <div class="col-sm-4">
                        <textarea class="form-control" rows="10" style="resize:none;" id="modify_content" name="content" >

				      </textarea>
                    </div>
                </div>
                <br>


            </div>
            <div class="modal-footer">
                <button class="btn btn-primary updateOne" type="submit">修改</button>
                <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
            </div>
        </div>
        </form>
    </div>
</div>

<!-- 修改客户信息 end -->


<!--删除确认框  start-->
<div class="modal fade" tabindex="-1" id="deleteProductModal">
    <!-- 窗口声明 -->
    <div class="modal-dialog">
        <!-- 内容声明 -->

        <input type="hidden" id="deleteProductId"/>
        <div class="modal-content">
            <!-- 头部、主体、脚注 -->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">提示消息</h4>
            </div>
            <div class="modal-body row">
                <div class="col-sm-8">
                    <h4>确认要删除该新闻吗？</h4>
                </div>

            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" onclick="deleteProduct()">确认</button>
                <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
            </div>
        </div>

    </div>
</div>


</body>

</html>