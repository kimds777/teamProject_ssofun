
$(document).ready(function(){

    var urlParams = new URLSearchParams(window.location.search);
    var $funding_id = urlParams.get("funding_id");
    var user_id = 1;

    getFundingDto($funding_id);
    setEventListener($funding_id,user_id);

});

function setEventListener($funding_id,user_id){

    $("#tab>ul>li#reward").click(function(){
        $("#tab>div#rewardModal").toggleClass("hide");
    });

    $("#likeBtn").click(function(){
        insertFavorit($funding_id,user_id);
    });

    $("#supportBtn").click(function(){
        location.href = "./fundingRewardChoicePage?funding_id="+$funding_id;
    });

}

function insertFavorit($funding_id,user_id){
    $.ajax({
        url: "./AJAXinsertFavorit",
        method: "POST",
        data: {funding_id:$funding_id,user_id:user_id},
        success: function(res){
            if(res==1){
                // uesd_fg 1인 좋아요 갯수 조회하기
                getCountFavorit($funding_id);
            }else{
                // 만들어야함 uesd_fg 0으로 처리하기
                deleteFavorit($funding_id,user_id);
            }
        }
    });
}

function getCountFavorit($funding_id){
    $.ajax({
        url: "./AJAXgetCountFavorit",
        method: "GET",
        data: {funding_id:$funding_id},
        success: function(res){
            if(res != null){
                return $("#likeBtn").html("<i class='bi bi-heart'></i>"+res);
            }
        }
    });
}

function deleteFavorit($funding_id,user_id){
    $.ajax({
        url: "./AJAXdeleteFavorit?funding_id="+$funding_id+"&user_id="+user_id,
        method: "PATCH",
        data: {used_fg:0},
        success: function(res){
            if(res == 1){
                getCountFavorit($funding_id);
            }
        }
    });
}

function getFundingDto($funding_id){
    $.ajax({
        url: "./getFundingDtoAjax",
        method: "GET",
        data: {funding_id:$funding_id},
        success: function(res){
            var $addComma;
            var $d_day;
            var $tabInfo = $("#tab>ul>li#info");
            var $tabNotice = $("#tab>ul>li#notice");
            var $tabCommunity = $("#tab>ul>li#community");
            $.each(res,function(key,value){
                    if(key == "funding_id"){
                        $tabInfo.html("<a class='activeTab' href='./fundingDetailPage?funding_id="+value+"'>소개</a>");
                        $tabNotice.html("<a href='./fundingDetailNoticeListPage?funding_id="+value+"'>공지사항</a>");
                        $tabCommunity.html("<a href='./fundingDetailCommunityListPage?funding_id="+value+"'>커뮤니티</a>");
                        return $("body").append("<input type='hidden' name='funding_id' id='funding_id' value='"+value+"'>");
                    }

                    if(key == "funding_category"){return $("#category-name>h6").text(value);}

                    if(key == "title"){return $("#title>h3").text(value);}

                    if(key == "description"){
                        return $("#introduce").html("<span class='first'>펀딩소개</span>"+value);
                    }

                    if(key == "achievementPrice"){return $addComma = addCommas(value);}
                    if(key == "achievementRate"){
                        return $("#totalAmount").html("<span class='first'>모인금액</span>"+$addComma+"<b>원</b><span id='achieve'>"+value+"% 달성</span>");
                    }

                    
                    if(key == "d_day"){return $d_day = value;}
                    if(key == "close_at"){
                        return $("#endtime").html("<span class='first'>남은 시간</span>"+$d_day+"<b>일</b><span id='end'>"+value+" 종료</span>");
                    }

                    if(key =="countSupporter"){
                        return $("#sponsor").html("<span class='first'>후원자</span>"+value+"<b>명 참여</b>");
                    }

                    if(key == "delivery_from"){
                        return $("#aside>ul>li>ul>li:first-child").html("<i class='bi bi-truck'></i> "+value+"에 발송됩니다.");
                    }

                    if(key =="contents"){
                        return $("#content>p").text(value);
                    }

                    if(key == "favorit"){
                        return $("#likeBtn").html("<i class='bi bi-heart'></i>"+value);
                    }

                    if(key == "rewardList"){
                        $.each(value,function(index,item){
                            var $stock;
                            var $addCommaRward;
                            var $dl = $("<dl></dl>");
                            var $sellCount;
                            $.each(item, function(key,value){
                                if(key == "funding_reward_id"){
                                    return $("<input type='hidden' id='funding_reward_id' value='"+value+"'>").appendTo($dl);
                                }

                                if(key == "price"){
                                    $addCommaRward = addCommas(value);
                                    return $("<dt>"+$addCommaRward+"<b>원</b></dt>").appendTo($dl);
                                }
    
                                if(key == "delivery_price"){
                                    $addCommaRward = addCommas(value);
                                    return $("<dd><span>배송비</span> "+$addCommaRward+"원</dd>").appendTo($dl);
                                }
    
                                if(key == "target_sell_count"){
                                    $sellCount = value;
                                    $addCommaRward = addCommas(value);
                                    return $("<dd class='ddFirst'>"+value+"명이 선택</dd>").appendTo($dl);
                                }
                                
                                if(key == "title"){
                                    return $(" <dd class='ddNthTwo'>"+value+"</dd>").appendTo($dl);
                                }
                                
                                if(key == "description"){
                                    return $("<dd class='ddNthThree'>"+value+"</dd>").appendTo($dl);
                                }
                                
                                if(key == "stock_max"){
                                    $stock = value-$sellCount;
                                    $addCommaRward = addCommas($stock);
                                    return $("<dd class='stock'><span>남은 수량</span> "+$addCommaRward+"개</dd>").appendTo($dl);
                                }
                                
                                if(key == "delivery_from"){
                                    return $("<dd class='ddLast'><span>발송 예정일</span> "+value+" 예정</dd>").appendTo($dl);
                                }

                                if(key == "itemList"){
                                    $.each(value, function(index,item){
                                        var $name;
                                        $.each(item, function(key,value){
                                            if(key=="name"){
                                                return $name = value;
                                            }
                                            if(key == "count"){
                                                return $("<dd class='item'>&#8226; "+$name+" "+value+"개</dd>").appendTo($dl);
                                            }
                                        });
                                    });
                                }

                            });
                            $("#rewardModal").append($dl);
                        });
                    }

            });
        }
    });
}

function addCommas(num){
    var str = num.toString();
    if(str.length >= 4){
        str = str.replace(/(\d)(?=(\d{3})+$)/g, '$1,');
    }

    return str;
}
