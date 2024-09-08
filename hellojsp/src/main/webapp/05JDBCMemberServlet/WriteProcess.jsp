<%@page import="model1.member.dao.MemberDAO"%>
<%@page import="model1.member.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//폼값 받기
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
%>

<%
MemberDTO dto = new MemberDTO(id,pass,name);
MemberDAO dao = new MemberDAO(application);
dao.updateEdit(dto);
dao.close();
%>

<%
//작업 후 페이지 이동
response.sendRedirect("List.jsp");
%>
    
