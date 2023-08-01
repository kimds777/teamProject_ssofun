<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.16.0/font/bootstrap-icons.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script src="../../resources/js/logout.js"></script>
	
    
    <title>커뮤니티</title>
	
		 <style>
		 
			 @import url('https://fonts.googleapis.com/css2?family=Inter&display=swap');
			*{margin: 0; padding: 0; list-style: none; box-sizing: border-box; font-family: 'Inter', sans-serif; font-weight: 400;}
				body{position: relative;}
			
			/* 페이지 전체 사이즈 설정  */
			.section {
			    width: 1200px;
			    margin: 0 auto;
			    }
		 
			 /*게시물 설정  */
			 .col-10 .title {
			    border-top: 1px solid black;
			    font-size: 1.5rem;
			    font-weight: bold;
			    background-color: #f3f3f3;
			    padding: 20px 0;
			     padding-left: 10px;
				}
			 
		 
				.col-10 .author{
			   	 background-color: #f3f3f3;
			   	  padding: 5px 0;
			   	  padding-left: 10px;
			   } 
		   
			 .col-10 .read-count {
			    border-bottom: 1px solid #ccc;
			     background-color: #f3f3f3;
			     padding-left: 10px;
			    display: flex;
				}
			 
			 	
			 .col-10 .contents {
			    border-bottom: 1px solid black;
			    height: 400px; 
			    padding: 30px 0;
			    padding-left: 10px;    
			   
				 }
		 
		 /* 목록으로 돌아가기 버튼  */
		 .back-list{
		  padding: 30px 0;
		 }
		 
			 /*배너 설정  */
			.img-fluid{
			margin-bottom: 70px;
			
			}
			/*수정-삭제 버튼 설정  */
			.modification-delete{
		  	padding: 30px 0;
		 		}
		 		
		 	.modification{
		 	
		 	}
		 
		 </style>   
	  
	 
</head>

<body>
<jsp:include page="../../include/fundingHeader.jsp"/>
<img src="../../resources/img/jangsoyeon/banner.jpg" class="img-fluid" alt="">	

				<div class ="section">
					<div class="container">
						<div class ="row">
						
			 				<!--사이드 바-->
						<div class="col-2" style="padding-right: 30px; padding-left: 0px">
							<div class="card">
					        	<div class="card-header">
					          		커뮤니티
					        	</div>
					        <ul class="list-group list-group-flush">
					          <li class="list-group-item"> 
					            <c:forEach items="${communityCategoryList}" var="communityCategoryList">
					              <div><a href="./communityCategoryPage?community_category_id=${communityCategoryList.community_category_id}">${communityCategoryList.name}</a></div>
					            </c:forEach>
					          </li>
					        </ul>
					      </div>
						</div>
					
					
					<!-- 게시글 상세페이지  -->
					
					<div class="col-10" style="padding-left: 30px;">
					
					<div class="title">${data.communityDto.title}</div>
				    <div class="author">${data.userDto.nickname}</div>
				    
				    <!-- 여기에 하단 테두리 추가 -->
				    <div class="read-count"><fmt:formatDate value="${data.communityDto.created_at}" pattern="yyyy.MM.dd"/>
				     <span style="margin-left: 20px;">
					        <i class="bi bi-eye">${data.communityDto.read_count}</i>
					   </span>   
					 </div>
					        
					<!-- 내용 -->
					<div class="contents">${data.communityDto.contents}</div>
					
					<div class ="row">
						<div class ="col-2">
							<div class = "back-list"><a href="./communityMainPage">목록으로</a></div>
						</div>
						<div class ="col-2"></div>
						<div class ="col-2"></div>
						<div class ="col-2"></div>
						<div class ="col-2"></div>
						<div class ="col-2 modification-delete">
						<c:if test="${!empty user && user.user_id == data.userDto.user_id}">
								<span class ="modification">
							    	<a href="./communityUpdatePage?community_id=${data.communityDto.community_id}">수정</a>
							    </span>
							    <span class ="delete">
							    	<a href="./deleteProcess?community_id=${data.communityDto.community_id}">삭제</a>
							    </span>
							</c:if> 
						</div>
						
		              </div>
				
					
					
					
					<form action="./commentInsertProcess" method="post" class="row g-3">
					    <div class="col-md-9 col-lg-8">
					        <label for="articleComment" hidden>댓글</label>
					        <textarea class="form-control" name="comment" placeholder="댓글을 남겨주세요" id="floatingTextarea" rows="3" required></textarea>
					        <input type="hidden" name="user_id" value="${data.userDto.user_id}">
					        <input type="hidden" name="community_id" value="${data.communityDto.community_id}">
					    </div>
					    <div class="col-md-3 col-lg-4">
					        <button class="btn btn-primary" id="comment-submit" type="submit">댓글 작성</button>
					    </div>
					</form>
					
					<ul id="article-comments" class="row col-md-10 col-lg-8 pt-3">
					               
					                <!-- 댓글 리스트 출력 -->
					                <c:forEach items="${Commentlist}" var="map">
					                    <li>
					                        <div class="row">
					                            <div class="col-md-12">
					                                ${map.userDto.nickname}
					                            </div>
					                            <div class="col-md-12">
					                                <fmt:formatDate value="${map.communityDto.created_at}" pattern="yy.MM.dd hh:mm"/>
					                            </div>
					                            <div class="col-md-12">
					                                ${map.communityCommentDto.comment}
					                            </div>
					                        </div>
					                    </li>
					                </c:forEach>
					            </ul>
						</div>
					</div>
				</div>
				
		<!-- 푸터 영역 -->
	<jsp:include page="../../include/fundingFooter.jsp"/>



</body>
</html>
