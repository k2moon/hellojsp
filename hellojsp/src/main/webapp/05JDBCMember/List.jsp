<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//JDBC 드라이버 로드
Class.forName("com.mysql.cj.jdbc.Driver");

// DB에 연결
Connection con;

String url = "jdbc:mysql://localhost:3306/jspdb?ServerDTimeZone=UTC";  
String id = "musthave";
String pwd = "1234"; 
con = DriverManager.getConnection(url, id, pwd); 

out.println("DB 연결 성공(기본 생성자)");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write.jsp</title>
</head>
<body>
<!-- Menu  -->
<table border="1" width="80%">
	 <tr>
	 	<td align="center"><a href="#">회원 가입</a></td>
	 </tr>	 	
</table>
<!-- Contents -->
<h1>List</h1>
<table border="1" width="80%">
	<tr><th>ID</th><th>PASS</th><th>NAME</th><th>REGIDATE</th></tr>
	<tr><th>ID</th><th>PASS</th><th>NAME</th><th>REGIDATE</th></tr>	 	
</table>

</body>
</html>