<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<title>Insert title here</title>

</head>
<body>
	<jsp:include page="../../include/fundingHeader.jsp"/>
	
<table class= "table" border="1">

	<tr>
		<td>글번호</td>
		<td>제목</td>
		<td>조회수</td>
		<td>작성자</td>
		<td>작성일</td>
	</tr>
	<c:forEach items= "${list }" var="map">
	
		<tr>
			<td>${map.communityDto.community_id} </td>
			<td><a href="./communityReadPage?community_id=${map.communityDto.community_id} }">${map.communityDto.title}</a> </td>
			<td>${map.communityDto.read_count} </td>
			<td>${map.userDto.nickname} </td>
			<td>${map.communityDto.community_created_at} </td>	
		</tr>
	</c:forEach>
</table>

	


	<c:if test="${!empty user}">
		<a href="./communityWritePage">글쓰기</a>
	</c:if>



</body>
</html>