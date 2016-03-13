function changeNumberFormat(number){
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