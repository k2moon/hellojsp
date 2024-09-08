<%@page import="model1.member.dao.MemberDAO"%>
<%@page import="model1.member.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//값 받기
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
%>

<%

//결과 확인 및 저장(웹 페이지에 출력)
MemberDAO dao = new MemberDAO(application);
MemberDTO member = dao.selectView(id);

dao.close();
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
            <td width="10%">ID</td>
            <td align="center">
                <%=member.getId() %>
            </td>
        </tr>
        <tr>
            <td width="10%">PASS</td>
            <td align="center">
                <%=member.getPass() %>
            </td>
        </tr>
        <tr>
            <td width="10%">NAME</td>
            <td align="center">
                <%=member.getName() %>
            </td>
        </tr>        
        <tr>
            <td colspan="2" align="center">
               <a href="./List.jsp">[List]</a>
               <a href="./Edit.jsp?id=<%=member.getId()%>">[Edit]</a>
               <a href="./DeleteProcess.jsp?id=<%=member.getId()%>">[Delete]</a>               
            </td>
        </tr>
    </table>
</form>

</body>
</html>