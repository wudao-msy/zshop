<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css?v1.07" />
    <title> ETEST通行证</title>

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
    $(function() {

        $('#frmModifyPassword').bootstrapValidator({
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                oldPassword:{
                    validators:{
                        notEmpty:{
                            message:'旧密码不能为空'
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
                rePassword: {
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

        $('#frmModifyDetail').bootstrapValidator({
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                email:{
                    validators:{
                        notEmpty:{
                            message:'邮箱不能为空'
                        },
                        emailAddress:{
                            message:'邮箱格式不正确'
                        }
                    }
                },
                phone:{
                    validators:{
                        notEmpty:{
                            message:'手机号不能为空'
                        }
                    }
                },
                cert:{
                    validators:{
                        notEmpty:{
                            message:'证件号不能为空'
                        }
                    }
                },
                name:{
                    validators:{
                        notEmpty:{
                            message:'姓名不能为空'
                        }
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

    function showStudent(email,phone) {
        alert("1231124");
        $('#modify_email').val(email);
        $('#modify_phone').val(phone);
        $('#modifyDetail').modal('show');

    }
</script>
</head>
<body>

    <div align="center" style="margin-top:20px;">
        <div class="top_con">
            <div class="top_con_out">
                <div class="top_con_logo">
                    <img src="${pageContext.request.contextPath}/images/logo_login.gif" border="0" usemap="#Map" /><map name="Map" id="Map"><area shape="rect" coords="2,19,137,64" href="#" /></map>
                </div>
                <div class="top_con_link2">
                    <ul>
                        <li class="tb"><a href="${pageContext.request.contextPath}/front/student/main">首页</a></li>
                        <li class="tb"></li>
                        <li><a href=${pageContext.request.contextPath}/front/student/loginOut>退出</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div style="clear:both;"></div>
        

<form id="frmDetail" action="Update" method="post">

    <div class="center_con1">

        
<div class="sign_logo_show" align="center">
    <div style="width: 100%; margin-top: 50px; height: 300px; box-shadow: #ddd 10px -5px 10px;
        border-right: 1px #ccc solid; padding-top: 10px;">
        <div style="height:150px;width:60%;background:url(http://resource.neea.edu.cn/project/Passport/Images/header.gif) no-repeat;margin-top:10px;
	margin-left:15px;padding-left:5px;"></div>
        <div style="height: 150px; width: 80%; font-size: 12px; padding-top: 10px;">
            <div style="margin-bottom: 15px; color: #666666">
               
            </div>
            <div class="line2">
            </div>
            <table width="90%" border="0" class="tb_link">
                <tr id="trChanagePassword">
                    <td width="50%">
                        <input type="button" class="btn btn-link btn-block " value="修改资料" onclick="showStudent(${student.email},${student.phone})" data-toggle="modal" data-target="#modifyDetail"/>
                    </td>
                    <td width="50%">
                        <button type="button" class="btn btn-link btn-block" data-toggle="modal" data-target="#modifyPassword">修改密码</button>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>

        <div class="center_show_right" align="center">
            <div style="font-size: 18pt; padding-top: 10px; color: #666666; font-size: 14px;
                margin-top: 30px;" align="left">
                <div class="input_sign1">
                    <p style="font-weight: bolder; margin-left: 15px; margin-bottom: 10px; color: #666">
                        通行证ID:834AB67FG33240F4B1690850RDC1113C
                    </p>
                    <div style="border: 1px solid #a7dbff; padding: 15px; margin-bottom: 20px; background-color: #e0effe;
                        border-radius: 6px;">
                        <div class="input_sub" align="left">
                            电子邮箱：
                            <input id="detail_email" name="email" type="text" value="${student.email}" class="input_style" />
                        </div>
                        <div class="input_sub1" align="left">
                            手机：
                            <input id="detail_phone" name="phone" type="text" value="${student.phone}" class="input_style" />
                        </div>
                    </div>
                    <div style="border-top: 1px solid #a7dbff; padding: 15px; margin-bottom: 20px;">
                        <div class="input_sub" align="left">
                            <label style="color: #888">证件类型：</label>
                            <p>中华人民共和国居民身份证</p>
                        </div>
                        <div class="input_sub2">
                            <label>
                                证件号：
                            </label>
                            <p>${student.cert}</p>
                        </div>
                        <div class="input_sub1">
                            <label>
                                姓名：
                            </label>
                            <p>${student.name}</p>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div style="clear:both; text-align: left;padding:0 6em;">
            <div class="tab-h2">
                <h4>本网站为通行证系统，如须报名请点击下方报名网址</h4>
            </div>
            <div style="text-align:center">
                <ul class="ul-list">
                    <li><a title="http://cet-bm.neea.cn" href="http://cet-bm.neea.cn">全国大学英语四、六级考试(CET)</a></li>
                    <li><a title="http://apchina.neea.cn " href="http://apchina.neea.cn ">AP考试信息网</a></li>
                    <li><a title="http://ncre-bm.neea.cn" href="http://ncre-bm.neea.cn">全国计算机等级考试（全国版）</a></li>
                    <li><a title="请到各省的网站报名!"  onclick="alert('请到各省的网站报名!');return false;" href="javascript:void(0);">全国计算机等级考试（省版本）</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="foot_con">

    </div>
</form>
        <div id="foot">Copyright <span style="font-size:18px;">&copy;</span> 2017 教育部考试中心版权所有.保留所有权利 (Powered by :4469446)</div>
    </div>

    <div class="modal fade" id="modifyPassword" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改密码</h4>
                </div>
                <form action="${pageContext.request.contextPath}/front/student/modifyPassword" class="form-horizontal" method="post"  id="frmModifyPassword">
                    <div class="modal-body">

                        <div class="form-group">
                            <div class="col-sm-6">
                                <input type="hidden" class="form-control" id="modifyemail" name="email" value="${student.email}"/>
                            </div>

                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">原始密码：</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="modify_oldPassword" name="oldPassword" value="${student.password}"/>
                            </div>

                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">新的密码：</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control"  id="modify_newPassword" name="password" />
                            </div>

                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-3">重复密码</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control"  id="modify——rePassword" name="rePassword" />
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">关&nbsp;&nbsp;闭</button>
                        <button type="reset" class="btn btn-default">重&nbsp;&nbsp;置</button>
                        <button type="submit" class="btn btn-default">提&nbsp;&nbsp;交</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- MODEL结束 -->


    <div class="modal fade" id="modifyDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">修改资料</h4>
                </div>
                <form action="${pageContext.request.contextPath}/front/student/modifyDetail" class="form-horizontal" method="post"  id="frmModifyDetail">
                    <div class="modal-body">
                        <div class="form-group">
                                <label class="col-sm-3 control-label">电子邮箱：</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="modify_email" name="email"  />
                                </div>

                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">手机号：</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control"  id="modify_phone" name="phone" />
                            </div>

                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">证件类型：</label>
                            <div class="col-sm-6">
                                <p>中华人民共和国居民身份证</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">证件号：</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="modify_cert" name="cert" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">姓名：</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="modify_name" name="name" />
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">关&nbsp;&nbsp;闭</button>
                        <button type="reset" class="btn btn-default">重&nbsp;&nbsp;置</button>
                        <button type="submit" class="btn btn-default">提&nbsp;&nbsp;交</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- MODEL结束 -->
</body>
</html>
