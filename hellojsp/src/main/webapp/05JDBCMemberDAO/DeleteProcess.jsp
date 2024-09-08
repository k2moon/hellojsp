<%@page import="model1.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//폼값 받기
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
out.print(id);
%>

<%
MemberDAO dao = new MemberDAO(application);
dao.delete(id);
dao.close();
%>

<%
//작업 후 페이지 이동
response.sendRedirect("List.jsp");
%>
    
