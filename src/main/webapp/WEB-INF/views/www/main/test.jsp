<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
.category-box-1{
	width: 650px;
}
.level1 {
    display: none;
    /* level1의 스타일 추가 */
  }

  .level2,
  .level3 {
    display: none;
    /* level2와 level3의 스타일 추가 */
  }

  .hide {
    display: none;
  }
</style>
</head>
<body>
	<jsp:include page="../../include/fundingHeader.jsp" />

	<div class="category-head">
		<div class="search-header-content">
			<div id="categoryMenu" class="category-box">
				<div class=category-btn  >
					<i class="bi bi-list"></i> <a href="javascript:;">카테고리</a>
					<div class="categories" >
						<div class="level1" >

							<ul class="shopping-menu-list">
				                <c:forEach items="${pctlist}" var="category">
									<c:if test="${category.this_parent_id eq 0}">
										<li class="li-list" value="${category.product_category_type_id}"  >${category.name}</li>
									</c:if>
								</c:forEach>

							</ul>

						</div>
						
						<div class="level2" >
				            <ul class="shopping-menu-list">
				                
				       				            </ul>
				        </div>
				        <div class="level3" >
				            <ul class="shopping-menu-list">
				                
				            </ul>
				        </div>
						
					</div>
				</div>
			</div>
		</div>
	</div>


	

	<div class="banner-a">
		<!--         <img class="banner-img" src="../../resources/img/banner.jpg"> -->
	</div>

	<!-- 푸터 영역 -->
	<jsp:include page="../../include/fundingFooter.jsp" />


	<script>

	// 마우스를 카테고리에 올렸을 때 level1 내용을 보여주는 함수
	  function showSubcategories(categoryName) {
	    // 모든 level1 요소를 숨깁니다.
	    var level1Elements = document.querySelectorAll('.level1');
	    level1Elements.forEach(function (element) {
	      element.style.display = 'none';
	    });

	    // 마우스로 올린 카테고리에 해당하는 level1 요소를 보여줍니다.
	    var level1Element = document.querySelector('.level1[data-category="' + categoryName + '"]');
	    if (level1Element) {
	      level1Element.style.display = 'block';
	    }
	  }

	  // 마우스가 카테고리에서 벗어났을 때 level1 내용을 숨기는 함수
	  function hideSubcategories() {
	    var level1Elements = document.querySelectorAll('.level1');
	    level1Elements.forEach(function (element) {
	      element.style.display = 'none';
	    });
	  }

	  // 이벤트 리스너를 등록하여 마우스 이벤트를 처리합니다.
	  document.addEventListener('DOMContentLoaded', function () {
	    var categoryItems = document.querySelectorAll('.li-list');
	    categoryItems.forEach(function (item) {
	      item.addEventListener('mouseover', function () {
	        var categoryName = this.getAttribute('data-category');
	        showSubcategories(categoryName);
	      });
	      item.addEventListener('mouseout', hideSubcategories);
	    });
	  });
    </script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>
