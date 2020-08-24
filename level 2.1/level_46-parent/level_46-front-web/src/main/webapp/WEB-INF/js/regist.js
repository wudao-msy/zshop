function CheckMobileAndEMail() {
    var registerEmail = $.trim($("#txtEmail").val());
    var registerMobile = $.trim($("#txtMobile").val());
    if (registerEmail == "" && registerMobile=="") {
        alert("邮箱和手机号至少填写一项！");
        return false;
    }
    if (registerEmail) {
        CheckRegisterEmail();
    }
    if (registerMobile) {
        CheckRegisterMobile();
    }
    return true;
}

//验证手机号
function CheckRegisterMobileByDefault() {
    var registerMobile = $.trim($("#txtMobile").val());
    //电子邮箱不能为空
    if (registerMobile == "") {
        alert("未输入手机号！");
        return false;
    }
    //是否有效的邮箱
    if (!registerMobile.isMobile()) {
        alert("手机号格式不符！");
        return false;
    }
    return true;
}
//验证手机号
function CheckRegisterMobile(obj) {
    var registerMobile = $.trim($(obj).val());
    //电子邮箱不能为空
    if (registerMobile == "") {
        alert("未输入手机号！");
        return false;
    }
    //是否有效的邮箱
    if (!registerMobile.isMobile()) {
        alert("手机号格式不符！");
        return false;
    }
    return true;
}

//验证邮箱
function CheckRegisterEmail()
{
    var registerEmail = $.trim($("#txtEmail").val());
    //电子邮箱不能为空
    if (registerEmail == "") {
        alert("未输入电子邮箱！");
        return false;
    }
    //是否有效的邮箱
    if (!registerEmail.isEmail())
    {
        alert("电子邮箱格式不符！");
        return false;
    }
    //*以NEEA为后缀的不能注册
    var extStart = registerEmail.lastIndexOf(".");
    var ext = registerEmail.substring(extStart, registerEmail.length).toUpperCase();
    if (ext == ".NEEA") {
        alert("*以NEEA为后缀的不能注册！");
        return false;
    }
    return true;
}


//验证密码和确认密码

function CheckRegisterPassWord(alertTitle)
{
    var password= $.trim($("#txtPassword").val())
    if (password == "") {
        alert(alertTitle+"密码不能为空！");
        return false;
    }
    //密码需长度在8~18之间
    if (password.length < 8 || password.length > 18)
    {
        alert(alertTitle + "密码需长度在8~18之间，且必须同时包含：字母、数字和特殊字符（!@#$%^&*_-）！");
        return false;
    }
    //确认密码不能为空
    var  passwordRepeat=$.trim($("#txtPasswordRepeat").val());
    if (passwordRepeat == "") {
        alert("确认密码不能为空！");
        return false;
    }
  

    //判断密码与确认密码是否相等
    if (password != passwordRepeat) {
        alert(alertTitle+"密码和确认密码不一致！");
        return false;
    }
    //判断密码强度
   // var wordRegex = new RegExp("^(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*_-]).{8,18}$");
    var wordRegex = /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*_-])[\da-zA-Z!@#$%^&*_-]{8,18}$/;
    if (!wordRegex.test(password)) {
        alert("您的密码长度不能小于8位，且必须同时包含：字母、数字和特殊字符（!@#$%^&*_-）！");
        return false;
    }
    return true;
}
/***
验证证件号
1：如果没有选择证件类型，直接跳过
1：如果选择为身份证，需要判断身份证是否正常
*/
function CheckIDNumber() {
    var checkIndex = $("#selectIDType").get(0).selectedIndex;
    if (checkIndex == 0) {
        return true;
    }
    var idNumber = $.trim($("#txtIDNumber").val());
    if (idNumber == "") {
        alert("证件号为空！");
        return false;
    }
    if (checkIndex == 1 && !idNumber.isIDCard()) {
        alert("身份证格式不正确！");
        return false;
    }
    return true;
}

/**
判断姓名是否正确
*/
function CheckName() {
    var name = $.trim($("#txtName").val());
    var checkIndex = $("#selectIDType").get(0).selectedIndex;
    if (checkIndex !== 0) {
        if (!name) {
            alert("姓名不能为空！");
            return false;
        }
    } else {
        if (!name) {
            return true;
        }
    }
    if (!name.isName())
    {
        alert("姓名只能包含中文字符、字母、不连续不在首尾的·号！");
        return false;
    }
    return true;
}

/**
验证码
*/
function CheckImageValid()
{
    var checkImage = $.trim($("#txtCheckImageValue").val());
    if (checkImage == "")
    {
        alert("验证码为空！");
        return false;
    }
    return true;
}

