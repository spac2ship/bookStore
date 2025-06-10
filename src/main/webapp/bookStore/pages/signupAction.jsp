<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ page import="db.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String memValues[] = request.getParameterValues("memValues");
		
		String result ="";
		
		MemberDTO memDTO = new MemberDTO(memValues[0], memValues[1], memValues[2],
	             memValues[3], memValues[4], memValues[5], memValues[6]);
	
		MemberDAO memDAO = MemberDAO.getInstance();
		
		int su = memDAO.memIns(memDTO);
		if (su != 0) { %>
			<script>
					alert("회원가입 성공!");
					window.location.href="./login.jsp";
			</script>
	 <% } else { %>
			<script>
					alert("회원가입 실패! (id 중복임)");
					window.location.href="./signup02.jsp";
			</script>
	 <%	} 
	%>
</body>
</html>