<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link href="${pageContext.request.contextPath}/css/ufo3.css?v=5.0" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/lanrenzhijia.css" type="text/css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/fudong.css" rel="stylesheet" />

    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
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

<div id="topdiv">
    <div id="top">
        <div id="logo">
            <div id="" class="">
                <ul id="logo_nav" style="width:300px;">
                    <li style="font-size:16px;width:auto;display:block;float:right;color:#666;"><span style="font-size:16px;display:inline-block;">客服电话：</span><span style="font-size:24px;font-weight:600;display:inline-block">010-62987880</span></li>
                </ul>
            </div>
            <div style="clear:both;height:1em;"></div>
            <div  class="huangs02"></div>
        </div>
        <div id="nav">
            <div  style="width:980px; text-align:center;">
                <ul class="">
                    <li style="padding-right:0px;"><a href="#" target="_parent" style="padding-top:3px;"><img src="${pageContext.request.contextPath}/images/home.png" width="16" height="14" alt="" /></a></li>
                    <li style="padding-left:0px;"><a href="${pageContext.request.contextPath}/front/Home/Index" target="_parent">首页</a> | </li>
                    <li><a href="${pageContext.request.contextPath}/front/Home/ExamIntroduction" target="_parent">考试简介</a> | </li>
                    <li><a href="${pageContext.request.contextPath}/front/Home/CandidateNotice" target="_parent">考生须知</a> | </li>
                    <li><a href="${pageContext.request.contextPath}/front/Home/TestDatePlan" target="_parent">考试时间</a> | </li>
                    <li><a href="${pageContext.request.contextPath}/front/Home/RegisterFlow" target="_parent">报名流程</a> | </li>
                    <li><a href="${pageContext.request.contextPath}/front/Home/CommonProblem" target="_parent">常见问题</a> | </li>
                    <li ><a href="${pageContext.request.contextPath}/front/Home/DelayTestNotice" target="_parent" >2020年上半年延考</a> | </li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>
