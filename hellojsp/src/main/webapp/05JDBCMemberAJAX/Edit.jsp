<%@page import="model2.member.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
//결과 확인 및 저장(웹 페이지에 출력)
//MemberDTO member = (MemberDTO)request.getAttribute("member");

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
<input type="hidden" name="id" value="${member.id }">
    <table border="1" width="80%">
        <tr>
            <td>ID</td>
            <td>
                ${member.id }
            </td>
        </tr>
        <tr>
            <td>PASS</td>
            <td>
                <input type="text" name="pass" style="width: 90%;" value="${member.pass }" />
            </td>
        </tr>
        <tr>
            <td>NAME</td>
            <td>
                <input type="text" name="name" style="width: 90%;" value="${member.name }" />
            </td>
        </tr>        
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">다시 입력</button>                
            </td>
        </tr>
    </table>
</form>

</body>
</html>