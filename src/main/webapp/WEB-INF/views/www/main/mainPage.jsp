<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="java.util.List" %>
<%
  // Jackson ObjectMapper를 사용하여 Java 객체를 JSON 형태로 변환합니다.
  ObjectMapper objectMapper = new ObjectMapper();
  String jsonPctList = objectMapper.writeValueAsString(request.getAttribute("pctlist"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>Insert title here</title>

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

	<jsp:include page="../../include/fundingHeader.jsp" />

	<div class="category-head">
		<div class="search-header-content">
			<div id="categoryMenu" class="category-box">
				<div class=category-btn onmouseover="showCategories()" >
					<i class="bi bi-list"></i> <a href="javascript:;">카테고리</a>
					<div class="categories" >
						<div class="level1"id="categoriesDropdown" onmouseleave="hideCategories()">

							<ul class="shopping-menu-list">
				                <c:forEach items="${pctlist}" var="category">
									<c:if test="${category.this_parent_id eq 0}">
										<li class="li-list" value="${category.product_category_type_id}" onmouseover="showSubcategories('${category.name}')" >${category.name}</li>
									</c:if>
								</c:forEach>

							</ul>

						</div>
						
						<div class="level2" onmouseleave="hideSubcategories()">
				            <ul class="shopping-menu-list">
				                <li class="li-list" onmouseover="showSubcategories('상의')">상의</li>
				                <li class="li-list">하의</li>
				                <li class="li-list">액세서리</li>
				                <c:forEach items="${pctlist}" var="category">
									<c:if test="${category.this_parent_id eq category.product_category_type_id}">
										<li class="li-list" value="${category.product_category_type_id}" onmouseover="showSubcategories('${category.name}')" >${category.name}</li>
									</c:if>
								</c:forEach>
				            </ul>
				        </div>
				        <div class="level3" onmouseleave="hideSubcategories()">
				            <ul class="shopping-menu-list">
				                <li class="li-list">남성 의류</li>
				                <li class="li-list">여성 의류</li>
				                <li class="li-list">아동 의류</li>
				            </ul>
				        </div>
						
					</div>
				</div>
			</div>
		</div>
	</div>



	<div class="banner-a">
<!-- 				<img class="banner-img" src="../../resources/img/banner.jpg"> -->
	</div>

	<div class="container">
		<div class="row">
			<div class="col"></div>
			<div class="col">


				<div class="row">
					<div class="col-ca">카테고리명</div>
				</div>

				<!-- 여기서 반복문 -->
				<div class="row">
					<c:forEach items="${list }" var="product">
						<div class="col-a Image ">
							<a class="baby-product-link"
								href="./productPage?id=${product.product_id }">
								<div class="row">
									<div class="col text-center">
										<img src="/ssofunUploadFiles/${product.thumbnail_name}"
											style="width: 280px; height: 280px;" class="img-rounded">
									</div>
								</div>
								<div class="row r1">
									<div class="row">
										<div class="col-name">
											<p style="font-size: 14px">${product.category_type_name }</p>
										</div>
									</div>
									<div class="row r2">
										<div class="col-ex">${product.product_name }</div>
									</div>
									<div class="row">
										<div class="col">
											<div class="row r3">
												<div class="col-won1 text-end">
													<b><fmt:formatNumber value="${product.price_sale }"
															pattern="#,###원" /></b>
												</div>
												<div class="col-won2">
													<del>
														<fmt:formatNumber value="${product.price }"
															pattern="#,###원" />
													</del>
												</div>
											</div>
										</div>
										<div class="col"></div>
									</div>
								</div>
								<div class="col-review">리뷰</div> <!-- <hr> -->
							</a>
						</div>
					</c:forEach>
				</div>


				<div class="row">
					<div class="col">
						<!-- 페이지네이션 부분 추가 -->
						<div class="pagination jOhOoP">
							<c:choose>
								<c:when test="${currentPage > 1}">
									<a href="?page=${currentPage - 1}" class="previous-button">이전</a>
								</c:when>
								<c:otherwise>
									<span class="previous-button">이전</span>
								</c:otherwise>
							</c:choose>
							<c:forEach begin="1" end="${pageCount}" var="pageNum">
								<c:url value="mainPage" var="pageUrl">
									<c:param name="page" value="${pageNum}" />
								</c:url>
								<c:choose>
									<c:when test="${pageNum eq currentPage}">
										<span class="current-page">${pageNum}</span>
									</c:when>
									<c:otherwise>
										<a href="${pageUrl}" class="page-link">${pageNum}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${currentPage < pageCount}">
									<a href="?page=${currentPage + 1}" class="next-button">다음</a>
								</c:when>
								<c:otherwise>
									<span class="next-button">다음</span>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
			<div class="col"></div>
		</div>
	</div>


	<!-- 푸터 영역 -->
	<jsp:include page="../../include/fundingFooter.jsp" />

	<script>



function showSubcategories(category) {
    var level2 = document.querySelector(".level2");
    var level3 = document.querySelector(".level3");

    if (category === '패션의류') {
        level2.style.display = "block";
        level3.style.display = "none";
    } else if (category === '도서') {
        level2.style.display = "none";
        level3.style.display = "none";
    } else if (category === '식품') {
        level2.style.display = "none";
        level3.style.display = "none";
    }
}

function hideSubcategories() {
    var level2 = document.querySelector(".level2");
    var level3 = document.querySelector(".level3");

    level2.style.display = "none";
    level3.style.display = "none";
}


</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>