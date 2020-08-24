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
            $('#frmAddExam').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields:{
                    name: {
                        validators: {
                            notEmpty: {
                                message: '考试名称不能为空'
                            },
                            remote:{
                                //get请求
                                url:'${pageContext.request.contextPath}/backend/exam/checkName'
                            }

                        }
                    },
                    play:{
                        validators:{
                            notEmpty:{
                                message:'考试时间不能为空'
                            }
                        }
                    },
                    examId:{
                        validators:{
                            notEmpty:{
                                message:'请选择考试类型'
                            }
                        }
                    }

                }
            });
            //修改窗口客户端校验
            $('#frmModifyExam').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields:{
                    name: {
                        validators: {
                            notEmpty: {
                                message: '考试名称不能为空'
                            },
                            remote:{
                                //get请求
                                url:'${pageContext.request.contextPath}/backend/exam/checkName'
                            }

                        }
                    },
                    play:{
                        validators:{
                            notEmpty:{
                                message:'考试时间不能为空'
                            }
                        }
                    },
                    examId:{
                        validators:{
                            notEmpty:{
                                message:'请选择考试类型'
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

                onPageClicked: function (event, originalEvent, type, page) {
                    //给隐藏表单域赋值
                    $('#pageNum').val(page);
                    //重新提交表单
                    $('#frmQuery').submit();


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



        function showExam(id){
            $.post(
                "${pageContext.request.contextPath}/backend/exam/findById",
                {"id":id},
                function(result){
                    $('#modify_id').val(result.data.id);
                    $('#modify_name').val(result.data.name);
                    $('#modify_play').val(result.data.play);
                    $('#modify_kind').val(result.data.kind);
                }
            );

        }

        //按条件查询
        function doQuery(){
            //重置当前页为第一页
            $('#pageNum').val(1);
            //提交表单
            $('#frmQuery').submit();
        }


        //修改用户状态
        function modifyStatus(id,isValid,btn){
            $.post('${pageContext.request.contextPath}/backend/exam/modifyStatus',
                {"id":id,"isValid":isValid},function(result){
                    if(result.status==1){
                        let $td= $(btn).parent().parent().children().eq(4);
                        if($td.text().trim()=='有效'){
                            $td.text('无效');
                            $(btn).val('启用').removeClass('btn-danger').addClass('btn-success');

                        }
                        else{
                            $td.text('有效');
                            $(btn).val('禁用').removeClass('btn-success').addClass('btn-danger');
                        }

                    }

                });
        }


    </script>

</head>

<body>
<div class="panel panel-default" id="userInfo" id="homeSet">
    <div class="panel-heading">
        <h3 class="panel-title">考试管理</h3>
    </div>
    <div class="panel-body">

        <div class="showusersearch">
            <form class="form-inline" action="${pageContext.request.contextPath}/backend/exam/findByParams"
                  method="post" id="frmQuery">
                <input type="hidden" name="pageNum" value="${data.pageNum}" id="pageNum">

                <div class="form-group">
                    <label for="exam_play">考试时间:</label>
                    <select class="form-control" id="exam_play" name="examId">
                        <option value="-1" selected="selected">查询全部</option>
                        <c:forEach items="${examPlays}" var="examPlays">
                            <option value="${examPlays.id}" <c:if test="${examPlays.id==examParam.examId}">selected</c:if>>${examPlays.play}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="exam_kind">考试类型:</label>
                    <select class="form-control" id="exam_kind" name="kind">
                        <option value="-1" selected="selected">全部</option>
                        <option value="4"<c:if test="${examParam.kind==4}">selected</c:if>>---4级---</option>
                        <option value="0"<c:if test="${examParam.kind==6}">selected</c:if>>---6级---</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="exam_isValid">状态:</label>
                    <select class="form-control" id="exam_isValid" name="isValid">
                        <option value="-1" selected="selected">全部</option>
                        <option value="1"<c:if test="${examParam.isValid==1}">selected</c:if>>---有效---</option>
                        <option value="0"<c:if test="${examParam.isValid==0}">selected</c:if>>---无效---</option>
                    </select>
                </div>
                <input type="button" value="查询" class="btn btn-primary" id="doSearch" onclick="doQuery()">
            </form>
        </div>


        <input type="button" value="添加考试" class="btn btn-primary" id="doAddPro">
        <br>
        <div class="text-center" style="position: relative;top: 30px;">
            <table class="table table-bordered table-hover" style='text-align: center;'>
                <thead>
                <tr class="text-danger">
                    <th class="text-center">序号</th>
                    <th class="text-center">考试</th>
                    <th class="text-center">场次</th>
                    <th class="text-center">类型</th>
                    <th class="text-center">状态</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody id="tb">
                <c:forEach items="${data.list}" var="exam">
                        <tr>
                        <td>${exam.id}</td>
                        <td>${exam.name}</td>
                        <td>${exam.play}</td>
                        <td>${exam.kind}</td>
                        <td>
                            <c:if test="${exam.isValid==1}">启用</c:if>
                            <c:if test="${exam.isValid==0}">禁用</c:if>
                        </td>

                        <td class="text-center">
                            <input type="button" class="btn btn-warning btn-sm doModify" value="修改" onclick="showExam(${exam.id})">
                            <c:if test="${exam.isValid==0}"> <input type="button" class="btn btn-success btn-sm doDisable" value="启用" onclick="modifyStatus(${exam.id},${exam.isValid},this)">
                            </c:if>
                            <c:if test="${exam.isValid==1}"><input type="button" class="btn btn-danger btn-sm doDisable" value="禁用" onclick="modifyStatus(${exam.id},${exam.isValid},this)">
                            </c:if>

                         </td>
                    </tr>
                </c:forEach>


                </tbody>
            </table>
            <ul id="pagination"></ul>
        </div>
    </div>
</div>

<!-- 添加exam start -->
<div class="modal fade" tabindex="-1" id="Product">
    <!-- 窗口声明 -->
    <div class="modal-dialog modal-lg">

        <form action="${pageContext.request.contextPath}/backend/exam/add" class="form-horizontal" method="post"  id="frmAddExam">
            <input type="hidden" name="pageNum" value="${data.pageNum}">
            <div class="modal-content">
                <!-- 头部、主体、脚注 -->
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">添加考试</h4>
                </div>
                <div class="modal-body text-center row">
                    <div class="col-sm-8">
                        <div class="form-group">
                            <label for="exam_add_name" class="col-sm-4 control-label">考试名称：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="exam_add_name" name="name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="exam_add_play" class="col-sm-4 control-label">考试时间：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="exam_add_play" name="play">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-4 control-label">考试类型：</label>
                            <div class="col-sm-8">
                                <select class="form-control" name="kind">
                                    <option value="4" selected="selected">--四级--</option>
                                    <option value="6">--六级--</option>
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


<!-- 修改exam信息 start -->
<div class="modal fade" tabindex="-1" id="myModal">
    <!-- 窗口声明 -->
    <div class="modal-dialog modal-lg">
        <!-- 内容声明 -->
        <form action="${pageContext.request.contextPath}/backend/exam/modify" class="form-horizontal" method="post" id="frmModifyExam">
        <div class="modal-content">
            <!-- 头部、主体、脚注 -->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">修改客户</h4>
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
                    <label for="modify_name" class="col-sm-4 control-label">考试名称：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="modify_name" name="name">
                    </div>
                </div>
                <br>
                <div class="row text-right">
                    <label for="modify_play" class="col-sm-4 control-label">考试场次：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="modify_play" name="play">
                    </div>
                </div>
                <br>
                <div class="row text-right">
                    <label for="modify_kind" class="col-sm-4 control-label">考试类型：</label>
                    <div class="col-sm-4">
                        <select class="form-control" name="kind" id="modify_kind">
                            <option value="4">--四级--</option>
                            <option value="6">--六级--</option>
                        </select>
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
</body>

</html>