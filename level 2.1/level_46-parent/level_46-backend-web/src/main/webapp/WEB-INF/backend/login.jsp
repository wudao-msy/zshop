<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>大学英语四六级后台管理</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mycss.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrapValidator.min.css" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/zshop.css"/>
    <script>
        function reloadImg(){
            //将验证码重新发送请求，生成验证码
            $('#randImg').attr('src','${pageContext.request.contextPath}/backend/code/image?time='+new Date().getTime());
            //将原来的验证码清空
            $('#code').val('');

        }



        $(function() {
            $('#frmLogin').bootstrapValidator({
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    name: {
                        validators: {
                            notEmpty: {
                                message: '登录名不能为空'
                            }
                        }
                    },
                    password: {
                        validators: {
                            notEmpty: {
                                message: '密码不能为空'
                            }


                        }
                    },
                    code: {
                        validators: {
                            notEmpty: {
                                message: '请输入验证码'
                            },
                            remote:{
                                url:'${pageContext.request.contextPath}/backend/code/checkCode',
                                message:'校验错误'
                            }


                        }
                    }
                }

            });


            $('#frmAddSysuser').bootstrapValidator({
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    name: {
                        validators: {
                            notEmpty: {
                                message: '登录名不能为空'
                            }
                        }
                    },
                    password: {
                        validators: {
                            notEmpty: {
                                message: '密码不能为空'
                            }


                        }
                    },
                    repassword: {
                        validators: {
                            notEmpty: {
                                message: '请填写确认密码'
                            },
                            identical: {
                                field: 'password',
                                message: '确认密码与密码不一致'
                            },
                        }
                    }
                }

            });


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
        });

    </script>
</head>
<body>
<!-- 使用自定义css样式 div-signin 完成元素居中-->
<div class="container div-signin">
    <div class="panel panel-primary div-shadow">
        <!-- h3标签加载自定义样式，完成文字居中和上下间距调整 -->
        <div class="panel-heading">
            <h3>管理员后台管理 1.0</h3>
            <span>English Level 4&6  Management System</span>
        </div>

        <div class="panel-body">
            <!-- login form start -->
            <form action="${pageContext.request.contextPath}/backend/sysuser/login" class="form-horizontal" method="post" id="frmLogin">
                <div class="form-group">
                    <label class="col-sm-3 control-label">用户名：</label>
                    <div class="col-sm-9">
                        <input class="form-control" type="text" placeholder="请输入用户名" name="name" id="name">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
                    <div class="col-sm-9">
                        <input class="form-control" name="password" id="password" type="password" placeholder="请输入密码">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">验证码：</label>
                    <div class="col-sm-4">
                        <input class="form-control" type="text" placeholder="验证码" id="code" name="code">
                    </div>
                    <div class="col-sm-2">
                        <!-- 验证码 -->
                        <img id="randImg" class="img-rounded" src="${pageContext.request.contextPath}/backend/code/image" style="height: 32px; width: 70px;"/>
                    </div>
                    <div class="col-sm-2">
                        <button type="button" class="btn btn-link" onclick="reloadImg()">看不清</button>

                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-3">
                        <button type="button" class="btn btn-link btn-block" data-toggle="modal" data-target="#registModal">注册账号</button>
                    </div>
                    <div class="col-sm-9 padding-left-0">
                        <div class="col-sm-4">
                            <button type="submit" class="btn btn-primary btn-block">登&nbsp;&nbsp;陆</button>
                        </div>
                        <div class="col-sm-4">
                            <button type="reset" class="btn btn-primary btn-block">重&nbsp;&nbsp;置</button>
                        </div>
                        <div class="col-sm-4">
                            <button type="button" class="btn btn-link btn-block">忘记密码？</button>
                        </div>
                    </div>
                </div>
            </form>
            <!-- login form end -->
        </div>
    </div>
</div>
<!-- 页尾 版权声明 -->
<div class="container">
    <div class="col-sm-12 foot-css">
        <p class="text-muted credit">
            Copyright © 2020 njfu 版权所有
        </p>
    </div>
</div>


<div class="modal fade" id="registModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">注册账号</h4>
            </div>
            <form action="${pageContext.request.contextPath}/backend/sysuser/add" class="form-horizontal" method="post"  id="frmAddSysuser">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">用户名：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="add_name" name="name" />
                        </div>

                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">密码：</label>
                        <div class="col-sm-6">
                            <input type="password" class="form-control"  id="add_password" name="password" />
                        </div>

                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">确认密码</label>
                        <div class="col-sm-6">
                            <input type="password" class="form-control"  id="repassword" name="repassword" />
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">关&nbsp;&nbsp;闭</button>
                    <button type="reset" class="btn btn-default">重&nbsp;&nbsp;置</button>
                    <button type="submit" class="btn btn-default">注&nbsp;&nbsp;册</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- MODEL结束 -->
</body>
</html>