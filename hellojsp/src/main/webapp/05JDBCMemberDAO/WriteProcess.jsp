<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
<%@page import="java.sql.Connection"%>
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
// DB에 저장

// DB에 연결
Connection conn;
JDBConnect jdbc = new JDBConnect();
conn = jdbc.con;

// 쿼리문 생성   
String sql = "insert into member(id, pass, name) values(?, ?, ?)";  
PreparedStatement pstmt = conn.prepareStatement(sql);  
pstmt.setString(1, id);
pstmt.setString(2, pass);
pstmt.setString(3, name);

// 쿼리 수행
int rs = pstmt.executeUpdate();

// DB 종료
jdbc.close();
%>

<%
//작업 후 페이지 이동
response.sendRedirect("List.jsp");
%>
    
