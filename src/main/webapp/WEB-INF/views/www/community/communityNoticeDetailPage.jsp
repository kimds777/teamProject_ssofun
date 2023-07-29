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
			공지사항제목: ${data.communityNoticeDto.title}<br>
			공지사항내용: ${data.communityNoticeDto.contents}<br>
			작성일: <fmt:formatDate value="${data.communityNoticeDto.created_at}" pattern="yy.MM.dd"/> <br>
			조회수: ${data.communityDto.read_count}<br>
</body>
</html>