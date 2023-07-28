<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${!empty user.user_id}">
			<form action="./communityWriteProcess" method="post">
				작성자: ${user.nickname }<br>
				
				<!-- 게시글 카테고리 선택 -->
				<select name="community_category_id">
			    <option>카테고리타입아이디 선택</option>
			    <c:forEach items="${communityCategoryList}" var="communityCategoryList">
			    <option value="${communityCategoryList.community_category_id}">${communityCategoryList.name}</option>
			    </c:forEach>
			    </select>
			    
				제목: <input type="text" name="title"><br>
				내용: <br>
				<textarea rows="10" cols="60" name="contents"></textarea>
				<br>
				<button>글쓰기</button>	
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





</body>
</html>