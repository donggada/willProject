<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String email=request.getParameter("email");
MemberDAO mdao=MemberDAO.mdao;
String checknum=mdao.checknum();
String to=email;
String subject="인증번호 입니다";
String content="RentCar site 회입가입인증번호 "+checknum;
mdao.sendEmail(to, subject, content);
out.print(checknum);
%>
