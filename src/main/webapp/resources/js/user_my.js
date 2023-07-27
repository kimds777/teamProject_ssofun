
$(document).ready(function(){
    var user_id = 1;

    divHeightSense();
    setEventListener(user_id);

});

function setEventListener(user_id){


}

function divHeightSense(){
    var divHight =  $('div#myPageSection').height();
    $('#topBg').height(divHight+160);
}