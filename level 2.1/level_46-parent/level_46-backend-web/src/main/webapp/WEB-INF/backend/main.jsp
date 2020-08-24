<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>大学英语四六级后台管理</title>
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/index.css" />
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/userSetting.js"></script>
    <script type="text/javascript">
        $(function(){
            // 点击切换页面
            $("#level-4-manager").click(function() {
                $("#frame-id").attr("src", "${pageContext.request.contextPath}/backend/student/findAll_4");
            });
            $("#level-6-manager").click(function() {
                $("#frame-id").attr("src","${pageContext.request.contextPath}/backend/student/findAll_6");
            });
            $("#exam-manager").click(function() {
                $("#frame-id").attr("src", "${pageContext.request.contextPath}/backend/exam/findAll");
            });
            $("#news-manager").click(function() {
                $("#frame-id").attr("src", "${pageContext.request.contextPath}/backend/news/findAll");
            });
            $("#file-manager").click(function() {
                $("#frame-id").attr("src", "${pageContext.request.contextPath}/backend/pdf/findAll");
            });
            $("#img-manager").click(function() {
                $("#frame-id").attr("src", "${pageContext.request.contextPath}/backend/img/findAll");
            });
        });
    </script>
</head>

<body>
<div class="wrapper-cc clearfix">
    <div class="content-cc">
        <!-- header start -->
        <div class="clear-bottom head">
            <div class="container head-cc">
                <p>英语4&6级<span>后台管理系统</span></p>
                <div class="welcome">
                    <div class="left">欢迎您：</div>
                    <div class="right">${sysuser.name}</div>
                    <div class="exit">退出</div>
                </div>
            </div>
        </div>
        <!-- header end -->
        <!-- content start -->
        <div class="container-flude flude-cc" id="a">
            <div class="row user-setting">
                <div class="col-xs-2 user-wrap">
                    <ul class="list-group">
                        <li class="list-group-item active" name="userSet" id="level-4-manager" style="cursor: pointer">
                            <i class="glyphicon glyphicon-lock"></i> &nbsp;4级考试管理
                        </li>
                        <li class="list-group-item" name="userPic" id="level-6-manager" style="cursor: pointer">
                            <i class="glyphicon glyphicon-facetime-video"></i> &nbsp;6级考试管理
                        </li>
                        <li class="list-group-item" name="userInfo" id="exam-manager" style="cursor: pointer">
                            <i class="glyphicon glyphicon-user"></i> &nbsp;当前考试管理
                        </li>
                        <li class="list-group-item" name="adminSet" id="news-manager" style="cursor: pointer">
                            <i class="glyphicon glyphicon-globe"></i> &nbsp;新闻信息管理
                        </li>

                        <li class="list-group-item" name="file-manager" id="file-manager" style="cursor: pointer">
                            <i class="glyphicon glyphicon-globe"></i> &nbsp;附加文件管理
                        </li>

                        <li class="list-group-item" name="img-manager" id="img-manager" style="cursor: pointer">
                            <i class="glyphicon glyphicon-globe"></i> &nbsp;图片信息管理
                        </li>
                    </ul>
                </div>
                <div class="col-xs-10" id="userPanel">
                    <iframe id="frame-id" src="${pageContext.request.contextPath}/backend/student/findAll_4" width="100%" height="100%" frameborder="0" scrolling="no">
                    </iframe>
                </div>

            </div>
        </div>
        <!-- content end-->
    </div>
</div>
<!-- footers start -->
<div class="footer">
    版权所有：njfu技术
</div>
<!-- footers end -->
</body>

</html>