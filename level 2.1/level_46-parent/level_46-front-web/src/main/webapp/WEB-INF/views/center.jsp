<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>全国大学英语四、六级考试成绩查询 - 中国教育考试网</title>
    <link href="${pageContext.request.contextPath}/css/query.css?v=2" rel="stylesheet" type="text/css">


    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/userSetting.js"></script>
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrapValidator.min.css" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-paginator.js"></script>
    <script>
        $.fn.modal.Constructor.prototype.enforceFocus =function(){
            $('#frmSelectScore').bootstrapValidator({
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    ke:{
                        validators:{
                            notEmpty:{
                                message:'邮箱不能为空'
                            }

                        }
                    },
                    name: {
                        validators: {
                            notEmpty: {
                                message: '密码不能为空'
                            }
                        }
                    }
                }

            });
            $.fn.modal.Constructor.prototype.enforceFocus =function(){};
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
        };

    </script>
</head>
<body>
<div id="Body">

    <div id="Content">
        <div id="Content1">

            <div id="query_param">
                <div class="queryLeft" style="min-height: 660px;">
                    <div class="c_tits"><span ></span>成绩查询<!--  -输入查询条件 --></div>
                    <p class="h2" style="font-size:14px;margin-bottom:35px;text-align:center;margin-top:-20px"><span
                            id="parm_subn"></span></p>




                    <form action="${pageContext.request.contextPath}/front/student/findScore" class="form-inline" method="post"  id="frmSelectScore">
                    <div class="container">

                            <ol>
                                <div>
                                    <input type="hidden" id="eid" name="eid" value="5" alt="考试">
                                </div>
                            <li><span>准考证号：</span>
                                <div>
                                    <input type="text" id="ke" name="ke">
                                </div>

                            <li class="tip_n"><span>&nbsp;</span>
                                <div>请输入15位笔试或口试准考证号</div>
                            </li>
                            <li><span>姓名：</span>
                                <div>
                                    <input type="text" id="name" name="name">
                                </div>

                            <li class="tip_n"><span>&nbsp;</span>
                                <div>姓名超过3个字，可只输入前3个</div>
                            </li>


                            </ol>

                            <div class="s3">
                                <button type="submit" class="btn btn-primary btn-block" style="width: 80px;">查&nbsp;&nbsp;询</button>
                                <button type="reset" class="btn btn-primary btn-block" style="width: 80px;">重&nbsp;&nbsp;填</button>
                            </div>

                    </div>
                    </form>
                </div>

                <div class="intr">
                    <div class="intrtit" style="border-bottom: none;margin-bottom: 0px;"><i></i>常见问题</div>
                    <ol class="problem" style="border-bottom: #ddd solid 1px;">
                        <li>
                            <span class="problem_tit">Q1：忘记准考证号怎么办？</span>
                            <div class="problem_answer">
                                <p><a target="_blank" href="http://cet-bm.neea.cn/Home/QueryTestTicket" style="color: #01adef;float: initial;float:none;">点击这里</a>查询。</p>
                            </div>
                        </li>
                        <li>
                            <span class="problem_tit">Q2：为什么笔试成绩为0？</span>
                            <div class="problem_answer">
                                <p>笔试成绩为0有以下几种情况：</p>
                                <p>（1）缺考违规成绩为0分；</p>
                                <p>（2）未缺考违规但成绩在220分以下则报道为0分；</p>
                                <p>（3）未缺考违规但在考试过程中未粘贴条形码，则成绩为0分。</p>
                            </div>
                        </li>
                        <li>
                            <span class="problem_tit">Q3：如对成绩有异议怎么办？</span>
                            <div class="problem_answer">
                                <p>如对成绩有异议，可按规定进行分数核查，具体办法请见<a target="_blank" href="http://cet.neea.edu.cn/html1/folder/19081/5179-1.htm" style="color: #01adef;float: initial;float:none;">成绩核查</a>。</p>
                            </div>
                        </li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</div>



</body>
</html>
