<%@page import="model1.member.dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="model1.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
// 결과 확인(웹 페이지에 출력)
MemberDAO dao = new MemberDAO(application);
List<MemberDTO> members = dao.selectList();

// 연결 닫기
dao.close();
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
<jsp:include page="../common/Menu.jsp" />
<!-- Contents -->
<h1>List</h1>
<table border="1" width="80%">
	<tr>
		<th width="25%">ID</th>
		<th width="25%">PASS</th>
		<th width="25%">NAME</th>
		<th width="25%">REGIDATE</th>
	</tr>
<%//for(MemberDTO member: members) {%>
<c:forEach items="${members}" var="member">	
	<tr align="center">
		<td><a href="View.jsp?id=$">${member.id}</a></td>
		<td>${member.pass}</td>
		<td>${member.name}</td>
		<td>${member.regidate}</td>	
</c:forEach>				 	
<%//} %>
<tr><td colspan="4" align="center"><a href="./Write.jsp">회원 가입</a></td></tr>
</table>

</body>
</html>