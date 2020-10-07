<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
<form action="deleteInfoPro.if" method="post">
<table border="1">
<tr>
<th colspan="2">회원탈퇴</th>
</tr>
<tr>
<th>비밀번호 입력</th><td><input type="password" name="pass"></td>
</tr>
<tr>
<td colspan="2">
<input type="submit" value="확인"><input type="button" value="취소" onclick="javascript:history.back()">
</td>
</tr>
</table>
</form>
</body>
</html>