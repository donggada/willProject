<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=request.getParameter("Member_id") %>
<%=request.getParameter("Member_name") %>
<%=request.getParameter("Member_license") %>

<form action="PassupdatePro.me" method="post">
<input type="hidden" value="<%=request.getParameter("Member_license") %>" name="Member_license">
<input type="hidden" value="<%=request.getParameter("Member_name") %>" name="Member_name">
<input type="hidden" value="<%=request.getParameter("Member_id") %>" name="Member_id">
새비밀번호:<input type="text" name="Member_pass"><br>
비밀번호 확인:<input type="text" name="Member_pass1"><br>
<input type="submit" value="확인">
</form>
</body>
</html>