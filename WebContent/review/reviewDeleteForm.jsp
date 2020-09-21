<%@page import="review.vo.ReviewBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int review_num = Integer.parseInt(request.getParameter("review_num"));
String nowPage = request.getParameter("page");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰삭제</title>
</head>
<body>
<form action="ReviewDeletePro.rw?review_num=<%=review_num%>&page=<%=nowPage%>" method="post">
비밀번호 : <input type="password" name="review_pass">
<input type="submit" value="삭제">
<input type="button" value="돌아가기" onclick="history.back()">
</form>
</body>
</html>