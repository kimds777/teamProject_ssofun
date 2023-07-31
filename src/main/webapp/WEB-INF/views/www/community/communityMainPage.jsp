<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	
	/* 페이지네이션 회색으로 색상 변경 */
	.page-link {
	  color: #000; 
	  background-color: #fff;
	  border: 1px solid #ccc; 
	}
	
	.page-item.active .page-link {
	 z-index: 1;
	 color: #555;
	 font-weight:bold;
	 background-color: #f1f1f1;
	 border-color: #ccc;
	 
	}
	
	.page-link:focus, .page-link:hover {
	  color: #000;
	  background-color: #fafafa; 
	  border-color: #ccc;
	} 


	/*검색창 아이콘 설정  */
		.search {
	  position: relative;
	  width: 300px;
	  
	  
	}
	
	.search-icon {
	      color: gray;
	      background-color: transparent;
	      border: none;
	     position : absolute;
		  width: 17px;
		  top: 8px;
		  left: 245px;
		  margin: 0;
			}

	
	/* 글쓰기 버튼 설정  */
	.btn {
	border-radius: 5px; 
	border-color : #BFBBB0;

	}

	/*공지사항 아이콘 색 변경 */
	.bi-bell-fill {
  	color: #FF6462;
	}
	
	/*공지사항 리스트 뒷 배경 설정  */
	.notice-row {
        background-color: #f3f3f3;
    }


</style>


</head>

<body>
	<jsp:include page="../../include/fundingHeader.jsp"/>
		
	
	  <div class="container mb-5" >
		
			<div class ="row">
			 	<div class="col"></div>
			
			<!--사이드 바-->
				<div class="col-2" style="padding-right: 30px;">
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
				
				<!-- 게시판 리스트 -->
				<div class="col-8" style="padding-left: 30px;">
				
					<!-- 시간 계산 -->
					<c:set var="now" value="<%=new java.util.Date()%>" />
					<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" />

					<c:if test="${!empty shopAdmin.admin_id}">
						<a href="./communityNoticeManagePage">공지사항관리</a>
					</c:if>
					
		<table class="table table-hover">
			
			    <thead>
			        <tr>
			            <td>번호</td>
			            <td>카테고리명</td>
			            <td>제목</td>
			            <td>작성자</td>
			            <td>작성일</td>
			            <td>조회수</td>
			        </tr>
			    </thead>
			
			    <tbody>
			        <c:forEach items="${communityNoticeListLimit3}" var="notice">
			            <tr class="notice-row">
			                <td><i class="bi bi-bell-fill"></i></td>
			                <td>공지사항</td>
			                <td>
			                    <a href="./communityNoticeDetailPage?community_notice_id=${notice.communityNoticeDto.community_notice_id}">
			                        ${notice.communityNoticeDto.title}
			                        
			                        <!-- 등록된지 1일 이내일 때 new 나옴 -->
			                        <c:if test="${notice.daysDiff lt 1}">
			                            <img src="../../resources/img/new.png" width="23px"/>
			                        </c:if>
			                    </a>
			                </td>
			                <td>관리자</td>
			                <td>
			                    <fmt:formatDate value="${notice.communityNoticeDto.created_at}" pattern="yy.MM.dd" />
			                </td>
			                <td>${notice.communityNoticeDto.read_count}</td>
			            </tr>
			        </c:forEach>
			      
			
			        <c:forEach items="${list}" var="community">
			            <tr>
			                <td>${community.communityDto.community_id}</td>
			                <td>${community.communityCategoryDto.name}</td>
			                <td>
			                    <a href="./communityReadPage?community_id=${community.communityDto.community_id}">
			                        ${community.communityDto.title}
			                        
			                 
			                        <!-- 댓글 개수 -->
			                       <span class="text-danger small ms-2">
				                        <c:if test="${community.commentCount>0}">
				                           <i class="bi bi-chat-dots"></i> ${community.commentCount}
				                        </c:if>
			                       </span>
			                        
			                   
			                        
			                        <!-- 등록된지 1일 이내일 때 new 나옴 -->
			                        <c:if test="${community.daysDiff lt 1}">
			                            <img src="../../resources/img/new.png" width="23px"/>
			                        </c:if>
			                    </a>
			                </td>
			                <td>${community.userDto.nickname}</td>
			                <td>
			                    <fmt:formatDate value="${community.communityDto.created_at}" pattern="yy.MM.dd" />
			                </td>
			                <td>${community.communityDto.read_count}</td>
			            </tr>
			        </c:forEach>
			    </tbody>
			</table>
		</div>
					<div class="col"></div>
	</div>
			
			
				<!--글쓰기 버튼  -->
				<div class="col-2 ms-auto">
						<a href="./communityWritePage" class="btn btn-fit-text">글쓰기</a>
			 	</div>
			
				<!--페이지네이션 -->
				
				<div class="row mt-5 color: black!important;">
					<div class="col d-flex justify-content-center">
					    <ul class="pagination mb-0">
					      <li class="page-item">
					        <a class="page-link" href="#" aria-label="Previous">
					          <span aria-hidden="true">&laquo;</span>
					        </a>
					      </li>
				      <li class="page-item"><a class="page-link" href="#">1</a></li>
				      <li class="page-item"><a class="page-link" href="#">2</a></li>
				      <li class="page-item"><a class="page-link" href="#">3</a></li>
				      <li class="page-item"><a class="page-link" href="#">4</a></li>
				      <li class="page-item"><a class="page-link" href="#">5</a></li>
				      <li class="page-item">
				        <a class="page-link" href="#" aria-label="Next">
				          <span aria-hidden="true">&raquo;</span>
				        </a>
				      </li>
				    </ul>
				  </div>
			   </div>
			   
			   
				<!-- 검색 -->
		
			    <div class="d-flex justify-content-center">
				    <form action="./communityMainPage" method="get" class="row mt-5 justify-content-center"> 
					      <div class="col-3">
					        <select name="searchType" class="form-select">
					          <option value="title" selected>제목</option>
					          <option value="content">내용</option>
					          <option value="nickname">작성자</option>
					        </select>				
					      </div>
					      <div class="col-9 search">
					      	<div class="input-group">
					        	<input name="searchWord" type="text" class="form-control" placeholder="검색어를 입력하세요">
									<button type="button" class="search-icon">
					 					 <i class="fas fa-search"></i> <!-- 돋보기 아이콘 사용 -->
				          			</button>
				      		</div>
				      	</div>
					</form>
			   </div>
		</div>


		<!-- 푸터 영역 -->
	<jsp:include page="../../include/fundingFooter.jsp"/>


</body>
</html>