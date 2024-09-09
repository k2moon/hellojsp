<%@page import="java.util.ArrayList"%>
<%@page import="model1.member.dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="common.JDBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// DB에 연결
JDBConnect jdbc = new JDBConnect();

// 쿼리문 생성   
String sql = "SELECT id, pass, name, regidate FROM member";  
jdbc.stmt = jdbc.con.createStatement();  

// 쿼리 수행
jdbc.rs = jdbc.stmt.executeQuery(sql);  

// 결과 확인(웹 페이지에 출력)
List<MemberDTO> members = new ArrayList<>();
while (jdbc.rs.next()) { 
    String id = jdbc.rs.getString("id");
    String pw = jdbc.rs.getString("pass");
    String name = jdbc.rs.getString("name");
    String regidate = jdbc.rs.getString("regidate");
    
    //out.println(String.format("%s %s %s %s", id, pw, name, regidate) + "<br/>");
    MemberDTO member = new MemberDTO(id,pw,name,regidate);
    members.add(member);    
}

// 연결 닫기
jdbc.close();
%>   

<%
// 작업 후 페이지 이동
%>  
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Write.jsp</title>
</head>
<body>
<!-- Menu  -->
<jsp:include page="/common/Menu.jsp" />
<!-- Contents -->
<h1>List</h1>
<table border="1" width="80%">
	<tr>
		<th width="25%">ID</th>
		<th width="25%">PASS</th>
		<th width="25%">NAME</th>
		<th width="25%">REGIDATE</th>
	</tr>
<%for(MemberDTO member: members) {%>	
	<tr align="center">
		<td><a href="View.jsp?id=<%=member.getId()%>"><%=member.getId() %></a></td>
		<td><%=member.getPass() %></td>
		<td><%=member.getName() %></td>
		<td><%=member.getRegidate() %>
	</td>				 	
<%} %>
<tr><td colspan="4" align="center"><a href="./Write.jsp">회원 가입</a></td></tr>
</table>

</body>
</html>