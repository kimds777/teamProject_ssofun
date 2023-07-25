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






    <title>venderListOfCompanyNumberPage</title>
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
                                <div class="col"><i class="bi bi-person-vcard text-light" style="margin-right: 5px;"></i><a
                                        class="leftsidepontstyle1"
                                        href="../../systemadmin/companyManagement/venderManagementMainPage">판매자관리</a></div>
                            </div>
                            <div class="row mt-3">
                              <!--  <div class="col"><i class="bi bi-person-vcard text-light" style="margin-right: 5px;"></i><a
                                        class="leftsidepontstyle1"
                                        href="#">사업자관리</a></div>
                                         --> 
                            </div>                            
                        </div>
                    </div>
                </div>


                <div class="col">
                    <div class="row mb-3">
                        <div class="col">
                            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                                <div class="container-fluid">
                                   
                                        <div class="col-3">
                                            <a class="navbar-brand text-black">${bizDto.biz_name}판매자관리</a>
                                        </div>
                                        <div class="col">
                                            <input type="button" style="border-radius: 5px;" class="writefaqbutton" value="판매자등록"  onclick="location.href='venderRegistrationPage?biz_id=${bizDto.biz_id }'">
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
                    
                        <div class="col">

                           	<div class="row">
                                <div class="col-2"><p class="three-font mt-1" style="margin-left: 10px;">판매자목록</p></div>
                                <div class="col c-five-font"><p class="five-font mt-2">소속회사에 등록된 판매자전체목록입니다.(등록일순)</p></div>
                                <div class="col-2"></div>
                                <div class="col-2">
                            		
                            	</div>
                            </div>
                            
                            <div class="row">
                                <div class="col hr-col"><hr class="hr-1"></div>
                            </div>
                            
                            
                            <!-- faq글목록작성하기 -->
                            <div class="row"> 
                                <div class="col-1"><p class="center1" style="text-align: center;">판매자번호</p></div>
                                <div class="col-1"><p class="center1" style="text-align: center;">회사번호</p></div>
                                <div class="col-2"><p class="center1" style="text-align: center;">소속회사명</p></div>
                                <div class="col"><p class="five-font" style="text-align: center;">계정명</p></div>
                                <div class="col"><p class="five-font" style="text-align: center;">닉네임</p></div>
                                <div class="col-2"><p class="center1" style="text-align: center;">등록일</p></div>
                                <div class="col-1"><p class="center1" style="text-align: center;">계정상태</p></div>                             
                            </div>
                            
                            <!-- 반복문돌리기 -->
                            <c:forEach items="${adminDtoList}" var="adminDataList">
	                            <div class="row">
	                                <div class="col-1"><p class="center1" style="text-align: center;">${adminDataList.adminDto.admin_id }</p></div>
	                                <div class="col-1"><p class="center1" style="text-align: center;">${adminDataList.bizDto.biz_id }</p></div>
	                                <div class="col-2"><p class="center1" style="text-align: center;">${adminDataList.bizDto.biz_name}</p></div>
	                                <div class="col"><p class="companyfontTitle" style="text-align: center;"><a class="readQnalink" href="./readVenderPage?admin_id=${adminDataList.adminDto.admin_id}">${adminDataList.adminDto.login_account}</a></p></div>
	                                <div class="col"><p class="companyfontTitle" style="text-align: center;">${adminDataList.adminDto.admin_nickname}</p></div>
	                                <div class="col-2"><p class="center1" style="text-align: center;"><fmt:formatDate pattern="yy. MM. dd. (E)" value="${adminDataList.adminDto.created_at }"/></p></div>
	                                
	                                <c:if test="${adminDataList.adminDto.used_fg ==1 }">
	                                	<div class="col-1"><p class="center1" style="text-align: center;"><i class="bi bi-check-circle-fill" style="color:green "></i></p></div>                             
	                            	</c:if>
	                            	<c:if test="${adminDataList.adminDto.used_fg == 0 }">
	                                	<div class="col-1"><p class="center1" style="text-align: center;"><i class="bi bi-check-circle-fill" style="color:#B3B8C3"></i></p></div>   <!-- 다른아이콘 <i class="bi bi-dash-circle"></i>-->                          
	                            	</c:if>
	                            </div>
                            </c:forEach>
                            
               <!-- 		<c:forEach items="${list }" var="map">
                            
	                            <div class="row">
	                                <div class="col-1"><p class="center1">${map.faqDto.faq_id }</p></div>
	                                <div class="col"><p class="five-font"><a class="readFaqlink" href="./systemAdminReadFaqPage?faqId=${map.faqDto.faq_id }">${map.faqDto.title }</a></p></div>
	                                <div class="col-2"><p class="center1">${map.adminDto.login_account}</p></div>
	                                <div class="col-2"><p class="center1">${map.faqDto.faq_category}</p></div>
	                                <div class="col-2"><p class="center1"><fmt:formatDate pattern="yy. MM. dd. (E) HH:mm:ss" value="${map.faqDto.created_at }"/></p></div>
	                            </div>
            
                            </c:forEach> -->             

                        
                        </div>
                    </div>
                    <div class="row mb-5">
                        <div class="col"> </div>
                    </div>
                    
                        <!-- 페이지네이션 -->
			            <div class="row">
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
			            </div>
                    
                    
                    
                </div>
            </div>

            <d iv class="row mt-5">
                <div class="col"> </div>
            </div>
        </div>


    </div>
    <script src="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/js/all.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>

</body>

</html>