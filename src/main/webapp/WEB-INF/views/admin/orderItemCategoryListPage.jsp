<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" dir="">
<style>

.logo_box{
    margin-left: 20px;
    font-size: 20px;
    font-weight: 750;
}

.home{
    margin-left: 20px;
    font-size: 20px;
    font-weight: 600;
}

.login_box{
    font-size: 14px;
    font-weight: 600;
}

</style>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Dashboard v1 | Gull Admin Template</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet" />
    <link href="../resources/dist-assets/css/themes/lite-purple.css" rel="stylesheet" />
    <link href="../resources/dist-assets/css/plugins/perfect-scrollbar.css" rel="stylesheet" />
</head>

<body class="text-left">
    <div class="app-admin-wrap layout-sidebar-large">
        <div class="main-header">
            <div class="row">
	            <div class="d-flex col p-0">
	                <div class="col-1 logo_box"><a href="./adminMainPage" id="logo" class="fs-3 fw-bold">SSOFUN</a></div>
	            </div>
	        </div>
            <div class="menu-toggle">
                <div></div>
                <div></div>
                <div></div>
            </div>
            <div class="d-flex align-items-center">
                <!-- Mega menu -->
                <!-- / Mega menu -->
                <div class="search-bar">
                    <input type="text" placeholder="Search">
                    <i class="search-icon text-muted i-Magnifi-Glass1"></i>
                </div>
	            <div class="d-flex col p-0">
	                <div class="col-1 home"><a href="./adminMainPage" id="logo" class="fs-3 fw-bold">Home</a></div>
	        	</div>
            </div>
            <div style="margin: auto"></div>
            <div class="header-part-right">
                <!-- Full screen toggle -->
							<c:if test="${empty shopAdmin }">
								<ul class="nav justify-content-end">
									<li class="nav-item login_box"><a class="nav-link" href="./loginPage">로그인</a></li>
									<li class="nav-item login_box"><a class="nav-link" href="#">고객센터</a></li>
								</ul>
							</c:if>
							<c:if test="${!empty shopAdmin }">
								<ul class="nav justify-content-end">
									<li class="nav-item login_box"><a class="nav-link" href="#">안녕하세요.&nbsp;${shopAdmin.login_account }님</a></li>
									<li class="nav-item login_box"><a class="nav-link" href="./logoutProcess">로그아웃</a></li>
									<li class="nav-item login_box"><a class="nav-link" href="#">고객센터</a></li>
								</ul>
							</c:if>
                <i class="i-Full-Screen header-icon d-none d-sm-inline-block" data-fullscreen></i>
                <!-- Grid menu Dropdown -->
                <div class="dropdown">
                    <i class="i-Safe-Box text-muted header-icon" role="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></i>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <div class="menu-icon-grid">
                            <a href="#"><i class="i-Shop-4"></i> Home</a>
                            <a href="#"><i class="i-Library"></i> UI Kits</a>
                            <a href="#"><i class="i-Drop"></i> Apps</a>
                            <a href="#"><i class="i-File-Clipboard-File--Text"></i> Forms</a>
                            <a href="#"><i class="i-Checked-User"></i> Sessions</a>
                            <a href="#"><i class="i-Ambulance"></i> Support</a>
                        </div>
                    </div>
                </div>
                <!-- Notificaiton -->
                <div class="dropdown">
                    <div class="badge-top-container" role="button" id="dropdownNotification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="badge badge-primary">3</span>
                        <i class="i-Bell text-muted header-icon"></i>
                    </div>
                    <!-- Notification dropdown -->
                    <div class="dropdown-menu dropdown-menu-right notification-dropdown rtl-ps-none" aria-labelledby="dropdownNotification" data-perfect-scrollbar data-suppress-scroll-x="true">
                        <div class="dropdown-item d-flex">
                            <div class="notification-icon">
                                <i class="i-Speach-Bubble-6 text-primary mr-1"></i>
                            </div>
                            <div class="notification-details flex-grow-1">
                                <p class="m-0 d-flex align-items-center">
                                    <span>New message</span>
                                    <span class="badge badge-pill badge-primary ml-1 mr-1">new</span>
                                    <span class="flex-grow-1"></span>
                                    <span class="text-small text-muted ml-auto">10 sec ago</span>
                                </p>
                                <p class="text-small text-muted m-0">James: Hey! are you busy?</p>
                            </div>
                        </div>
                        <div class="dropdown-item d-flex">
                            <div class="notification-icon">
                                <i class="i-Receipt-3 text-success mr-1"></i>
                            </div>
                            <div class="notification-details flex-grow-1">
                                <p class="m-0 d-flex align-items-center">
                                    <span>New order received</span>
                                    <span class="badge badge-pill badge-success ml-1 mr-1">new</span>
                                    <span class="flex-grow-1"></span>
                                    <span class="text-small text-muted ml-auto">2 hours ago</span>
                                </p>
                                <p class="text-small text-muted m-0">1 Headphone, 3 iPhone x</p>
                            </div>
                        </div>
                        <div class="dropdown-item d-flex">
                            <div class="notification-icon">
                                <i class="i-Empty-Box text-danger mr-1"></i>
                            </div>
                            <div class="notification-details flex-grow-1">
                                <p class="m-0 d-flex align-items-center">
                                    <span>Product out of stock</span>
                                    <span class="badge badge-pill badge-danger ml-1 mr-1">3</span>
                                    <span class="flex-grow-1"></span>
                                    <span class="text-small text-muted ml-auto">10 hours ago</span>
                                </p>
                                <p class="text-small text-muted m-0">Headphone E67, R98, XL90, Q77</p>
                            </div>
                        </div>
                        <div class="dropdown-item d-flex">
                            <div class="notification-icon">
                                <i class="i-Data-Power text-success mr-1"></i>
                            </div>
                            <div class="notification-details flex-grow-1">
                                <p class="m-0 d-flex align-items-center">
                                    <span>Server Up!</span>
                                    <span class="badge badge-pill badge-success ml-1 mr-1">3</span>
                                    <span class="flex-grow-1"></span>
                                    <span class="text-small text-muted ml-auto">14 hours ago</span>
                                </p>
                                <p class="text-small text-muted m-0">Server rebooted successfully</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Notificaiton End -->
                <!-- User avatar dropdown -->
                <div class="dropdown">
                    <div class="user col align-self-end">
                        <img src="../../resources/img/admin1.jpg" id="userDropdown" alt="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                            <div class="dropdown-header">
                                <i class="i-Lock-User mr-1"></i> Timothy Carlson
                            </div>
                            <a class="dropdown-item">Account settings</a>
                            <a class="dropdown-item">Billing history</a>
                            <a class="dropdown-item" href="signin.html">Sign out</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="side-content-wrap">
            <div class="sidebar-left open rtl-ps-none" data-perfect-scrollbar="" data-suppress-scroll-x="true">
                <ul class="navigation-left">
                    <li class="nav-item" data-item="dashboard"><a class="nav-item-hold" href="#"><i class="nav-icon i-Bar-Chart"></i><span class="nav-text">Dashboard</span></a>
                        <div class="triangle"></div>
                    </li>
                    <li class="nav-item" data-item="uikits"><a class="nav-item-hold" href="#"><i class="nav-icon i-Library"></i><span class="nav-text">Product</span></a>
                        <div class="triangle"></div>
                    </li>
                    <li class="nav-item" data-item="extrakits"><a class="nav-item-hold" href="#"><i class="nav-icon i-Suitcase"></i><span class="nav-text">Order</span></a>
                        <div class="triangle"></div>
                    </li>
                    <li class="nav-item" data-item="charts"><a class="nav-item-hold" href="#"><i class="nav-icon i-File-Clipboard-File--Text"></i><span class="nav-text">Review</span></a>
                        <div class="triangle"></div>
                    </li>
                </ul>
            </div>
            <div class="sidebar-left-secondary rtl-ps-none" data-perfect-scrollbar="" data-suppress-scroll-x="true">
                <!-- Product -->
                <ul class="childNav" data-parent="dashboard">
                    <li class="nav-item"><a href="./adminMainPage"><i class="nav-icon i-Clock-3"></i><span class="item-name">메인페이지</span></a></li>
                </ul>
                <ul class="childNav" data-parent="uikits">
                   <li class="nav-item"><a href="./productInsertPage"><i class="nav-icon i-Split-Horizontal-2-Window"></i><span class="item-name">상품등록페이지</span></a></li>
                   <li class="nav-item"><a href="./productListPage"><i class="nav-icon i-Split-Horizontal-2-Window"></i><span class="item-name">상품리스트페이지</span></a></li>
                   <li class="nav-item"><a href="./productCategoryTypeInsertPage"><i class="nav-icon i-Split-Horizontal-2-Window"></i><span class="item-name">카테고리타입등록페이지</span></a></li>
                </ul>
                <!-- Order -->
                <ul class="childNav" data-parent="extrakits">
                    <li class="nav-item"><a href="./orderItemListPage"><i class="nav-icon i-File-Clipboard-Text--Image"></i><span class="item-name">주문리스트페이지</span></a></li>
          		</ul>
          		<!-- Review-->
                <ul class="childNav" data-parent="charts">
                    <li class="nav-item"><a href="./productReviewListPage"><i class="nav-icon i-File-Clipboard-Text--Image"></i><span class="item-name">상품(리뷰,평점)리스트페이지</span></a></li>
                </ul>
            <div class="sidebar-overlay"></div>
        	</div>
        </div>
        <!-- =============== Left side End ================-->
        <div class="main-content-wrap sidenav-open d-flex flex-column">
            <!-- ============ Body content start ============= -->
                <div class="row mb-4">
                    <div class="col mb-3">
                        <div class="card text-left">
                            <div class="card-body">
                                <h4 class="card-title mb-3 pt-3">주문리스트</h4>
								<div class="row">
								    <div class="col-md-6 form-group mb-3">
								    	<%-- <form action="orderItemCategoryListPage" method="post">
								        <select name="product_order_status_id" class="form-control form-control-rounded">
								            <option>카테고리선택</option>
								            <c:forEach items="${orderStatusList}" var="orderStatusList">
								                <option value="${orderStatusList.product_order_status_id}">${orderStatusList.name}</option>
								            </c:forEach>
								        </select>
								        </form> --%>
								    </div>
								</div>
                                <ul class="nav justify-content-end">
									<li class="nav-item">
									    <a class="nav-link" href="./orderItemCategoryListPage?product_order_status_id=3">결제완료</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="./orderItemCategoryListPage?product_order_status_id=4">판매자확인완료</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="./orderItemCategoryListPage?product_order_status_id=5">배송중</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="./orderItemCategoryListPage?product_order_status_id=6">배송완료</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="./orderItemCategoryListPage?product_order_status_id=7">구매확정</a>
									</li>
								</ul>
								<div class="table-responsive">
								    <table class="table table-striped">
								        <thead>
								            <tr>
								                <th scope="col">#</th>
								                <th scope="col">NO</th>
								                <th scope="col">주문일</th>
								                <th scope="col">고객명</th>
								                <th scope="col">진행상태</th>
								                <th scope="col">상품명</th>
								                <th scope="col">수량</th>
								                <th scope="col">가격</th>
								                <th scope="col">할인가</th>
								            </tr>
								        </thead>
								        	<tbody>
								            	<c:forEach items="${orderItemCategoryList}" var="orderItemCategoryList">
								               		<tr>
								                  		<th scope="row">
								                       		<label class="checkbox checkbox-outline-info">
								                                    <input type="checkbox" checked="" /><span class="checkmark"></span>
								                           	</label>
								                       	</th>
								                        	<td>${orderItemCategoryList.product_order_item_id}</td>
								                            <td><fmt:formatDate value="${orderItemCategoryList.created_at}" pattern="yyyy-MM-dd" /></td>
								                            <td>${orderItemCategoryList.recipient_name}</td>
								                            <td>${orderItemCategoryList.order_status_name}</td>
								                            <td>
								                                <a href="orderItemDetailPage?product_order_item_id=${orderItemCategoryList.product_order_item_id}">${orderItemCategoryList.product_name}</a>
								                            </td>										                										      										    
								                            <td>${orderItemCategoryList.count}</td>
								                            <td>${orderItemCategoryList.price}</td>
								                            <td>${orderItemCategoryList.price_sale}</td>										                										                
								                        </tr>
								              	</c:forEach>
								       		</tbody>
								   		</table>									 
									</div>
                				</div>
                				<!-- 페이징 버튼 -->
									<div id="pagination">
									    <nav aria-label="Page navigation">
									        <ul class="pagination justify-content-center">
									            <!-- 이전 페이지 버튼 -->
									            <li class="page-item" id="prevPage">
									                <a class="page-link" href="#" aria-label="Previous">
									                    <span aria-hidden="true">&laquo;</span>
									                </a>
									            </li>
									            <!-- 장식 -->
									            <li class="page-item">
									                <a class="page-link" href="#" onclick="loadPage(1)">1</a>
									            </li>
									            <li class="page-item">
									                <a class="page-link" href="#" onclick="loadPage(2)">2</a>
									            </li>
									            <li class="page-item">
									                <a class="page-link" href="#" onclick="loadPage(3)">3</a>
									            </li>
									            <li class="page-item">
									                <a class="page-link" href="#" onclick="loadPage(4)">4</a>
									            </li>
									            <li class="page-item">
									                <a class="page-link" href="#" onclick="loadPage(5)">5</a>
									            </li>
									            <li class="page-item">
									                <a class="page-link" href="#" onclick="loadPage(6)">6</a>
									            </li>
									            <li class="page-item">
									                <a class="page-link" href="#" onclick="loadPage(7)">7</a>
									            </li>
									            <li class="page-item">
									                <a class="page-link" href="#" onclick="loadPage(8)">8</a>
									            </li>
									            <li class="page-item">
									                <a class="page-link" href="#" onclick="loadPage(9)">9</a>
									            </li>
									            <li class="page-item">
									                <a class="page-link" href="#" onclick="loadPage(10)">10</a>
									            </li>
									            <!-- 장식 끝 -->
									            <!-- 페이지 번호 버튼 -->
									            <li class="page-item" id="nextPage">
									                <a class="page-link" href="#" aria-label="Next">
									                    <span aria-hidden="true">&raquo;</span>
									                </a>
									            </li>
									        </ul>
									    </nav>
									</div> 
           
                <!-- end of row-->
                <!-- end of main-content -->
            </div><!-- Footer Start -->
            <div class="flex-grow-1"></div>
            <div class="app-footer">
                <div class="row">
                    <div class="col-md-9">
                        <p><strong>Gull - Laravel + Bootstrap 4 admin template</strong></p>
                        <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Libero quis beatae officia saepe perferendis voluptatum minima eveniet voluptates dolorum, temporibus nisi maxime nesciunt totam repudiandae commodi sequi dolor quibusdam
                            <sunt></sunt>
                        </p>
                    </div>
                </div>
                <div class="footer-bottom border-top pt-3 d-flex flex-column flex-sm-row align-items-center">
                    <a class="btn btn-primary text-white btn-rounded" href="https://themeforest.net/item/gull-bootstrap-laravel-admin-dashboard-template/23101970" target="_blank">Buy Gull HTML</a>
                    <span class="flex-grow-1"></span>
                    <div class="d-flex align-items-center">
                        <img class="logo" src="../resources/dist-assets/images/logo.png" alt="">
                        <div>
                            <p class="m-0">&copy; 2018 Gull HTML</p>
                            <p class="m-0">All rights reserved</p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- fotter end -->
        </div>
    </div><!-- ============ Search UI Start ============= -->
    <div class="search-ui">
        <div class="search-header">
            <img src="../resources/dist-assets/images/logo.png" alt="" class="logo">
            <button class="search-close btn btn-icon bg-transparent float-right mt-2">
                <i class="i-Close-Window text-22 text-muted"></i>
            </button>
        </div>
        <input type="text" placeholder="Type here" class="search-input" autofocus>
        <div class="search-title">
            <span class="text-muted">Search results</span>
        </div>
        <div class="search-results list-horizontal">
            <div class="list-item col-md-12 p-0">
                <div class="card o-hidden flex-row mb-4 d-flex">
                    <div class="list-thumb d-flex">
                        <!-- TUMBNAIL -->
                        <img src="../resources/dist-assets/images/products/headphone-1.jpg" alt="">
                    </div>
                    <div class="flex-grow-1 pl-2 d-flex">
                        <div class="card-body align-self-center d-flex flex-column justify-content-between align-items-lg-center flex-lg-row">
                            <!-- OTHER DATA -->
                            <a href="" class="w-40 w-sm-100">
                                <div class="item-title">Headphone 1</div>
                            </a>
                            <p class="m-0 text-muted text-small w-15 w-sm-100">Gadget</p>
                            <p class="m-0 text-muted text-small w-15 w-sm-100">$300
                                <del class="text-secondary">$400</del>
                            </p>
                            <p class="m-0 text-muted text-small w-15 w-sm-100 d-none d-lg-block item-badges">
                                <span class="badge badge-danger">Sale</span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        <!-- PAGINATION CONTROL -->
        <div class="col-md-12 mt-5 text-center">
            <nav aria-label="Page navigation example">
                <ul class="pagination d-inline-flex">
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Previous</span>
                        </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Next</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    <!-- ============ Search UI End ============= -->
    <script src="../resources/dist-assets/js/plugins/jquery-3.3.1.min.js"></script>
    <script src="../resources/dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
    <script src="../resources/dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
    <script src="../resources/dist-assets/js/scripts/script.min.js"></script>
    <script src="../resources/dist-assets/js/scripts/sidebar.large.script.min.js"></script>
</body>

</html>