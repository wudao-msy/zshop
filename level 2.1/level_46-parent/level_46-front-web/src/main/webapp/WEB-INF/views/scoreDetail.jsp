<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/css/query.css?v=2" rel="stylesheet" type="text/css">
    <title>全国大学英语四、六级考试成绩查询 - 中国教育考试网</title>
    <script src="${pageContext.request.contextPath}/js/Common.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/ControlToLabel.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/public.js"></script>
    <script src="${pageContext.request.contextPath}/js/register.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrapValidator.min.css" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/zshop.css"/>
</head>


</head>
<body>
<div id="Body">
    <div id="Content">
            <div id="query_result" style="display:block">
                <div class="c_tits"><span id="sn"></span> ${student.exam.name}- 查看成绩</div>
                <div class="container">

                    <div class="score" id="cet46_t" style="display:block">
                        <div id="score_tit">
                            <ul class="clist">
                                <li><strong>姓　　名：</strong><span id="n">${student.name}</span></li>
                                <li><strong>学　　校：</strong><span id="x">南京林业大学</span></li>
                            </ul>
                        </div>
                        <div id="score_write">
                            <div class="titleT">笔试成绩</div>
                            <ul class="clist">
                                <li><strong>准考证号：</strong><span id="z">${student.score.ke}</span></li>
                                <li><strong>总　　分：</strong><span id="s">${student.score.allScores}</span></li>
                            </ul>
                            <div class="scoreT">
                                <ul class="clist">
                                    <li><strong>听　　　力：</strong><span id="l">${student.score.hearing}</span></li>
                                    <li><strong>阅　　　读：</strong><span id="r">${student.score.reading}</span></li>
                                    <li><strong>写作和翻译：</strong><span id="w">${student.score.writing}</span></li>
                                </ul>
                            </div>
                        </div>
                        <div id="tipss" class="tipss" style="display:none;margin-bottom:15px">
                            <p>该考生为听力残疾，听力部分免考，分数经折算计入笔试总分。</p>
                        </div>
                        <div id="score_oral">
                            <div class="titleT">口试成绩</div>
                            <ul class="clist">
                                <li><strong>准考证号：</strong><span id="kyz"></span></li>
                                <li><strong>等　　级：</strong><span id="kys"></span></li>
                            </ul>
                        </div>
                        <div id="score_id" style="display: none;margin-top: 30px;">
                            <!--<div class="titleT">成绩报告单</div>-->
                            <ul class="clist">
                                <li><strong style="width: 120px;">成绩报告单编号：</strong><span id="id"></span></li>
                            </ul>
                        </div>
                    </div>

                    <!-- minority -->
                    <div class="score" id="cet46_f" style="display:none">
                        <ul class="clist">
                            <li><strong>姓　　名：</strong><span id="m_n"></span></li>
                            <li><strong>学　　校：</strong><span id="m_x"></span></li>
                        </ul>
                        <ul class="clist">
                            <li><strong>准考证号：</strong><span id="m_z"></span></li>
                            <li><strong>总　　分：</strong><strong id="m_s"></strong></li>
                        </ul>
                        <div id="m_tipss" class="tipss" style="display:none;margin-bottom:15px">
                            <p>该考生为听力残疾，听力部分免考，分数经折算计入笔试总分。</p>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>
