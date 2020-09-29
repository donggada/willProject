
<%@page import="faq.svc.contentService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="faq.dao.faqBoardDAO"%>
<%@page import="faq.vo.faqBoardbean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<%
int num=Integer.parseInt(request.getParameter("num"));
out.print(num);
%>


<%

contentService conservice=new contentService();
ArrayList<faqBoardbean> bean=conservice.getarticlelist(num);


%>

<%for(int i=0; i<bean.size(); i++){
	faqBoardbean f=bean.get(i);%>
			<%=f.getFaqboard_content()%>
			<%}{}%>




</body>
</html>