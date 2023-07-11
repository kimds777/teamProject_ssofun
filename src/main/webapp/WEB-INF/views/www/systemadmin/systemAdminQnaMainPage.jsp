<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/systemAdminMain.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ssofuncss.css">
<title>Insert title here</title>



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
                                        href="#">자주찾는질문관리</a></div>
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
                                    <a class="navbar-brand text-black">고객센터메인페이지</a>
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

                    <!--안에 페이지 내용만 바꾸기-->
                    
                    <div class="row"  style="margin-left: 10px;">
                                 
                        <div class="col">
                            <div class="row">
                                <div class="col-2"><p class="three-font mt-1" style="margin-left: 10px;">답변미등록 qna</p></div>
                                <div class="col c-five-font"><p class="five-font mt-2">답변 미등록 qna목록입니다.(ASC)</p></div>
                                <div class="col-2">
                                </div>
                            
                            </div>
                            <div class="row">
                                <div class="col hr-col"><hr class="hr-1"></div>
                            </div>
                            <div class="row">
                                <div class="col-1"><p class="center1">번호</p></div>
                                <div class="col"><p class="five-font">제목</p></div>
                                <div class="col-2"><p class="center1">작성자</p></div>
                                <div class="col-2"><p class="center1">작성일</p></div>
                                <div class="col-2"><p class="center1">문의상태</p></div>
                            </div>
                            
                            <c:forEach items="${getUnansweredQnaList}" var="unansweredQna">
                                <c:if test="${unansweredQna.answer_contents == null }">
                                    <div class="row">
                                        <div class="col-1"><p class="center1" name="qna_id" id="qna_id">${unansweredQna.qna_id }</p></div>
                                        <div class="col"><p class="five-font"><a class="readQnalink" href="./systemAdminReadQnaPage?qna_id=${unansweredQna.qna_id }">${unansweredQna.title }</a></p></div>
                                        <div class="col-2"><p class="center1">${unansweredQna.user_id }</p></div>
                                        
                                        <div class="col-2">
                                            <p class="center1">
                                                <fmt:formatDate pattern="yy. MM. dd. (E) hh:mm:ss" value="${unansweredQna.created_at }"/>
                                            </p>
                                        </div>
                                        <div class="col-2">
                                            <div class="row">
                                                <div class="col"><p class="center1">접수대기</p></div>
                                            </div>
                                        </div>
                                    </div>

                                </c:if>

                            </c:forEach>

                            <div class="row">
                                <div class="col"><p>페이지네이션</p></div>
                            </div>

                            <div class="row mt-5">
                                <div class="col hr-col"><hr></div>
                            </div>


                            <div class="row">
                                <div class="col-2"><p class="three-font mt-1" style="margin-left: 10px;">답변완료 qna</p></div>
                                <div class="col c-five-font"><p class="five-font mt-2">답변완료 qna목록입니다.</p></div>
                                <div class="col-2">


                                </div>
                            
                            </div>
                            <div class="row">
                                <div class="col hr-col"><hr class="hr-1"></div>
                            </div>
                            <div class="row">
                                <div class="col-1"><p class="center1">번호</p></div>
                                <div class="col"><p class="five-font">제목</p></div>
                                <div class="col-2"><p class="center1">작성자</p></div>
                                <div class="col-2"><p class="center1">작성일</p></div>
                                <div class="col-2"><p class="center1">문의상태</p></div>
                            </div>
                            
                            <c:forEach items="${answerCompletedQnaList}" var="answerCompletedQna">
                                <c:if test="${answerCompletedQna.answer_contents != null }">
                                <div class="row">
                                    <div class="col-1"><p class="center1" name="qna_id" id="qna_id">${answerCompletedQna.qna_id }</p></div>
                                    <div class="col"><p class="five-font"><a class="readQnalink" href="./systemAdminReadQnaPage?qna_id=${answerCompletedQna.qna_id }">${answerCompletedQna.title }</a></p></div>
                                    <div class="col-2"><p class="center1">${answerCompletedQna.user_id }</p></div>
                                    
                                    <div class="col-2">
                                        <p class="center1">
                                            <fmt:formatDate pattern="yy. MM. dd. (E) hh:mm:ss" value="${answerCompletedQna.created_at }"/>
                                        </p>
                                    </div>
                                    <div class="col-2">
                                        <div class="row">
                                            <div class="col"><p class="center1">접수대기</p></div>
                                        </div>
                                    </div>
                                </div>
                                </c:if>
                            </c:forEach>
                            

                            <div class="row">
                                <div class="col"><p>페이지네이션</p></div>
                            </div>
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