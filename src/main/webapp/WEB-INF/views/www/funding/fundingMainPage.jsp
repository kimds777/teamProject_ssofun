<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩 리스트</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="../../resources/css/funding_Main.css">
<script src="../../resources/js/funding_list.js"></script>
</head>
<body>
    <div class="container text-center">
    
        <!--헤더 영역-->
    	<jsp:include page="../../include/fundingHeader.jsp"/>
    	<div class="section bannerSection">
            <div class="gradient"></div>
            <div class="gradient right"></div>
            <ul id="bannerList">
                <li><a href=""><img src="" alt="">배너 300*450</a></li>
                <li><a href=""><img src="" alt="">배너 300*450</a></li>
                <li><a href=""><img src="" alt="">배너 300*450</a></li>
                <li><a href=""><img src="" alt="">배너 300*450</a></li>
                <li><a href=""><img src="" alt="">배너 300*450</a></li>
                <li><a href=""><img src="" alt="">배너 300*450</a></li>
                <li><a href=""><img src="" alt="">배너 300*450</a></li>
                <li><a href=""><img src="" alt="">배너 300*450</a></li>
                <li><a href=""><img src="" alt="">배너 300*450</a></li>            
            </ul>
        </div>

        <div class="section">
            <div class="row section" id="hotZip">
                <div class="col">
                    <h5 class="row p-0">지금 제일 핫한 펀딩 모음집</h5>
    
                    <div class="row p-0 d-flex" id="sList">
                        <a href="">
                            <ul class="p-0">
                                <li>image 280 x 280</li>
                                <li class="text-start">카테고리</li>
                                <li class="text-start">상품 제목이 1줄이상 넘어가면 이렇게 표시를 하면 되겠습니다. 가나라마바사 아자차카다파하</li>
                                <li class="text-start"><b class="text-danger">152% 달성</b> 12일 남음</li>
                            </ul>
                        </a>
                        <a href="">
                            <ul class="p-0">
                                <li>image 280 x 280</li>
                                <li class="text-start">카테고리</li>
                                <li class="text-start">상품 제목이 1줄이상 넘어가면 이렇게 표시를 하면 되겠습니다. 가나라마바사 아자차카다파하</li>
                                <li class="text-start"><b class="text-danger">152% 달성</b> 12일 남음</li>
                            </ul>
                        </a>
                        <a href="">
                            <ul class="p-0">
                                <li>image 280 x 280</li>
                                <li class="text-start">카테고리</li>
                                <li class="text-start">상품 제목이 1줄이상 넘어가면 이렇게 표시를 하면 되겠습니다. 가나라마바사 아자차카다파하</li>
                                <li class="text-start"><b class="text-danger">152% 달성</b> 12일 남음</li>
                            </ul>
                        </a>
                        <a href="">
                            <ul class="p-0">
                                <li>image 280 x 280</li>
                                <li class="text-start">카테고리</li>
                                <li class="text-start">상품 제목이 1줄이상 넘어가면 이렇게 표시를 하면 되겠습니다. 가나라마바사 아자차카다파하</li>
                                <li class="text-start"><b class="text-danger">152% 달성</b> 12일 남음</li>
                            </ul>
                        </a>

                        <a href="">
                            <ul class="p-0">
                                <li>image 280 x 280</li>
                                <li class="text-start">카테고리</li>
                                <li class="text-start">상품 제목이 1줄이상 넘어가면 이렇게 표시를 하면 되겠습니다. 가나라마바사 아자차카다파하</li>
                                <li class="text-start"><b class="text-danger">152% 달성</b> 12일 남음</li>
                            </ul>
                        </a>
                        <a href="">
                            <ul class="p-0">
                                <li>image 280 x 280</li>
                                <li class="text-start">카테고리</li>
                                <li class="text-start">상품 제목이 1줄이상 넘어가면 이렇게 표시를 하면 되겠습니다. 가나라마바사 아자차카다파하</li>
                                <li class="text-start"><b class="text-danger">152% 달성</b> 12일 남음</li>
                            </ul>
                        </a>
                        <a href="">
                            <ul class="p-0">
                                <li>image 280 x 280</li>
                                <li class="text-start">카테고리</li>
                                <li class="text-start">상품 제목이 1줄이상 넘어가면 이렇게 표시를 하면 되겠습니다. 가나라마바사 아자차카다파하</li>
                                <li class="text-start"><b class="text-danger">152% 달성</b> 12일 남음</li>
                            </ul>
                        </a>
                        <a href="">
                            <ul class="p-0">
                                <li>image 280 x 280</li>
                                <li class="text-start">카테고리</li>
                                <li class="text-start">상품 제목이 1줄이상 넘어가면 이렇게 표시를 하면 되겠습니다. 가나라마바사 아자차카다파하</li>
                                <li class="text-start"><b class="text-danger">152% 달성</b> 12일 남음</li>
                            </ul>
                        </a>
                    </div>
    
                </div>
            </div>
        </div>
	</div>

    <div id="subBanner"><a href=""><img src="" alt="">banner Full x 250</a></div>

    <div class="section">
        <div class="row section" id="recoZip">
            <div class="col">
                <h5 class="row p-0">이런건 어떠세요?</h5>

                <div class="row p-0 d-flex" id="sList">
                    <a href="">
                        <ul class="p-0">
                            <li>image 280 x 280</li>
                            <li class="text-start">카테고리</li>
                            <li class="text-start">상품 제목이 1줄이상 넘어가면 이렇게 표시를 하면 되겠습니다. 가나라마바사 아자차카다파하</li>
                            <li class="text-start"><b class="text-danger">152% 달성</b> 12일 남음</li>
                        </ul>
                    </a>
                    <a href="">
                        <ul class="p-0">
                            <li>image 280 x 280</li>
                            <li class="text-start">카테고리</li>
                            <li class="text-start">상품 제목이 1줄이상 넘어가면 이렇게 표시를 하면 되겠습니다. 가나라마바사 아자차카다파하</li>
                            <li class="text-start"><b class="text-danger">152% 달성</b> 12일 남음</li>
                        </ul>
                    </a>
                    <a href="">
                        <ul class="p-0">
                            <li>image 280 x 280</li>
                            <li class="text-start">카테고리</li>
                            <li class="text-start">상품 제목이 1줄이상 넘어가면 이렇게 표시를 하면 되겠습니다. 가나라마바사 아자차카다파하</li>
                            <li class="text-start"><b class="text-danger">152% 달성</b> 12일 남음</li>
                        </ul>
                    </a>
                    <a href="">
                        <ul class="p-0">
                            <li>image 280 x 280</li>
                            <li class="text-start">카테고리</li>
                            <li class="text-start">상품 제목이 1줄이상 넘어가면 이렇게 표시를 하면 되겠습니다. 가나라마바사 아자차카다파하</li>
                            <li class="text-start"><b class="text-danger">152% 달성</b> 12일 남음</li>
                        </ul>
                    </a>
                </div>

            </div>
        </div>
    </div>

	<!-- 푸터 영역 -->
	<jsp:include page="../../include/fundingFooter.jsp"/>
    
</body>
</html>