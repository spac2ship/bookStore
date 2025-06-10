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
		String id = request.getParameter("mem_id");
		String pwd = request.getParameter("mem_pwd");
		
		MemberDTO memDTO = new MemberDTO(id, pwd);
	
		MemberDAO memDAO = MemberDAO.getInstance();
		
		int su = memDAO.memLog(memDTO);
		if (su != 0) { 
			// 로그인 성공 시 세션에 정보 저장
			session.setAttribute("log_id", id);
			response.sendRedirect("./../index.jsp");
	 	} else { 
	 %>
	 	<script type="text/javascript">
	 		alert("아이디나 비밀번호가 존재하지 않습니다.");
			window.location.href="./login.jsp";
		</script>
			
	 <%	} 
	%>
</body>
</html>