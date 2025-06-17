<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ page import="db.*" %>
<%@ page import="java.util.*" %>
<
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
		
		int su = memDAO.memDel(memDTO);
		if (su != 0) { %>
			<script>
				alert("탈퇴되었습니다.");
				window.location.href = "./../index.jsp";
			</script>
	 <% } else { %>
			<script>
				alert("회원 정보가 틀립니다.");
				window.location.href = "delete.jsp";
			</script>    
	<%	}
	%>
</body>
</html>