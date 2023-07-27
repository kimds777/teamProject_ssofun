$(document).ready(function(){
    var $funding_id = $("#funding_id").val();
    var $funding_notice_id = $("#funding_notice_id").val();
    var user_id = 1;   //로그인 연동하고 수정해야함

    
    getFundingDto($funding_id,$funding_notice_id);
    setEventListener($funding_id,user_id,$funding_notice_id);
    

});

function setEventListener($funding_id,user_id,$funding_notice_id){

    $(document).on("click","#content>div>div.input>input#commentSubmit",function(){ 
        event.stopPropagation();       
        var $contents = $("#commentInput").val();

        if($contents == ""){
            alert("댓글 내용을 입력해주세요");
            $("#commentInput").focus();
            return ;
        }

        insertNewsComment($funding_notice_id,user_id,$contents);
    });

    $(document).on("click","input.commentReplySubmit",function(){ 
        event.stopPropagation();       
        var $contents = $(this).prev().val();
        var $this_answer_id = $(this).next().val();
        alert($contents+" "+$this_answer_id);

        if($contents == ""){
            alert("댓글 내용을 입력해주세요");
            $contents.focus();
            return ;
        }

        insertNewsCommentReply($funding_notice_id,user_id,$this_answer_id,$contents);
    });

    $(document).on("click",".commentReplyShowBtn",function(){
        $(this).addClass("hide");
        var $hideBtn = $(this).next();
        var $replyList = $hideBtn.next();
        $hideBtn.removeClass("hide");
        $replyList.removeClass("hide");
    });

    $(document).on("click",".commentReplyHideBtn",function(){
        $(this).addClass("hide");
        var $showBtn = $(this).prev();
        var $replyList = $(this).next();
        $replyList.addClass("hide");
        $showBtn.removeClass("hide");
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




var $creator_name;

function getFundingDto($funding_id,$funding_notice_id){
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
                    return $creator_name =value;
                }

                    if(key == "funding_id"){
                        $tabInfo.html("<a href='./fundingDetailPage?funding_id="+value+"'>소개</a>");
                        $tabNotice.html("<a class='activeTab' href='./fundingDetailNoticeListPage?funding_id="+value+"'>공지사항</a>");
                        $tabCommunity.html("<a href='./fundingDetailCommunityListPage?funding_id="+value+"'>커뮤니티</a>");
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

                    if(key == "newsList"){                        
                        return true;
                    }
                });
                getFundingNewsDto($funding_notice_id);
        }
    });
}

