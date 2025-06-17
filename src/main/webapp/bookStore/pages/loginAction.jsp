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
		
		MemberDTO memDTO = new MemberDTO(memValues[0], memValues[1]);
	
		MemberDAO memDAO = MemberDAO.getInstance();
		
		int su = memDAO.memLog(memDTO);
		if (su != 0) { %>
			<script>
				alert("회원 로그인 성공!");
				window.location.href="./../index.jsp?id=<%=memValues[0] %>&pwd=<%=memValues[1]%>";
			</script>
	 <% } else { %>
			<script>
				alert("아이디나 비밀번호가 존재하지 않습니다.");
				window.location.href="./login.jsp";
			</script>
	 <%	} 
	%>
</body>
</html>