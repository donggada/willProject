<%@page import="review.vo.ReviewBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ReviewBean article = (ReviewBean)request.getAttribute("article");
String nowPage = request.getParameter("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정</title>
</head>
<body>
<body>
<h1>리뷰수정</h1>
<form action="ReviewModifyPro.rw?review_num=<%=article.getReview_num()%>&page=<%=nowPage %>" method="post" enctype="multipart/form-data" name="reviewForm">
<table>
<tr><td>ID</td><td><%=article.getMember_id() %></td><td>예약번호</td><td><%=article.getBook_num() %></td></tr>
<tr><td>차량정보</td><td><%=article.getCar_id() %></td><td>인수일</td><td><%=article.getPickup_date() %></td>
    <td>반납일</td><td><%=article.getEnd_date() %></td></tr>
<tr><td>글제목</td><td><input type="text" name="review_subject" value="<%=article.getReview_subject()%>"></td></tr>
<tr><td>파일</td><td><input type="file" name="review_file" value="<%=article.getReview_file()%>"></td>
<tr><td>내용</td><td><textarea rows="10" cols="60" name="review_content"><%=article.getReview_content() %></textarea></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="review_pass"></td></tr>
</table>
<input type="submit" value="등록" class="btn">
<input type="button" value="취소" class="btn" onclick="history.back()">
</form>
</body>
</html>