function getFundingNewsDto($funding_notice_id){
    // $("#content>div").detach();
    //$("#content>div").css('display','none').remove(); //깜박임 없애며 나타내기....아직 부족함
    $("#content").empty();
    $.ajax({
        url : "./getFundingNewsDtoAjax",
        method: "GET",
        data: {funding_notice_id:$funding_notice_id},
        success: function(res){
            var $div = $("<div class='col'></div>");
            var $ul = $("<ul class='noticeWriter'></ul>");
            var $creatorName = $creator_name;
            $.each(res,function(key,value){
                    if(key == "created_after"){
                        // $creatorName = $creator_name;
                        if(value == 0){
                            return $ul.append("<li class='profile'></li><li class='name'>"+$creatorName+"<span>메이커</span></li><li class='date'> 오늘</li>").appendTo($div);
                        }else{
                            return $ul.append("<li class='profile'></li><li class='name'>"+$creatorName+"<span>메이커</span></li><li class='date'>"+value+"일전</li>").appendTo($div);
                        }
                    }
                    if(key == "title"){
                        return true;
                    }                                      
                    if(key == "contents"){                       
                        return $div.append("<div class='noticeContent'>"+value+"</div>");
                    }
                    if(key == "funding_notice_id"){
                        return true;
                    }
                    if(key == "totalComment"){
                        $div.append("<p class='totalComment'>"+value+"개의 댓글</p>");
                        return $div.append("<div class='input'><input type='text' name='commentInput' id='commentInput' placeholder='댓글을 달아보세요!'><input type='button' value='작성하기' id='commentSubmit'></div>");
                    }
                    if(key == "reviewList"){
                        var $commentList = $("<div id='commentList'></div>");
                        var $divComment = $("<div class='col p-0'></div>");
                        $.each(value, function(index,item){
                            var $comment = $("<div class='row comment'></div>");
                            var $ulComment = $("<ul class='commentWriter'></ul>");
                            var $this_answer_id;
                            $.each(item, function(key,value){
                                if(key == "funding_news_review_id"){            
                                    return $this_answer_id = $("<input type='hidden' class='this_answer_id' value='"+value+"'>");
                                    // return $("<input type='hidden' class='funding_news_review_id' value='"+value+"'>").appendTo($comment);
                                }
                                
                                if(key == "nickname"){
                                    return $("<li class='profile'></li><li class='name'>"+value+"</li>").appendTo($ulComment);
                                }
                                if(key == "created_at"){
                                    if(value == 0){
                                        return $("<li class='date'> 오늘</li>").appendTo($ulComment);
                                    }else{
                                        return $("<li class='date'>"+value+"일전</li>").appendTo($ulComment);
                                    }
                                }
                                if(key == "contents"){
                                    $("<li class='commentContent'>"+value+"</li>").appendTo($ulComment);
                                    return $comment.append($ulComment);
                                    // return  $divComment.append($comment);
                                }

                                if(key =="answer_count"){
                                    if(value == 0){
                                        var $showBtn = $("<ul class='commentReplyShowBtn'><li><i class='bi bi-plus'></i></li><li>답글 달기</li></ul>");
                                        var $hideBtn = $("<ul class='commentReplyHideBtn hide'><li><span></span></li><li>숨기기</li></ul>");
                                        return $comment.append($showBtn).append($hideBtn);
                                    }else{
                                        var $showBtn = $("<ul class='commentReplyShowBtn'><li><i class='bi bi-plus'></i></li><li>답글 "+value+"개</li></ul>");
                                        var $hideBtn = $("<ul class='commentReplyHideBtn hide'><li><span></span></li><li>숨기기</li></ul>");
                                        return $comment.append($showBtn).append($hideBtn);
                                    };
                                }

                                if(key == "answerList"){
                                    var $replyList = $("<div class='commentReplyList hide'></div>");                   
                                    var $inputDiv = $("<div class='input'></div>");
                                    $.each(value,function(index,item){
                                        var $ul = $("<ul class='commentWriter'></ul>");
                                        $.each(item,function(key,value){
                                            
                                            if(key == "nickname"){
                                                return $("<li class='profile'></li><li class='name'>"+value+"</li>").appendTo($ul);
                                            }

                                            if(key == "created_at"){
                                                if(value == 0){
                                                    return $("<li class='date'> 오늘</li>").appendTo($ul);
                                                }else{
                                                    return $("<li class='date'>"+value+"일전</li>").appendTo($ul);
                                                }
                                            }

                                            if(key == "contents"){
                                                $("<li class='commentContent'>"+value+"</li>").appendTo($ul);                                              
                                                return  $replyList.append($ul);
                                            }

                                            if(key == "this_answer_id"){
                                                return true;
                                            }
                                        })
                                    });                                    
                                    $comment.append($replyList);                              

                                    $inputDiv.append("<input type='text' name='commentReply' class='commentReply' placeholder='댓글을 달아보세요!'><input type='button' value='작성하기' class='commentReplySubmit'>");
                                    $inputDiv.append($this_answer_id);
                                    $replyList.append($inputDiv);
                                }
                            });

                            $divComment.append($comment);
                            $commentList.append($divComment);
                        });
                        $div.append($commentList);
                    }                
            });
            $("#content").append($div);
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

function insertNewsComment($funding_notice_id,user_id,$contents){
    alert($funding_notice_id+" "+user_id+" "+$contents);
    $.ajax({
        url: "./insertNewsCommentAjax",
        method: "POST",
        data:{funding_notice_id:$funding_notice_id,user_id:user_id,contents:$contents},
        success: function(res){
            if(res==1){
                alert("댓글등록 성공!");
                getFundingNewsDto($funding_notice_id);
                $("#commentInput").val("");
            }else{
                alert("댓글등록 실패!");
            }
        }
    });
}

function insertNewsCommentReply($funding_notice_id,user_id,$this_answer_id,$contents){
    alert($funding_notice_id+" "+$this_answer_id+" "+user_id+" "+$contents);
    $.ajax({
        url: "./insertNewsCommentReplyAjax",
        method: "POST",
        data: {funding_notice_id:$funding_notice_id,user_id:user_id,this_answer_id:$this_answer_id,contents:$contents},
        success: function(res){
            if(res==1){
                alert("대댓글등록 성공!");
                getFundingNewsDto($funding_notice_id);
                $(".commentReply").val("");
            }else{
                alert("댓글등록 실패!");
            }
        }
    });
}


