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
		작성자: ${sessionUser.nickname }<br>
		제목: <input type="text" name="title"><br>
		내용: <br>
		<textarea rows="10" cols="60" name="contents"></textarea>
		<br>
		<button>글 쓰기</button>	
	</form>




</body>
</html>