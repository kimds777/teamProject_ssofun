function getFundingDto($funding_id){
    $.ajax({
        url: "./getFundingDtoAjax",
        method: "GET",
        data: {funding_id:$funding_id},
        success: function(res){
            var $creator_name;
            var $funding_id;
            var $addComma;
            var $d_day;
            var $tabInfo = $("#tab>ul>li#info");
            var $tabNotice = $("#tab>ul>li#notice");
            var $tabCommunity = $("#tab>ul>li#community");
            $.each(res,function(key,value){
                    if(key == "creator_name"){
                        return $creator_name = value;
                    }

                    if(key == "funding_id"){
                        $funding_id = value;
                        $tabInfo.html("<a href='./fundingDetailPage?funding_id="+value+"'>소개</a>");
                        $tabNotice.html("<a class='activeTab' href='./fundingDetailNoticeListPage?funding_id="+value+"'>공지사항</a>");
                        $tabCommunity.html("<a href='./fundingDetailCommunityListPage?funding_id="+value+"'>커뮤니티</a>");
                        return true;
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
                        return true;
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

                    if(key == "newsList"){                        
                        $.each(value,function(index,item){
                            var $div = $("<div></div>");
                            var $noticeList = $("<div class='noticeList'></div>");
                            var $ul = $("<ul class='noticeWriter'></ul>");
                            $.each(item,function(key,value){

                                if(key == "created_at"){
                                    if(value == 0){
                                        return $ul.append("<li class='profile'></li><li class='name'>"+$creator_name+"<span>메이커</span></li><li class='date'> 오늘</li>").appendTo($noticeList);
                                    }else{
                                        return $ul.append("<li class='profile'></li><li class='name'>"+$creator_name+"<span>메이커</span></li><li class='date'>"+value+"일전</li>").appendTo($noticeList);
                                    }
                                }
                                if(key == "title"){
                                    return true;
                                }                                      
                                if(key == "contents"){                       
                                    return $noticeList.append("<div class='noticeContent'>"+value+"</div><div class='gradient'></div>");
                                }
                                if(key == "funding_notice_id"){
                                    $div.append($noticeList);
                                    return $div.append("<a href='./fundingDetailNoticePage?funding_id="+$funding_id+"&funding_notice_id="+value+"' class='moreBtn'>더보기</a>");
                                }
                            });
                            $("#content").append($div);
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

$(document).ready(function(){
    var $funding_id = $("#funding_id").val();

    getFundingDto($funding_id);

        $("#tab>ul>li#reward").click(function(){
            $("#tab>div#rewardModal").toggleClass("hide");
        });

});