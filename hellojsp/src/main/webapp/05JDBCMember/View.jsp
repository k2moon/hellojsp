<%@page import="java.sql.ResultSet"%>
<%@page import="model1.member.dto.MemberDTO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//값 받기
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
%>

<%
// DB에 저장

// DB에 연결
Connection conn;
JDBConnect jdbc = new JDBConnect();
conn = jdbc.con;

// 쿼리문 생성   
String sql = "SELECT id, pass, name, regidate FROM member where id = ?";  
PreparedStatement pstmt = conn.prepareStatement(sql);  
pstmt.setString(1, id);

//쿼리 수행
ResultSet rs = pstmt.executeQuery(); 

//결과 확인 및 저장(웹 페이지에 출력)
MemberDTO members = null;
if (rs.next()) { 
 String pw = rs.getString("pass");
 String name = rs.getString("name");
 String regidate = rs.getString("regidate");
 
 //out.println(String.format("%s %s %s %s", id, pw, name, regidate) + "<br/>");
 MemberDTO member = new MemberDTO(id,pw,name,regidate);     
}

// DB 종료
jdbc.close();
%>

<%
//작업 후 페이지 이동
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>View.jsp</title>
</head>
<body>
<!-- Menu  -->
<jsp:include page="../common/Menu.jsp" />
<!-- Contents -->
<h1>View</h1>
<form name="writeFrm" method="post" action="WriteProcess.jsp">
    <table border="1" width="80%">
        <tr>
            <td>ID</td>
            <td>
                <%=members.getId() %>
            </td>
        </tr>
        <tr>
            <td>PASS</td>
            <td>
                <%=members.getPass() %>
            </td>
        </tr>
        <tr>
            <td>NAME</td>
            <td>
                <%=members.getName() %>
            </td>
        </tr>        
        <tr>
            <td colspan="2" align="center">
               <a href="./List.jsp">[List]</a>
               <a href="./Edit.jsp">[Edit]</a>
               <a href="./Delete.jsp">[Delete]</a>
               
            </td>
        </tr>
    </table>
</form>

</body>
</html>