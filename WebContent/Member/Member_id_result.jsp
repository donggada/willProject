<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
아이디찾기 성공
<%=request.getParameter("findid") %>
<input type="button" value="확인" onclick="location.href='../LoginForm.me'">
</body>
</html>