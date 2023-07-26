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
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminCompanyManagement.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ssofuncss.css">
    <!-- <script type="text/javascript"> </script>-->






    <title>systemAdminFaqMainPage</title>
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col"><!--상단 네비-->
                <jsp:include page="../include/systemAdminNavi.jsp"></jsp:include>
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
                                <div class="col"><i class="bi bi-clipboard text-light" style="margin-right: 5px;"></i><a
                                        class="leftsidepontstyle1"
                                        href="#">공지사항관리</a></div>
                            </div>
                            <div class="row mt-3">
                                <div class="col"><i class="bi bi-patch-question text-light" style="margin-right: 5px;"></i><a
                                        class="leftsidepontstyle1"
                                        href="../systemadmin/systemAdminFaqMainPage">자주찾는질문관리</a></div>
                            </div>
                            <div class="row mt-3">
                                <div class="col"><i class="bi bi-book-half text-light" style="margin-right: 0px;">

                                </i><a class="leftsidepontstyle1"
                                        href="#">이용약관관리</a></div>
                            </div>
                            <div class="row mt-3">
                                <div class="col"><i class="bi bi-send-check text-light" style="margin-right: 5px;"></i><a
                                        class="leftsidepontstyle1"
                                        href="../systemadmin/systemAdminQnaMainPage">1:1문의관리</a></div>
                            </div>
                            
                        </div>

                    </div>
                </div>


                <div class="col">
                    <div class="row mb-3">
                        <div class="col">
                            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                                <div class="container-fluid">
                                   
                                        <div class="col-2">
                                            <a class="navbar-brand text-black">자주찾는질문관리</a>
                                        </div>
                                        <div class="col">
                                            <input type="button" class="writefaqbutton" value="FAQ글작성"  onclick="location.href='systemAdminWriteFaqPage'">
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
                    <div class="row" style="margin-left: 10px;">
                    
                        <div class="col">
                            

                            <div class="row" style="height: 500px;">
                                <div class="col">
                                    <div class="row">
                                        <div class="col-2"><p class="three-font mt-1" style="margin-left: 10px;">Top10HelpfulFaq</p></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col hr-col"><hr></div>
                                    </div>
                                </div>
                                

                                <div class="col">
                                    <div class="row">
                                        <div class="col-2"><p class="three-font mt-1" style="margin-left: 10px;">Top10HelpfulFaq</p></div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col hr-col"><hr></div>
                                    </div>

                                </div>
                            </div>


                            <div class="row mt-5">
                                <div class="col hr-col"><hr></div>
                            </div>
                           	<div class="row">
                                <div class="col-2"><p class="three-font mt-1" style="margin-left: 10px;">FAQ목록</p></div>
                                <div class="col c-five-font"><p class="five-font mt-2">자주찾는질문 전체목록입니다.(글등록일순)</p></div>
                                <div class="col-2"></div>
                                <div class="col-2">
                            		<input type="button" class="writefaqbutton" value="FAQ글작성"  onclick="location.href='systemAdminWriteFaqPage'">
                            	</div>
                            </div>
                            
                            <div class="row">
                                <div class="col hr-col"><hr class="hr-1"></div>
                            </div>
                            
                            
                            <!-- faq글목록작성하기 -->
                            <div class="row">
                                <div class="col-1"><p class="center1">번호</p></div>
                                <div class="col"><p class="five-font">제목</p></div>
                                <div class="col-2"><p class="center1">작성한관리자</p></div>
                                <div class="col-2"><p class="center1">카테고리</p></div>
                                <div class="col-2"><p class="center1">작성일</p></div>
                            </div>
                            
                            <c:forEach items="${list }" var="map">
                            
	                            <div class="row">
	                                <div class="col-1"><p class="center1">${map.faqDto.faq_id }</p></div>
	                                <div class="col"><p class="five-font"><a class="readFaqlink" href="./systemAdminReadFaqPage?faqId=${map.faqDto.faq_id }">${map.faqDto.title }</a></p></div>
	                                <div class="col-2"><p class="center1">${map.adminDto.login_account}</p></div>
	                                <div class="col-2"><p class="center1">${map.faqDto.faq_category}</p></div>
	                                <div class="col-2"><p class="center1"><fmt:formatDate pattern="yy. MM. dd. (E) HH:mm:ss" value="${map.faqDto.created_at }"/></p></div>
	                            </div>
            
                            </c:forEach>

                        
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