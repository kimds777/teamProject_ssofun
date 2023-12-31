
$(document).ready(function(){

    setEventListener();

});

function setEventListener(){

    $(document).on("click","#snsJoin>ul>li#kakao",function(e){
        e.stopPropagation();
        loginWithKakao();
    });

    $(document).on("click","div#emailJoin>ul>li:nth-child(6)>span>input",function(e){
        e.stopPropagation();

        $("#emailJoin>ul>li:nth-child(6)>span>input").removeClass("click");
        $(this).addClass("click");
    });

    $(document).on("blur","input#email",function(e){
        e.stopPropagation();

        $("#emailJoin>ul>li:first-child>p").remove();

        var email = $("input#email").val();
        var emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;

        if (!emailRegex.test(email) && email != "") {
            return alert("이메일 형식을 다시 확인해주세요.");
        }else{
            return emailCheck(email);
        }

    });

    $(document).on("blur","input#password",function(e){
        e.stopPropagation();

        var password = $("input#password").val();
        var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,}$/;
        var passwordCheck = $("input#passwordCheck").val();
        
        if(password != ""){
            $("#emailJoin>ul>li:nth-child(3)>p").remove();
            if(!passwordPattern.test(password)){
                $("#emailJoin>ul>li:nth-child(3)").append("<p class='impossibility'>최소 8자 이상, 대문자, 소문자, 숫자, 특수문자 포함 필수</p>");
            }
        }else if(password != "" && passwordCheck != ""){

            $("#emailJoin>ul>li:nth-child(3)>p").remove();
    
            if(password != passwordCheck){
                $("#emailJoin>ul>li:nth-child(3)").append("<p class='impossibility'>비밀번호 불일치 :(</p>");
            }else{
                if(!passwordPattern.test(password)){
                    $("#emailJoin>ul>li:nth-child(3)").append("<p class='impossibility'>최소 8자 이상, 대문자, 소문자, 숫자, 특수문자 포함 필수</p>");
                }else{
                    $("#emailJoin>ul>li:nth-child(3)").append("<p class='available'>비밀번호 일치 :)</p>");
                }
            }
        }
    });

    $(document).on("blur","input#passwordCheck",function(e){
        e.stopPropagation();

        
        var password = $("input#password").val();
        var passwordCheck = $("input#passwordCheck").val();
        var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,}$/;
        
        if(password != "" && passwordCheck != ""){

            $("#emailJoin>ul>li:nth-child(3)>p").remove();
            
            if(password != passwordCheck){
                $("#emailJoin>ul>li:nth-child(3)").append("<p class='impossibility'>비밀번호 불일치 :(</p>");
            }else{
                if(!passwordPattern.test(password)){
                    $("#emailJoin>ul>li:nth-child(3)").append("<p class='impossibility'>최소 8자 이상, 대문자, 소문자, 숫자, 특수문자 포함 필수</p>");
                }else{
                    $("#emailJoin>ul>li:nth-child(3)").append("<p class='available'>비밀번호 일치 :)</p>");
                }
            }
        }


    });

    $(document).on("blur","input#nickname",function(e){
        e.stopPropagation();

        $("#emailJoin>ul>li:nth-child(5)>p").remove();

        var nickname = $("input#nickname").val();

        if(nickname != ""){
            nicknameCheck(nickname);
        }
    })
    
    
    $(document).on("click","input#userJoinSubmitBtn",function(e){
        e.stopPropagation();
        
        var email = $("input#email").val();
        var name = $("input#name").val();
        var password = $("input#password").val();
        var passwordCheck = $("input#passwordCheck").val();
        var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,}$/;

        var birth = $("input#birth").val();
        var nickname = $("input#nickname").val();
        var gender = $("input.gender.click").index();
        var agree_sms = $("input#agree_sms").is(":checked");

        if(email == ""){
            return alert("이메일을 입력해주세요.");
        }
        if(name == ""){
           return alert("이름을 입력해주세요.");
        }
        if(password == ""){
           return alert("비밀번호를 입력해주세요.");
        }
        if(passwordCheck == ""){
           return alert("비밀번호 확인을 입력해주세요.");
        }        
        if (!passwordPattern.test(password)) {
            return alert("비밀번호는 최소 8자 이상, 대문자와 소문자, 숫자, 특수문자를 포함해야합니다.");
        }
        if(password != passwordCheck){
            return alert("비밀번호가 일치하지않습니다. 다시 확인해주세요.");
        }
        if(birth == ""){
           return alert("생년월일을 선택해주세요.");
        }
        if(nickname == ""){
           return alert("닉네임을 입력해주세요.");
        }
        if(!agree_sms){
            return alert("필수약관을 체크해주세요.");
        }

        if(gender == -1){
            gender = 2;
        }

        insertEmailJoin(email,name,password,gender,birth,nickname,1);

    });



}


var popup;

// 카카오 로그인 처리 함수
function loginWithKakao(){

    $.ajax({
        url: "./AJAXkakaoLogin",
        method: "GET",
        success: function(res) {

            // 새 창을 띄우는 팝업 창 옵션
            var popupOptions = "width=450,height=500,scrollbars=yes,resizable=no";

            // 팝업 창을 띄웁니다. (window.open() 메서드를 호출하여 새로운 창을 엽니다.)
            popup = window.open("./kakaoOauthPage", "KakaoLoginPopup", popupOptions);

            // popup.addressFromParent = res;

            // 자식 창으로 바로 주소로 이동
            popup.location.href = res;

        },
        error: function(err) {
            // 에러 처리
            console.error(err);
        }
    });    
}

function checkKakaoUser(access_token){
    popup.close();

    $.ajax({
        url: "./AJAXcheckKakaoUser",
        method: "GET",
        data: {access_token:access_token},
        success: function(res){
            if(res != null){
                window.location.href = res;
            }
        }
    });
}

function insertEmailJoin(email,name,password,gender,birth,nickname,agree_sms){
    $.ajax({
        url: "./AJAXinsetEmailJoin",
        method: "POST",
        contentType: "application/json",
        data: JSON.stringify({email:email,name:name,password:password,gender:gender,birth:birth,nickname:nickname,agree_sms:agree_sms}),
        success: function(res){
            if(res != 0){
                window.location.href = "http://localhost:8181/www/user/userJoinSuccessPage?user_id="+res;
            }
        }
    });
}

function emailCheck(email){
    $.ajax({
        url: "./AJAXemailCheck",
        method: "GET",
        data: {email:email},
        success: function(res){
            if(res != null){
                if(res == 1){
                    $("#emailJoin>ul>li:first-child").append("<p class='available'>사용 가능한 이메일입니다 :)</p>");
                }else if(res == 2){
                    $("#emailJoin>ul>li:first-child").append("<p class='impossibility'>사용 불가능한 이메일입니다:(</p>");
                }
            }
        }
    });
}

function nicknameCheck(nickname){
    $.ajax({
        url: "./AJAXnicknameCheck",
        method: "GET",
        data: {nickname:nickname},
        success: function(res){
            if(res!=null){
                if(res == 1){
                    $("#emailJoin>ul>li:nth-child(5)").append("<p class='available'>사용 가능한 닉네임입니다 :)</p>");
                }else if(res == 2){
                    $("#emailJoin>ul>li:nth-child(5)").append("<p class='impossibility'>사용 불가능한 닉네임입니다:(</p>");
                }
            }
        }
    });
}