<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8" />
    <title> 欢迎使用CET考试报名系统</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <meta content="" name="description" />
    <meta content="" name="author" />
    <link href="http://resource.neea.edu.cn/project/CET/Assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="http://resource.neea.edu.cn/project/CET/Assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
    <link href="http://resource.neea.edu.cn/project/CET/Assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="http://resource.neea.edu.cn/project/CET/Assets/global/css/components.css" id="style_components" rel="stylesheet" type="text/css" />
    <link href="http://resource.neea.edu.cn/project/CET/Assets/admin/layout/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="http://resource.neea.edu.cn/project/CET/Assets/global/plugins/bootstrap-validator/css/bootstrapValidator.min.css" rel="stylesheet" />
    <link href="http://resource.neea.edu.cn/project/CET/Assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="http://resource.neea.edu.cn/project/CET/jquery-easyui/themes/ap/easyui.css">
    <link rel="stylesheet" type="text/css" href="http://resource.neea.edu.cn/project/CET/jquery-easyui/themes/icon.css">

    <link href="http://resource.neea.edu.cn/project/CET/Content/ufo.css?v=1.02" rel="stylesheet" type="text/css" />
    

    <link href="http://resource.neea.edu.cn/project/CET/Assets/global/plugins/bootstrap-toastr/toastr.min.css" rel="stylesheet" />
    <link href="http://resource.neea.edu.cn/project/CET/Assets/global/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css" />
    <link href="http://resource.neea.edu.cn/project/CET/Assets/global/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css" />


    <script src="http://resource.neea.edu.cn/project/CET/Assets/global/plugins/jquery.min.js" type="text/javascript"></script>
    <script src="http://resource.neea.edu.cn/project/CET/Assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="http://resource.neea.edu.cn/project/CET/Assets/global/scripts/metronic.js"></script>
    <script src="http://resource.neea.edu.cn/project/CET/Assets/global/plugins/bootstrap-validator/bootstrap-validator.min.js"></script>
    <script src="http://resource.neea.edu.cn/project/CET/Assets/global/plugins/bootstrap-validator/language/zh_CN.js"></script>
    <script src="http://resource.neea.edu.cn/project/CET/Assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
    <script src="http://resource.neea.edu.cn/project/CET/Assets/global/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="http://resource.neea.edu.cn/project/CET/Assets/global/plugins/bootstrap-toastr/toastr.min.js"></script>
    <script type="text/javascript" src="http://resource.neea.edu.cn/project/CET/jquery-easyui/jquery.easyui.min.js"></script>
    <script src="http://resource.neea.edu.cn/project/CET/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script src="http://resource.neea.edu.cn/project/CET/Assets/global/plugins/bootstrap-modal/js/bootstrap-modalmanager.js"></script>
    <script src="http://resource.neea.edu.cn/project/CET/Assets/global/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript"></script>

    <script src="http://resource.neea.edu.cn/project/CET/scripts/public.js?v=2.00"></script>

    <script>
        var _hmt = _hmt || [];
        (function () {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?c9c0128aec42c22340930c8062591842";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>
    <script>
        var _hmt = _hmt || [];
        (function () {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?2c27f6e0da87610221a9d3a549f876bc";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>

</head>

<body>
    <div id="zc_box" class="">
        <jsp:include page="top1.jsp"/>

<div id="zc_main" class="" style="height:auto;">

    <div id="zc_title" class="cen"><h1>欢迎登录CET考试报名系统</h1></div>

    <div id="" class="p100">
            <table class="table table-bordered table-hover table-striped table-condensed" style="box-shadow: 2px 2px 5px #ccc;border-radius: 3px;">

                <thead>
                    <tr>
                        <td colspan="2" align="center" class="ufo_table_02_title">基本信息</td>
                    </tr>
                </thead>

                <tbody>
                            <tr>
                                <td class="td_title">考次名称：</td>

                                    <td class="td_content">2020年上半年（9月）CET考试</td>

                            </tr>
                            <tr>
                                <td class="td_title">报名状态：</td>

                                    <td class="td_content"><strong class="r">未报名（或当前通行证账号非报名时账号）</strong></td>

                            </tr>
                            <tr>
                                <td class="td_title">残疾考生合理便利线下申请截止时间：</td>

                                    <td class="td_content">2020-07-24 17:00</td>

                            </tr>
                </tbody>

                <tfoot>
                    <tr>
                        <td colspan="2" align="center" class="ufo_table_02_title"></td>
                    </tr>
                </tfoot>

            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="40%"></td>
                    <td align="center">
                            <a class="zc_button" style="text-decoration:none;" href="${pageContext.request.contextPath}/front/plug/DetailsAG">开始报名</a>
                    </td>
                    <td width="40%"></td>
                </tr>
            </table>
    </div>

    <br />

</div>

<form id="sidForm" action='../Student/Details' method="post" target="_self">
    <input name="__RequestVerificationToken" type="hidden" value="2hHyYGLxZiKVItRMoKY3h3oL9HF_SMpblaM16Xvaeuv_k70dsHPYcEge9PxJSl5Z5gbFz_X8SAWQp6RktuLJBN5b9PbrcfsE8TwrwIN9BeM1" />
    <input type="hidden" name="sid" id="hiddenSID" />
</form>

<script type="text/javascript">
    function toAgreement() {
        $("#hiddenSID").val('');
        $("#sidForm").attr('action', '../Student/DetailsAG');
        $("#sidForm").submit();
    };
    function viewCandidate() {
        $("#hiddenSID").val('');
        $("#sidForm").attr('action', '../Student/Details?r=' + Math.random());
        $("#sidForm").submit();
    };
</script>


        <div id="zc_footer" class="">
            <img src="http://resource.neea.edu.cn/project/CET/images/zc_footer.jpg" width="953" height="59" alt="" />
            <p class="t12" style="text-align:center">
                COPYRIGHT：中华人民共和国教育部考试中心&nbsp;/&nbsp;All RIGHTS RESERVED <br />
                京ICP备05031027
            </p>
        </div>
    </div>

</body>
</html>
<style type="text/css">
    body {
        background: url(http://resource.neea.edu.cn/project/CET/images/top_bg_stu.jpg) repeat-x top #ebeff2;
    }
</style>