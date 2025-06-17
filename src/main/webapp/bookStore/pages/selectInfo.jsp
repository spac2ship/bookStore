<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="dao.*" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select</title>
    <link href = './../assets/select.css' rel="stylesheet">  
</head>
<body>
    <%@include file="header.jsp" %>
    <div id="wrapper">        
        <form action="">
            <table class="table-select">
            	<thead>
	                <tr>
	                    <th colspan="7">bookStore 전체 회원 정보</th>
	                </tr>
	                <tr class = "tr_nav">
	                    <td>아이디</td>
	                    <td>비밀번호</td>
	                    <td>이름</td>
	                    <td>이메일</td>
	                    <td>번호</td>
	                    <td>주소</td>
	                    <td>상세주소</td>
	                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        <%
            MemberDAO memDAO = MemberDAO.getInstance();
            String memSel = memDAO.memSelJSON02();
        %>
        <script>
        	let sel = `<%=memSel %>`;
        	let strSel = JSON.parse(sel);

			let tbody = document.querySelector('.table-select tbody');
			let myObjValues = Object.values(strSel.member);
			
			for(let i = 0; i < strSel.member.length; i++) {
				let createTR = document.createElement('tr');
				const list = createTR.classList;
				list.add("db_records");
				let myObjValues2 = Object.values(myObjValues[i]);
				for(let j = 0; j < myObjValues2.length; j++) {
					let createTD = document.createElement("td");
					createTD.innerHTML = myObjValues2[j];
					createTR.appendChild(createTD);
				}
				tbody.appendChild(createTR);
			}
       	</script>
        </form>
    </div>
    <%@include file="footer.jsp" %>
</body>
</html>