<%@page import="member.svc.MemberJoinProService"%>
<%@page import="member.action.MemberLoginProAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String id=request.getParameter("id");
request.setCharacterEncoding("UTF-8");
int dupcheck=0;
MemberJoinProService mjps=new MemberJoinProService();
dupcheck= mjps.dupCheckMember(id);
if(dupcheck==0){
	out.print("아이디 사용불가");
}else if(dupcheck==1){
	out.print("아이디 사용가능");
}


%>