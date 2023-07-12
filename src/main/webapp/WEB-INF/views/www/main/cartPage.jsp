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
<link href="../../resources/css/cartPage.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>Document</title>
</head>
<body>

	<jsp:include page="../head/topNavi.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<div class="col"></div>
			<div class="col">
				<div class="row">
					<div class="col-title">장바구니</div>
				</div>
				<div class="row">
					<div class="col-contents">
						<hr>
						<div class="row">
							<div class="col-customer">

								<table class="customer-table">
									<tr>
										<td class="all-event-check"><input type="checkbox"
											id="allCheck" onclick="toggleAllChecks()"></td>
										<td class="td-image"></td>
										<td class="td-productInfo">상품정보</td>
										<td class="td-price">판매가</td>
										<td class="td-quantity">수량</td>
										<td class="td-shipping">배송비</td>
										<td class="td-total">합계</td>
										<td class="td-delete"></td>
									</tr>
									
									<c:forEach items="${list}" var="item" varStatus="status">
										<c:set var="subtotal" value="${item.price * item.total_count}"></c:set>
										<tr>
											<td class="event-check"><input type="checkbox"
												class="itemCheck" onclick="toggleItemCheck()"></td>
											<td class="td-image"><img
												src="/ssofunUploadFiles/${item.thumbnail_name}"
												style="width: 75px; height: 75px;"></td>

											<td class="td-productInfo">
												<div class="product-name">${item.product_name}</div>

												<div class="cart-price">
													<div class="option-select">
														<div class="button_quantity">
															<span class="custom-element">
																<button class="prod-quantity__plus"
																	onclick="changeQuantity('+', 'prod-quantity-${status.index + 1}', ${status.index})">+</button>
																<input type="text"
																id="prod-quantity-${status.index + 1}"
																value="${item.total_count}" class="prod-quantity__input"
																min="1" maxlength="6" autocomplete="off"
																onchange="updateCount(${status.index})">
																<button class="prod-quantity__minus"
																	onclick="changeQuantity('-', 'prod-quantity-${status.index + 1}', ${status.index})">-</button>
															</span>
														</div>
													</div>

													<div class="option-price">
														<fmt:formatNumber value="${subtotal}" type="number"
															pattern="#,###원" />
													</div>
												</div>
											</td>

											<td class="td-price"><fmt:formatNumber
													value="${item.price}" type="number" pattern="#,###원" /></td>
											<td class="td-quantity" id="td-quantity-${status.index + 1}">
												<span id="item-count-${status.index + 1}">${item.total_count}</span>
											</td>

											<td class="td-shipping">무료</td>
											<td class="td-total"><fmt:formatNumber
													value="${subtotal}" type="number" pattern="#,###원" /></td>
											<td class="td-delete"><a
												href="./deleteCartProcess?user_id=${item.user_id}&product_id=${item.product_id}">
													<i class="bi bi-x-square" style="font-size: 1rem;"></i>
											</a></td>
										</tr>
									</c:forEach>



									<tr>
										<td colspan="8">
											<div class="cart-total-price">
												<div class="row">
													<div class="col-price">총 상품가격</div>
													<div class="col-shipping">총 배송비</div>
													<div class="col-sale">총 할인</div>
													<div class="col-total">총 주문금액</div>
												</div>
												<div class="row">
													<div class="col">총 상품가격</div>
													<div class="col">+</div>
													<div class="col">총 배송비</div>
													<div class="col">-</div>
													<div class="col">총 할인</div>
													<div class="col">총 주문금액</div>
												</div>
											</div>
										</td>
									</tr>
								</table>


							</div>
						</div>
					</div>


				</div>


			</div>
			<div class="col"></div>
		</div>
	</div>

	<script>
		//체크박스
		function toggleAllChecks() {
			var allCheck = document.getElementById('allCheck');
			var itemChecks = document.getElementsByClassName('itemCheck');

			for (var i = 0; i < itemChecks.length; i++) {
				itemChecks[i].checked = allCheck.checked;
			}
		}

		function toggleItemCheck() {
			var allCheck = document.getElementById('allCheck');
			var itemChecks = document.getElementsByClassName('itemCheck');

			var isAnyUnchecked = false;

			for (var i = 0; i < itemChecks.length; i++) {
				if (!itemChecks[i].checked) {
					isAnyUnchecked = true;
					break;
				}
			}

			allCheck.checked = !isAnyUnchecked;
		}

		// +,- 수량 변경
		function changeQuantity(operation, inputId) {
			var input = document.getElementById(inputId);
			var value = parseInt(input.value);

			if (operation === "+") {
				value += 1;
			} else if (operation === "-") {
				value -= 1;
			}

			if (value < 1) {
				alert("1개 이상부터 구매하실 수 있습니다.");
				value = 1; // 최소값인 1로 설정
			}

			input.value = value.toString();
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>