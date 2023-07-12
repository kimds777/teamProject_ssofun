
$(document).ready(function(){
    var user_id = 1;

    

    setEventListener(user_id);
    getCategoryList();

});

function setEventListener(user_id){

    $(document).on("click","input#fundingRegisterSubmitBtn",function(event){
        event.stopPropagation();        
        insertUserCreator();
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

    alert("name: "+name+", email: "+email+", phone: "+phone+", creator_type: "+creator_type+", biz_no: "+biz_no);

    $.ajax({
        url: "./AJAXinsertUserCreator",
        method: "POST",
        data: {user_id:user_id, name:name, email:email, phone:phone, creator_type:creator_type, biz_no:biz_no},
        success: function(res){
            if(res!=0){
                alert("창작자 정보 입력 성공!!");
                // ------ 창작자 은행 정보 입력 ------ 
                var user_creator_id = res;
                var bank_type = $("#bank_type>option:selected").val();
                var account_no = $("input#account_no").val();
                var account_name = $("input#account_name").val();

                $.ajax({
                    url: "./AJAXinsertCreatorBank",
                    method: "POST",
                    data: {user_creator_id:user_creator_id,bank_type:bank_type,account_no:account_no,account_name:account_name},
                    success: function(res){
                        if(res == 1){
                            alert("창작자 은행 정보 입력 성공!!!")

                            // ------ 태그 입력 ------ 
                            var tagName = $("#insertTagList>li").text().replace("#","").replace("X","");
                            var funding_tag_id;
                            $.ajax({
                                url: "./AJAXinsertTag",
                                method: "POST",
                                data: {name:tagName},
                                success: function(res){
                                    if(res != 0){
                                        alert("태그 등록 성공! funding_tag_id: "+res);
                                        funding_tag_id = res;

                                        var funding_category_id = $("select#funding_category_id>option:selected").val();
                                        var funding_code = generateUniqueProductCode(10);
                                        var title = $("#projectTitle").val();
                                        var description = $("#description").val();
                                        var contents = $("textarea#contents").val();
                                        var target_price = $("#target_price").val().replace(/[^0-9]/g,"");
                                        var adult_fg = $("#adult_fg:checked").val();
                                        if(adult_fg == null){
                                            adult_fg = 0;
                                        }
                                        var delivery_from = $("#delivery_from").val();
                                        // var fundingDto = {
                                        //             title: title,
                                        //             description:description,
                                        //             contents:contents
                                        // };
                        
                                        alert("contents: "+contents+", funding_category_id: "+funding_category_id+", funding_tag_id: "+funding_tag_id+", target_price: "+target_price);
                                        
                                        $.ajax({
                                            url: "./AJAXinsertFunding",
                                            method: "POST",
                                            data: {funding_category_id:funding_category_id,
                                                    funding_tag_id:funding_tag_id,
                                                    user_creator_id:user_creator_id,
                                                    funding_code:funding_code,
                                                    title: title,
                                                    description:description,
                                                    contents:contents,
                                                    // attained_close_fg: 나중에 넣기,
                                                    target_price:target_price,
                                                    //confirm_fg:1, //나중에 수정해야함
                                                    adult_fg:adult_fg,
                                                    delivery_from:delivery_from
                                                },
                                            success: function(res){

                                                if(res!=0){
                                                    alert("펀딩 등록 성공! funding_id: "+res);

                                                    var formData = new FormData();
                                                    var funding_id = res;
                                                    var mainUrl = $("input#mainUrl")[0].files[0];

                                                    alert("funding_id: "+funding_id+", mainUrl: "+mainUrl);
                                                    
                                                    formData.append("funding_id",funding_id);
                                                    formData.append("url",mainUrl);
                                                    formData.append("image_order",1);
                                                    
                                                    $.ajax({
                                                        url: "./AJAXinsertFundingThumbnail",
                                                        method: "POST",
                                                        data: formData,
                                                        processData: false, // 데이터 처리 방지
                                                        contentType: false, // 컨텐츠 타입 설정을 자동으로 처리
                                                        success: function(res){
                                                            if(res == 1){
                                                                alert("리스트 섬네일 업로드 완료!!");                                                              
                                                                
                                                            }
                                                        }
                                                    });

                                                    var files = $('input#url')[0].files;
                                                    var order = 2;
                                                    
                                                    for (var i = 0; i < files.length; i++) {
                                                        var fundingId = res;
                                                        var formDataDetail = new FormData();
                                                        var file = files[i]; // 파일에 대한 작업 수행

                                                        alert("funding_id: "+funding_id+", url: "+file);
                                                        
                                                        formDataDetail.append("funding_id",fundingId);
                                                        formDataDetail.append("url",file);
                                                        formDataDetail.append("image_order",i+order);

                                                        $.ajax({
                                                            url: "./AJAXinsertFundingThumbnail",
                                                            method: "POST",
                                                            data: formDataDetail,
                                                            processData: false, // 데이터 처리 방지
                                                            contentType: false, // 컨텐츠 타입 설정을 자동으로 처리
                                                            success: function(res){
                                                                if(res == 1){
                                                                    alert("상세 섬네일 업로드 완료!!");
                                                                    
                                                                }
                                                            }
                                                        });

                                                    }



                                                    var itemList = [];
                                                    var rewardList = [];
                                                    var rewardLength = $("#rewardList>ul").length;
                                                    alert("rewardLength: "+rewardLength);
                                    
                                                    

                                                    for(var i = 0; i<rewardLength; i++){
                                                        var title = $("#rewardList>ul.reward").eq(i).children("li.rewardTitle").text();
                                                        var description = $("#rewardList>ul.reward").eq(i).children("li.rewardDesc").text();

                                                        var stock_max = $("#rewardList>ul.reward").eq(i).children("li.maxStock").text().replace(/[^0-9]/g,"");

                                                        var $buy_count_origin = $("#rewardList>ul.reward").eq(i).children("li:first-child").children("span").text();
                                                        var buy_count =  $buy_count_origin.replace(/[^0-9]/g,"");
                                                        alert("buy_count_origin: "+$buy_count_origin+"buy_count: "+buy_count);

                                                        var price_orgin = $("#rewardList>ul.reward").eq(i).children("li:first-child").text().replace($buy_count_origin,"");
                                                        var price = price_orgin.replace(/[^0-9]/g,"");
                                                        alert("price_orgin: "+price_orgin+", price: "+price);

                                                        var delivery_price = $("#rewardList>ul.reward").eq(i).children("li.deliveryPrice").text().replace(/[^0-9]/g,"");
                                                        var delivery_from_origin = $("#rewardList>ul.reward").eq(i).children("li.deliveryDate").text().replace(/[^a-zA-Z0-9-]/g,"");
                                                        var delivery_from = formatDate(delivery_from_origin);

                                                        var start_from_origin = $("#rewardList>ul.reward").eq(i).children("li.startDate").text().replace(/[^a-zA-Z0-9-]/g,"");
                                                        var start_from = parseDate(start_from_origin);

                                                        var close_at_origin = $("#rewardList>ul.reward").eq(i).children("li.closeDate").text().replace(/[^a-zA-Z0-9-]/g,"");
                                                        var close_at = parseDate(close_at_origin);

                                                        alert("start_from: "+start_from+", close_at: "+close_at+", delivery_from: "+delivery_from);
                                                        // alert("delivery_from_origin: "+delivery_from_origin+", delivery_from: "+delivery_from);

                                                        var itemLength = $("#rewardList>ul.reward").eq(i).children("li.rewardItemList").children("ul").children("li").length;
                                                        alert("itemLength: "+itemLength);
                                                    
                                                        // var fundingRewardDto = {
                                                        //     funding_id:funding_id,
                                                        //     title:title,
                                                        //     description:description,
                                                        //     price:price,
                                                        //     delivery_price:delivery_price,
                                                        //     itemList:itemList,
                                                        //     // stock_max:
                                                        //     buy_count:buy_count,
                                                        //     delivery_from:delivery_from
                                                        // };

                                                        alert("funding_id: "+funding_id+", title: "+title+", description: "+description+", price: "+price+", delivery_price: "+delivery_price+", buy_count: "+buy_count+", delivery_from: "+delivery_from);
                                                        $.ajax({
                                                            url: "./AJAXinsertFundingReward?delivery_from="+delivery_from+"&start_from="+start_from+"&close_at="+close_at,
                                                            method: "POST",
                                                            data: JSON.stringify({
                                                                funding_id:funding_id,
                                                                title:title,
                                                                description:description,
                                                                price:price,
                                                                delivery_price:delivery_price,
                                                                stock_max:stock_max,
                                                                buy_count:buy_count
                                                                // delivery_from_origin:delivery_from_origin
                                                            }), // JSON 문자열로 데이터 직렬화 //funding_order_status_id:2 -> 2는 결제완료 의미
                                                            contentType: "application/json",
                                                            success: function(res){
                                                                if(res != 0){
                                                                    
                                                                    alert("성공!!! funding_reward_id: "+res);
                                                                    var funding_reward_id = res;

                                                                    for(var k = 0; k<rewardLength; k++){

                                                                        for(var j = 0; j<itemLength; j++){
                                                                            // var $itemCount_orgin;
                                                                            // var itemCount;
                                                                            // var itemName;
    
                                                                            var $itemCount_orgin = $("div#rewardList").children("ul.reward").eq(k).children("li.rewardItemList").children("ul").children("li").eq(j).children("span").text();
                                                                            
                                                                            var itemCount = $itemCount_orgin.replace("개","");
                                                                            var itemName = $("#rewardList").children("ul.reward").eq(k).children("li.rewardItemList").children("ul").children("li").eq(j).text().replace($itemCount_orgin,"");
    
                                                                            // alert(k+"번째 reward의 "+j+"번째 itemCount: "+itemCount+", itemName: "+itemName);
                                                                            
                                                                            var fundingItemDto = {funding_reward_id:funding_reward_id, name:itemName, count:itemCount};
                                                                            alert(k+"번째 reward의 "+j+"번째 "+JSON.stringify(fundingItemDto));
    
                        
                                                                            $.ajax({
                                                                                url: "./AJAXinsertFundingRewardItem",
                                                                                method: "POST",
                                                                                data: JSON.stringify(fundingItemDto),
                                                                                contentType: "application/json",
                                                                                success: function(res){
                                                                                    if(res == 1){
                                                                                        alert("리워드 아이템 등록 완료!!!");
                                                                                        
                                                                                    }
                                                                                }
                                                                            });
                                                                            
                                                                        }
                                                                    };
                                                                }
                                                            }
                                                        });
                                                        // rewardList.push(fundingRewardDto);
                                                    }


                                                    // $.ajax({
                                                    //     url: "./AJAXinsertFundingReward",
                                                    //     method: "POST",
                                                    //     data: JSON.stringify({rewardList:rewardList}), // JSON 문자열로 데이터 직렬화 //funding_order_status_id:2 -> 2는 결제완료 의미
                                                    //     contentType: "application/json",
                                                    //     success: function(res){
                                                    //         if(res !== 0){
                                                    //             alert("성공!!!");
                                                    //         }
                                                    //     }
                                                    // });
                                                }
                                            }
                                        });


                                    }
                                }
                            });
                        }
                    }
                });

                



            }
        }
    });
}
//2023. 7. 11. 화요일 이렇게 나옴
function formatDate(dateString) {
    var parts = dateString.split('-');
    var year = parseInt(parts[0], 10);
    var month = parseInt(parts[1], 10) - 1;
    var day = parseInt(parts[2], 10);
    
    var date = new Date(year, month, day);
    
    var options = { year: 'numeric', month: '2-digit', day: '2-digit', weekday: 'long' };
    var formattedDate = date.toLocaleDateString('ko-KR', options);
    
    formattedDate = formattedDate.replace(/(\d{4}).(\d{2}).(\d{2}).*/, '$1. $2. $3');
    
    return formattedDate;
  }
  

//2023.07.11 
function parseDate(dateString) {
    var parts = dateString.split('-');
    var year = parseInt(parts[0], 10);
    var month = parseInt(parts[1], 10) - 1;
    var day = parseInt(parts[2], 10);
    
    var date = new Date(year, month, day);
    
    var formattedDate = date.getFullYear() + '.' 
                      + padZero(date.getMonth() + 1) + '.' 
                      + padZero(date.getDate());
    
    return formattedDate;
  }


  
  function padZero(number) {
    return (number < 10 ? '0' : '') + number;
  }
  

function generateUniqueProductCode(length) {
    var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    var code = '';
  
    for (var i = 0; i < length; i++) {
      var randomIndex = Math.floor(Math.random() * characters.length);
      code += characters.charAt(randomIndex);
    }
  
    return "SF"+code;
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


function insertTemporarilyReward(){

    var price = addCommas($("input#rewardPrice").val());
    var title = $("input#rewardName").val();
    var desc = $("#rewardDesc").val();
    var itemLength = $("#rewardModal>ul:last-of-type>li#itemList>ul>li").length;
    


    //stock_max 추가해야함
    var buy_count = $("input#buy_count").val();
    var stock_max = $("input#stock_max").val();
    var delivery_price = addCommas($("#delivery>input.delivery_price").val());
    var start_from = $("input#start_from").val();
    var close_at = $("input#close_at").val();
    var delivery_from = $("input#reward_delivery_from").val();



    var rewardList = $("#rewardList");
    var rewardUl = $("<ul class='reward'></ul>");
    rewardUl.append("<li>"+price+"원 <span>제한 수량 "+buy_count+"개</span></li>");
    rewardUl.append("<li class='rewardTitle'>"+title+"</li>");
    rewardUl.append("<li class='rewardDesc'>"+desc+"</li>");
    
    var rewardItemList = $("<li class='rewardItemList'></li>");
    var itemUl = $("<ul></ul>");
    
    for(var i = 1; i<=itemLength; i++){
        var itemName = $("#rewardModal>ul:last-of-type>li#itemList>ul>li").eq(i-1).children("input.itemName").val();
        var itemCount = $("#rewardModal>ul:last-of-type>li#itemList>ul>li").eq(i-1).children("input.itemCount").val();
 
        itemUl.append("<li>"+itemName+"<span>"+itemCount+"개</span></li>");
    };
    rewardItemList.append(itemUl);
    rewardUl.append(rewardItemList);
    
    rewardUl.append("<li class='maxStock'><span>최대 재고</span>"+stock_max+"개</li>");
    rewardUl.append("<li class='maxBuy'><span>제한 수량</span>"+buy_count+"개</li>");
    rewardUl.append("<li class='deliveryPrice'><span>배송비</span> "+delivery_price+"원</li>");
    rewardUl.append("<li class='startDate'><span>시작일</span>"+start_from+"</li>");
    rewardUl.append("<li class='closeDate'><span>종료일</span>"+close_at+"</li>");
    rewardUl.append("<li class='deliveryDate'><span>발송 예정일</span>"+delivery_from+" 예정</li>");
    
    
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