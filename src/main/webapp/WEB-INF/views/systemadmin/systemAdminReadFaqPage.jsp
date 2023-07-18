<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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




<title>Insert title here</title>
</head>
<body>
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
                <!--왼쪽사이드바-->
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
                                    <a class="navbar-brand text-black">자주찾는질문관리</a>
                                    <form class="d-flex" role="search">
                                        <input class="form-control me-2" type="search" placeholder="Search"
                                            aria-label="Search">
                                        <button class="btn btn-outline-secondary"
                                            type="submit">Search</button>
                                    </form>
                                </div>
                            </nav>
                        </div>
                    </div>


                    <div class="row" style="margin-left: 10px;">
                    <!--안에 페이지 내용만 바꾸기-->
                    
                 
                   
	        
	                    <div class="col">
                           
                            <div class="row">
                                <div class="col-11"><p class="three-font mt-1">FAQ상세글보기</p></div>
                      
                                

                            </div>
                            <div class="row">
                                <div class="col hr-col"><hr class="hr-1"></div>
                            </div>

                            
                            <div class="row">
                                <div class="col-1"><p class="center1">번호</p></div>
                                <div class="col"><p class="five-font">제목</p></div>
                                <div class="col-2"><p class="center1">작성한관리자</p></div>
                                <div class="col-2"><p class="center1">카테고리</p></div>
                                <div class="col-2"><p class="center1">작성일</p></div>
                            </div>
                            <div class="row">
                                <div class="col-1"><p class="center1">${faqData.faqDto.faq_id}</p></div>
                                <div class="col"><p class="five-font">${faqData.faqDto.title}</p></div>
                                <div class="col-2"><p class="center1">${faqData.adminDto.login_account}</p></div>
                                <div class="col-2"><p class="center1">${faqData.faqDto.faq_category}</p></div>
                                <div class="col-2"><p class="center1"><fmt:formatDate pattern="yyyy. MM. dd. (E)" value="${faqData.faqDto.created_at }"/></p></div>
                            </div>
                            <div class="row">
                                <div class="col" style="padding: 2px;"><hr style="color: grey; padding: 1px; margin: 3px;"></div>
                            </div>
                            
                            <div class="row mt-3" style="height: 600px;">
                                <div class="col ten-font">
                                    ${faqData.faqDto.contents}

                                </div>
                            </div>
 <%--
                            <div class="row mt-3">
                                <div class="col-2 seven-font">첨부파일</div>
                            </div>
                            <div class="row mt-3">
                            
                               <c:forEach items="${data.Qna_ImageDtoList}" var="ImageDtoList">
                                    <div class="col-2 qnaImage">
                                        <div class="row">
                                            <div class="col"><img src="/ssofunUploadFiles/${ImageDtoList.link}" width="100px" height="100px"></div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <hr class="hr hr-1">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col mb-2">${ImageDtoList.original_filename }</div>
                                        </div> 
                                    </div>
                                    
                                    
                                </c:forEach>
        
                            </div>--%> 
                            
                            <div class="row mt-3">
                                <div class="col hr-col"><hr class="hr-1"></div>
                            </div>
                            
                            <div class="row mt-2">
                            	<div class="col-3"></div>
                            	<div class="col">
                            		<input type="hidden" name="faq_id" value="${faqData.faqDto.faq_id}">
                                	<div class="col divcenter"><input type="button" id ="qnaUserSubmit" class="qnaUserSubmit" value="FAQ목록으로" onclick="location.href='./systemAdminFaqMainPage'"></div>     
                          		</div>

                          		<div class="col">
                          			<input type="hidden" name="qna_id" value="${faqData.faqDto.faq_id}">
                                	<div class="col divcenter"><input type="button" id ="qnaUserSubmit" class="qnaUserSubmit" value="FAQ수정" onclick="location.href='./systemAdminFaqUpdatePage?faqId=${faqData.faqDto.faq_id}'"></div>
                          		</div>
                          		<div class="col">
                            		<input type="hidden" name="faq_id" value="${faqData.faqDto.faq_id}">
                                	<div class="col divcenter"><input type="button" id ="qnaUserSubmit" class="qnaUserSubmit" value="FAQ삭제" onclick="location.href='./systemAdminFaqDeleteProcess?faqId=${faqData.faqDto.faq_id}'"></div>       
                          		</div>
                            	<div class="col-3"></div>
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