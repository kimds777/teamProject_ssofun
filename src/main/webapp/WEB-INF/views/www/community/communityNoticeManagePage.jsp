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