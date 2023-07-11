<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

<title>Insert title here</title>

<script type="text/javascript">

	$(document).ready(function (){
	   	   $("#adminloginbutton").on('click', function(){
	   		adminLogin();
	   	   });
	   	});

		function adminLogin(){  
			   $.ajax({
				    type : "post",           // 타입 (get, post, put 등등)
				    url : "systemAdminLoginProcess",           // 요청할 서버url
				    data : {  // 보낼 데이터 (Object , String, Array)
				    	login_account : $("#login_account").val(),
				    	login_password : $("#login_password").val()
				    },
				    success : function(result) { // 결과 성공 콜백함수
				
				    if(result == 1){
				    	
				    	window.open("./systemAdminMainPage","_self","");
				    	alert('관리자로그인되었습니다.');
				      
				    }else {
				    	alert('관리자로그인실패. 아이디와 비밀번호를 확인해주세요.');
				    	window.open("./systemAdminLoginPage","_self","");
				    	}
				    
				    },
				    error : function(request, status, error) { // 결과 에러 콜백함수
		
				        console.log(error)
				    }
			});
	   }

</script>


</head>
<body>
	<div class ="container">

		
		<div class="row mt-5">
			<div class="col"></div>
			<div class="col-6">
				<form action="./systemAdminLoginPage" method="post">
				<div class="row mt-5">
					<div class="col fw-bold fs-1 text-center">관리자로그인</div>	
				</div>
				<div class="row mt-3">
					<div class="col">
						<input class="form-control" type="text" id="login_account" name="login_account" placeholder="관리자아이디">
					</div>
				</div>
				<div class="row mt-2">
					<div class="col">
						<input class="form-control" type="password" id="login_password" name="login_password" placeholder="패스워드">
					</div>
				</div>
				<div class="row mt-3">
					<div class="col d-grid" >
						<button class="btn btn-primary"	id="adminloginbutton">로그인</button>
					</div>
				</div>
				<div class="row mt-2">
					<div class="col d-grid">
						<a href="./registerPage" class="btn btn-outline-primary">회원가입</a>
					</div>
				</div>
				</form>
			</div>
			<div class = "col"></div>
		</div>
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>