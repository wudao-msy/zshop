<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title> ETEST通行证</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrapValidator.min.css" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>


    <script>

        function reloadImg(){
            //将验证码重新发送请求，生成验证码
            $('#randImg').attr('src','${pageContext.request.contextPath}/front/code/image?time='+new Date().getTime());
            //将原来的验证码清空
            $('#code').val('');

        }

        $(function() {
            $('#frmAddStudent').bootstrapValidator({
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
                                message:'电话号码不能为空'
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
                    },
                    code: {
                        validators: {
                            notEmpty: {
                                message: '请输入验证码'
                            },
                            remote:{
                                url:'${pageContext.request.contextPath}/front/code/checkCode',
                                message:'校验错误'
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


<form id="frmAddStudent" action="${pageContext.request.contextPath}/front/student/add" method="post">

    <div class="center_con1">
        <div class="center_con_left">
            <div class="sign_logo"></div>
            <div class="input_sign1" align="left">
                <div style="border: 1px solid #a7dbff; padding: 15px; margin-bottom: 20px; background-color: #e0effe; border-radius: 6px;">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">电子邮箱：</label>
                        <div class="col-sm-9">
                            <input class="form-control" type="text" placeholder="请输入邮箱" name="email" id="email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">手机号：</label>
                        <div class="col-sm-9">
                            <input class="form-control" type="text" placeholder="请输入手机号" name="phone" id="phone">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
                        <div class="col-sm-9">
                            <input class="form-control" name="password" id="password" type="password" placeholder="请输入密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">密码确认：</label>
                        <div class="col-sm-9">
                            <input class="form-control" name="repassword" id="repassword" type="password" placeholder="请再次输入密码">
                        </div>
                    </div>
                        <p style="margin-right: 50px; margin-left: 52px; font-size: 12px; color: #666; margin-top: 5px;">提示：1.邮箱和手机号均可作为您的登录账号</p>
                        <p style="margin-right: 50px; margin-left: 52px; font-size: 12px; color: #666; margin-top: 5px;padding-left:37px;">2.密码长度为8-18位字符，且必须同时包含：字母、数字和特殊字符!@#$%*_-</p>
                    </div>

                        <p style="font-weight: bolder; margin-left: 15px; margin-bottom: 10px; color: #666">个人资料（可选填）</p>
                        <div style="border-bottom: 1px solid #a7dbff; border-top: 1px solid #a7dbff; padding: 15px; margin-bottom: 20px;">

                    <div class="input_sub" align="left">
                        <label style="color: #888">证件类型：</label>
                        <select id="selectIDType" name="selectIDType" class="input_style3" onchange="tt()" style="overflow: hidden">
                            <option value="-1">-请选择-</option>

                                <option value="1">中华人民共和国居民身份证</option>
                                <option value="2">台湾居民往来大陆通行证</option>
                                <option value="3">港澳居民来往内地通行证</option>
                                <option value="4">军人证件</option>
                                <option value="5">护照</option>
                                <option value="6">香港身份证</option>
                                <option value="7">澳门身份证</option>
                        </select>

                    </div>
                    <div class="input_sub2" align="left">
                        <label style="color: #888">证件号：</label><input id="add_cert" name="cert" type="text" class="input_style" /><label class="redStar">*</label>
                    </div>
                    <div class="input_sub1" align="left">
                        <label style="color: #888">姓名：</label><input id="add_name" name="name" type="text" class="input_style" /><label class="redStar">*</label>
                    </div>
                </div>
                <div style="padding-left: 15px; margin-bottom: 20px;">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">验证码：</label>
                        <div class="col-sm-4">
                            <input class="form-control" type="text" placeholder="验证码" id="code" name="code">
                        </div>
                        <div class="col-sm-2">
                            <!-- 验证码 -->
                            <img id="randImg" class="img-rounded" src="${pageContext.request.contextPath}/front/code/image" style="height: 32px; width: 70px;"/>
                        </div>
                        <div class="col-sm-2">
                            <button type="button" class="btn btn-link" onclick="reloadImg()">看不清</button>

                        </div>
                    </div>
                </div>
            </div>
            <div style="clear: both;"> </div>
            <div align="center" style="margin-top: 22px;">
                <button type="submit" class="btn btn-primary btn-block" style="width: 80px;">提&nbsp;&nbsp;交</button>
            </div>
            </div>

        <div class="center_con_right">
            <div class="login_con">
                <div style="font-size: 18pt; padding-top: 10px; color: #333; font-size: 14px; margin-top: 50px; margin-left: 25px;" align="left">
                    <strong>已经有ETEST通行证,直接登录：</strong>
                </div>
                <div align="center" style="margin-top: 35px;">
                    <a href="${pageContext.request.contextPath}/front/student/main">
                        <img src="${pageContext.request.contextPath}/images/login_button.png" border="0" />
                    </a>
                </div>
                <div class="line_bg_sign"></div>
                <div class="other_select1" align="left">
                </div>
            </div>
        </div>
        <br />
    </div>
    <div class="foot_con"></div>
</form>


        <div id="foot">Copyright <span style="font-size:18px;">&copy;</span> 2017 教育部考试中心版权所有.保留所有权利 (Powered by :4665462)</div>
    </div>
</body>
</html>
