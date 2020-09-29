<%@page import="admin.svc.PopPageService"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="member.db.JdbcUtill" %>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
PopPageService pps=new PopPageService();
JSONArray PopPage=pps.CallPage();
%>
<%=PopPage%>