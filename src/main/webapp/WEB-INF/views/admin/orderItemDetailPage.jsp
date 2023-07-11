<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="">

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
            <div class="logo">
                <img src="../../resources/dist-assets/images/logo.png" alt="">
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
            </div>
            <div style="margin: auto"></div>
            <div class="header-part-right">
                <!-- Full screen toggle -->
							<c:if test="${empty shopAdmin }">
								<ul class="nav justify-content-end">
									<li class="nav-item"><a class="nav-link"
										href="./loginPage">로그인</a></li>
									<li class="nav-item"><a class="nav-link" href="#">고객센터</a>
									</li>
								</ul>
							</c:if>
							<c:if test="${!empty shopAdmin }">
								<ul class="nav justify-content-end">
									<li class="nav-item"><a class="nav-link" href="#">${shopAdmin.login_account }</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										href="./logoutProcess">로그아웃</a></li>
									<li class="nav-item"><a class="nav-link" href="#">고객센터</a>
									</li>
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
                        <img src="../resources/dist-assets/images/faces/1.jpg" id="userDropdown" alt="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                    <li class="nav-item" data-item="uikits"><a class="nav-item-hold" href="#"><i class="nav-icon i-Library"></i><span class="nav-text">Product</span></a>
                        <div class="triangle"></div>
                    </li>
                    <li class="nav-item" data-item="charts"><a class="nav-item-hold" href="#"><i class="nav-icon i-File-Clipboard-File--Text"></i><span class="nav-text">Order</span></a>
                        <div class="triangle"></div>
                    </li>
                </ul>
            </div>
            <div class="sidebar-left-secondary rtl-ps-none" data-perfect-scrollbar="" data-suppress-scroll-x="true">
                <!-- Submenu Dashboards-->
                <ul class="childNav" data-parent="uikits">
                   <li class="nav-item"><a href="./productInsertPage"><i class="nav-icon i-Split-Horizontal-2-Window"></i><span class="item-name">InsertPage</span></a></li>
                   <li class="nav-item"><a href="./productListPage"><i class="nav-icon i-Split-Horizontal-2-Window"></i><span class="item-name">ListPage</span></a></li>
                   <li class="nav-item"><a href="./productCategoryTypeInsertPage"><i class="nav-icon i-Split-Horizontal-2-Window"></i><span class="item-name">CategoryTypeInsertPage</span></a></li>
                </ul>
                <ul class="childNav" data-parent="charts">
                    <li class="nav-item"><a href="./orderItemInsertPage"><i class="nav-icon i-File-Clipboard-Text--Image"></i><span class="item-name">orderItemInsertPage</span></a></li>
                    <li class="nav-item"><a href="./orderItemListPage"><i class="nav-icon i-File-Clipboard-Text--Image"></i><span class="item-name">orderItemListPage</span></a></li>
          		</ul>
            <div class="sidebar-overlay"></div>
        	</div>
        </div>
        <!-- =============== Left side End ================-->
        <div class="main-content-wrap sidenav-open d-flex flex-column">
            <!-- ============ Body content start ============= -->
                		<!-- 주문상품에 대한 정보 -->
                        <div class="row mb-4">                      	
                            <div class="col-md-6 col-lg-6 mt-4 mb-4">
                                <div class="card text-left">
                                    <div class="card-body">
                                    <h4 class="card-title mb-3">주문상품</h4>
                                        <!-- begin::widget-stats-1-->
                                        <div class="ul-widget1">
                                            <div class="ul-widget__item">
                                                <div class="ul-widget__info">
                                                    <h3 class="ul-widget1__title">No</h3>
                                                </div><span class="ul-widget__desc text-mute">${orderItemDetail.product_order_item_id}</span>
                                            </div>
                                            <div class="ul-widget__item">
                                                <div class="ul-widget__info">
                                                    <h3 class="ul-widget1__title">회사명</h3>
                                                </div><span class="ul-widget__desc text-mute">${orderItemDetail.biz_name}</span>
                                            </div>
                                            <div class="ul-widget__item">
                                                <div class="ul-widget__info">
                                                    <h3 class="ul-widget1__title">카테고리명</h3>
                                                </div><span class="ul-widget__desc text-mute">${orderItemDetail.category_type_name}</span>
                                            </div>
                                            <div class="ul-widget__item">
                                                <div class="ul-widget__info">
                                                    <h3 class="ul-widget1__title">상품명</h3>
                                                </div><span class="ul-widget__desc text-mute">${orderItemDetail.product_name}</span>
                                            </div>
                                            <div class="ul-widget__item">
                                                <div class="ul-widget__info">
                                                    <h3 class="ul-widget1__title">상품이미지</h3>
                                                </div>
                                                <span class="ul-widget__desc text-mute">
                                                <img class="img-fluid img-thumbnail" style="width:75px; height:75px;" src="/ssofunUploadFiles/${orderItemDetail.thumbnail_name}">
                                                </span>
                                            </div>
                                            <div class="ul-widget__item">
                                                <div class="ul-widget__info">
                                                    <h3 class="ul-widget1__title">가격</h3>
                                                </div><span class="ul-widget__desc text-mute">${orderItemDetail.price}</span>
                                            </div>
                                            <div class="ul-widget__item">
                                                <div class="ul-widget__info">
                                                    <h3 class="ul-widget1__title">수량</h3>
                                                </div><span class="ul-widget__desc text-mute">${orderItemDetail.count}</span>
                                            </div>
                                            <div class="ul-widget__item">
                                                <div class="ul-widget__info">
                                                    <h3 class="ul-widget1__title">등록일</h3>
                                                </div><span class="ul-widget__desc text-mute">${orderItemDetail.created_at}</span>
                                            </div>
											<div class="ul-widget__item">
											    <div class="ul-widget__info">
											        <h3 class="ul-widget1__title">진행상태</h3>
											    </div>
												<span class="ul-widget__desc text-mute">
												    <form id="orderStatusForm" action="orderStatusProcess" method="post">
												    	<input type="hidden" name="product_order_item_id" value="${orderItemDetail.product_order_item_id}">												        
												        <input type="submit" name="order_status_name" value="${orderItemDetail.order_status_name}">
												        <input type="hidden" name="orderStatusProcessUrl" value="orderStatusProcess">
												    </form>
												</span>
											</div>
                                        </div>
                                     </div>
                               	</div>
                          	</div>
							<div class="col-md-6 col-lg-6 mt-4 mb-4">
                                <div class="card">
                                    <div class="card-body">
                                    <h4 class="card-title mb-3">고객정보</h4>
                                        <!-- begin::widget-stats-1-->
                                        <div class="ul-widget1">
                                            <div class="ul-widget__item">
                                                <div class="ul-widget__info">
                                                    <h3 class="ul-widget1__title">수령인</h3>
                                                </div><span class="ul-widget__desc text-mute">${orderItemDetail.recipient_name}</span>
                                            </div>
                                            <div class="ul-widget__item">
                                                <div class="ul-widget__info">
                                                    <h3 class="ul-widget1__title">우편번호</h3>
                                                </div><span class="ul-widget__desc text-mute">${orderItemDetail.address_post}</span>
                                            </div>
                                            <div class="ul-widget__item">
                                                <div class="ul-widget__info">
                                                    <h3 class="ul-widget1__title">기본주소</h3>
                                                </div><span class="ul-widget__desc text-mute">${orderItemDetail.address_default}</span>
                                            </div>
                                            <div class="ul-widget__item">
                                                <div class="ul-widget__info">
                                                    <h3 class="ul-widget1__title">상세주소</h3>
                                                </div><span class="ul-widget__desc text-mute">${orderItemDetail.address_detail}</span>
                                            </div>
                                            <div class="ul-widget__item">
                                                <div class="ul-widget__info">
                                                    <h3 class="ul-widget1__title">배송요청사항</h3>
                                                </div><span class="ul-widget__desc text-mute">${orderItemDetail.request_message}</span>
                                            </div>
                                        </div>
                                     </div>
                                   </div>
                                   <c:if test="${orderItemDetail.order_status_name eq '판매자확인완료'}">
                                   <div class="card mt-4">
                                    <div class="card-body">
                                    <h4 class="card-title mb-3">택배사등록</h4>
                                        <!-- begin::widget-stats-1-->
                                        <!-- form태그 -->
                                        <form action="deliveryInsertProcess" method="post">
                                        <div class="ul-widget1">
                                            <div class="ul-widget__item">
                                                <div class="ul-widget__info">
                                                    <h3 class="ul-widget1__title">택배사선택</h3>
                                                </div>
                                                <span class="ul-widget__desc text-mute">
                                                <select name="delivery_company_id" class="form-control form-control-rounded">
                                            		<option>택배사선택</option>
                                                	<option value="1">로젠택배</option>
                                                	<option value="2">CJ대한통운</option>
                                               		<option value="3">한진택배</option>
                                            	</select>
                                                </span>
                                            </div>
                                            <div class="ul-widget__item">
                                                <div class="ul-widget__info">
                                                    <h3 class="ul-widget1__title">운송장번호</h3>
                                                </div>
                                                <span class="ul-widget__desc text-mute">                                                
                                                <input class="form-control" id="invoice_no" name="invoice_no" type="text" placeholder="운송장번호를 입력해주세요." />
                                                <input type="hidden" name="delivery_recipient_id" value="${orderItemDetail.delivery_recipient_id}">
                                                <input type="hidden" name="product_order_item_id" value="${orderItemDetail.product_order_item_id}">
                                                </span>
                                            </div>
                                            <div class="ul-widget__item">
                                                <div class="ul-widget__info">
                                                    <h3 class="ul-widget1__title">등록</h3>
                                                </div>
                                                <span class="ul-widget__desc text-mute">
                                                	<button id="submitDeliveryBtn" class="btn btn-outline-dark m-1" onclick="submitForms()">택배사등록</button>

                                                </span>
                                            </div>
                                        </div>
                                        </form>
                                     </div>
                                  </div>
                               </c:if>        
            			    </div>
            					
            					
      		<!-- end of row-->
            <!-- Footer Start -->
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
<script>
function submitForms() {
  document.getElementById('deliveryForm').submit();
  document.getElementById('orderStatusForm').submit();
}
</script>
</html>