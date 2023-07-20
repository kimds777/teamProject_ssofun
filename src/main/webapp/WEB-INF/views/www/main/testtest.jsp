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
<link href="../../resources/css/orderListPage.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Document</title>
</head>
<body>
	<jsp:include page="../../include/fundingHeader.jsp" />

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
									<div class="pl-text">
										<span>주문목록</span>
									</div>

									<div class="row">
										<div class="col">
											<c:forEach items="${list}" var="item" varStatus="status">
												<c:if
													test="${status.index == 0 || item.product_order_id != list[status.index - 1].product_order_id}">
													<div class="bigbox">
														<div class="order-title">
															<div class="create-date">
																<fmt:formatDate value="${item.created_at}"
																	pattern="yyyy-MM-dd" />
																주문
															</div>

															<div class="order-detail">
															<a class="order-detail" href="./orderdetailPage?id=${item.product_order_id }">주문 상세보기</a></div>
														</div>
														<c:forEach items="${list}" var="innerItem">
															<c:if
																test="${item.product_order_id eq innerItem.product_order_id}">
																<div class="middlebox">
																	<table>
																		<colgroup>
																			<col width="600">
																			<col width="">
																		</colgroup>
																		<tr>
																			<td class="pa">${innerItem.order_status_name }
																				<div class="img-title">
																					<div class="img">
																						<img
																							src="/ssofunUploadFiles/${innerItem.thumbnail_name}"
																							style="width: 64px; height: 64px;">
																					</div>
																					<div class="npc">
																						<span>${innerItem.product_name }</span>
																						<div class="price-count">
																							<span><fmt:formatNumber
																									value="${innerItem.price_sale }"
																									pattern="#,###원" /></span> <span>${innerItem.count }개</span>
																						</div>
																					</div>
																				</div>
																			</td>
																			<td class="td-btn">
																				<div class="btn-box">
																					<button class="btn-review">리뷰 작성하기</button>
																				</div>
																			</td>
																		</tr>
																	</table>
																</div>
															</c:if>
														</c:forEach>
													</div>
												</c:if>
											</c:forEach>
										</div>
									</div>
								</div>

								<!-- 페이지네이션 부분 수정 -->
								<div class="pagination jOhOoP">
									<c:choose>
										<c:when test="${currentPage > 1}">
											<a href="?page=${currentPage - 1}" class="previous-button">이전</a>
										</c:when>
										<c:otherwise>
											<span class="previous-button">이전</span>
										</c:otherwise>
									</c:choose>

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
