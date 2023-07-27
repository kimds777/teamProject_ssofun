$(document).ready(function(){
    var $funding_id = $("#funding_id").val();
    var user_id = 1; // 나중에 수정해야함

    getFundingDto($funding_id);
    setEventListener($funding_id,user_id);

});

function setEventListener($funding_id,user_id){



    $(document).on("click","#reviewSubmit",function(e){ 
    e.stopPropagation();   

    var $contents = $("#reviewInput").val();

    if($contents == ""){
        alert("댓글 내용을 입력해주세요");
        $("#commentInput").focus();
        return ;
    }
    insertReview($funding_id,user_id,$contents);
    });
    

    $("#tab>ul>li#reward").click(function(){
        $("#tab>div#rewardModal").toggleClass("hide");
    });

    $("#tab>ul>li#reward").click(function(){
        $("#tab>div#rewardModal").toggleClass("hide");
    });

    $("#likeBtn").click(function(){
        insertFavorit($funding_id,user_id);
    });

    $("#supportBtn").click(function(){
        location.href = "./fundingRewardChoicePage?funding_id="+$funding_id;
    });


    var n=0;
    $('ul#moveLeft').click(function(){
        n--;
        getDetailThumbnailCount(function(res){
            var $thumbLength = res-1;

            if(n<0){
                n=$thumbLength;
            };

            $("ul#swiper>li").removeClass("activeBtn");
            $("ul#swiper>li").eq(n).addClass("activeBtn");

            var nm= n*(-100)+'%';
            $('ul#thumb').animate({left:nm});
        }, $funding_id);
        

    });

    $('ul#moveRight').click(function(){
        n++;
        getDetailThumbnailCount(function(res){
            var $thumbLength = res-1;

            if(n>$thumbLength){
                n=0;
            };
            $("ul#swiper>li").removeClass("activeBtn");
            $("ul#swiper>li").eq(n).addClass("activeBtn");

            var nm= n*(-100)+'%';
            $('ul#thumb').animate({left:nm});
        }, $funding_id);


    });

}

function getDetailThumbnailCount(callback,$funding_id){
    $.ajax({
        url: "./AJAXgetDetailThumbnailCount",
        method: "GET",
        data: {funding_id:$funding_id},
        success: function(res){
            if(res != 0){
                callback(res);
            }
        }
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
                $("#likeBtn").html("<i class='bi bi-heart'></i>"+res);
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
    $("#content>div.input").siblings().remove();
    $("#swiper").empty();
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
                    if(key == "creator_name"){
                        // return $creator_name = value;
                        return true;
                    }
                    if(key == "funding_id"){
                        $tabInfo.html("<a href='./fundingDetailPage?funding_id="+value+"'>소개</a>");
                        $tabNotice.html("<a href='./fundingDetailNoticeListPage?funding_id="+value+"'>공지사항</a>");
                        $tabCommunity.html("<a class='activeTab' href='./fundingDetailCommunityListPage?funding_id="+value+"'>커뮤니티</a>");
                        return true;
                    }

                    if(key == "thumbnailList"){
                        $.each(value,function(index,item){
                            var $url;
                            $.each(item,function(key,value){
                                if(key == "url"){
                                    $url = value;
                                }

                                if(key == "image_order"){
                                    if(value != 1){
                                        if(value == 2){
                                            $("ul#swiper").append("<li class='activeBtn'></li>");
                                            $("ul#thumb").append("<li><img src='/ssofunUploadFiles/"+$url+"' alt='상세 섬네일'></li>");
                                        }else{
                                            $("ul#swiper").append("<li></li>");
                                            $("ul#thumb").append("<li><img src='/ssofunUploadFiles/"+$url+"' alt='상세 섬네일'></li>");
                                        }
                                    }
                                }
                            });
                        });
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

                    if(key == "reviewList"){                        
                        $.each(value,function(index,item){
                            var $div = $("<div></div>");
                            var $noticeList = $("<div class='noticeList'></div>");
                            var $ul = $("<ul class='noticeWriter'></ul>");
                            var $nickname;
                            $.each(item,function(key,value){

                                if(key == "nickname"){
                                    return $nickname = value;
                                }

                                if(key == "created_after"){
                                    if(value == 0){
                                        return $ul.append("<li class='profile'></li><li class='name'>"+$nickname+"</li><li class='date'> 오늘</li>").appendTo($noticeList);
                                    }else{
                                        return $ul.append("<li class='profile'></li><li class='name'>"+$nickname+"</li><li class='date'>"+value+"일전</li>").appendTo($noticeList);
                                    }
                                }
                                if(key == "title"){
                                    return true;
                                }                                      
                                if(key == "contents"){                       
                                    return $noticeList.append("<div class='noticeContent'>"+value+"</div>");
                                }
                                if(key == "funding_review_id"){
                                    $div.append($noticeList);
                                    return $div.append("<a href='./fundingDetailCommunityPage?funding_id="+$funding_id+"&funding_review_id="+value+"' class='moreBtn'></a>");
                                }
                            });
                            $("#content").append($div);
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

function insertReview($funding_id,user_id,$contents){


    $.ajax({
        url: "./insertReviewAjax",
        method: "POST",
        data: {funding_id:$funding_id,user_id:user_id,contents:$contents},
        success: function(res){
            if(res==1){
                alert("리뷰등록 성공!");
                getFundingDto($funding_id);
                $("#reviewInput").val("");
            }else{
                alert("댓글등록 실패!");
            }
        }
    });
}

