$(document).ready(function(){
    var urlParams = new URLSearchParams(window.location.search);
    var $funding_order_id =  urlParams.get("funding_order_id");
    var user_id = 1;  // 유저아이디 수정 필요 세션으로 받아야함

    getPaymentBeforeFundingOrder($funding_order_id);
    setEventListener($funding_order_id,user_id);
});

function setEventListener($funding_order_id,user_id){


    $(document).on("click","#addressInputBtn",function(event){
        event.stopPropagation(); 
        $("#modalBack").removeClass("hide");
        $("#addressSelectModal").removeClass("hide");

    });

    $(document).on("click","#modalBack",function(event){
        event.stopPropagation(); 
        if($("div#addressAddModal.hide").length > 0){
            $(this).addClass("hide");
            $("#addressSelectModal").addClass("hide");
        }else{
            return ;
        }
    });

    $(document).on("click","#showAddressAddModalBtn",function(event){
        event.stopPropagation(); 
        getUseraddressList(user_id)
        $("#addressAddModal").removeClass("hide");
    })
    
    $(document).on("click","#returnBtn",function(event){
        event.stopPropagation(); 
        $("#addressAddModal").addClass("hide");

    });
    
    $(document).on("click","#addBtn",function(event){
        event.stopPropagation(); 
        // addAddress(user_id);
        $("#addressAddModal").addClass("hide");
    });

    $(document).on("click","input#paymentSubmit",function(event){
        event.stopPropagation();
        var totalAgreeChecked = $("#totalAgree.checked").length;

        if(totalAgreeChecked == 0){
            alert("전체 동의후 결제가 진행됩니다.");
        }else{
            payment($funding_order_id);
        }
    });
    
    // 동의사항 수정해야함..!
    $(document).on("click","#agree>li#totalAgree",function(event){
        event.stopPropagation(); 
        if($("#agree>li.checked").length <= 0 || $("#agree>li.checked").length === 3){

            $(this).toggleClass("checked");
            $(this).children("i").toggleClass("checked");
            
            $("#agree>li").eq(1).toggleClass("checked");
            $("#agree>li").eq(1).children("i").toggleClass("checked");
            
            $("#agree>li").eq(2).toggleClass("checked");
            $("#agree>li").eq(2).children("i").toggleClass("checked");
        
        }else{

            $(this).toggleClass("checked");
            $(this).children("i").toggleClass("checked");

            $("#agree>li").not("#agree>li.checked").toggleClass("checked");
            $("#agree>li").not("#agree>li.checked").children("i").toggleClass("checked");

        }
    });
    
    $(document).on("click","#agree>li:nth-child(2)",function(event){
        event.stopPropagation(); 
        if($("#agree>li#totalAgree.checked").length > 0){
            $("#agree>li#totalAgree").toggleClass("checked");
            $("#agree>li#totalAgree").children("i").toggleClass("checked");

            $(this).toggleClass("checked");
            $(this).children("i").toggleClass("checked");
        }else{
            $(this).toggleClass("checked");
            $(this).children("i").toggleClass("checked");
        }
    });
    
    $(document).on("click","#agree>li:nth-child(3)",function(event){
        event.stopPropagation(); 
        if($("#agree>li#totalAgree.checked").length > 0){
            $("#agree>li#totalAgree").toggleClass("checked");
            $("#agree>li#totalAgree").children("i").toggleClass("checked");

            $(this).toggleClass("checked");
            $(this).children("i").toggleClass("checked");
        }else{
            $(this).toggleClass("checked");
            $(this).children("i").toggleClass("checked");
        }
    });

    


};


