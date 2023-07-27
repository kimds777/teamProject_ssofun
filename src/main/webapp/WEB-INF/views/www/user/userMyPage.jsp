<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="../../resources/CSS/user_my.css"> 
</head>
<body>

    <!--헤더 영역-->
   	<jsp:include page="../../include/fundingHeader.jsp"/>
	
    <div id="topBg"></div>
    <div class="section zIndex">
        <div class="myPage">
            <div class="fakeSection">
                <ul id="myPageTab">
                    <li class="click"><a class="click" href="">서포터</a><i class="bi bi-caret-down-fill click"></i></li>
                    <li><a href="">창작자</a><i class="bi bi-caret-down-fill"></i></li>
                </ul>
            </div>
            
            <div id="myPageSection">
                <div id="profile">
                    <ul id="first">
                        <li id="profileIcon"><span></span></li>
                        <li id="makerName">이지광님</li>
                        <li id="logout">로그아웃</li>
                    </ul>
                    <dl>
                        <dt>나의 쇼핑 내역</dt><!--중분류명 넣으면 됩니다-->
                        <dd><a href="">주문 / 배송조회</a><i class="bi bi-caret-right-fill "></i></dd><!--여기에 메뉴 넣으세요!-->
                        <dd><a href="">주문 / 배송조회</a><i class="bi bi-caret-right-fill"></i></dd><!--여기에 메뉴 넣으세요!-->
                        <dd><a href="">주문 / 배송조회</a><i class="bi bi-caret-right-fill"></i></dd><!--여기에 메뉴 넣으세요!-->
                    </dl>  
                    <dl>
                        <dt>나의 펀딩 내역</dt>
                        <dd class="click"><a class="click" href="./userMyFundingOrderListPage">후원한 프로젝트</a><i class="bi bi-caret-right-fill click"></i></dd>
                        <dd><a href="./userMyFundingLikeListPage">찜한 프로젝트</a><i class="bi bi-caret-right-fill"></i></dd>
                    </dl>                  
                </div>
                <div id="contents">
                    <div id="leftBorder">
                        <div id="subTitle">
                            <h5>후원한 프로젝트</h5>
                        </div>
                        <div id="list"> 
                            <!--리스트 영역-->                           

                        </div>
                    </div>

                </div>
            </div>

        </div>

    <script src="../../resources/JS/user_my.js"></script>
</body>
</html>