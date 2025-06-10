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
		/* name 값 가져옴 */
		String id = request.getParameter("id");
	    String email = request.getParameter("email");
		
	    MemberDTO memDTO = new MemberDTO();
	    /* 따로 생성자 안써줘서(따로 생성자 쓰면 string 개수때매 오류) set으로 값 집어넣고 dao로 불러옴 */
	    memDTO.setMem_id(id);
	    memDTO.setMem_email(email);
	    MemberDAO memDAO = MemberDAO.getInstance();
	    
	    String pwd = memDAO.memFind(memDTO);
		if (pwd != null) { %>
			<script>
					alert("비밀번호는 <%=pwd %> 입니다");
					window.location.href="./login.jsp";
			</script>
	 <% } else { %>
			<script>
					alert("아이디나 이메일이 틀렸습니다.");
					window.location.href="./forgotPassword.jsp";
			</script>
	 <%	} 
	%>
</body>
</html>