<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Write.jsp</title>
<script type="text/javascript">

function WriteProcess(){
	const form = document.writeFrm;
	const id = form.id.value;
	const pass = form.pass.value;
	const name = form.name.value;
	const params = {id, pass, name};
	console.log(params);
	
	fetch('/hellojsp/WriteProcess.json', {
	  method: 'POST',
	  headers: {
	    'Content-Type': 'application/json'
	  },
	  body: JSON.stringify(params)
	})
	.then(response => response.json())
	.then(data => {
	  console.log('Success:', data);
	})
	.catch(error => {
	  console.error('Error:', error);
	});
}

window.onload = function(){
	
}

</script>
</head>
<body>
<!-- Menu  -->
<jsp:include page="/common/Menu.jsp" />
<!-- Contents -->
<h1>Write</h1>
<form name="writeFrm" method="post" action="WriteProcess.do">
    <table border="1" width="80%">
        <tr>
            <td>ID</td>
            <td>
                <input type="text" name="id" style="width: 90%;" />
            </td>
        </tr>
        <tr>
            <td>PASS</td>
            <td>
                <input type="text" name="pass" style="width: 90%;" />
            </td>
        </tr>
        <tr>
            <td>NAME</td>
            <td>
                <input type="text" name="name" style="width: 90%;" />
            </td>
        </tr>        
        <tr>
            <td colspan="2" align="center">
                <button type="button" onclick="WriteProcess()">작성 완료</button>
                <button type="reset">다시 입력</button>
                <button type="button" onclick="location.href='List.jsp';">
                    목록 보기</button>
            </td>
        </tr>
    </table>
</form>

</body>
</html>