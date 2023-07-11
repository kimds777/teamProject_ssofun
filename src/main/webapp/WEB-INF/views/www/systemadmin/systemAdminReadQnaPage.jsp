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
                                    <a class="navbar-brand text-black">1:1문의관리</a>
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
                                <div class="col-11"><p class="three-font mt-1">1:1 문의내용</p></div>
                                <div class="col-1"><input type="button" class="qnabutton" value="답변대기"></div>
                                

                            </div>
                            <div class="row">
                                <div class="col hr-col"><hr class="hr-1"></div>
                            </div>

                            
                            <div class="row">
                                <div class="col-1"><p class="center1">번호</p></div>
                                <div class="col"><p class="five-font">제목</p></div>
                                <div class="col-2"><p class="center1">작성자</p></div>
                                <div class="col-2"><p class="center1">작성일</p></div>
                            </div>
                            <div class="row">
                                <div class="col-1"><p class="center1">${data.QnaDto.qna_id}</p></div>
                                <div class="col"><p class="five-font">${data.QnaDto.title}</p></div>
                                <div class="col-2"><p class="center1">${data.QnaDto.user_id}</p></div>
                                <div class="col-2"><p class="center1"><fmt:formatDate pattern="yyyy. MM. dd. (E)" value="${data.QnaDto.created_at }"/></p></div>
                            </div>
                            <div class="row">
                                <div class="col" style="padding: 2px;"><hr style="color: grey; padding: 1px; margin: 3px;"></div>
                            </div>
                            
                            <div class="row mt-3" style="height: 300px;">
                                <div class="col ten-font">
                                    ${data.QnaDto.contents}

                                </div>
                            </div>

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
        
                            </div>

                            <div class="row mt-3">
                                <div class="col hr-col"><hr class="hr-1"></div>
                            </div>



                            <!-- answer_contents값이면 글쓰는 양식나오게 -->
                    
                                <c:if test="${unansweredQna.answer_contents == null }">
                            
                                <form action="./writeQnaAnswerProcess" method="post" enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="col-1"><i class="bi bi-chat-square-text fs-2" style="color: #1D212A;"></i></div>
                                        <div class="col-11"><p class="three-font mt-1">답변작성란</p></div>
                                        <div class="col-1"></div>
                                        
        
                                    </div>
                                    <div class="row">
                                        <div class="col" style="padding: 2px;"><hr style="color: grey; padding: 1px; margin: 3px;"></div>
                                    </div>


                                    <div class="row mt-3">
                                        <div class="col-10"><textarea name="answer_contents" id="answer_contents" class="form-control" placeholder="문의에 대한 답변작성란입니다." id="floatingTextarea2" style="height: 250px; width: 1000px; resize: none;"></textarea></div>    
                                    </div>
                                    

            
                                    <div class="row  mt-5">
                                        <div class="col-1"><p class="six-font">첨부파일</p></div>
                                        <div class="col-10">
                                        <!-- <label for="fileSelect" id="fileSelect" for="input-file">파일첨부</label> -->
                                            <div class="filecustom"><input type="file" name="qnaFiles" id="qna_image_id" multiple accept="image/*"></div> 
                                        </div>    
                                        
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col"></div>
                                        <div class="col-10">
                                            <div class="row"><div class="col"><p class="seven-font">· 5mb이하만 첨부가 가능합니다.</p></div></div>
                                            <div class="row"><div class="col"><p class="seven-font">· 문의 내용과 관련이 없거나 음란 및 불법적인 내용은 답변이 불가능할 수 있습니다.</p></div></div>
                                            <div class="row"><div class="col"><p class="seven-font">· 최대 5개까지의 파일을 첨부할 수 있습니다.</p></div></div>
                                        </div>    
                                        <div class="col"></div>
                                    </div> 

                                    <div class="row mt-3">
                                        <div class="col hr-col"><hr class="hr-1"></div>
                                    </div>  

                                    <div class="row mt-3">
                                        <div class="col divcenter"><input type="submit" id ="qnaUserSubmit" class="qnaUserSubmit" value="등록하기"></div>       
                                    </div> 
                    
                                </form>
                            </c:if>

                            
                            
                            <!-- answer_contents값이 있으면 기존qnaanswer가져오기 -->
                                <c:if test="${unansweredQna.answer_contents != null }">
                                    <div class="row-3">
                                        <div class="col-2 eight-font"><p>${data.QnaDto.user_id}</p></div>
                                    </div>	
                                    <div class="row mt-3">
                                        <div class="col ten-font">
                                            ${data.tb_QnaDto.answer_contents}답변가져오기
                
                                        </div>
                                    </div>
                            </c:if>

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