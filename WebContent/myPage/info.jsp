<%@page import="info.vo.pageinfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="info.vo.ListBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ListBean lb = (ListBean)request.getAttribute("bean");
    	ArrayList<ListBean> list = (ArrayList<ListBean>)request.getAttribute("list");
    	pageinfo pagecheck = (pageinfo)request.getAttribute("pageinfo");
    	
    	int listCount = pagecheck.getListcount();
    	int nowPage = pagecheck.getPage(); 
    	int startPage = pagecheck.getStartpage();
    	int endPage = pagecheck.getEndpage();
    	int maxPage = pagecheck.getMaxpage();
    	int checkNum = Integer.parseInt(request.getParameter("page"));
    	if(checkNum != 1)
    	{
    		checkNum = startPage * 10;
    	}
    	else
    	{
    		checkNum = 0;
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지<%=checkNum %></title>
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
<tr>
<th>순번</th><th>예약일시</th><th>대여일</th><th>반납일</th><th>차량 아이디</th><th>가격</th>
</tr>
<%
if(list != null & pagecheck.getListcount() > 0)
{
for(int i =0; i < list.size(); i++)
{
%>
<tr>
<td><%=checkNum + (i+1) %></td>
<td><%=list.get(i).getBook_date() %></td>
<td><%=list.get(i).getPickup_date() %></td>
<td><%=list.get(i).getEnd_date() %></td>
<td><%=list.get(i).getCar_id() %></td>
<td><%=list.get(i).getPrice() %>원</td>
</tr>
<%
}
%>
</table>
    <%if(nowPage<=1){ %>
    [이전]
    <%}else{ %>
        <a href="MemberInfo.if?page=<%=nowPage-1 %>">[이전]</a>
    <%} %>
    <%for(int a=startPage; a<=endPage; a++){ 
        if(a==nowPage){%>
            [<%=a %>]
    <%} else { %>
        <a href="MemberInfo.if?page=<%=a %>">[<%=a %>]</a>
        <%} %>    
    <%} %>
    <%if(nowPage>=maxPage){ %>
        [다음]
    <%}else{ %>    
        <a href="MemberInfo.if?page=<%=nowPage+1 %>">[다음]</a>
    <%} %>
	<%}else{
	%>등록된 글이 없습니다.
	<%} %>
</body>
</html>











