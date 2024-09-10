<%@page import="model2.member.dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
// 결과 확인(웹 페이지에 출력)
//List<MemberDTO> members = (List<MemberDTO>)request.getAttribute("members");
%>   

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>List.jsp</title>
</head>
<body>
<!-- Menu  -->
<jsp:include page="../common/Menu.jsp" />
<!-- Contents -->
<h1>List </h1>
<table border="1" width="80%">
	<tr>
		<th width="25%">ID</th>
		<th width="25%">PASS</th>
		<th width="25%">NAME</th>
		<th width="25%">REGIDATE</th>
	</tr>
<%//for(MemberDTO member: members) {%>
<c:forEach var="member" items="${members}">	
	<tr align="center">
		<td><a href="View.do?id=${member.id }">${member.id }</a></td>
		<td>${member.pass }</td>
		<td>${member.name }</td>
		<td>${member.regidate }	</td>
	</tr>	
</c:forEach>				 	
<%//} %>
	<tr><td colspan="4"><a href="Write.do">[회원 가입]</a></td></tr>
</table>

</body>
</html>