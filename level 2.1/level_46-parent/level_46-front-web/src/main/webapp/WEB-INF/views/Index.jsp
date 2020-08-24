<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>全国大学英语四、六级考试报名网</title>
    <link href="${pageContext.request.contextPath}/css/ufo3.css?v=5.0" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/lanrenzhijia.css" type="text/css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/fudong.css" rel="stylesheet" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
        }
        body {
            background: url(${pageContext.request.contextPath}/images/bg.jpg) repeat-x;
        }
        #topdiv{
            padding: 0;
            margin: 0;
            font-size: 12px;
            font-family: "微软雅黑", "宋体";
            color: #1f1e23;
            background:url(${pageContext.request.contextPath}/images/top_bg.jpg) repeat-x;
        }
        #footer{width:980px; margin:0 auto; text-align:center; border-top:1px solid #666;}
        #footer p{ font-size:12px; color:#666; font-family:Arial, "微软雅黑"; display:block;  margin-top:5px;}
        .footer_title{ font-weight:bold; color:#666; font-size:14px; line-height:2em;}
    </style>
</head>


<body>
<div class="OnlineService_Bg">
    <div class="OnlineService_Box">
        <div class="OnlineService_Phone">

            <a href="http://aics.neea.cn/CustomerChat/Index?projectCode=101" target="_blank" title="点击打开在线客服咨询网站（考生咨询版）">在线客服</a>

        </div>
    </div>
</div>


<jsp:include page="top.jsp"/>


<div id="lanrenzhijia">
    <ul id="slides">
        <li style="background:url(${pic}) no-repeat center top"><a href="#"></a></li>

    </ul>
</div>
<div id="banner">
    <div id="banner_l" class="f_l" style="width:100%;margin-top:5px;margin-left:15px;">
        <img src="${pageContext.request.contextPath}/images/bz1.png" />
    </div>
</div>
<div style="height:0px; clear:both"></div>
<div id="main">

    <div id="main_l">
        <a href="https://passport.neea.cn/CETLogin?ReturnUrl=http://cet-bm.neea.cn/Home/VerifyPassport/?LoginType=0" class="c_hei cet_banner01">
            <p class="f20">进入报名</p>
            <p class=" ">ENTRY</p>
        </a>

        <a href="${pageContext.request.contextPath}/front/student/toRegist" class="c_hei cet_banner02">
            <p class="f20">注册 / 修改用户</p>
            <p class=" ">REGISTER / MODIFY USER</p>
        </a>

        <a href="RetrieveAccount.html" class="c_hei cet_banner05">
            <p class="f20">找回已报名账号</p>
            <p class=" ">RETRIEVE ACCOUNT</p>
        </a>
        <a href="${pageContext.request.contextPath}/front/student/select" class="c_hei cet_banner03" target="_blank">
            <p class="f20">查询成绩</p>
            <p class=" ">TRANSCRIPT COPY RE-ORDER</p>
        </a>
        <a href="../Home/QuickPrintTestTicket" class="c_hei cet_banner06">
            <p class="f20">快速打印准考证</p>
            <p class=" ">PRINT TICKET</p>
        </a>
    </div>


    <div id="main_c">
        <div class="title_b"><a href="http://cet.neea.edu.cn/"><img src="${pageContext.request.contextPath}/images/lun_d.png" width="300" height="345" alt="" /></a></div><!--270-->
</div>
    <div id="main_r">
        <div class="title_b">
            <a href="#"><img src="${pageContext.request.contextPath}/images/news.jpg" width="380" height="40" alt="" /></a>
            <div style="padding:10px;" class="main_info_l">
                <h4>2020年上半年（9月）考试时间</h4>
                <ul>
                    <li>笔试：2020-9-19</li>
                    <li>上午：英语、日语、德语、俄语、法语四级</li>
                    <li>下午：英语、日语、德语、俄语六级</li>
                    <li style="color:red;">口试：本次不开考</li>
                    <li style="color:red;">7月11日考试报名工作已结束，请考生按规定时间进入页面左侧</li>
                    <li style="color:red;">“快速打印准考证”打印准考证，无须再次登录。</li>

                </ul>
            </div>
            <hr class="hr_line" />
            <div style="padding:10px;line-height:1.8em;" class="main_info_l">
                <h4>2020年上半年（9月）考试报名提示：</h4>
                <ul>
                    <li style="font-weight:bold;">1.本次报名仅针对2020年9月19日考试报名，不含7月11日考试报名，两次考试均只开考笔试科目。</li>
                    <li style="font-weight:bold;">2.报名未开始前，考生可进行注册及学籍信息验证操作，具体报名时间以各学校通知为准。</li>
                    <li style="font-weight:bold;">3.请在报名完成后24小时内完成缴费，并再次登录系统确认是否报名成功，如有疑问可拨打客服电话进行咨询。</li>
                </ul>
            </div>
        </div>
    </div>
</div>
    <div style="clear:both;"></div>
    <div style="width:100% ;margin:2em 0;">
        <div id="footer">
            <div id="">
                <p>
                    <span class="footer_title">COPYRIGHT 中华人民共和国教育部考试中心 All RIGHTS RESERVED</span><br />
                    京ICP备05031027号 (Powered by :85127856)<br /><font color="red">建议浏览器：火狐浏览器、谷歌浏览器、IE9+、360浏览器（选择极速模式）</font><br />
                </p>
            </div>
        </div>
    </div>
</body>
</html>
