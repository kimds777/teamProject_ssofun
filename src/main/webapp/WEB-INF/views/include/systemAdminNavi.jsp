<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/systemAdminMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ssofuncss.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminCompanyManagemenet.css">
    <!-- <script type="text/javascript"> </script>-->


    <title>systemAdminNavi</title>
</head>

<body>
<div class="row">
	<div class="col-2">테스트 로그인 상태</div>
	<div class="col-2">user: ${empty user ? "X" : user.nickname }</div>
	<div class="col-2">shopAdmin: ${empty shopAdmin ? "X" : shopAdmin.login_account }</div>
	<div class="col-2">systemAdmin: ${empty systemAdmin ? "X" : systemAdmin.login_account }</div>
	<div class="col-2">로그인</div>
</div>
<div class="row topnavi">
	<div class="col-2">
		<div class="row ">
			
			<div class="col text-center fw-bold fs-5">SSOFUN <span class="site">사이트 관리 </span></div>
		</div>
	</div>
	<div class="col">
		
		<div class="row">
			<div class="col-2 text-center fw-bold">홈</div>
			<div class="col-2 text-center fw-bold"><a href="../../systemadmin/companyManagement/companyManagementMainPage">입점사관리</a></div>
			<div class="col-2 text-center fw-bold"><a href="../../systemadmin/companyManagement/venderManagementMainPage">판매자관리</a></div>
			<div class="col-2 text-center fw-bold">사이트 관리</div>
			<div class="col-2 text-center fw-bold"><a href="../../systemadmin/systemAdminMainPage">고객센터관리</a></div>
		 </div>
		<div class="row"> </div>
	</div>
</div>
 
 <script src="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/js/all.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>

</body>

</html>