$(document).ready(function(){
    var urlParams = new URLSearchParams(window.location.search);
    var $funding_order_id =  urlParams.get("funding_order_id");
    var user_id = 1;

    getFundingOrder($funding_order_id);
    setEventListener($funding_order_id,user_id);
});

function setEventListener($funding_order_id,user_id){   


};

function getFundingOrder($funding_order_id){
    $.ajax({
        url: "./AJAXgetFundingOrder",
        method: "GET",
        data: {funding_order_id:$funding_order_id},
        success: function(res){
            if(res != null){
                $.each(res, function(key,value){
                    if(key == "funding_category"){
                        $("#participation>#history>#project>li:first-child").html(value);
                    }

                    if(key == "title"){
                        $("#participation>#history>#project>li:last-child").html(value);
                    }

                        if(key == "rewardList"){
                            $.each(value,function(index,item){
                                if(index == 0){ // 첫번째 리워드만 보여주기
                                    $.each(item,function(key,value){
                                        if(key == "fundingRewardDto"){
                                            $.each(value,function(key,value){
                                                    if(key == "title"){
                                                        $("#projectInfo>.reward>li.title").html(value);
                                                    }
                                                    if(key == "itemList"){
                                                        var $detailLi = $("#projectInfo>.reward>li.detail");
                                                        var $ul = $("<ul></ul>");
                                                        $.each(value,function(index,item){
                                                            var name;
                                                            $.each(item,function(key,value){
                                                                if(key=="name"){
                                                                    name = value;
                                                                }
                                                                if(key == "count"){
                                                                    $("<li>&#8226; "+name+" "+value+"개</li>").appendTo($ul);
                                                                }
                                                            });
                                                        });
                                                        $detailLi.append($ul);
                                                    }
                                            });
                                        }

                                        if(key == "count"){
                                            var $totalLi = $("#projectInfo>.reward>li.total");
                                            $("<span>수량 "+value+"개</span>").appendTo($totalLi);
                                        }
                
                                        if(key =="amount"){
                                            var $totalLi = $("#projectInfo>.reward>li.total");
                                            var amountCommas = addCommas(value);
                                            $("<b>"+amountCommas+"원</b>").appendTo($totalLi);
                                        }


                                    });
                                }
                            });
                        }

                    
                });
            }
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