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

function reloadPage() {
	location.reload();
}

function showMessageWithAction(title, msg, type, action, size) {
	var size_convert;
	var type_convert;
	
	switch(size) {
		case 'normal':
			size_convert = BootstrapDialog.SIZE_NORMAL;
			break;
		case 'small':
			size_convert = BootstrapDialog.SIZE_SMALL;
			break;
		case 'wide':
			size_convert = BootstrapDialog.SIZE_WIDE;
			break;
		case 'large':
			size_convert = BootstrapDialog.SIZE_LARGE;
			break;
	}
	
	switch(type) {
		case 'defaul':
			type_convert = BootstrapDialog.TYPE_DEFAULT;
			break;
		case 'info':
			type_convert = BootstrapDialog.TYPE_INFO;
			break;
		case 'primary':
			type_convert = BootstrapDialog.TYPE_PRIMARY;
			break;
		case 'success':
			type_convert = BootstrapDialog.TYPE_SUCCESS;
			break;
		case 'warning':
			type_convert = BootstrapDialog.TYPE_WARNING;
			break;
		case 'danger':
			type_convert = BootstrapDialog.TYPE_DANGER;
			break;
	}
	
	
	var dialog = new BootstrapDialog({
        title: title,
        size: size_convert,
        type: type_convert,
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

function showConfirmModal(mess, type, action) {
	  var dialog_type = null;
	  var action;
	  
	  if (!action) {
		  action = function(dialog) {
              dialog.close();
          }
	  }
	  
	  if (type == 'SUCCESS') {
		  dialog_type = BootstrapDialog.TYPE_SUCCESS;
	  }if (type == 'ERROR') {
		  dialog_type = BootstrapDialog.TYPE_DANGER;
	  }
	  dialog_keep = BootstrapDialog.show({
		size: BootstrapDialog.SIZE_SMALL,
        type: dialog_type,
        title: common_confirm,
        message: mess,
        buttons: [{
            label: "OK",
            cssClass: 'btn-success',
            action: action
        }]
	  });
	  
 }

function getUrlParameter(name) {
	var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results==null){
       return null;
    }
    else{
       return results[1] || 0;
    }
};