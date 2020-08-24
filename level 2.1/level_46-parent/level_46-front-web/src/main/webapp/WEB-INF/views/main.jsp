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
            $('#frmLogin1').bootstrapValidator({
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
                        <li class="tb"><a href="${pageContext.request.contextPath}/front/student/main"><div style="color: white">首页</div></a></li>
                        <li class="tb"><a href="${pageContext.request.contextPath}/front/student/select"><div style="color: white">查询成绩</div></a></li>
                        <li class="tb"></li>
                        <li><a href=${pageContext.request.contextPath}/front/student/loginOut><div style="color: white">退出</div></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div style="clear:both;"></div>

        <form id="frmLogin" action="${pageContext.request.contextPath}/front/student/loginByAccount" class="form-horizontal" method="post">
            <div class="form-body">
                <div class="center_con_1">
                    <div class="con_pic">
                    </div>
                    <div class="right_login" style="height: 325px;" align="left">
                        <div class="top_bg">
                        </div>
                        <div class="login_con">
                            <div style="color: #333; font-size: 14px; padding-left: 25px; padding-top: 10px;">
                                <strong>ETEST通行证</strong>
                            </div>

                            <div style="margin: 10px 0px 0px 25px;">
                                账号：<label>
                                <input name="email" id="email" type="text"  style="border: 1px #cccccc solid; border-radius: 6px; color: Gray; padding: 3px; width: 150px;" value="邮箱/手机" /><span style="color: #CC3300; visibility: hidden;">*</span>
                                &nbsp;
                            </label><span class="findpassword"></span>
                            </div>
                            <div style="margin: 10px 0px 0px 25px;">
                                密码：<label>
                                <input name="password" id="password" type="Password" style="border: 1px #cccccc solid; border-radius: 6px; padding: 3px; width: 150px;" /><span style="color: #CC3300; visibility: hidden;">*</span>
                                &nbsp;
                            </label><span class="findpassword"><a href="FindPassword">找回密码</a></span>
                            </div>

                            <div style="margin: 10px 0px 0px 25px; width: 250px;">
                                <tr align="left">
                                    <td width="80px;">
                                        验证码：
                                    </td>
                                    <td align="left" width="120px;">
                                        <input name="code" id="code" type="text"  style="border: 1px #cccccc solid; border-radius: 6px; padding: 3px; width: 90px;" />
                                    </td>
                                    <td>
                                        <input type="image" id="randImg" class="img-rounded" src="${pageContext.request.contextPath}/front/code/image" tabindex="10" title="请点我！" onclick="reloadImg()"  style="vertical-align: bottom;width:80px;height:25px;" />
                                    </td>
                                </tr>
                            </div>

                            <div align="center" style="margin-top: 22px;">
                                <button type="submit" class="btn btn-primary btn-block" style="width: 80px;">登&nbsp;&nbsp;陆</button>
                            </div>
                            <div id="divLogin" style="color: Red; text-align: center">
                            </div>
                            <div class="other_select">





                            </div>
                            <div class="line_bg">
                            </div>
                            <span style="color: #666; display: block; font-size: 12px; margin-top: 10px; padding-left: 35px;">
                                没有ETEST通行证？
                            </span>
                            <div align="center" style="margin-top: 5px;">
                                <a href="${pageContext.request.contextPath}/front/student/toRegist">
                                    <img src="${pageContext.request.contextPath}/images/sign_button.png" border="0" />
                                </a>
                            </div>
                        </div>
                        <div class="down_bg">
                        </div>
                    </div>
                </div>
            </div>

            <div class="foot_con1">
                <div class="foot_con1_out" align="left">
                    <div class="foot_con1_logo">
                    </div>
                </div>
            </div>
        </form>




<div class="foot_logo_box">
    <div class="foot_logo">
        <a href="http://cet-bm.neea.cn/">
            <img src="http://resource.neea.edu.cn/project/Passport/Images/CETlogo.png" width="109" height="65" />
            <p>全国大学英语四、六级考试(CET)（考生端）</p>
        </a>
    </div>
    <div class="foot_logo">
        <a href="#">
            <img src="http://resource.neea.edu.cn/project/Passport/Images/APlogo.png" width="109" height="65" />
            <p>AP考试信息网</p>
        </a>
    </div>
    <div class="foot_logo">
        <a href="#">
            <img src="http://resource.neea.edu.cn/project/Passport/Images/ncrelogo.png" width="109" height="65" />
            <p>全国计算机等级考试（全国版）</p>
        </a>
    </div>
    <div class="foot_logo">
        <a href="#" onclick="alert('请到各省的网站报名!');return false;">
            <img src="http://resource.neea.edu.cn/project/Passport/Images/ncrelogo.png" width="109" height="65" />
            <p>全国计算机等级考试（省版本）</p>
        </a>
    </div>
</div>



        <div id="foot">Copyright <span style="font-size:18px;">&copy;</span> 2017 教育部考试中心版权所有.保留所有权利 (Powered by :EB65EBA)</div>
    </div>
</body>
</html>
