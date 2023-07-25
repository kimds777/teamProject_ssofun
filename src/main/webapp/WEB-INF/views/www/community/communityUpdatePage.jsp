<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="./communityWriteProcess" method="post">
		작성자: ${user.nickname }<br>
		제목: <input type="text" name="title" value="${data.communityDto.title}"><br>
		내용: <br>
		<textarea rows="10" cols="60" name="contents">${data.communityDto.contents}</textarea>
		<input type="hidden" name="community_id" value="${data.communityDto.community_id}">
		
		
		<br>
		<button>글 수정</button>	
	</form>


</body>
</html>