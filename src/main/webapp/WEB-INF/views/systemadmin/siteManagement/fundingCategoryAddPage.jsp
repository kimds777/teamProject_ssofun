<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/systemAdminMain.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ssofuncss.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminCompanyManagement.css">
    <!-- <script type="text/javascript"> </script>-->
	<style>

	</style>





    <title>fundingCategoryAddPage</title>
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col"><!--상단 네비-->
                <jsp:include page="../../include/systemAdminNavi.jsp"></jsp:include>
            </div>
        </div>





        <!--고객센터 기본 틀 -->
        <div class="container mt-4 container2">

            <div class="row">
                <div class="col-2">
                    <div class="row leftside1">
                        <div class="col">
                            <div class="row" style="height: 30px;"></div>
                            <div class="row" style="height: 100px;">
                                <div class="col"></div>
                                <div class="col">
                                    <div class="box adminimagecol"><img class="adminimage"></div>
                                </div>
                                <div class="col"></div>
                            </div>
                            <div class="row mt-1 adminid">
                                <div class="col">관리자아이디</div>
                            </div>
                            <div class="row mb-3"></div>
                        </div>
                    </div>
                    <div class="row leftside2 ">
                        <div class="col leftsidefontstyle1">NAVIGATION</div>
                    </div>
                    <div class="row leftside3">
                        <div class="col-1"></div>
                        <div class="col">

    
               
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="row">
                                        <div class="col">
                                            <i class="bi bi-arrow-through-heart-fill text-light" style="margin-right: 5px;"></i>
                                            <a class="leftsidepontstyle1" href="../../systemadmin/siteManagement/fundingManagementPage">펀딩사이트</a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-1"></div>
                                        <div class="col">
                                            <!--<i class="bi bi-arrow-through-heart-fill text-light" style="margin-right: 5px;"></i>-->
                                            <a class="leftsidepontstyle1" href="../../systemadmin/siteManagement/fundingManagementPage">- 승인관리</a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-1"></div>
                                        <div class="col">
                                            <!--<i class="bi bi-arrow-through-heart-fill text-light" style="margin-right: 5px;"></i>-->
                                            <a class="leftsidepontstyle1" href="../../systemadmin/siteManagement/fundingCategoryAddPage">- 카테고리관리<a>
                                        </div>
                                    </div>   
                                </div>  
                            </div>


                            <div class="row mt-3">
                                <div class="col"><i class="bi bi-cart4 text-light" style="margin-right: 5px;"></i><a class="leftsidepontstyle1" href="../../systemadmin/companyManagement/companyManagementMainPage">쇼핑몰사이트</a>
                                    <div class="row">
                                        <div class="col-1"></div>
                                        <div class="col">
                                            <a class="leftsidepontstyle1" href="../../systemadmin/companyManagement/companyManagementMainPage">- 승인관리</a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-1"></div>
                                        <div class="col">
                                            <a class="leftsidepontstyle1" href="../../systemadmin/companyManagement/companyManagementMainPage">- 카테고리관리</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                              <!--  <div class="col"><i class="bi bi-person-vcard text-light" style="margin-right: 5px;"></i><a
                                        class="leftsidepontstyle1"
                                        href="#">사업자관리</a></div>
                                         --> 
                            </div>                            
                        </div>
                        <div class="col-1"></div>
                    </div>
                </div>


                <div class="col">
                    <div class="row mb-2">
                        <div class="col">
                            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                                <div class="container-fluid">
                                   
                                        <div class="col-2">
                                            <a class="navbar-brand text-black">카테고리관리</a>
                                        </div>
                                        <div class="col">
                                            <!--<p class="five-font mt-2">펀딩관리페이지입니다.</p>-->
                                            
                                        </div>
                                        <div class="col-6 d-flex align-items-center justify-content-end">
                                            
                                            <form class="d-flex" role="search">
                                                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                                                <button class="btn btn-outline-secondary" type="submit">Search</button>
                                            </form>
                                        </div>
                                 
                                </div>
                            </nav>
                        </div>
                    </div>

                    <!--안에 페이지 내용만 바꾸기-->
                    <div class="row" style="margin-left: 10px; height:1000px">
                    
                        <div class="col" style="padding-left: 0px;">
		
                            <form action="../fundingCategoryAddProcess"  method="post">

                           	<div class="row" style="padding-left: 0px;">
                                <div class="col-7" style="padding-left: 0px;"><!--<p class="three-font mt-1" style="margin-left: 5px;">미승인된 펀딩목록</p>--></div>
                                <div class="col c-five-font"></div>
                                <div class="col-2" style="text-align: right;"><input type="submit" class="writefaqbutton" value="카테고리추가"   style="border-radius: 5px;"></div>
                            
                            </div>
                      
                                <div class="row mt-2">
                                    <div class="col"  style="background-color:#F8F9FA; height:100px; border-radius: 3%; margin-right: 5px;">
                                        <div class="row" >
                                            <div class="col-1">
                                                
                                             
                                            </div>
                                            <div class="col">
                                             
            
                                                <div class="row mt-2">
                                                   
                                                    <div class="col textcenter">
                                                        <p class="companyfont">아이콘등록</p>
                                                    </div>
                                                    <div class="col mt-2">
                                                        <input type="file" name="qnaFiles" id="name" multiple accept="image/*">
                                                    </div>
                                                </div>
                                                      
                                                <div class="row mt-2">
                                                    
                                                    <div class="col-3 textcenter">
                                                        <p class="companyfont">아이콘명</p>
                                                    </div>
                                                    <div class="col">
                                                        <input type="text" name="name" class="form-control"  aria-label="companyName">
                                                    </div>
                                                </div>
            
                                            </div>
                                            <div class="col-1"></div>
                                        </div>
                                    </div>
                      
                                </div>
    
                                </form>

                                <div class="row">
                                    <div class="col hr-col"><hr class="hr-1"></div>
                                </div>

                                <div class="row mt-2">
                                    <div class="row" style="padding-left: 0px;">
                                        <div class="col-2" style="padding-left: 0px; margin-left: 10px;"><p class="three-font mt-1" style="margin-left: 5px;">카테고리목록</p></div>
                                        <div class="col-7" style="padding-left: 0px;"><!--<p class="three-font mt-1" style="margin-left: 5px;">미승인된 펀딩목록</p>--></div>
                                        <div class="col c-five-font"></div>
                                       
                                    </div>
                                </div>

                                <div class="row mt-1" style="margin-left: 10px;">
                                    <!--이미지반복문돌리기-->
									
									<c:forEach items="${fundingCategoryList }" var="list">
                                    <div class="col-1 mt-2 qnaImage">
                                        <div class="row" style="text-align: center;">
                                            <div class="col mt-2"><img src="/ssofunUploadFiles/${d.link}" width="60px" height="60px"></div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <hr class="hr hr-1">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col mb-3" style="text-align: center;"><p class="companyfont" style="margin-top: 0px;">${list.name }</p></div>
                                        </div>    
                                    </div>
                                    </c:forEach>

                                </div>

                            
                            </div>














                      







                    
		                    <div class="row mb-5">
		                        <div class="col"> </div>
		                    </div>
	                    
	                        <!-- 페이지네이션 -->
				            <!--<div class="row">
				            	<div class="col"></div>
				            	<div class="col">
					            	<nav aria-label="Page navigation example">
									  <ul class="pagination">
									    <li class="page-item">
									      <a class="page-link" href="#" aria-label="Previous">
									        <span aria-hidden="true">&laquo;</span>
									      </a>
									    </li>
									    <li class="page-item"><a class="page-link" href="#">1</a></li>
									    <li class="page-item"><a class="page-link" href="#">2</a></li>
									    <li class="page-item"><a class="page-link" href="#">3</a></li>
									    <li class="page-item"><a class="page-link" href="#">4</a></li>
									    <li class="page-item"><a class="page-link" href="#">5</a></li>
									    <li class="page-item"><a class="page-link" href="#">6</a></li>
									    <li class="page-item"><a class="page-link" href="#">7</a></li>
									    <li class="page-item"><a class="page-link" href="#">8</a></li>
									    <li class="page-item"><a class="page-link" href="#">9</a></li>
									    <li class="page-item"><a class="page-link" href="#">10</a></li>
									    <li class="page-item">
									      <a class="page-link" href="#" aria-label="Next">
									        <span aria-hidden="true">&raquo;</span>
									      </a>
									    </li>
									  </ul>
									</nav>
								</div>
								<div class="col"></div>
				            </div>-->
	                    
                    
		            
		                </div>
		            </div>
				</div>
            <div class="row mt-5">
                <div class="col"> </div>
            </div>
        </div>

    	</div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/js/all.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>

</body>

</html>