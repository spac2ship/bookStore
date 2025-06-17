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
		
		MemberDTO memDTO = new MemberDTO(memValues[0], memValues[1], memValues[2],
	             memValues[3], memValues[4], memValues[5], memValues[6]);
	
		MemberDAO memDAO = MemberDAO.getInstance();
		
		int su = memDAO.memUpd(memDTO);
		String id = memValues[0];
		String pwd = memValues[1];
		if (su != 0) {
			response.sendRedirect("mypage.jsp?id=" + id + "&pwd=" + pwd);
	    } else { %>
			<script>
					alert("회원수정 실패");
					window.location.href="./updateAction.jsp";
			</script>
	 <%	} 
	%>
</body>
</html>