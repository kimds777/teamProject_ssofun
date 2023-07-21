<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			
			제목: ${data.communityDto.title}<br>
			작성자: ${data.userDto.nickname}<br>
			작성일: ${data.communityDto.community_created_at}<br>
			조회수: ${data.communityDto.read_count}<br>
			내용: <br>
			${data.communityDto.contents}<br>
			
			<a href="./communityMainPage">목록으로</a>
			

</body>
</html>