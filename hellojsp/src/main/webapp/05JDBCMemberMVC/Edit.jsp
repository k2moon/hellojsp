<%@page import="model2.member.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//결과 확인 및 저장(웹 페이지에 출력)
MemberDTO member = (MemberDTO)request.getAttribute("member");

%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Edit.jsp</title>
</head>
<body>
<!-- Menu  -->
<jsp:include page="../common/Menu.jsp" />
<!-- Contents -->
<h1>Edit</h1>
<form name="editFrm" method="post" action="EditProcess.do">
<input type="hidden" name="id" value="<%=member.getId()%>">
    <table border="1" width="80%">
        <tr>
            <td>ID</td>
            <td>
                <%=member.getId() %>
            </td>
        </tr>
        <tr>
            <td>PASS</td>
            <td>
                <input type="text" name="pass" style="width: 90%;" value="<%=member.getPass() %>" />
            </td>
        </tr>
        <tr>
            <td>NAME</td>
            <td>
                <input type="text" name="name" style="width: 90%;" value="<%=member.getName() %>" />
            </td>
        </tr>        
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">다시 입력</button>
                <button type="button" onclick="location.href='List.jsp';">
                    목록 보기</button>
            </td>
        </tr>
    </table>
</form>

</body>
</html>