
$(document).ready(function(){
    var user_id = 1;


    setEventListener(user_id);
    getCategoryList();

});

function setEventListener(user_id){

    $(document).on("click","input#fundingRegisterSubmitBtn",function(event){
        event.stopPropagation();        
        insertTemporarilyReward();
    });


    $(document).on("click","span#rewardAddBtn",function(event){
        event.stopPropagation();
        
        insertTemporarilyReward();
        
        $("#rewardModal").addClass("hide");
        $("#modalBg").addClass("hide");
    });

    $(document).on("click","#creatorType>ul:first-of-type>li",function(event){
        event.stopPropagation(); 
        $("#creatorType>ul:first-of-type>li").removeClass("checked");
        $(this).addClass("checked");
    });

    $(document).on("input","#target_price",function(event){
        event.stopPropagation(); 
        // 현재 입력된 값 가져오기
        var value = $(this).val();
        
        // 콤마 제거하기
        value = value.replace(/,/g, '');
        
        // 숫자만 남기기
        value = value.replace(/\D/g, '');
        
        // 세 자리마다 콤마 추가하기
        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
        
        // 값 업데이트
        $(this).val(value);
    });

    $(document).on("click","li#close",function(event){
        event.stopPropagation();
        $("#rewardModal").addClass("hide");
        $("#modalBg").addClass("hide");
    });
    
    $(document).on("click","span.close",function(event){
        event.stopPropagation();
        $("#rewardModal").addClass("hide");
        $("#modalBg").addClass("hide");
    });



    $(document).on("click","div#rewardRegisterBtn",function(event){
        event.stopPropagation();
        $("#rewardModal").removeClass("hide");
        $("#modalBg").removeClass("hide");
    });
    
    $(document).on("keyup","#tags>input#name",function(key){
        if(key.keyCode == 13){
            key.stopPropagation();
            var tag = $(this).val();
            $(this).val("");
            insertTemporarilyTag(tag);
            
        }
    });
    



};

function insertUserCreator(user_id){
    var name = $("#creatorName").val();
    var email = $("#creatorEmail").val();
    var phone = $("#creatorPhone").val();
    var creator_type = $("#creatorType>ul:first-of-type>li.checked").index();
    var biz_no = $("#creatorType>ul:last-of-type>li>input#biz_no").val();

    $.ajax({
        url: "./"
    });
}

function getCategoryList(){
    $.ajax({
        url: "./AJAXgetCategoryList",
        method: "GET",
        success: function(res){
            if(res!=null){
                $.each(res,function(index,item){
                    var $funding_category_id;
                    $.each(item,function(key,value){
                        if(key == "funding_category_id"){
                            $funding_category_id = value;
                        }
                        
                        if(key == "name"){
                            if(value == "전체" || value == "BEST 펀딩"){
                                return ;
                            }else{
                                $("select#funding_category_id").append("<option value='"+$funding_category_id+"'>"+value+"</option>");
                            }
                        }
                    });
                });
            }
        }
    });
};


function insertTemporarilyTag(tag){

    $("#insertTagList").append("<li>#"+tag+"<span>X</span></li>");

};

function insertTag(){
    $.ajax({
        url: "./AJAXinsertTag",
        method: "POST",
        data: {name:tag},
        success: function(res){
            if(res != 0){
                getTag(res);
            }
        }
    });
}

function insertTemporarilyReward(){

    var price = addCommas($("input#rewardPrice").val());
    var title = $("input#rewardName").val();
    var itemList = [];
    var itemLength = $("#insertTagList>li").length;
    // for(var i = 1; i<=itemLength; i++){
    //     var itemName = $("#insertTagList>li").eq(i).children("input.itemName");
    //     var itemCount = $("#insertTagList>li").eq(i).children("input.itemCount");
    //     var item = {name:itemName, count:itemCount};

    //     itemList.push(item);
    // }

    //stock_max 추가해야함
    var buy_count = $("input.buy_count").val();

    var delivery_price = addCommas($("#delivery>input.delivery_price").val());
    var start_from = $("input.start_from").val();
    var close_at = $("input.close_at").val();

    // var data = {
    //     price:price,
    //     title:title,
    //     itemList:itemList,
    //     // stock_max:
    //     buy_count:buy_count,
    //     delivery_price:delivery_price,
    //     start_from:start_from,
    //     close_at:close_at
    // };

    var rewardList = $("#rewardList");
    var rewardUl = $("<ul class='reward'></ul>");
    rewardUl.append("<li>"+price+"원 <span>제한 수량 "+buy_count+"개</span></li>");
    rewardUl.append("<li class='rewardTitle'>"+title+"</li>");
    rewardUl.append("<li class='rewardTitle'>"+title+"</li>");
    // rewardUl.append("<li class='rewardDesc'>리워드 설명</li>");
    
    var rewardItemList = $("<li class='rewardItemList'></li>");
    var itemUl = $("<ul></ul>");
    for(var i = 1; i<=itemLength; i++){
        var itemName = $("#insertTagList>li").eq(i).children("input.itemName");
        var itemCount = $("#insertTagList>li").eq(i).children("input.itemCount");
        itemUl.append("<li>"+itemName+" <span>"+itemCount+"</span>개</li>");
    }
    rewardItemList.append(itemUl);
    rewardUl.append(rewardItemList);
    
    rewardUl.append("<li class='deliveryPrice'><span>배송비</span> "+delivery_price+"원</li>");
    rewardUl.append("<li class='deliveryDate'><span>발송 예정일</span> "+close_at+" 예정</li>");
    
    rewardList.append(rewardUl);
}

function addCommas(num){
    var str = num.toString();
    if(str.length >= 4){
        str = str.replace(/(\d)(?=(\d{3})+$)/g, '$1,');
    }

    return str;
};

// function getTemporarilyTag(res){
//     $.ajax({
//         url: "./AJAXgetTemporarilyTag",
//         method: "GET",
//         data: {funding_tag_id:res},
//         success: function(res){
//             var $funding_tag_id;
//             $.each(res,function(key,value){
//                 if(key == "funding_tag_id"){
//                     $funding_tag_id = value;
//                 }
//                 if(key == "name"){
//                     $("#insertTagList").append("<li>#"+value+"<span>X</span><input type='hidden' class='funding_tag_id' value='"+$funding_tag_id+"'></li>");
//                 }
//             });

//         }
//     });
// }