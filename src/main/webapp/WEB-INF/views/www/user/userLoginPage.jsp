<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="../../resources/css/login.css">
</head>
<body>

    <!--헤더 영역 필요없음-->

    <div class="section">
        <h2 id="logo"><a href="../../www/funding/fundingMainPage">SSOFUN</a></h2>
        
        <div id="loginSection">
            <ul id="loginTab">
                <li id="user" class="click">회원 로그인</li>
                <li id="admin">관리자 로그인</li>                
            </ul>
            <p id="cover"></p>
            <ul id="userLogin">
                <li><input type="text" id="email" placeholder="아이디"></li>
                <li><input type="password" id="password" placeholder="비밀번호"></li>
                <li><a href="">로그인 정보를 잊으셨나요?</a></li>
                <li><input type="button" id="userLoginBtn" value="로그인"></li>
            </ul>
            <ul id="userApiLogin">
                <li id="kakao"></li>
                <li id="naver"></li>
                <li id="google"></li>
            </ul>
            <p id="userJoin">아직 쏘펀 계정이 없나요? <a href="./userJoinPage">회원가입</a></p>
            <ul id="adminLogin" class="hide">
                <li><input type="text" id="login_account" placeholder="아이디"></li>
                <li><input type="password" id="login_password" placeholder="비밀번호"></li>
                <li><a href="">로그인 정보를 잊으셨나요?</a></li>
                <li><input type="button" id="adminLoginBtn" value="로그인"></li>
            </ul>
        </div>
    </div>

	<!-- 푸터 영역 필요없음-->
	
    <script src="../../resources/js/login.js"></script>
</body>
</html>