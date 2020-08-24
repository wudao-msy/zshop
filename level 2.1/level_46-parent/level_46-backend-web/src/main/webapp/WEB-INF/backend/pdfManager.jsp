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
            $('#frmAddPdf').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields:{
                    file: {
                        validators: {
                            notEmpty: {
                                message: '文件选择不能为空'
                            }


                        }
                    },
                    name:{
                        validators:{
                            notEmpty:{
                                message:'文件名不能为空'
                            },
                            remote:{
                                //get请求
                                url:'${pageContext.request.contextPath}/backend/pdf/checkName'
                            }
                        }
                    }

                }
            });
            //修改窗口客户端校验
            $('#frmModifyPdf').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields:{
                    file: {
                        validators: {
                            notEmpty: {
                                message: '文件选择不能为空'
                            }


                        }
                    },
                    name:{
                        validators:{
                            notEmpty:{
                                message:'文件名不能为空'
                            },
                            remote:{
                                //get请求
                                url:'${pageContext.request.contextPath}/backend/pdf/checkName'
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
                    return '${pageContext.request.contextPath}/backend/pdf/findAll?pageNum='+page;
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
                "${pageContext.request.contextPath}/backend/pdf/findById",
                {"id":id},
                function(result){
                    $('#detail_id').html(result.data.id);
                    $('#detail_title').html(result.data.title);
                    $('#detail_content').html(result.data.content);
                    $('#pdfDetail').modal('show');
                }
            );

        }

        function modifyPdf(id){
            $.post(
                "${pageContext.request.contextPath}/backend/pdf/findById",
                {"id":id},
                function(result){
                    $('#pdf_modify_id').val(result.data.id);
                    $('#pdf_modify_name').val(result.data.name);
                    $('#pdf_modify_status').val(result.data.status);
                    $('#pdf_modify_path').val(result.data.path);

                }
            );

        }

        //显示删除窗口
        function showDeleteModal(id){
            //alert(id);
            //将id，存放在该对话框的隐藏表单域
            $('#deletePdfId').val(id);
            //显示该删除对话框
            $('#deleteProductModal').modal('show');
        }

        //删除商品
        function deletePdf(){
            $.post('${pageContext.request.contextPath}/backend/pdf/removeById',
                {"id":$('#deletePdfId').val()},function(result){
                    if(result.status==1){
                        layer.msg(result.message,{
                                time:2000,
                                skin:'successMsg'
                            },
                            function(){
                                location.href='${pageContext.request.contextPath}/backend/pdf/findAll?pageNum='+${data.pageNum};
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

        <input type="button" value="添加文件" class="btn btn-primary" id="doAddPro">
        <br>
        <div class="text-center" style="position: relative;top: 30px;">
            <table class="table table-bordered table-hover" style='text-align: center;'>
                <thead>
                <tr class="text-danger">
                    <th class="text-center">序号</th>
                    <th class="text-center">文件</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody id="tb">
                <c:forEach items="${data.list}" var="pdf">
                        <tr>
                        <td>${pdf.id}</td>
                            <td><a href="${pdf.path}">${pdf.name}</a></td>
                        <td class="text-center">
                            <input type="button" class="btn btn-warning btn-sm doModify" value="修改" onclick="modifyPdf(${pdf.id})">
                            <input type="button" class="btn btn-danger btn-sm doProDelete" value="删除"
                                   onclick="showDeleteModal(${pdf.id})">
                         </td>
                    </tr>
                </c:forEach>


                </tbody>
            </table>
            <ul id="pagination"></ul>
        </div>
    </div>
</div>

<!-- 添加pdf start -->
<div class="modal fade" tabindex="-1" id="Product">
    <!-- 窗口声明 -->
    <div class="modal-dialog modal-lg">

        <form action="${pageContext.request.contextPath}/backend/pdf/add" class="form-horizontal" method="post"  id="frmAddPdf" enctype="multipart/form-data">
            <input type="hidden" name="pageNum" value="${data.pageNum}">
            <div class="modal-content">
                <!-- 头部、主体、脚注 -->
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">文件新增</h4>
                </div>
                <div class="modal-body text-center row">
                    <div class="col-sm-8">
                        <div class="form-group">
                            <label for="pdf_add_file" class="col-sm-4 control-label">文件：</label>
                            <div class="col-sm-8">
                                <input type="file" class="form-control" id="pdf_add_file" name="file">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="form-group">
                            <label for="pdf_add_name" class="col-sm-4 control-label">文件名：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="pdf_add_name" name="name">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="form-group">
                            <label for="pdf_add_status" class="col-sm-4 control-label">文件种类：</label>
                            <div class="col-sm-8">
                                <select class="form-control" id="pdf_add_status" name="status">
                                    <option value="0">考试须知</option>
                                    <option value="1">考试时间</option>
                                    <option value="2">考试报名</option>
                                    <option value="3">延考通知</option>
                                </select>
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


<!-- 修改pdf信息 start -->
<div class="modal fade" tabindex="-1" id="myModal">
    <!-- 窗口声明 -->
    <div class="modal-dialog modal-lg">
        <!-- 内容声明 -->
        <form action="${pageContext.request.contextPath}/backend/pdf/modify" class="form-horizontal" method="post" id="frmModifyPdf" enctype="multipart/form-data">
            <input type="hidden" name="pageNum" value="${data.pageNum}">
            <div class="modal-content">
                <!-- 头部、主体、脚注 -->
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">文件修改</h4>
                </div>
                <div class="modal-body text-center row">
                    <div class="col-sm-8">
                        <div class="form-group">
                            <label for="pdf_modify_id" class="col-sm-4 control-label">编号：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="pdf_modify_id" name="id" readonly="readonly">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="form-group">
                            <label for="pdf_modify_file" class="col-sm-4 control-label">文件：</label>
                            
                            <div class="col-sm-8">
                                <!--<input type="textbox" name="path" class="form-control" id="pdf_modify_path">-->
                                    <input type="file" class="form-control" id="pdf_modify_file" name="file">

                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="form-group">
                            <label for="pdf_modify_name" class="col-sm-4 control-label">文件名：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="pdf_modify_name" name="name">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="form-group">
                            <label for="pdf_modify_status" class="col-sm-4 control-label">文件种类：</label>
                            <div class="col-sm-8">
                                <select class="form-control" id="pdf_modify_status" name="status">
                                    <option value="0">考试须知</option>
                                    <option value="1">考试时间</option>
                                    <option value="2">考试报名</option>
                                    <option value="3">延考通知</option>
                                </select>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" type="submit">修改</button>
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

        <input type="hidden" id="deletePdfId"/>
        <div class="modal-content">
            <!-- 头部、主体、脚注 -->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">提示消息</h4>
            </div>
            <div class="modal-body row">
                <div class="col-sm-8">
                    <h4>确认要删除该文件吗？</h4>
                </div>

            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" onclick="deletePdf()">确认</button>
                <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
            </div>
        </div>

    </div>
</div>


</body>

</html>