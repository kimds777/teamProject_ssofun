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
    
    <!--헤더 영역-->
    	<jsp:include page="../../include/fundingHeader.jsp"/>
    	
    	
    	
    	<!--
	   	 <div class="row one">
	            <div class="col">
	                <div class="row">
	                    <div class="col one-2"><p class="one-font">LOGO</p></div>
	                    <div class="col one-1"><p class="one-font">펀딩</p></div>
	                    <div class="col one-1"><p class="one-font">스토어</p></div>
	                    <div class="col-4 one-1"></div>
	                    <div class="col one-1"><a href="../qna/loginPage" class="one-font-1"><p class="one-font">로그인</p></a></div>
	                    <div class="col one-1"><p class="one-font">고객센터</p></div>
	                </div>
	            </div>
	        </div>
	      -->        
	        
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
                                <div class="row"><div class="col"><p class="four-font" id="four-font-default">공지사항</p></div></div>
                                <hr class="hr-1">
                                <div class="row"><div class="col"><a href="../faq/faqMainPage"><p class="four-font" id="four-font-default">자주찾는질문</p></a></div></div>
                                <hr class="hr-1">
                                <div class="row"><div class="col"><p class="four-font" id="four-font-default">이용약관</p></div></div>
                                <hr class="hr-1">
                                <div class="row"><div class="col"><button type="button" class="qnaMainbutton" onclick="location.href='../qna/qnaMain'"><p class="four-font"  id="four-font-active">1:1문의하기</p></button></div></div>
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
                            <div class="col-1">
                            	        <c:if test="${empty data.QnaDto.answer_contents }">
                                    	<input type="button" class="qnabutton" value="답변대기">
                                    	</c:if>
                                    	<c:if test="${!empty data.QnaDto.answer_contents}">
                                    	 <input type="button" class="qnabutton" value="답변완료">
                                    	</c:if>
                            
                            </div>
                            <div class="col-5">
                              
                                <div class="row">
                                    <div class="col"><p class="nine-font" style="margin:0;">${data.QnaDto.title}</p></div>
                                </div>
                                <div class="row"> <div class="col eight-font"><fmt:formatDate pattern="yyyy. MM. dd. (E)" value="${data.QnaDto.created_at }"/></div></div>
                            </div>
                        </div>

     
                        
                        <div class="row mt">
                            <div class="col hr-col"><hr class="hr-1" style="color:darkgrey"></div>
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
                        
                        
                        
                        
                  		<c:if test="${empty data.QnaDto.answer_contents }">
                  			
                  <!-- 글넣을지말지
                  			<div class="row mt-3">
	                            <div class="col-1"><i class="bi bi-chat-square-text fs-2" style="color: #1D212A;  margin-left: 10px;"></i></div>
	                            <div class="col">
	                                <div class="row">
	                                    <div class="col"><p class="nine-font" style="margin:0;">문의내용 확인중입니다.</p></div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="row mt">
	                            <div class="col hr-col"><hr class="hr-1"></div>
	                        </div>
                 	-->
                  		
                  		</c:if>
                  		
                  		
                  		
                  		                        
                  		<c:if test="${!empty data.QnaDto.answer_contents }">
           
              
                            
                              
                        <div class="row">
                        	<div class="col-1"><i class="bi bi-chat-square-text fs-2" style="color: #1D212A;  margin-left: 10px;"></i></div>
                            <div class="col">
                            	<div class="row"><div class="col"><p class="nine-font" style="margin:0;">문의한 내용에 대한 답변입니다.</p></div></div>
                            	<div class="row"><div class="col eight-font"><fmt:formatDate pattern="yyyy. MM. dd. (E)" value="${data.QnaDto.answer_created_at }"/></div></div>
                 
                            </div>
                        </div>

                        <div class="row mt">
                            <div class="col hr-col"><hr class="hr-1" style="color:darkgrey"></div>
                        </div>	
                  				

	                        
	                        <div class="row mt-3">
	                            <div class="col ten-font">
	                                ${data.QnaDto.answer_contents }
	                            </div>
	                        </div>
	                        
		                    <div class="row mt-3">
	                            <div class="col hr-col"><hr class="hr-1"></div>
	                        </div>
                  		</c:if>
       
                    </div>
                </div>
  				<div class="row mt-3">
  					<div class="col"></div>
  				</div>
            </div>
  
        </div>
        <div class="row mt-5">
            <div class="col"> </div>
        </div>
    </div>
    
 
    	<jsp:include page="../../include/fundingFooter.jsp"/>
   
    



<script src="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/js/all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>    
<script src="../../resources/js/logout.js"></script>

</body>
</html>