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
    .qnaUserSubmit{background-color: #FF6462; height: 20px; width: 80px; border: none; border-radius: 5px; color: #ffffff;  font-family: 'Noto Sans KR', sans-serif; font-weight:400; font-size: 16px;  }
	.companyButton{background-color: #212529; height: 50px; width: 150px; border: none; border-radius: 5px; color: #ffffff;  font-family: 'Noto Sans KR', sans-serif; font-weight:400; font-size: 16px;  }
    .readCompanyButton1{ height: 35px; width: 90px;  border-color: #FF6462; color: #FF6462; border-radius: 5px;   font-family: 'Noto Sans KR', sans-serif; font-weight:400; font-size: 16px; }
    .readCompanyButton2{ height: 35px; width: 90px; border-color: #212529; background-color:#F8F9FA ; border-radius: 5px; color: #212529;  font-family: 'Noto Sans KR', sans-serif; font-weight:400; font-size: 16px; }
    #infoWrap>div>div>p{width: 350px;}
    #infoWrap>div>div>p>span:first-of-type{margin-right: 15px;}







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

                    <div class="row">
                        <div class="col">
                            <div class="accordion accordion-flush" id="accordionFlushExample">
                                <div class="accordion-item">
                                  <h2 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                      Accordion Item #1
                                    </button>
                                  </h2>
                                  <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
                                  </div>
                                </div>
                                <div class="accordion-item">
                                  <h2 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                                      Accordion Item #2
                                    </button>
                                  </h2>
                                  <div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the second item's accordion body. Let's imagine this being filled with some actual content.</div>
                                  </div>
                                </div>
                                <div class="accordion-item">
                                  <h2 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                                      Accordion Item #3
                                    </button>
                                  </h2>
                                  <div id="flush-collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
                                  </div>
                                </div>
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
                            
            
                            
                            <div  class="row">
                                <div class="col"  style="background-color:#F8F9FA; height:320px; border-radius: 3%;">
                                   
                                        <div class="row mt-2" style="height: 60px;">
                                            <div class="col"style="text-align: left;">
                                                <a class="readQnalink" href="./companyManagementMainPage"><i class="bi bi-chevron-left fs-2"></i></a>
                                            </div>
                                            <div class="col-9"></div>
                                            <div class="col mt-1" style="text-align: right;">
                                                <input type="button" class="readCompanyButton1" value="판매자목록" onclick="location.href='./venderListOfCompanyNumberPage?biz_id=${bizData.biz_id }'">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <!--<div class="col-1"></div>-->
                                            <div class="col">
                                                <div class="row"></div>
                                                <div class="row">
                                                    <div class="col textcenter">
                                                        <img src="/resources/companyManagement/companyperson.jpg" alt="대표자" width="200px" height="200px"  style=" border-radius: 30%;">
                                                    </div>
                                                </div>
                                                
                                            </div>
                                            <div class="col" id="infoWrap">
                                                <div class="row"></div>
                                                <div class="row">
                                                    <div class="col mt-2 ">
                                                        <p><span class="companyfont" style="font-weight: bold;">회사명</span><span class="companyfont"> ${bizData.biz_name }</span></p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col mt-2">
                                                        <p><span class="companyfont" style="font-weight: bold;">대표자명</span> <span class="companyfont"> ${bizData.biz_ceo }</span></p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col mt-2 ">
                                                        <p><span class="companyfont" style="font-weight: bold;">사업자번호</span> <span class="companyfont"> ${bizData.biz_no }</span></p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col mt-2">
                                                        <p><span class="companyfont" style="font-weight: bold;">회사전화번호</span> <span class="companyfont">  ${bizData.biz_phone}</span></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col" id="infoWrap">
                                                <div class="row"></div>
                                                <div class="row">
                                                    <div class="col mt-2 ">
                                                        <p><span class="companyfont" style="font-weight: bold;">판매자수</span> <span class="companyfont"> ~명</span></p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col mt-2 ">
                                                        <p><span class="companyfont" style="font-weight: bold;">등록일</span> <span class="companyfont"> <fmt:formatDate pattern="yy. MM. dd. (E)" value="${bizData.created_at }"/></span></p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col mt-2 ">
                                                        <p><span class="companyfont" style="font-weight: bold;">회사위치</span> <span class="companyfont"> 서울강남~</span></p>
                                                    </div>
                                                </div>
                                                <div class="row" >
                                                    <div class="col mt-2"style="height: 44x;" >
                                                        
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col mt-2 ">
                                                       <div class="row">
                                                        <div class="col textcenter"><input type="button"  class="readCompanyButton2" value="수정" onclick="location.href='updateCompanyPage?biz_id=${bizData.biz_id }'"></div>
                                                        <div class="col textcenter"><input type="button"  class="readCompanyButton2" value="삭제" onclick="location.href='updateCompanyPage?biz_id=${bizData.biz_id }'"></div>
                                                        <div class="col textcenter"></div>
                                                       </div>
        
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-1"></div>
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