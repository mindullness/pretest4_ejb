$(document).ready(() => {
    $("#btnNumber").click(() => {
        let phone = $("input[name=number]").val();
        let numbers = "input[name=numbers]";
        let str = $(numbers).val().toString();
        if(str){
            if(str.split(",").length >= 2){
                alert("Cannot add more than 2 phone numbers!");
                return;
            }
            str = str.concat(", "+ phone);
        }else {
            str = phone.toString();
        }
        $(numbers).val(str.trim());
    });
});

// function addPhoneTag() {
//     let count = $("#phone-numbers > input").length;
//     count++;
//     return "Phone " + count + ": <input name=\"num_" + count + "\" type=\"text\"/> <br>"
// }