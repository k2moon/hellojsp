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
<title>View.jsp</title>
<script>
	function delete_confirm(member_id) {
		const rs = confirm("삭제하시겠습니까?");
		console.log(rs);
		if(rs){
			location.href="DeleteProcess.do?id="+member_id;
		}else{
			alert('삭제가 취소 되었습니다.');
		}
		
	}
</script>
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
                ${member.id }
            </td>
        </tr>
        <tr>
            <td width="10%">PASS</td>
            <td align="center">
                ${member.pass }
            </td>
        </tr>
        <tr>
            <td width="10%">NAME</td>
            <td align="center">
                ${member.name }
            </td>
        </tr> 
        <tr>
            <td width="10%">REGIDATE</td>
            <td align="center">
                ${member.regidate }
            </td>
        </tr>        
        <tr>
            <td colspan="2" align="center">
               <a href="./List.do">[List]</a>
               <a href="./Edit.do?id=${member.id }">[Edit]</a>
               <!-- a href="./DeleteProcess.do?id=${member.id }">[Delete]</a -->
               <a href="#" onclick="delete_confirm('${member.id }')">[Delete]</a>               
            </td>
        </tr>
    </table>
</form>

</body>
</html>