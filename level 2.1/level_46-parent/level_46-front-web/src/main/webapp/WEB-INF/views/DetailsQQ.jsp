<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--

-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8" />
    <title> 资格信息查询</title>
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

    <div id="zc_title" class="cen"><h1>资格信息查询</h1></div>

    <div id="zc_main_room">

        <!--证件类型-->
        <div class="form-group form-md-line-input">
            <select id="selIDType" class="form-control" required data-bv-notempty-message="请选择证件类型">
                <option value="">- 请选择 -</option>
                    <option value="1">中华人民共和国居民身份证</option>
                    <option value="2">台湾居民往来大陆通行证</option>
                    <option value="3">港澳居民来往内地通行证</option>
                    <option value="4">护照</option>
                    <option value="5">香港身份证</option>
                    <option value="6">澳门身份证</option>
                    <option value="7">港澳居民居住证</option>
                    <option value="8">台湾居民居住证</option>
            </select>
            <label for="selIDType"><span class="r">*</span>&nbsp;证件类型：</label>
            <span class="help-block">学籍证件类型</span>
        </div>

        <!--证件号码-->
        <div class="form-group form-md-line-input">
            <input id="txtIDNumber" class="form-control placeholder" type="text" placeholder="请输入证件号码" maxlength="32">
            <label for="txtIDNumber"><span class="r">*</span>&nbsp;证件号码：</label>
            <span class="help-block">学籍证件号码</span>
        </div>

        <!--姓名-->
        <div class="form-group form-md-line-input">
            <input id="txtName" class="form-control placeholder" type="text" placeholder="请输入姓名" maxlength="64" onchange="javascript: if (!/^((([\u2E80-\uFE4F]|[a-zA-Z])+((·|\s|-|\(|\))?([\u2E80-\uFE4F]|[a-zA-Z]))*\)?)|([a-zA-Z]+((·|\s|-|.|,)?[a-zA-Z])*))$/g.test($.trim(this.value))) { $.messager.alert('姓名输入错误', '姓名只能为以下两种格式：1.中文字符或字母开头，包含中文字符、字母、不连续不在结尾的“·”、空格、“-”、“(”、不连续可在结尾的“)”。2.字母开头，包含字母、不连续不在首尾的“·”、空格、“-”、“.”、“,”。', 'error'); }">
            <label for="txtName"><span class="r">*</span>&nbsp;姓名：</label>
            <span class="help-block">学籍姓名</span>
        </div>

        <!--查询-->
        <div>
            <table style="width:100%;line-height: 44px;" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="40%"></td>
                    <td align="center">
                        <a id="btnSearch" class="zc_button" onclick="query()" style="text-decoration: none;"><span style="padding-right:30px;">查</span>询</a>
                    </td>
                    <td width="40%"></td>
                </tr>
            </table>
            <br />
        </div>

    </div>
</div>

<form id="zcForm" action='../Student/DetailsQC' method="post" target="_self">
    <input name="__RequestVerificationToken" type="hidden" value="nlPegpHY3XkmAER9htOZw_ZRE-yoGrO9OKbO-0kRqTSYbOhJ6o4qc7_gnoXZjAOSo25Q6bbq-dJbD6qHO1e5p3KhbDwCjFza4ttMSSXZL1w1" />
    <input type="hidden" name="sid" id="hiddenSID" />
</form>


<script type="text/javascript">
    function query() {
        var idtype = $('#selIDType').val();
        var idnumber = $.trim($('#txtIDNumber').val());
        var name = $.trim($('#txtName').val());

        if (!check(idtype, idnumber, name)) { return; }

        $.ajax({
            type: "post",
            url: '../Student/GetQualifications',
            data: {
                IDType: idtype, IDNumber: idnumber, Name: name,
                __RequestVerificationToken: $("[name='__RequestVerificationToken']").val()
            },
            success: function (data) {
                switch (data.ExceuteResultType) {
                    case -1: toastr.error(data.Message, '错误');
                        $('#btnSearch').hide();
                        setTimeout(function () {
                            $('#btnSearch').show();
                        }, 5000); break;
                    case 0: toastr.error('执行无结果！', '错误');
                        $('#btnSearch').hide();
                        setTimeout(function () {
                            $('#btnSearch').show();
                        }, 5000); break;
                    case 1: $.messager.alert('提示', '查询成功！', 'info');
                        setTimeout(function () {
                            $('#hiddenSID').val(data.Message);
                            $("#zcForm").attr('action', '../Student/DetailsQC?r=' + Math.random());
                            $("#zcForm").submit();
                        }, 1000); break;
                }
            },
            error: function (data) {
                $.messager.alert('提示', '查询失败，错误信息：' + data.responseJSON.Message, 'error');
            }
        });
    }
    function check(idtype, idnumber, name) {
        if (!idtype) {
            toastr.warning('请选择证件类型！', '警告');
            return false;
        }
        if (!idnumber) {
            toastr.warning('请输入证件号码！', '警告');
            return false;
        }
        else if (!idnumber.CheckIDNumber()) {
            toastr.error('证件号码只能输入字母、数字、英文括号！', '错误');
            return false;
        }
        else if (!idnumber.ChineseLength() > 18) {
            toastr.error('证件号码长度不能超出18位！', '错误');
            return false;
        }
        else if ('1' == idtype) {
            if (idnumber.length != 15 && idnumber.length != 18) {
                toastr.error('身份证号码长度错误！', '错误');
                return false;
            }
            else if (idnumber.length == 18 && !idnumber.isIDCard()) {
                toastr.error('证件号码"' + idnumber + '"不是有效的身份证号码！', '错误');
                return false;
            }
        }
        if (!name) {
            toastr.warning('请输入姓名！', '警告');
            return;
        }
        else if (!name.ChineseLength() > 64) {
            toastr.error('姓名长度不能超出64字符！', '错误');
            return false;
        }
        else if (!name.match(/^((([\u2E80-\uFE4F]|[a-zA-Z])+((·|\s|-|\(|\))?([\u2E80-\uFE4F]|[a-zA-Z]))*\)?)|([a-zA-Z]+((·|\s|-|.|,)?[a-zA-Z])*))$/)) {
            toastr.error('姓名只能为以下两种格式：1.中文字符或字母开头，包含中文字符、字母、不连续不在结尾的“·”、空格、“-”、“(”、不连续可在结尾的“)”。2.字母开头，包含字母、不连续不在首尾的“·”、空格、“-”、“.”、“,”。', '错误');
            return false;
        }
        return true;
    }
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