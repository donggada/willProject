<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%int qnaBoard_num= Integer.parseInt(request.getParameter("qnaBoard_num"));
	String nowPage = (String)request.getParameter("page");
	String id = (String)session.getAttribute("id"); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>MVC 게시판</title>
<style>
</style>
</head>
<body>
<section id = "passForm">
이 글은 비밀글입니다. 비밀번호를 입력해주세요.
관리자는 확인버튼만 누르시면 됩니다.
<form name="checkForm" action="qnaBoardDetail.bo" 
	method="post">
<input type = "hidden" name = "page" value = "<%=nowPage %>"/>
<input type = "hidden" name = "qnaBoard_num" value = "<%=qnaBoard_num %>"/>
<table>
<tr>
	<td>
		<label>글 비밀번호 : </label>
	</td>
	<td>
		<input name="qnaBoard_pass" type="password">
		
		
	</td>
</tr>
<tr>
	<td>
	
	

		<input type="submit" value = "확인"/>
		
		<input type = "button" value = "돌아가기" onClick ="javascript:history.go(-1)"/>
	</td>
</tr>
</table>
</form>
</section>
</body>
</html>