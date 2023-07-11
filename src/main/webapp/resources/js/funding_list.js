function getPageName($funding_category_id){
    $.ajax({
        url: "./getPageNameAjax",
        method: "GET",
        //contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        data: {funding_category_id:$funding_category_id},
        success: function(res){
            $("#category-name").html(res);
        }
    });
};


function getMaxPageNum(callback,$funding_category_id){
    $.ajax({
        url: "./getMaxPageNumAjax",
        method: "GET",
        data: {funding_category_id:$funding_category_id},
        success: function(res){
            callback(res);
        }
    });
}

function getPageList(clickNum,$funding_category_id){
	$("#paging ul").empty();
    
    $.ajax({
        url: "./getPageListAjax",
        method: "GET",
        data: {clickNum:clickNum !== null ? clickNum : null,
            funding_category_id:$funding_category_id},
        success: function(res){
            // if(res == null){
            //     return true;
            // }
            $("#paging ul").append("<span id='move-left'>&lt;</span>");
            $.each(res,function(index,item){
            	if(item == clickNum){
            		return $("#paging ul").append("<li class='active' id='pageNum"+item+"'>"+item+"</li>");
            	}
                if(item == 1 && clickNum == null){
                    return $("#paging ul").append("<li class='active' id='pageNum"+item+"'>"+item+"</li>");
                }
                $("#paging ul").append("<li id='pageNum"+item+"'>"+item+"</li>");
            });
            $("#paging ul").append("<span id='move-right'>&gt;</span>");
        }
    });
};

function getFundingList(pageNum,$funding_category_id){
    $("#list").empty();


    $.ajax({
        url: "./getFundingListAjax",
        method: "GET",
        data: {pageNum:pageNum !== null ? pageNum : null,
            funding_category_id:$funding_category_id},
        success: function(res){
            // if(res == null){
            //     return $("#list").html("<div class='noFunding'>등록된 상품이 없습니다</div>");
            // }
            $.each(res,function(index,item){
                var $a;
                var $achievementPrice;
                var $achievementRate;
                var $addComma;
                var $ul = $("<ul class='p-0'></ul>").append("<li>image 280 x 280</li>");
                $.each(item,function(key,value){
                    if(key == "funding_id"){
                        return $a = $("<a href='./fundingDetailPage?funding_id="+value+"'></a>");
                    }
                    if(key == "funding_category" || key == "title" || key == "description"){
                        return $("<li class='text-start'>"+value+"</li>").appendTo($ul);
                    }

                    if(key == "achievementPrice"){
                        return $achievementPrice = value;
                    }

                    if(key == "achievementRate"){
                        return $achievementRate = value;
                    }

                    if(key == "d_day"){
                        $addComma = addCommas($achievementPrice);
                        return $("<li class='text-start'><b class='text-danger'>"+$achievementRate+"% 달성</b> "+$addComma+"원 <span class='float-end'>"+value+"일 남음</span></li>").appendTo($ul);
                    }

                    if(key == "delivery_from"){
                        if($achievementRate>=100){
                            $achievementRate = 100;
                        }
                        var $li = $("<li></li>");
                        var $span = $("<span></span>").css({"width": $achievementRate+"%"}).appendTo($li);
                        return $($li).appendTo($ul);
                    }

                    if(key == "funding_tag" || key == "name" || key == "contents" || key == "thumbnailList"){
                        return true;
                    }
                });
                $a.append($ul);
                $("#list").append($a);
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
}


function getCategoryList(clickCategory){
    $("#category").empty();

    $.ajax({
        url: "./getCategoryListAjax",
        method: "GET",
        success: function(res){
            $.each(res,function(index,item){
                var $li = $("<li></li>").addClass("col");
                var $cateId;
                $.each(item, function(key,value){
                    if(key == "funding_category_id"){
                        return $cateId = value;
                    }
                    if(key == "name"){
                        if($cateId == clickCategory){
                            $li.addClass('active-cate');
                            return $("<a href='./categoryFundingListPage?funding_category_id="+$cateId+"'><i class='bi bi-arrow-through-heart-fill'></i>"+value+"</a>").appendTo($li);
                        }
                        if($cateId == 1 && clickCategory == null){
                            $li.addClass('active-cate');
                            return $("<a href='./fundingListPage'><i class='bi bi-arrow-through-heart-fill'></i>"+value+"</a>").appendTo($li);
                        }
                        // if($cateId == 1){
                        //     return $("<a href='./fundingListPage'><i class='bi bi-arrow-through-heart-fill'></i>"+value+"</a>").appendTo($li);
                        // }

                        return $("<a href='./categoryFundingListPage?funding_category_id="+$cateId+"'><i class='bi bi-arrow-through-heart-fill'></i>"+value+"</a>").appendTo($li);
                    }
                });
                $('#category').append($li);
            });
        }
    });
};

$(document).ready(function(){

	var $funding_category_id = $("#funding_category_id").val();

    getCategoryList($funding_category_id);
    getPageName($funding_category_id);
    getFundingList(null,$funding_category_id);
    getPageList(null,$funding_category_id);

    $("#sort").css({
        "height":"25px",
        "font-size":"5px"
    });

    $(document).on("click","#move-right",function(){
        var $currentPageNum = $(".active").text();
        var $maxPageNum;
        getMaxPageNum(function(res){
            $maxPageNum = res;
            if($currentPageNum == $maxPageNum){
                return alert("더이상 이동할 페이지가 없습니다.");
            }
            $("#pageNum"+$currentPageNum).removeClass('active');
            var $nextPageNum =  parseInt($currentPageNum) + 1 ;
            getPageList($nextPageNum,$funding_category_id);
            getFundingList($nextPageNum,$funding_category_id);
        },$funding_category_id);
    });

    $(document).on("click","#move-left",function(){
        var $currentPageNum = $(".active").text();
        if($currentPageNum == 1){
            return alert("더이상 이동할 페이지가 없습니다.");
        }
    	$("#pageNum"+$currentPageNum).removeClass('active');
        var $prePageNum = $currentPageNum - 1 ;
        getPageList($prePageNum,$funding_category_id);
        getFundingList($prePageNum,$funding_category_id);
    });

    $(document).on("click","#paging ul li",function(){
        $("#paging ul li").removeClass('active');
        var $clickNum = $(this).text();
        getPageList($clickNum,$funding_category_id);
        getFundingList($clickNum,$funding_category_id);
    });

    $("#category>li").first().addClass('active-cate');


});