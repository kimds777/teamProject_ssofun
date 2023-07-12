<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>Insert title here</title>

<link href="../../resources/css/main.css" rel="stylesheet"
	type="text/css">
<link href="../../resources/css/main.css" rel="stylesheet"
	type="text/css">
<link href="../../resources/css/productPage.css" rel="stylesheet"
	type="text/css">
<link href="../../resources/css/productOrder.css" rel="stylesheet"
	type="text/css">
<link href="../../resources/css/cartPage.css" rel="stylesheet"
	type="text/css">

</head>
<body>

	<jsp:include page="../../include/fundingHeader.jsp"/>
     
	
	<div class="container">
		<div class="row">
			<div class="col"></div>
			<div class="col">
				<div class="row">
				<div class="col">
					<img class="img- fluid banner" src="../../resources/img/banner.jpg">
				</div>
				</div>
				
				<div class="row">
				<div class="col ca">카테고리명</div>
				</div>							
				
				<!-- 여기서 반복문 -->
				<div class="row">
				<c:forEach items="${list }" var="product">
				<div class="col-a Image "><a class="baby-product-link" href="./productPage?id=${product.product_id }">
					<div class="row">
					<div class="col text-center"><img src="/ssofunUploadFiles/${product.thumbnail_name}" style="width:380px; height:380px;" class="img-rounded">
					</div>
					</div>
					<div class="row r1">
						<div class="row">
						<div class="col-name"><p style="font-size:14px">${product.category_type_name }</p></div>
						</div>
						<div class="row r2">
						<div class="col-ex">${product.product_name }</div>
						</div>
						<div class="row">
						<div class="col">
							<div class="row r3">
							<div class="col-won1 text-end"><b><fmt:formatNumber value="${product.price_sale }" pattern="#,###원"/></b></div>						
							<div class="col-won2"><del><fmt:formatNumber value="${product.price }" pattern="#,###원"/></del></div>
						</div>				
						</div>
						<div class="col"></div>
						</div>
					</div>
					<div class="col-review">리뷰</div><!-- <hr> --></a>					
				</div>
				</c:forEach>
				</div>
				
				
				<div class="row">
				<div class="col">zz</div>
				</div>
			</div>
			<div class="col"></div>
		</div>
	</div>
	<div class="row">
		<div class="col-foot">FOOTER(미정)</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>