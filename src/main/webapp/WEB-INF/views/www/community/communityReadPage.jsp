<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			
			제목: ${data.communityDto.title}<br>
			작성자: ${data.userDto.nickname}<br>
			작성일: <fmt:formatDate value="${data.communityDto.created_at}" pattern="yy.MM.dd"/> <br>
			조회수: ${data.communityDto.read_count}<br>
			내용: <br>
			${data.communityDto.contents}<br>
			
			<br><br>
			<a href="./communityMainPage">목록으로</a>
			
			<c:if test="${!empty user && user.user_id== data.userDto.user_id }">
				<a href="./communityUpdatePage?community_id=${data.communityDto.community_id }">수정</a>
				<a href="./deleteProcess?community_id=${data.communityDto.community_id }">삭제</a>
			</c:if>

			<c:forEach items= "${Commentlist }" var="map">
						${map.userDto.nickname}
						<fmt:formatDate value="${map.communityDto.created_at}" pattern="yy.MM.dd hh:mm"/>
						${map.communityCommentDto.comment}
			</c:forEach>


			<form action="./commentInsertProcess" method="post">
				<div class="form-floating">
		  			<textarea class="form-control" name="comment" placeholder="댓글을 남겨주세요" id="floatingTextarea"></textarea>
		  			<input type="hidden" name ="user_id" value=" ${data.userDto.user_id}">
		  			<input type="hidden" name ="community_id" value=" ${data.communityDto.community_id }">
		  			<input type="submit">
				</div>
			 </form>

       

</body>
</html>