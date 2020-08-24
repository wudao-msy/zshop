//Lihd：把编辑页转为查看页，把控件转为标签
function ControlToLabel() {
   
    var select = $("select");
    for (var j = 0; j < select.length; j++) {
        if ($(select[i]).attr("isShow") == "1") { continue; }
        $(select[j]).hide();
        if ($(select[j]).find('option:selected').val() != "" && $(select[j]).find('option:selected').val() != -1) {
            $(select[j]).after("<font>" + $(select[j]).find('option:selected').text() + "</font>");
        }
    }


    var inputs = $(":text");
    for (var i = 0; i < inputs.length; i++) {
        if ($(inputs[i]).attr("isShow") == "1") { continue; }
        $(inputs[i]).hide().after("<font >" + $(inputs[i]).val() + "</font>");

    }

    var submit = $(":submit");
    for (var i = 0; i < submit.length; i++) {
        if ($(submit[i]).attr("isShow") == "1") { continue; }
        $(submit[i]).hide();

    }

    var button = $(":button");
    for (var i = 0; i < button.length; i++) {
        if ($(button[i]).attr("isShow") == "1") { continue; }
        $(button[i]).hide();

    }
 
}