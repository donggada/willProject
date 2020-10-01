<%@page import="java.util.ArrayList"%>
<%@page import="info.vo.ListBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ListBean lb = (ListBean)request.getAttribute("bean");
    	ArrayList<ListBean> list = (ArrayList<ListBean>)request.getAttribute("list");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
<p>개인 정보</p>
<table border="1">
<tr>
<th>아이디</th><td><%=lb.getId() %></td>
<th>이름</th><td><%=lb.getName() %></td>
<th>나이</th><td><%=lb.getAge() %></td>
</tr>
<tr>
<th>성별</th><td><%=lb.getGender() %></td>
<th>전화번호</th><td><%=lb.getTel() %></td>
<th>주소</th><td><%=lb.getAddress() %></td>
<th>이메일</th><td><%=lb.getEmail() %></td>
</tr>
<tr>
<th>면허증</th><td><%=lb.getLicense() %></td>
<th>흡연여부</th><td><%=lb.getSmoke() %></td>
<th>애완동물</th><td><%=lb.getPet() %></td>
<th>아기</th><td><%=lb.getBaby() %></td>
</tr>
</table>
<!-- ------------------------------------------------------------------------------------------------------- -->
<table>
<tr><th>멤버쉽 등급</th><td><%=lb.getGrade() %></td></tr>
</table>
<!-- ------------------------------------------------------------------------------------------------------- -->
<p>예약 현황</p>
<table border="1">
<%
for(int i =0; i < list.size(); i++)
{%>
<tr>
<th>순번</th><td><%=i+1 %></td>
<th>예약일시</th><td><%=list.get(i).getBook_date() %></td>
<th>대여일</th><td><%=list.get(i).getPickup_date() %></td>
<th>반납일</th><td><%=list.get(i).getEnd_date() %></td>
<th>차량 아이디</th><td><%=list.get(i).getCar_id() %></td>
<th>가격</th><td><%=list.get(i).getPrice() %></td>
</tr>
<%}
%>
</table>
</body>
</html>