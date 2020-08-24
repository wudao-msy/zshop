function Common() {
    this.RegisterKeydown = function (id) {
       
        $(document).keydown(function (evt) {

            evt = (evt) ? evt : ((window.event) ? window.event : "")
            var key = evt.keyCode ? evt.keyCode : evt.which;

            if (key == 13) {

                
               //// $("#" + id).focus();
                $("#" + id).click();

            }
        })
    };

}
function setCookie(NameOfCookie, value, expireSeconds) {
 

    var ExpireDate = new Date();
    ExpireDate.setTime(ExpireDate.getTime() + (expireSeconds * 1000));
    if (getCookie(NameOfCookie) != null) {
        delCookie(NameOfCookie);
     }
 
    document.cookie = NameOfCookie + "=" + escape(value) +
  ((expireSeconds == null) ? "" : "; expires=" + ExpireDate.toGMTString());
}

///获取cookie值 
function getCookie(NameOfCookie) {

    

    if (document.cookie.length > 0) {        

        begin = document.cookie.indexOf(NameOfCookie + "=");
        if (begin != -1) {
                  

            begin += NameOfCookie.length + 1; //cookie值的初始位置 
            end = document.cookie.indexOf(";", begin); //结束位置 
            if (end == -1) end = document.cookie.length; //没有;则end为字符串结束位置 
            return unescape(document.cookie.substring(begin, end));
        }
    }

    return null;


}

///删除cookie 
function delCookie(NameOfCookie) {
   
    if (getCookie(NameOfCookie)) {
        document.cookie = NameOfCookie + "=" +
"; expires=Thu, 01-Jan-70 00:00:01 GMT";
    }
}

