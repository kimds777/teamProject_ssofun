<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link href="../../resources/css/myPage.css" rel="stylesheet"	type="text/css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Document</title>
</head>
<body>
	<jsp:include page="../../include/fundingHeader.jsp"/>
	
	<div class="container">
		<div class="box-size">
        <div class="row">
            <div class="col-left">
                <div class="my-title">
                    <span class="s-title">MY쏘펀</span>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="myMenu">
                            <div class="myMenu-first">
                                <div class="myMenu-title">My 쇼핑</div>
                                <div class="myMenu-content">
                                    <ul>
                                        <li>주문목록</li>
                                    </ul>
                                </div>
                            </div>

                            <div class="myMenu-first">
                                <div class="myMenu-title">My 활동</div>
                                <div class="myMenu-content">
                                    <ul>
                                        <li>문의하기</li>
                                        <li>문의내역 확인</li>
                                        <li>리뷰관리</li>

                                    </ul>
                                </div>
                            </div>

                            <div class="myMenu-last">
                                <div class="myMenu-title">My 정보</div>
                                <div class="myMenu-content">
                                    <ul>
                                        <li>개인정보확인/수정</li>
                                        <li>문의내역 확인</li>
                                        <li>리뷰관리</li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-middle">
                <div class="middle-top">
                    <ul class="top-box"></ul>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="middle-contents">
                            <div class="product-List">
                                <span>주문목록</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="middle-contents">
                            <div class="product-List">
                                <span>주문목록</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                        
            <div class="col"></div>
        </div>
        </div>
    </div>
	
    
    
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>
