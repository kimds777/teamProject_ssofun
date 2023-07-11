$(document).ready(function(){
    var urlParams = new URLSearchParams(window.location.search);
    var $funding_id =  urlParams.get("funding_id");
    var user_id = 1;

    getFundingDto($funding_id);
    setEventListener($funding_id,user_id);
});

function setEventListener($funding_id,user_id){

    $(document).on("click","#rewardGroup>.reward>ul:first-of-type",function(){
        event.stopPropagation(); 
        $(this).children("li").eq(1).toggleClass("activeColor");
        $(this).children("li:eq(1)").children("i").toggleClass("activeColor");
        $(this).parent("div").toggleClass("checked");
        $(this).next().children("li").first().children("input").val("");
        $(this).next().children("li").first().children("input").removeClass("activeInput");
        $(this).next().children("li.activeColor").removeClass("activeColor");
        $(this).next().toggleClass("hide");
    });
    
    $(document).on("focus","#rewardGroup>.reward>ul:last-of-type>li:first-child>input",function(){
        event.stopPropagation(); 
        $(this).addClass("activeInput");
        $(this).parent("li").next().addClass("activeColor");
    });

    $(document).on("blur","#rewardGroup>.reward>ul:last-of-type>li:first-child>input",function(){
        event.stopPropagation();         
        var $thisVal = $(this).val();
        var valParseInt = parseInt($thisVal);
        if($thisVal != ""){
            if(valParseInt>10){
                alert("최대 10개까지 구매 가능합니다.");
                $(this).val("");
                $(this).removeClass("activeInput");
                $(this).parent("li").next().removeClass("activeColor");
            }else{
                $(this).val($thisVal+"개");
                $(this).addClass("activeInput").addClass("activeColor");
                $(this).parent().next().addClass("activeColor");
            }
        }else{
            $(this).removeClass("activeInput");
            $(this).parent("li").next().removeClass("activeColor");
        }    
    });

    $(document).on("click","#nextSubmit",function(){
        event.stopPropagation(); 
        if($("div.checked").length){
            var inputValue = $("div.checked>ul:last-of-type>li>input").val();
            
            if(inputValue == ""){
                alert("최소 1개 이상의 리워드 수량을 입력해주세요.");
            }else{
                insertFundingOrder(user_id);
            }
        }else{
            alert("최소 1개 이상의 리워드를 선택해주세요.");
        }
        
    });
    
    $(document).on("input","#price_support",function(){
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


    $(document).on("click","#open>dd:nth-child(4)",function(){
        event.stopPropagation(); 
        $(this).toggleClass("checked");
        $(this).children("i").toggleClass("activeColor");
    });
    
    
    $(document).on("click","#open>dd:last-child",function(){
        event.stopPropagation(); 
        $(this).toggleClass("checked");
        $(this).children("i").toggleClass("activeColor");
    });


    
}

function insertFundingOrder(user_id){
    
    var $rewardList = [];
    var $total_price = 0;
    
    $("div.checked").each(function(i){
        
        var reward_id =  $(this).children("ul").first().children("li").first().children("input").val();
        
        var currentCountValue = $(this).children("ul").last().children("li").children("input").val();
        var reward_count = currentCountValue.replace(/[^0-9]/g, '');
        
        var currentAmountValue = $(this).children("ul").first().children("li.first").children("b").text();
        var reward_amount = currentAmountValue.replace(/[^0-9]/g, '');
        
        var fundingRewardOrderDto = {
            funding_reward_id : reward_id,
            count: reward_count,
            amount: reward_amount,
            status: 1 // 1 -> 주문 진행중
        };

        
        $total_price += parseInt(reward_count*reward_amount);
        
        $rewardList.push(fundingRewardOrderDto);
        
    });
    
    var $price_support = $("#price_support").val().replace(/[^0-9]/g, '');
    if($price_support == ""){
        $price_support = 0;
    }

    $total_price += parseInt($price_support);
    
    
    var $open_name_fg = 0;
    var $open_amount_fg = 0;

    $("dd.checked").each(function(i){
        var checkValue = $(this).text().replace(/\s/g, "");

        if(checkValue == "후원금액비공개"){
            $open_amount_fg = 1;
        }
        if(checkValue == "이름비공개"){
            $open_name_fg = 1;
        }

    });
    
    var $fundingOrderDto = {
        user_id: parseInt(user_id),
        funding_order_status_id: 1, // 1 -> 주문 진행중
        price_support: $price_support,
        open_name_fg: $open_name_fg,
        open_amount_fg: $open_amount_fg,
        total_price: $total_price,
        rewardList: $rewardList
    };


    $.ajax({
        url: "./AJAXinsertFundingOrder",
        method: "POST",
        data: JSON.stringify($fundingOrderDto),
        contentType : "application/json",
        success: function(res){
            if(res != 0){
                alert("주문 데이터 입력 완료! 리워드 데이터 입력 실행!!");
                location.href = "./fundingRewardPaymentPage?funding_order_id="+res;
            }else{
                alert("주문 처리중 문제가 발생했습니다. 다시 시도해주세요.")
            }
        }
    });
};





function getFundingDto($funding_id){
    $.ajax({
        url: "./getFundingDtoAjax",
        method: "GET",
        data: {funding_id:$funding_id},
        success: function(res){
            var achievementRate;
            $.each(res,function(key,value){
                if(key == "funding_category"){
                    $("#fundingInfo>li:nth-child(2)").text(value);
                }
                if(key == "title"){
                    $("#fundingInfo>li:nth-child(3)").text(value);
                }
                if(key == "achievementPrice"){
                    var commasValue = addCommas(value);
                    $("#fundingInfo>li:nth-child(4)").html(commasValue+"원");
                }
                if(key == "achievementRate"){
                    achievementRate = value;
                }
                if(key == "d_day"){
                    $("#fundingInfo>li:last-child").html("<b>"+achievementRate+"% 달성</b> "+value+"일 남음");
                }

                if(key == "rewardList"){
                    $.each(value,function(index,item){
                        var $rewardGroup = $("#rewardGroup");
                        var $rewardDiv = $("<div class='reward'></div>");
                        var $ul = $("<ul></ul>");
                        var $ulInput = $("<ul></ul>");
                        var price;
                        var target_sell_count;
                        var commasTargetSellCount;
                        var title;
                        var description;
                        var $itemList = $("<ul class='itemList'></ul>");
                        var stock_max;
                        var funding_reward_id;
                        $.each(item,function(key,value){
                            if(key == "funding_reward_id"){
                                funding_reward_id = value;
                            }
                            if(key == "price"){
                                var commasPrice = addCommas(value);
                                price = commasPrice;
                            }
                            if(key == "target_sell_count"){
                                commasTargetSellCount = addCommas(value);
                                target_sell_count = value;
                            }
                            if(key == "title"){
                                title = value;
                            }
                            if(key == "description"){
                                description = value;
                            }
                            if(key == "itemList"){
                                $.each(value,function(index,item){
                                    var name;
                                    $.each(item,function(key,value){                                        
                                        if(key == "name"){
                                            name = value;
                                        }
                                        if(key == "count"){
                                            $itemList.append("<li>&#8226; "+name+" "+value+"개</li>");
                                        }
                                    });
                                });
                                $("<li></li>").append($itemList).appendTo($ul);
                            }
                            if(key == "stock_max"){
                                stock_max = value;
                                if(target_sell_count < value){
                                    $ul.prepend("<li>"+description+"</li>");
                                    $ul.prepend("<li>"+title+"</li>");
                                    $ul.prepend("<li>"+commasTargetSellCount+"명이 선택</li>");
                                    $ul.prepend("<li class='first'><i class='bi bi-check-square'></i><b>"+price+"원</b><span>남은수량 "+(value - target_sell_count)+"개</span></li>");
                                    $ul.prepend("<li><input type='hidden' class='rewardId' value='"+funding_reward_id+"'></li>");
                                }else if(target_sell_count >= value){
                                    $ul.prepend("<li class='soldOut'>"+description+"</li>");
                                    $ul.prepend("<li class='soldOut'>"+title+"</li>");
                                    $ul.prepend("<li class='soldOut'>"+commasTargetSellCount+"명이 선택</li>");
                                    $ul.prepend("<li class='soldOut first'><i class='bi bi-check-square'></i><b>"+price+"원</b><span class='activeColor'>남은수량 0개 (매진)</span></li>");
                                    $ul.prepend("<li><input type='hidden' class='funding_reward_id' value='"+funding_reward_id+"'></li>");
                                }
                            }
                            if(key == "delivery_from"){
                                if(target_sell_count < stock_max){                                    
                                    $ul.append("<li><span>발송예정일</span> "+value+" 예정</li>");
                                    $ulInput.addClass("hide").append("<li><input type='text' name='amount' class='amount'></li><li>수량</li><li>최대 10개</li>");
                                }else if(target_sell_count >= stock_max){
                                    $ul.append("<li class='soldOut'><span>발송예정일</span> "+value+" 예정</li>");
                                }
                            }
                            
                        });
                        $rewardDiv.append($ul).append($ulInput).appendTo($rewardGroup);
                    });
                }

            });
        }
    });
};

function addCommas(num){
    var str = num.toString();
    if(str.length >= 4){
        str = str.replace(/(\d)(?=(\d{3})+$)/g, '$1,');
    }

    return str;
};