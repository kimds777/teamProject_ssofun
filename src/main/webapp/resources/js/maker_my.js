
$(document).ready(function(){
    var user_id = 1; //세션에서 받아와야함
    var user_creator_id = 1; //세션에서 받아와야함
    
    if(user_creator_id != null){
        getMakerFundingList(user_creator_id);
        getMakerProfile(user_creator_id);
    }

    setEventListener(user_creator_id);



});

function setEventListener(user_id){

    $(document).on("click","#projectBtn",function(e){
        e.stopPropagation();
        window.location.href = "../maker/makerProjectRegisterPage";
    });

    $(document).on("click","#myPageTab>li:first-child",function(e){
        e.stopPropagation();
        window.location.href = "../store/userMyPage";
    });

    $(document).on("click","#myPageTab>li:first-child>a",function(e){
        e.stopPropagation();
        window.location.href = "../store/userMyPage";
    });
    
    $(document).on("click","#myPageTab>li:last-child",function(e){
        e.stopPropagation();
        window.location.href = "../maker/makerMyPage";
    });

    $(document).on("click","#myPageTab>li:last-child>a",function(e){
        e.stopPropagation();
        window.location.href = "../maker/makerMyPage";
    });

    $(document).on("click","#leftBorder>div#list>div.projectWrap>i", function(e) {
        e.stopPropagation();
        $(this).next("span.projectDelete").toggleClass("hide");
      });


}

function getMakerFundingList(user_creator_id){
    $.ajax({
        url: "./AJAXgetMakerFundingList",
        method: "GET",
        data: {user_creator_id:user_creator_id},
        success: function(res){
            if(res != null){
                var length = res.length;
                $("#subTitle>h5>span").html(length);
                $.each(res,function(index,item){
                    var projectWrap = $("<div class='projectWrap'></div>");
                    var a;
                    var ul = $("<ul></ul>");
                    $.each(item,function(key,value){
                        if(key == "funding_id"){
                            $("<i class='bi bi-three-dots-vertical'></i>").appendTo(projectWrap);
                            $("<span class='projectDelete hide'>삭제</span>").appendTo(projectWrap);
                            a = $("<a class='project' href='./makerProjectRegisterPage?funding_id="+value+"'></a>");
                        }

                        if(key == "thumbnailList"){
                            var url;
                            $.each(value,function(index,item){
                                $.each(item,function(key,value){
                                    if(key == "url"){
                                        url = value;
                                    }

                                    if(key == "image_order"){
                                        if(value == 1){
                                            $("<li class='img'><img src='/ssofunUploadFiles/"+url+"' alt=''></li>").appendTo(ul);
                                        }
                                    }
                                });
                            });
                        }

                        if(key == "title"){
                            $("<li class='title'>"+value+"</li>").appendTo(ul);
                        }

                        if(key == "confirm_fg"){
                            if(value == 0){
                                $("<li class='status'>심사 중</li>").appendTo(ul);
                            }else if(value == 1){
                                $("<li class='status'>진행 중</li>").appendTo(ul);
                            }
                        }

                    });
                    ul.appendTo(a);
                    a.appendTo(projectWrap);
                    projectWrap.appendTo("#list");
                });
                divHeightSense();
            }

        }
    });

}

function divHeightSense(){
    var divHight =  $('div#myPageSection').height();
    $('#topBg').height(divHight+160);
    $('#height').height(divHight+160);
}


function getMakerProfile(user_creator_id){
    $.ajax({
        url: "./AJAXgetMakerProfile",
        method: "GET",
        data: {user_creator_id:user_creator_id},
        success: function(res){
            if(res != null){
                $.each(res,function(key,value){
                    if(key == "name"){
                        $("#makerName").html(value+" 창작자님");
                    }
                    if(key == "creator_type"){
                        if(value == 0){
                            $("#biz").html("개인 사업자");
                        }else if(value == 1){
                            $("#biz").html("법인 사업자");
                        }
                    }
                });
            }
        }
    });
}









