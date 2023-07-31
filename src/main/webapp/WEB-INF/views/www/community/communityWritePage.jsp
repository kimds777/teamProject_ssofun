<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.16.0/font/bootstrap-icons.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script src="../../resources/js/logout.js"></script>
	<!-- Summernote 라이브러리 추가 -->
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css">
</head>


<body>
<jsp:include page="../../include/fundingHeader.jsp"/>
		
			<main role="main" class="container">
			  <c:choose>
			    <c:when test="${!empty user.user_id}">
			      <form action="./communityWriteProcess" method="post">
			      
			        <!-- 게시글 카테고리 선택 -->
			        <select name="community_category_id">
			          <option>카테고리타입아이디 선택</option>
			          <c:forEach items="${communityCategoryList}" var="communityCategoryList">
			            <option value="${communityCategoryList.community_category_id}">${communityCategoryList.name}</option>
			          </c:forEach>
			        </select>
			        <div class="pt-1">
			          <input type="text" name="title" placeholder="제목을 입력하세요" style="border-radius:5px; width: 100%; padding:5px;">
			        </div>
			        <div class="container">
			          <textarea class="summernote" name="contents"></textarea>
			        </div>
			        
			        
			        
			   <script>
				    $(document).ready(function() {
				        $('.summernote').summernote({
				            placeholder: '내용을 입력해주세요',
				            tabsize: 2,
				            height: 300
				        });
				
				        $('form').submit(function(event) {
				            // Summernote의 내용을 일반 텍스트로 변환하여 textarea의 값으로 설정
				            var summernoteContent = $('.summernote').summernote('code');
				            $('.summernote').val(summernoteContent);
				        });
				    });
			</script>

			        <div class="text-end">
			          <button class="btn btn-success" type="submit" style="width: 10%; padding: 5px;">제출</button> 
			        </div>
			      </form>
			    </c:when>
			    
			    
			    <c:when test="${!empty shopAdmin.admin_id}">
			      <form action="./communityWriteProcess" method="post">
			        제목: <input type="text" name="title"><br>
			        내용: <br>
			        <textarea rows="10" cols="60" name="contents"></textarea>
			        <br>
			        <button>글쓰기</button>
			      </form>
			    </c:when>
			  </c:choose>
			</main>
			
			
			
			</body>
			</html>
