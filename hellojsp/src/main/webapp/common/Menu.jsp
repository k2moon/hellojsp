<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table border="1" width="80%">
	 <tr>
	 	<td align="center"><a href="<%=request.getContextPath() %>/05JDBCMember/List.jsp">회원 목록</a></td>
	 	<td align="center"><a href="<%=request.getContextPath() %>/05JDBCMemberDAO/List.jsp">회원 목록(DAO)</a></td>
	 	<td align="center"><a href="<%=request.getContextPath() %>/05JDBCMemberServlet/List.jsp">회원 목록(Servlet)</a></td>
	 	<td align="center"><a href="<%=request.getContextPath() %>/05JDBCMemberMVC/List.do">회원 목록(MVC)</a></td>
	 	<td align="center"><a href="<%=request.getContextPath() %>/05JDBCMemberJSTL/List.do">회원 목록(JSTL)</a></td>
	 </tr>	 	
</table>