<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- saved from url=(0098)https://passport.neea.cn/CETLogin?ReturnUrl=http://cet-bm.neea.cn/Home/VerifyPassport/?LoginType=0 -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>CET报名网</title>
        <link href="${pageContext.request.contextPath}/css/ufo3.css" rel="stylesheet" type="text/css">
        <link href="${pageContext.request.contextPath}/css/lanrenzhijia.css" type="text/css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/login_p_1128.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrapValidator.min.css" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
        
    <style type="text/css">
        body {
            width: 100%;
            margin: 0;
            font-size: 12px;
            font-family: "微软雅黑", "宋体";
            color: #1f1e23;
            text-align: center;
        }

        #footer {
            width: 980px;
            margin: 0 auto;
            text-align: center;
        }

            #footer p {
                font-size: 12px;
                color: #666;
                font-family: Arial, "微软雅黑";
                display: block;
                margin-top: 5px;
            }

        .footer_title {
            font-weight: bold;
            color: #666;
            font-size: 14px;
            line-height: 2em;
        }
    </style>


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
        <form id="frmVerifyPassport" method="post" action="${pageContext.request.contextPath}/front/plug/loginByAccount">
            <div style="width:100%;background:url(http://resource.neea.edu.cn/project/Passport/Images/top_logo.jpg) repeat-x; ">
                <div id="top">
                    <div id="logo">
                        <div class="">
                            <ul id="logo_nav">
                                <li><a href="https://passport.neea.cn/CETLogin?ReturnUrl=http://cet-bm.neea.cn/Home/VerifyPassport/?LoginType=0#">客服电话：</a></li>
                            </ul>
                        </div>
                        <div style="clear:both"></div>
                        <div class="huangs02">010-62987880</div>
                    </div>
                    <div id="nav">
                        <div style="width:980px; text-align:center;">
                        </div>
                    </div>
                </div>
            </div>
            <div class="login_box" style="margin-top:25px;">
                <div class="login_form">
 <img src="${pageContext.request.contextPath}/images/login_title.jpg" width="500" height="67">

                    <div class="login_form_box" style="margin-left:0;margin-top:15px;">
                        <div class="loginForm_01">
                            <label class=""><strong>账&nbsp;&nbsp;&nbsp;号</strong>：</label>
                            <input name="email" type="text" class="input_box" id="email" tabindex="2" title="请输入账号" value="邮箱" style="color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);"><a href="http://cet-bm.neea.cn/Home/RetrieveAccount">&nbsp;找回账号？</a>
                        </div>
                        <div class="loginForm_02">
                            <label class="#"><strong>密&nbsp;&nbsp;&nbsp;码</strong>：</label>
                            <input name="password" type="password" class="input_box" id="password" tabindex="2" title="请输入密码" value="" style="background-color: rgb(255, 255, 255); color: rgb(0, 0, 0);">&nbsp;<span class="findpassword"><a href="https://passport.neea.cn/FindPassword">找回密码？</a></span>
                        </div>
                        <div class="loginForm_03" style="text-align:left;margin-left:106px;">
                            <label class="#"><strong>验证码</strong>：</label>
                            <input name="code" id="code" tabindex="3" style="width: 95px; background-color: rgb(255, 255, 255);" class="input_box" type="text">
                                <input type="image" id="randImg" class="img-rounded" src="${pageContext.request.contextPath}/front/code/image" tabindex="10" title="请点我！" onclick="reloadImg()"  style="vertical-align: bottom; width: 80px; height: 25px; background-color: rgb(255, 255, 255);" />
                        </div>
                        <p>
                                <input style="display: none; background-color: rgb(255, 255, 255);" id="chkForce" name="chkForce" type="checkbox" onclick="setForceCheckValue()" value="1">

                            &nbsp;&nbsp;&nbsp;没有通行证?<a href="https://passport.neea.cn/Register">点击注册</a>
                        </p>

                        <div id="button" style="margin-top:5px;">
                            <button  type="submit">
                                登　录
                            </button>
                            &nbsp;
                            <button  type="reset">
                                重　置
                            </button>
                            
                        </div>
                    </div>
                </div>
            </div>
            <div id="footer">
                <div id="">
                    <p>
                        <span class="footer_title">COPYRIGHT 中华人民共和国教育部考试中心 All RIGHTS RESERVED</span><br>
                        京ICP备05031027号<br>
                    </p>
                </div>
            </div>
            <input id="hdnForce" name="hdnForce" value="0" type="hidden" style="background-color: rgb(255, 255, 255);">
            <input id="hdnLoginMode" name="hdnLoginMode" type="hidden" style="background-color: rgb(255, 255, 255);">
            <input id="hdnReturnUrl" name="hdnReturnUrl" value="http://cet-bm.neea.cn/Home/VerifyPassport/?LoginType=0" type="hidden" style="background-color: rgb(255, 255, 255);">
            <input id="hdnRedirectUrl" name="hdnRedirectUrl" type="hidden" style="background-color: rgb(255, 255, 255);">
            <input id="HiddenAccessToken" name="HiddenAccessToken" type="hidden" style="background-color: rgb(255, 255, 255);">
            <input id="HiddenPublicKeyExponent" value="3VYSV7jmpe5NN5ep" name="HiddenPublicKeyExponent" type="hidden" style="background-color: rgb(255, 255, 255);">
            <input id="HiddenPublicKeyModulus" value="YQOAQ2KECAQqqQAC" name="HiddenPublicKeyModulus" type="hidden" style="background-color: rgb(255, 255, 255);">
            <input id="HiddenSafe" name="HiddenSafe" value="0" type="hidden" style="background-color: rgb(255, 255, 255);">
        </form>
    
</body>
</html>