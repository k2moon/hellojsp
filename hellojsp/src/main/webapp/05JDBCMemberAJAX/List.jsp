<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>List.jsp</title>
<script>

let memberData = {};
function setMemberData(data){
	memberDate = data;
}

function List(){
	let memberTable = '';
	memberTable = `
		<h1>List </h1>
		<table border="1" width="80%">
		<tr>
			<th width="25%">ID</th>
			<th width="25%">PASS</th>
			<th width="25%">NAME</th>
			<th width="25%">REGIDATE</th>
		</tr>
	`;
	for(member of memberDate){
		memberTable += `
			<tr align="center">
			<td><a href="View.do?id=${member.id}">${'${member.id}'}</a></td>
			<td>${'${member.pass}'}</td>
			<td>${'${member.name}'}</td>
			<td>${'${member.regidate}'}</td>
		</tr>		
	    `;
	}
	console.log(memberTable)
    memberTable += `
    	<tr><td colspan="4"><a href="Write.do">[회원 가입]</a></td></tr>
    	</table>
    	`;
    document.querySelector('#root').innerHTML = memberTable;
}

function selectList(){
	fetch('/hellojsp/List.json')
	  .then(response => response.json())
	  .then(data => {
	    // Handle the data here
	    console.log(data);
	    setMemberData(data);
	    List();
	  })
	  .catch(error => {
	    // Handle errors here
	    console.error('Error:',error);
	 });
}

window.onload = function(){
	selectList();
	
}

</script>
</head>
<body>

<div id="root"></div>

</body>
</html>