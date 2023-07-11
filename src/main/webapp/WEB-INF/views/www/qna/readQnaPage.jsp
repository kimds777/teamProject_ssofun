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

    <div class="container container1">
        <div class="row one">
            <div class="col">
                <div class="row">
                    <div class="col one-2"><p class="one-font">LOGO</p></div>
                    <div class="col one-1"><p class="one-font">펀딩</p></div>
                    <div class="col one-1"><p class="one-font">스토어</p></div>
                    <div class="col-4 one-1"></div>
                    <div class="col one-1"><p class="one-font">로그인</p></div>
                    <div class="col one-1"><p class="one-font">고객센터</p></div>
                </div>
            </div>
        </div>
    </div>

    <div class="backgroundcolor">
        <div class="container mb-3">
            <div class="row">
                <div class="col">
                    <div class="row"><div class="col"></div></div>
                    <div class="row mt-5"><div class="col"><p class="two_font mb-0">쏘펀 고객센터입니다.</p></div></div>
                    <div class="row mt-1"><div class="col"><p class="two_font mb-0">어떤 도움이 필요하세요?</p></div></div>
                    <div class="row mt-1">
                        <div class="col-5">
                            <div class="search-bar style" style="background-color: white;">
                                <input type="text" class="search-input" placeholder="자주 찾는 질문을 검색해보세요!" >
                                <button class="search-bar-button"><i class="fas fa-search search-icon" style="color: #000000;"></i></button>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-5"><div class="col"></div></div>
                    <div class="row mb-5"><div class="col"></div></div>
                </div>
            </div>
        </div>
    </div>
    <div class="container mt-4 container2">
        <div class="row">
            <div class="col">
                <div class="row ">
                    <div class="col-2">
                        <div class="row"><div class="col"><p class="three-font mb-3">고객센터</p></div></div>
                        <div class="row">
                            <div class="col borderline">
                                <div class="row"><div class="col"><p class="four-font">공지사항</p></div></div>
                                <hr class="hr-1">
                                <div class="row"><div class="col"><p class="four-font">자주찾는질문</p></div></div>
                                <hr class="hr-1">
                                <div class="row"><div class="col"><p class="four-font">이용약관</p></div></div>
                                <hr class="hr-1">
                                <div class="row"><div class="col" ><p class="four-font">1:1문의하기</p></div></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col borderline mt-4">
                                <div class="row"><div class="col"><p class="four-font">쏘펀 고객센터 안내</p></div></div>
                                <div class="row"><div class="col"><p class="three-font">02-123-7798</p></div></div>
                                <hr class="hr-1">
                                <div class="row"><div class="col"><p class="four-font-1 mb-1">평일(월~금)</p></div></div>
                                <div class="row"><div class="col"><P class="four-font-1 mb-1">· 09:00~18:00운영</P></div></div>
                                <div class="row"><div class="col"><p class="four-font-1 mb-1">휴일(토~일), 공휴일</p></div></div>
                                <div class="row"><div class="col"><P class="four-font-1">· 10:00~15:00운영</P></div></div>
                            </div>
                        </div>  
                    </div>
                    
                    <div class="col-1"></div>
                    
                    <div class="col">
                        <div class="row">
                            <div class="col-2"><p class="three-font mt-1">1:1 문의내용</p></div>
                            <div class="col"></div>

                        </div>
                        <div class="row">
                            <div class="col hr-col"><hr class="hr-1"></div>
                        </div>
                 


                   		<div class="row">
                            <div class="col-1"><input type="button" class="qnabutton" value="답변대기"></div>
                            <div class="col-5">
                              
                                <div class="row">
                                    <div class="col"><p class="nine-font">${data.QnaDto.title}</p></div>
                                </div>
                                <div class="row"></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-2 eight-font"><fmt:formatDate pattern="yyyy. MM. dd. (E)" value="${data.QnaDto.created_at }"/></div>
                        </div>

                        <div class="row mt-3">
                            <div class="col ten-font">
								${data.QnaDto.contents}
								


                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-2 seven-font">첨부파일</div>
                        </div>
                        <div class="row mt-3">
                        
                        	<c:forEach items="${data.Qna_ImageDtoList}" var="d">
	                            <div class="col-2 qnaImage">
	                                <div class="row">
	                                    <div class="col"><img src="/ssofunUploadFiles/${d.link}" width="100px" height="100px"></div>
	                                </div>
	                                <div class="row">
	                                    <div class="col">
	                                        <hr class="hr hr-1">
	                                    </div>
	                                </div>
	                                <div class="row">
	                                    <div class="col mb-2">${d.original_filename }</div>
	                                </div>    
	                            </div>
                            </c:forEach>
     
                        </div>

                        <div class="row mt-3">
                            <div class="col hr-col"><hr class="hr-1"></div>
                        </div>

                        <div class="row mt-3">

                            <div class="col-1"><i class="bi bi-chat-square-text-fill fs-2"></i></div>
                            <div class="col">
                                <div class="row">
                                    <div class="col"><p class="nine-font-1">문의한 내용에 대한 답변입니다.</p></div>
                                </div>
                                <div class="row">
                                    <div class="col eight-font">2023.06.28. 월요일</div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col ten-font">
                                Lorem ipsum dolor sit amet consectetur. A orci in egestas nunc varius sed in a ornare. Ut odio enim nunc fusce eu et. Duis sed aenean in eu duis dui. Sed bibendum ut a ut. Consequat duis condimentum imperdiet nunc in odio. Sed sit malesuada tincidunt posuere tempus sociis nulla mauris. Risus non praesent vitae id orci orci.
                                Malesuada nibh gravida feugiat mi tristique cras amet justo nulla. Ac nunc velit praesent curabitur purus. Habitant et dolor volutpat facilisis ullamcorper sit. Sem ac neque pretium elit arcu ac volutpat. Augue sed eu id duis est. Mauris eget nisl libero et. Ac lectus convallis leo ultrices libero nascetur felis feugiat. Cursus quisque et pellentesque blandit tortor morbi aliquet. Vulputate eu maecenas proin consectetur pellentesque consequat cursus magna nec. Eu cursus purus.
                            </div>
                        </div>
                    </div>
                </div>
         
            </div>
  
        </div>
        <div class="row mt-5">
            <div class="col"> </div>
        </div>
    </div>



<script src="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/js/all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>    


</body>
</html>