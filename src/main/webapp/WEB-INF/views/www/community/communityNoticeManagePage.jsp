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
<title>Insert title here</title>
</head>
<body>
					<table class="table table-hover">
					    <thead>
					        <tr>
					            <td>공지사항번호</td>
					            <td>공지사항 제목</td>
					            <td>공지사항 내용</td>
					            <td>작성일</td>
					        </tr>
					    </thead>
					
					    <tbody>
					        <c:forEach items="${communityNoticeList}" var="map">
					            <tr>
					                <td>${map.communityNoticeDto.community_notice_id}</td>
					                <td>
					                    <a href="./communityNoticeDetailPage?community_notice_id=${map.communityNoticeDto.community_notice_id}">
					                        ${map.communityNoticeDto.title}
					                    </a>
					                </td>
					                <td>${map.communityNoticeDto.contents}</td>
					                <td>
					                    <fmt:formatDate value="${map.communityNoticeDto.created_at}" pattern="yy.MM.dd" />
					                </td>
					            </tr>
					        </c:forEach>
					    </tbody>
					</table>
</body>
</html>