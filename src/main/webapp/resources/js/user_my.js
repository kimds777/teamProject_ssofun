
$(document).ready(function(){
    var user_id = 1;

    divHeightSense();
    setEventListener(user_id);

});

function setEventListener(user_id,funding_id){


}

function divHeightSense(){
    var divHight =  $('div#myPageSection').height();
    $('#topBg').height(divHight+160);
    $('#height').height(divHight+160);
}