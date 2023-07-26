<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@ page import="java.util.List"%>
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
<style>
.test {
	height: 30px;
	margin: 5px 0px;
}

/* Show/hide the categories on hover */
.category-box:hover .categories {
	display: block;
}

.categories {
	width: 150px;
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	z-index: 1;
}

.categories ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.categories li {
	padding: 8px 16px;
	position: relative;
}

/* Style for the subcategories */
.subcategories {
	width: 150px;
	display: none;
	position: absolute;
	left: 100%;
	top: 0;
	background-color: #f9f9f9;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.subcategories ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.subcategories li {
	padding: 8px 16px;
	position: relative;
}

/* Style for the subsubcategories */
.subsubcategories {
	width: 150px;
	display: none;
	position: absolute;
	left: 100%;
	top: 0;
	background-color: #f9f9f9;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.subsubcategories ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.subsubcategories li {
	padding: 8px 16px;
}

.categories li:hover,
.subcategories li:hover,
.subsubcategories li:hover {
	background-color: #f1f1f1;
}
</style>
</head>
<body>
	<jsp:include page="../../include/fundingHeader.jsp" />

	<div class="category-head">
		<div class="search-header-content">
			<div class="category-box">
				<div class="category-btn">
					<i class="bi bi-list"></i> <a href="javascript:;">카테고리</a>
					<div class="categories">
						<ul class="shopping-menu-list">
							<c:forEach items="${pctlist}" var="category">
								<c:if test="${category.this_parent_id eq 0}">
									<li class="li-list" value="${category.product_category_type_id}">
										${category.name}
										<!-- Subcategories -->
										<div class="subcategories">
											<ul>
												<c:forEach items="${pctlist}" var="subcategory">
													<c:if test="${subcategory.this_parent_id eq category.product_category_type_id}">
														<li>${subcategory.name}
															<!-- Subsubcategories -->
															<div class="subsubcategories">
																<ul>
																	<c:forEach items="${pctlist}" var="subsubcategory">
																		<c:if test="${subsubcategory.this_parent_id eq subcategory.product_category_type_id}">
																			<li>${subsubcategory.name}</li>
																		</c:if>
																	</c:forEach>
																</ul>
															</div>
														</li>
													</c:if>
												</c:forEach>
											</ul>
										</div>
									</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="banner-a">
		<!-- 배너 이미지 -->
	</div>

	<!-- 푸터 영역 -->
	<jsp:include page="../../include/fundingFooter.jsp" />

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>

	<script>
	$(document).ready(function() {
		// Show/hide the categories on hover for both the category button and menu items
		$(".category-box").hover(function() {
			$(".categories").css("display", "block");
		}, function() {
			$(".categories").css("display", "none");
		});

		$(".shopping-menu-list li").hover(function() {
			$(this).find(".subcategories").css("display", "block");
		}, function() {
			$(this).find(".subcategories").css("display", "none");
		});

		$(".subcategories li").hover(function() {
			$(this).find(".subsubcategories").css("display", "block");
		}, function() {
			$(this).find(".subsubcategories").css("display", "none");
		});
	});
	</script>
</body>
</html>
