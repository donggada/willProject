<%@page import="book.vo.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <%
      String snsid = (String)session.getAttribute("snsid");
      String id = (String)session.getAttribute("id");

      String pickup = request.getParameter("pickup_date"); 
      String end = request.getParameter("end_date"); 
      String carid = request.getParameter("car_id"); 
      String rentprice = request.getParameter("rentprice");
      String SelCarType = request.getParameter("SelCar"); 

		BookBean bb = (BookBean)request.getAttribute("bookList");
    %>
    
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<h3>예약 페이지 3</h3>
</head>
<body>

예약일<br>
<%=bb.getBook_date() %>
<br>

예약번호<br>
<%=bb.getBook_num() %>
<br>

금액 <br>
<%=bb.getBook_price() %>



<button type="button" onclick="location.href='index.jsp'">메인으로</button>



</body>
</html>