function payment($funding_order_id){


    IMP.init("imp33817838");

    var today = new Date();   
    var hours = today.getHours(); // 시
    var minutes = today.getMinutes();  // 분
    var seconds = today.getSeconds();  // 초
    var milliseconds = today.getMilliseconds();
    var makeMerchantUid = hours +  minutes + seconds + milliseconds;


    var rewardCount = $("#rewardGroup>ul").length;
    var name = $("#rewardGroup>ul:first-of-type>li.title").text();
    var orderName;
    if(rewardCount>1){
        orderName = name+"외 "+rewardCount+"건";
    }else{
        orderName = name;
    }

    var buyerName = $("#addressSection>li").first().text().replace("받는분", "");
    var $amount = $("#choiceReward>ul:first-of-type>li:last-child>b").text().replace(/[^0-9]/g, '');
    var buyerEmail = $("#supporterInfo>ul>li:first-child").text().replace("이메일", "");
    var buyerTel = $("#addressSection>li:nth-child(2)").text().replace(/[^0-9]/g, "");

    var defaultAddr = $("#addressSection>li:nth-child(4)>ul>li:first-child").text();
    var detailAddr = $("#addressSection>li:nth-child(5)").text().replace("상세주소", "");
    var buyerAddr = defaultAddr+" "+detailAddr;
    
    var buyerPostcode = $("#addressSection>li:nth-child(3)").text().replace("우편번호", "");
    var requestMessage = $("#addressSection>li:last-child").text().replace("요청사항","");
    // alert(buyerPostcode);

    var data = {
        pg: "html5_inicis.INIpayTest",
        pay_method: "card",
        merchant_uid: "KDS"+makeMerchantUid,   // 주문번호
        name: orderName,
        amount: $amount,                         // 숫자 타입
        buyer_email: buyerEmail,
        buyer_name: buyerName,
        buyer_tel: buyerTel,
        buyer_addr: buyerAddr,
        buyer_postcode: buyerPostcode
        };

        IMP.request_pay(data,function(rsp){
            if(rsp.success){
                //STEP 4
                $.ajax({
                    url: "./AJAXcallback_receive",
                    // url: "./AJAXwebhook_receive", //ngrok으로 연결후 사용해야함 -> 아임포트 웹훅 URL변경 필수
                    method: "POST",
                    headers: {"Content-Type": "application/json"},
                    data: JSON.stringify(rsp)
                }).done(function(data) {
                    //STEP 6
                    alert("결제 성공!!! 결제 정보 입력 실행!"+JSON.stringify(data));
                    
                    var $token = "b068c276cfbaabb6a1020150348545ddb9cb4eab"; // 콜백용 token값 설정
                    
                    alert("token: "+$token+", amount: "+$amount);
                    // var $token = data.token; // 웹훅용 model값 가져오기

                    $.ajax({
                        url: "./AJAXinsertPayment",
                        method: "POST",
                        data: {token:$token,amount:$amount},
                        success:function(res){
                            if(res != 0 ){
                                console.log("결제 정보 입력 성공!! 펀딩 주문 결제 정보 입력 실행!");
                                var payment_id = res; // model값 가져오기
                                alert("payment_id: "+payment_id+", funding_order_id: "+$funding_order_id);

                                $.ajax({
                                    url: "./AJAXinsertOrderPayment",
                                    method: "POST",
                                    data: {payment_id:payment_id, funding_order_id:$funding_order_id},
                                    success: function(res){
                                        alert("주문 결제 정보 입력 성공!!! 배송 수령인 정보 입력 실행!!");
                                        alert("name: "+buyerName+", phone: "+buyerTel+", address_post: "+buyerPostcode+", address_default: "+defaultAddr+", address_detail: "+detailAddr+", request_message: "+requestMessage);

                                        $.ajax({
                                            url: "./AJAXinsertDeliveryRecipient",
                                            method: "POST",
                                            data: {name:buyerName, phone: buyerTel, address_post:buyerPostcode, address_default:defaultAddr, address_detail:detailAddr, request_message:requestMessage},
                                            success: function(res){
                                                if(res != 0){
                                                    alert("수령인 정보 입력 완료!!! 주문 확정 처리 진행!!");
                                                    var $delivery_recipient_id = res;

                                                    $.ajax({
                                                        url: "./AJAXupdateFundingRewardOrder?funding_order_id="+$funding_order_id,
                                                        method: "PATCH",
                                                        data: JSON.stringify({delivery_recipient_id:$delivery_recipient_id, used_fg: 1, status: 3 }), // JSON 문자열로 데이터 직렬화 //status:3 -> 3는 결제완료 의미
                                                        contentType: "application/json", // Content-Type 헤더 설정 
                                                        success: function(res){
                                                            if(res == 1){
                                                                alert("리워드 주문 확정 완료!! 주문 확정 진행!!");
                                                                
                                                                $.ajax({
                                                                    url: "./AJAXupdateFundingOrder?funding_order_id="+$funding_order_id,
                                                                    method: "PATCH",
                                                                    data: JSON.stringify({ used_fg: 1, funding_order_status_id: 3 }), // JSON 문자열로 데이터 직렬화 //funding_order_status_id:3 -> 3는 결제완료 의미
                                                                    contentType: "application/json", // Content-Type 헤더 설정 
                                                                    success: function(res){
                                                                        if(res == 1){
                                                                            alert("주문 확정 완료!!");
                                                                            location.href = "./fundingCompletePaymentPage?funding_order_id="+$funding_order_id;
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
                                });

                                
                            }else{
                                alert("결제정보 입력에 실패하였습니다.");
                            }
                        }
                    });

                    
                    

                    
                    });
                
            }else{
                alert("결제에 실패하였습니다. 에러내용: "+rsp.error_msg);
            }
            });
};

function getPaymentBeforeFundingOrder($funding_order_id){
    $.ajax({
        url: "./AJAXgetPaymentBeforeFundingOrder",
        method: "GET",
        data:{funding_order_id:$funding_order_id},
        success: function(res){
            var $rewardGroup = $("div#rewardGroups");
            $.each(res,function(key,value){
                if(key == "price_support"){
                    var price_support = addCommas(value);
                    $("#choiceReward>ul:first-of-type>li:nth-child(2)>b").text(price_support+"원");
                }
                // if(key == ""){
                //     var delivery_price = addCommas(value);
                //     $("#choiceReward>ul:first-of-type>li:nth-child(3)>b").text(delivery_price+"원");
                // }
                if(key == "total_price"){
                    var total_price = addCommas(value);
                    $("#choiceReward>ul:first-of-type>li:last-child>b").text(total_price+"원");
                }
                if(key =="rewardList"){
                    $.each(value,function(index,item){
                        var $ul = $("<ul></ul>");
                        var count;
                        $.each(item,function(key,value){
                            if(key == "fundingRewardDto"){
                                $.each(value,function(key,value){
                                    if(key == "title"){
                                        $("<li class='title'>"+value+"</li>").appendTo($ul);
                                    }
                                    if(key == "itemList"){
                                        var $detail = $("<li class='detail'></li>");
                                        var $itemList = $("<ul></ul>");
                                        $.each(value,function(index,item){
                                            var name;
                                            $.each(item,function(key,value){
                                                if(key == "name"){
                                                    name = value;
                                                }
                                                if(key == "count"){
                                                    $("<li>&#8226; "+name+" "+value+"개</li>").appendTo($itemList);
                                                }
                                            });
                                        });
                                        $detail.append($itemList);
                                        $ul.append($detail);
                                    }

                                    // if(key == "delivery_from"){
                                        
                                    // }
                                });
                            }

                            if(key == "count"){
                                count = value;
                            }

                            if(key == "amount"){
                                var total = count * value;
                                var totalPrice = addCommas(total);
                                $("<li class='total'><span>수량 "+count+"개</span><b>"+totalPrice+"원</b></li>").appendTo($ul);
                            }

                        });

                        $rewardGroup.append($ul);
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


function getUseraddressList(user_id){
    $.ajax({
        url: "./AJAXgetUseraddressList",
        method: "GET",
        data: {user_id:user_id},
        success: function(res){
            if(res != null){

            }
        }
    });
}