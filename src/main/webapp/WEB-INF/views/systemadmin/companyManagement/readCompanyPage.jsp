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
	.star{margin-top:5px; margin-bottom:0px; color:#FF6462}
	.companyfont{font-family: 'Noto Sans KR', sans-serif; font-weight:400; font-size: 19px; margin-bottom: 0; margin-top:7px; margin-bottom:0px;}	
	.companyfont1{font-family: 'Noto Sans KR', sans-serif; font-weight:400; font-size: 25px; margin-bottom: 0; margin-top:7px; margin-bottom:0px;}	
    .qnaUserSubmit{background-color: #FF6462; height: 50px; width: 150px; border: none; border-radius: 5px; color: #ffffff;  font-family: 'Noto Sans KR', sans-serif; font-weight:400; font-size: 16px;  }
	.companyButton{background-color: #212529; height: 50px; width: 150px; border: none; border-radius: 5px; color: #ffffff;  font-family: 'Noto Sans KR', sans-serif; font-weight:400; font-size: 16px;  }








</style>





    <title>readCompanyPage</title>
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
                                <div class="col"><i class="bi bi-building text-light" style="margin-right: 5px;"></i><a
                                        class="leftsidepontstyle1"
                                        href="#">입점사관리</a></div>
                            </div>
                            <div class="row mt-3">
                                <!-- <div class="col"><i class="bi bi-person-vcard text-light" style="margin-right: 5px;"></i><a
                                        class="leftsidepontstyle1"
                                        href="#">사업자관리</a></div> -->
                            </div>                            
                        </div>
                    </div>
                </div>


                <div class="col">
                    <div class="row mb-3">
                        <div class="col">
                            <nav class="navbar navbar-expand-lg bg-body-tertiary" style="height:54.98px">
                                <div class="container-fluid">
                                   
                                        <div class="col-2">
                                            <a class="navbar-brand text-black">입점사 상세정보</a>
                                        </div>

                                        <div class="col-6 d-flex align-items-center justify-content-end">
                                            
                                            <!-- <form class="d-flex" role="search">
                                                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                                                <button class="btn btn-outline-secondary" type="submit">Search</button>
                                            </form> -->
                                        </div>
                                 
                                </div>
                            </nav>
                        </div>
                    </div>

                    <!--안에 페이지 내용만 바꾸기-->
                    <div class="row" style="margin-left: 10px; height:0px">
                    
                        <div class="col">

                           	<div class="row">
                                <div class="col-2"><p class="three-font mt-1" style="margin-left: 10px;">입점사상세정보</p></div>
                                <div class="col c-five-font"><p class="five-font mt-2">입점사상세정보와 소속판매자정보입니다.</p></div>
                                <div class="col-2"></div>
                                <div class="col-2">
                            		
                            	</div>
                            </div>
                            
                            <div class="row" >
                                <div class="col hr-col"><hr class="hr-1"></div>
                            </div>
                            
                            
                            
                                
                            <div class="row">
                            	<div class="col">
                            		<div class="row" style="background-color:#F8F9FA; height:550px; border-radius: 3%;">
		                            	<div class="col-2"></div>
		                            	<div class="col">
		
											<div class="row mt-3">
		                                        <div class="col"></div>
		                            			<div class="col textcenter" >
		                            				<p class="companyfont1" >Nike</p>
		                            			</div>
		                            			<div class="col"></div>
		                            	
		                            		</div>
		
				                            <div class="row">
		                               			<div class="col hr-col"><hr class="hr-1"></div>
		                           			 </div>
		
		
		                                    <div class="row mt-2">
		                                        <div class="col"></div>
		                                        <div class="col mt-2 textcenter" >
		                                            <img src="/resources/companyManagement/companyperson.jpg" alt="대표자" width="130px" height="130px"  style=" border-radius: 30%;">
		                                        </div>
		                                        <div class="col">

		                                        </div>
		                                    </div>
		                                                                		
		
		

		     		
		                            		<div class="row mt-2">
		                                        <div class="col-2"></div>
		                            			<div class="col textcenter">
		                            				<p class="companyfont">대표자명</p>
		                            			</div>
		                            			<div class="col">
		                                            <p class="companyfont">김다슬 님</p>
		                            			</div>
		                            			<div class="col-2"></div>
		                            		</div>
		                            		
		                            		<div class="row mt-2">
		                                        <div class="col-2"></div>
		                            			<div class="col textcenter">
		                            				<p class="companyfont">사업자번호</p>
		                            			</div>
		                            			<div class="col">
		                            				<p class="companyfont">123-12-12345</p>
		                            			</div>
		                            			<div class="col-2"></div>
		                            		</div>
		                            		
		                            		<div class="row mt-2">
		                                        <div class="col-2"></div>
		                            			<div class="col textcenter">
		                            				<p class="companyfont">회사전화번호</p>
		                            			</div>
		                            			<div class="col">
		                                            <p class="companyfont">010-1234-1234</p>
		                            			</div>
		                            			<div class="col-2"></div>
		                            		</div>
		                            		
		                            		<div class="row mt-2">
		                                        <div class="col-2"></div>
		                            			<div class="col textcenter">
		                                            <p class="companyfont">회사위치</p>
		                            			</div>
		                            			<div class="col">
		                                            <p class="companyfont">강남~</p>                                            
		                            			</div>
		                            			<div class="col-2"></div>
		                            		</div>
		                            		

		                           			
		                           			<div class="row mt-5">
				                            	<div class="col"></div>
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	
				                            	<div class="col textcenter"><input type="button"  class="companyButton" value="목록으로" onclick="location.href='companyManagementMainPage'"></div>
				                            	<div class="col textcenter"><input type="button" class="qnaUserSubmit" value="소속판매자" onclick="location.href='venderListOfCompanyNumberPage'"></div>
				                            	<div class="col"></div>
			                            	</div>
		                            		
		                          		

		                            	</div>
		                            	<div class="col-2"></div>
	                            	</div>
	                            	<div class="row">
	                            	
	                            	</div>
	                            </div>
                            </div>

                            
                            <!-- 
                            <div class="row">
                                <div class="col-1"><p class="center1" style="text-align: center;">입점사번호</p></div>
                                <div class="col"><p class="five-font" style="text-align: center;">회사명</p></div>
                                <div class="col-2"><p class="center1" style="text-align: center;">대표자명</p></div>
                                <div class="col-2"><p class="center1" style="text-align: center;">사업자번호</p></div>
                                <div class="col-1"><p class="center1" style="text-align: center;">사업자수</p></div>
                                                               
                            </div>
                            -->
                            
               			<!--<c:forEach items="${list }" var="map">
                            
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
                    

                    
                    
                </div>
            </div>

            <div class="row mt-5">
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