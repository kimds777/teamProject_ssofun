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

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ssofuncss.css">
<title>Insert title here</title>



</head>
<body>

    <div class="container container1">
        <div class="row one">
            <div class="col">
                <div class="row">
                    <div class="col one-2"><p class="one-font">시스템관리자페이지</p></div>
                    <div class="col one-1"><p class="one-font"></p></div>
                    <div class="col one-1"><p class="one-font"></p></div>
                    <div class="col-4 one-1"></div>
                    <div class="col one-1"><a href="../qna/loginPage" class="one-font-1"><p class="one-font"></p></a></div>
                    <div class="col one-1"><p class="one-font">로그인</p></div>
                </div>
            </div>
        </div>
    </div>

    <div class="backgroundcolor">
        <div class="container mb-3">
            <div class="row">
                <div class="col">
                    <div class="row"><div class="col"></div></div>
                    <div class="row mt-5"><div class="col"><!--<p class="two_font mb-0">쏘펀 고객센터입니다.</p>--></div></div>
                    <div class="row mt-1"><div class="col"><p class="two_font mb-0">~~~~검색</p></div></div>
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
                        <div class="row"><div class="col"><p class="three-font mb-3">홈페이지관리</p></div></div>
                        <div class="row">
                            <div class="col borderline">
                                <div class="row"><div class="col"><p class="four-font">공지사항</p></div></div>
                                <hr class="hr-1">
                                <div class="row"><div class="col"><p class="four-font">자주찾는질문</p></div></div>
                                <hr class="hr-1">
                                <div class="row"><div class="col"><p class="four-font">이용약관</p></div></div>
                                <hr class="hr-1">
                                <div class="row"><div class="col" ><p class="four-font">1:1문의 관리</p></div></div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-1"></div>
                    
                    <div class="col">
                        <div class="row">
                            <div class="col-2"><p class="three-font mt-1">답변미등록 qna</p></div>
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

                        <div class="row mt-5">
                            <div class="col hr-col"><hr></div>
                        </div>


                        <div class="row">
                            <div class="col-2"><p class="three-font mt-1">답변완료 qna</p></div>
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


</body>
</html>