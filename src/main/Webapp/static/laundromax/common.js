function changeNumberFormat(number) {
    number = number + ""; // change it to string
    var output = "";
    for (var i=number.length - 1; i>=0; i--){
        output = number[i] + output;
        
        if ((number.length - i) % 3 == 0 &&  i > 0 ) {
            output = "." + output;
        }

    }
//    output += " Đ";
    return output;
}

function showMessageWithAction(title, msg, type, action, size) {
	var dialog = new BootstrapDialog({
        title: title,
        size: size,
        type: type,
        message:msg ,
        closable: true,
        closeByBackdrop: false,
        closeByKeyboard: false,
        buttons: [{
            label: 'Close',
            action: action
        }]
    });
    dialog.open();
}