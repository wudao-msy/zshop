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

            $('#frmAddStudent').bootstrapValidator({
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields:{
                    name: {
                        validators: {
                            notEmpty: {
                                message: '姓名不能为空'
                            },
                            remote:{
                                //get请求
                                url:'${pageContext.request.contextPath}/backend/student/checkName'
                            }
                        }
                    },
                    cert:{
                        validators:{
                            notEmpty:{
                                message:'身份证信息不能为空'
                            }
                        }
                    },
                    ke:{
                        validators:{
                            notEmpty:{
                                message:'准考证不能为空'
                            },stringLength:{
                                min:6,
                                max:6,
                                message:'准考证长度必须6位'

                            }
                        }
                    },
                    phone:{
                        validators:{
                            notEmpty:{
                                message:'电话号码不能为空'
                            }
                        }
                    },
                    email:{
                        validators:{
                            notEmpty:{
                                message:'邮箱不能为空'
                            },
                            emailAddress:{
                                message:'邮箱格式不正确'
                            }

                        }
                    }

                }
            });

            //使用bootstrap校验框架进行客户端数据校验
            $('#frmModifyCustomer').bootstrapValidator({
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
                                message: '姓名不能为空'
                            },
                            remote:{
                                //get请求
                                url:'${pageContext.request.contextPath}/backend/student/checkName'
                            }
                        }
                    },
                    cert:{
                        validators:{
                            notEmpty:{
                                message:'身份证信息不能为空'
                            }
                        }
                    },
                    ke:{
                        validators:{
                            notEmpty:{
                                message:'准考证不能为空'
                            },stringLength:{
                                min:6,
                                max:6,
                                message:'准考证长度必须6位'

                            }
                        }
                    },
                    phone:{
                        validators:{
                            notEmpty:{
                                message:'电话号码不能为空'
                            }
                        }
                    },
                    email:{
                        validators:{
                            notEmpty:{
                                message:'邮箱不能为空'
                            },
                            emailAddress:{
                                message:'邮箱格式不正确'
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


        //按条件查询
        function doQuery(){
            //重置当前页为第一页
            $('#pageNum').val(1);
            //提交表单
            $('#frmQuery').submit();
        }


        function showStudent(id){
            $.post(
                "${pageContext.request.contextPath}/backend/student/findById",
                {"id":id},
                function(result){
                    $('#detail_id').html(result.data.id);
                    $('#detail_name').html(result.data.name);
                    $('#detail_cert').html(result.data.cert);
                    $('#detail_ke').html(result.data.score.ke);
                    if (result.data.sex==1){
                        $('#detail_sex').html('男');
                    }else{
                        $('#detail_sex').html('女');
                    }

                    $('#detail_email').html(result.data.email);
                    $('#detail_phone').html(result.data.phone);
                    $('#detail_all_scores').html(result.data.score.allScores);
                    $('#detail_exam_name').html(result.data.exam.name);
                    $('#detail_hearing').html(result.data.score.hearing);
                    $('#detail_reading').html(result.data.score.reading);
                    $('#detail_writing').html(result.data.score.writing);
                    $('#studentDetail').modal('show');
                }
            );
        }

        function updateStudent(id){
            $.post(
                "${pageContext.request.contextPath}/backend/student/findById",
                {"id":id},
                function(result){
                    $('#modify_id').val(result.data.id);
                    $('#modify_name').val(result.data.name);
                    $('#modify_cert').val(result.data.cert);
                    $('#modify_ke').val(result.data.score.ke);
                    $('#modify_sex').val(result.data.sex);
                    $('#modify_email').val(result.data.email);
                    $('#modify_phone').val(result.data.phone);
                    $('#modify_all_scores').val(result.data.score.allScores);
                    $('#modify_eid').val(result.data.exam.id);
                    $('#modify_hearing').val(result.data.score.hearing);
                    $('#modify_reading').val(result.data.score.reading);
                    $('#modify_writing').val(result.data.score.writing);

                }
            );

        }


        //修改用户状态
        function modifyStatus(id,isValid,btn){
            $.post('${pageContext.request.contextPath}/backend/student/modifyStatus',
                {"id":id,"isValid":isValid},function(result){
                    if(result.status==1){
                        let $td= $(btn).parent().parent().children().eq(5);
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
        <h3 class="panel-title">个人信息管理</h3>
    </div>
    <div class="panel-body">
        <div class="showusersearch">
            <form class="form-inline" action="${pageContext.request.contextPath}/backend/student/findByParams_6"
                  method="post" id="frmQuery">
                <input type="hidden" name="pageNum" value="${data.pageNum}" id="pageNum">
                <div class="form-group">
                    <label for="student_name">姓名:</label>
                    <input type="text" class="form-control"id="student_name" name="name" placeholder="请输入姓名" size="15px" value="${studentParam.name}">
                </div>
                <div class="form-group">
                    <label for="student_cert">身份证:</label>
                    <input type="text" class="form-control" id="student_cert" name="cert" placeholder="请输入身份证" size="15px" value="${studentParam.cert}">
                </div>
                <div class="form-group">
                    <label for="student_ke">准考证:</label>
                    <input type="text" class="form-control" id="student_ke" name="ke" placeholder="请输入准考证" size="15px" value="${studentParam.ke}">
                </div>
                <div class="form-group">
                    <label for="student_sex">性别:</label>
                    <select class="form-control" id="student_sex" name="sex">
                        <option value="-1">全部</option>
                        <option value="1"<c:if test="${studentParam.sex==1}">selected</c:if>>---男---</option>
                        <option value="0"<c:if test="${studentParam.sex==0}">selected</c:if>>---女---</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="student_exam_play">考试时间:</label>
                    <input type="text" class="form-control" id="student_exam_play" name="play" placeholder="请输入考试时间" size="15px" value="${studentParam.play}">
                </div>

                <br/>
                <br/>
                <div class="form-group">
                    <label class="control-label">总分:</label>
                    <input type="text" class="form-control" placeholder="最低分数" name="minScore" value="${studentParam.minScore}">--
                    <input type="text" class="form-control" placeholder="最高分数" name="maxScore" value="${studentParam.maxScore}">
                </div>
                <div class="form-group">
                    <label for="customer_isValid">状态:</label>
                    <select class="form-control" id="customer_isValid" name="isValid">
                        <option value="-1">全部</option>
                        <option value="1"<c:if test="${studentParam.isValid==1}">selected</c:if>>---有效---</option>
                        <option value="0"<c:if test="${studentParam.isValid==0}">selected</c:if>>---无效---</option>
                    </select>
                </div>
                <input type="button" value="查询" class="btn btn-primary" id="doSearch" onclick="doQuery()">
            </form>
        </div>

        <input type="button" value="添加学生" class="btn btn-primary" id="doAddPro">
        <br>
        <div class="text-center" style="position: relative;top: 30px;">
            <table class="table table-bordered table-hover" style='text-align: center;'>
                <thead>
                <tr class="text-danger">
                    <th class="text-center">姓名</th>
                    <th class="text-center">身份证号</th>
                    <th class="text-center">考试类型</th>
                    <th class="text-center">准考证号</th>
                    <th class="text-center">总分</th>
                    <th class="text-center">状态</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody id="tb">
                <c:forEach items="${data.list}" var="student">
                    <tr>
                        <td>${student.name}</td>
                        <td>${student.cert}</td>
                        <td>${student.exam.name}</td>
                        <td>${student.score.ke}</td>
                        <td>${student.score.allScores}</td>
                        <td>
                            <c:if test="${student.isValid==1}">启用</c:if>
                            <c:if test="${student.isValid==0}">禁用</c:if>
                        </td>

                        <td class="text-center">
                            <input type="button" class="btn btn-info btn-sm " value="详情" onclick="showStudent(${student.id})">
                            <input type="button" class="btn btn-warning btn-sm doModify" value="修改" onclick="updateStudent(${student.id})">
                            <c:if test="${student.isValid==0}"> <input type="button" class="btn btn-success btn-sm doDisable" value="启用" onclick="modifyStatus(${student.id},${student.isValid},this)">
                            </c:if>
                            <c:if test="${student.isValid==1}"><input type="button" class="btn btn-danger btn-sm doDisable" value="禁用" onclick="modifyStatus(${student.id},${student.isValid},this)">
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

<!-- 添加student start -->
<div class="modal fade" tabindex="-1" id="Product">
    <!-- 窗口声明 -->
    <div class="modal-dialog modal-lg">

        <form action="${pageContext.request.contextPath}/backend/student/add_6" class="form-horizontal" method="post"  id="frmAddStudent">
            <input type="hidden" name="pageNum" value="${data.pageNum}">
            <div class="modal-content">
                <!-- 头部、主体、脚注 -->
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">添加学生</h4>
                </div>
                <div class="modal-body text-center row">
                    <div class="col-sm-8">


                        <div class="form-group">
                            <div class="row text-right">
                                <label class="col-sm-3 control-label">姓名：</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="add_name" name="name">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row text-right">
                                <label class="col-sm-3 control-label">身份证：</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="add_cert" name="cert">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row text-right">
                                <label class="col-sm-3 control-label">准考证：</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="add_ke" name="score.ke">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row text-right">
                                <label class="col-sm-3 control-label">性别：</label>
                                <div class="col-sm-6">
                                    <select class="form-control" id="add_sex" name="sex">
                                        <option value="1" selected="selected">---男---</option>
                                        <option value="0">---女---</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row text-right">
                                <label class="col-sm-3 control-label">电话：</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="add_phone" name="phone">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row text-right">
                                <label class="col-sm-3 control-label">邮箱：</label>
                                <div class="col-sm-6">
                                    <input type="email" class="form-control" id="add_email" name="email">
                                </div>
                            </div>
                        </div>



                        <div class="form-group">
                            <div class="row text-right">
                                <label class="col-sm-3 control-label">考试场次：</label>
                                <div class="col-sm-6">
                                    <select class="form-control" id="add_eid" name="exam.id">
                                        <c:forEach items="${examPlays}" var="examPlays">
                                            <option value="${examPlays.id}" <c:if test="${examPlays.id==examParam.examId}">selected</c:if>>${examPlays.play}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>



                        <div class="form-group">
                            <div class="row text-right">
                                <label class="col-sm-3 control-label">总分：</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="add_allScores" name="score.allScores">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row text-right">
                                <label class="col-sm-3 control-label">听力：</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="add_hearing" name="score.hearing">

                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row text-right">
                                <label class="col-sm-3 control-label">阅读：</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="add_reading" name="score.reading">

                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row text-right">
                                <label class="col-sm-3 control-label">写作：</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="add_writing" name="score.writing">

                                </div>
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
<!-- 添加 end -->


<div class="modal fade" id="studentDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">学生信息详情</h4>
            </div>
            <div class="modal-body">


                <div class="form-group">
                    <div class="row text-right">
                        <label class="col-sm-3 control-label">姓名：</label>
                        <div class="col-sm-6">
                            <p id="detail_name"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row text-right">
                        <label class="col-sm-3 control-label">身份证：</label>
                        <div class="col-sm-6">
                            <p id="detail_cert"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row text-right">
                        <label class="col-sm-3 control-label">准考证：</label>
                        <div class="col-sm-6">
                            <p id="detail_ke"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row text-right">
                        <label class="col-sm-3 control-label">性别：</label>
                        <div class="col-sm-6">
                            <p id="detail_sex"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row text-right">
                        <label class="col-sm-3 control-label">电话：</label>
                        <div class="col-sm-6">
                            <p id="detail_phone"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row text-right">
                        <label class="col-sm-3 control-label">邮箱：</label>
                        <div class="col-sm-6">
                            <p id="detail_email"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row text-right">
                        <label class="col-sm-3 control-label">考试：</label>
                        <div class="col-sm-6">
                            <p id="detail_exam_name"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row text-right">
                        <label class="col-sm-3 control-label">总分：</label>
                        <div class="col-sm-6">
                            <p id="detail_all_scores"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row text-right">
                        <label class="col-sm-3 control-label">听力：</label>
                        <div class="col-sm-6">
                            <p id="detail_hearing"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row text-right">
                        <label class="col-sm-3 control-label">阅读：</label>
                        <div class="col-sm-6">
                            <p id="detail_reading"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row text-right">
                        <label class="col-sm-3 control-label">写作：</label>
                        <div class="col-sm-6">
                            <p id="detail_writing"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- MODEL结束 -->



<!-- 修改客户信息 start -->
<div class="modal fade" tabindex="-1" id="myModal">
    <!-- 窗口声明 -->
    <div class="modal-dialog">
        <!-- 内容声明 -->
        <form action="${pageContext.request.contextPath}/backend/student/modify_6" class="form-horizontal" method="post" id="frmModifyCustomer">
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
                        <label for="modify_name" class="col-sm-4 control-label">姓名：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="modify_name" name="name">
                        </div>
                    </div>
                    <br>
                    <div class="row text-right">
                        <label for="modify_cert" class="col-sm-4 control-label">身份证：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="modify_cert" name="cert">
                        </div>
                    </div>
                    <br>
                    <div class="row text-right">
                        <label for="modify_ke" class="col-sm-4 control-label">准考证：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="modify_ke" name="score.ke">
                        </div>
                    </div>
                    <br>
                    <div class="row text-right">
                        <label for="modify_sex" class="col-sm-4 control-label">性别：</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="modify_sex" name="sex">
                                <option value="1" selected="selected">---男---</option>
                                <option value="0">---女---</option>
                            </select>
                        </div>
                    </div>
                    <br>
                    <div class="row text-right">
                        <label for="modify_phone" class="col-sm-4 control-label">电话：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="modify_phone" name="phone">
                        </div>
                    </div>
                    <br>
                    <div class="row text-right">
                        <label for="modify_email" class="col-sm-4 control-label">邮箱：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="modify_email" name="email">
                        </div>
                    </div>
                    <br>



                    <div class="row text-right">
                        <label class="col-sm-4 control-label">考试场次：</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="modify_eid" name="exam.id">
                                <c:forEach items="${examPlays}" var="examPlays">
                                    <option value="${examPlays.id}">${examPlays.play}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <br>
                    <div class="row text-right">
                        <label for="modify_all_scores" class="col-sm-4 control-label">总分：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="modify_all_scores" name="score.allScores">
                        </div>
                    </div>
                    <br>
                    <div class="row text-right">
                        <label for="modify_hearing" class="col-sm-4 control-label">听力：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="modify_hearing" name="score.hearing">
                        </div>
                    </div>
                    <br>
                    <div class="row text-right">
                        <label for="modify_reading" class="col-sm-4 control-label">阅读：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="modify_reading" name="score.reading">
                        </div>
                    </div>
                    <br>
                    <div class="row text-right">
                        <label for="modify_writing" class="col-sm-4 control-label">写作：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="modify_writing" name="exam.writing">
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