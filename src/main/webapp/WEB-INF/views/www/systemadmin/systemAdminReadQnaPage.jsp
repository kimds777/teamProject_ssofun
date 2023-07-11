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
                      
                            
                            <div class="col-10">
                              
                                <div class="row">
                                    <div class="col-1"><p class="ten-font">${data.QnaDto.qna_id}</p></div>
                                    <div class="col-8"><p class="nine-font">${data.QnaDto.title}</p></div>
                                    
                                </div>
                                <div class="row"></div>
                            </div>
                            <div class="col-1"><input type="button" class="qnabutton" value="답변대기"></div>
                        </div>
                        <div class="row">
                            <div class="col-2 eight-font"><fmt:formatDate pattern="yyyy. MM. dd. (E)" value="${data.QnaDto.created_at }"/></div>
                            <div class="col-2 eight-font"><p>${data.QnaDto.user_id}</p></div>
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
                        
                        	<c:forEach items="${data.Qna_ImageDtoList}" var="ImageDtoList">
	                            <div class="col-2 qnaImage">
	                                <div class="row">
	                                    <div class="col"><img src="/ssofunUploadFiles/${ImageDtoList.link}" width="50px" height="50px"></div>
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
		                        <div class="row mt-3">
		
		                            <div class="col-1"><i class="bi bi-chat-square-text-fill fs-2"></i></div>
		                            <div class="col">
		                                <div class="row">
		                                    <div class="col"><p class="nine-font-1">답변작성란</p></div>
		                                </div>
		
		                            </div>
		                        </div>

		                        <div class="row mt-3">
		                            <div class="col-10"><textarea name="answer_contents" id="answer_contents" class="form-control" placeholder="문의에 대한 답변작성란입니다." id="floatingTextarea2" style="height: 250px;  resize: none;"></textarea></div>    
		                        </div>
		                        
		                        <div class="row mt-3">
		                            <div class="col hr-col"><hr class="hr-1"></div>
		                        </div>
		
		                        <div class="row  mt-3">
		                            <div class="col"><p class="six-font">첨부파일</p></div>
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