<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
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
                            <div class="col-2"><p class="three-font mt-1">1:1 문의하기</p></div>
                            <div class="col c-five-font"><p class="five-font mt-2">답변까지 약 2~3일 정도가 소요될 수 있습니다.</p></div>
                            <div class="col-2">
                            <c:if test="${!empty sessionUser }">
                            	<input type="button" class="qnabutton" value="1:1문의"   onclick="location.href='writeQnaPage'">
                            </c:if>
                            </div>
                         
                        </div>
                        <div class="row">
                            <div class="col hr-col"><hr class="hr-1"></div>
                        </div>
                        <div class="row">
                            <div class="col-1"><p class="center1">번호</p></div>
                            <div class="col"><p class="five-font">제목</p></div>
                            <div class="col-2"><p class="center1">작성일</p></div>
                            <div class="col-2"><p class="center1">문의상태</p></div>
                        </div>
                        
                        
                        <div class="row mt-5">
                            <div class="col"><p class="seven-font-1">작성한 1:1 문의 사항이 없습니다.</p></div>
                        </div>
                   
                        

                        <div class="row">
                            <div class="col"><p>페이지네이션</p></div>
                        </div>
                    </div>
                </div>
         
            </div>
  
        </div>
    </div>
	<div class="container">
		<div class="row  mt-5">
			<div class="col"></div>
		</div>
			<div class="row  mt-5">
			<div class="col"></div>
		</div>
	</div>




<script src="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/js/all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>    

     



<script src="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/js/all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>    

</body>
</html>