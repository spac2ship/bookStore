<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ page import="db.*" %>
<%@ page import="java.sql.*" %>
<%@page import="java.time.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = (String)session.getAttribute("log_id");
		
		// 글 저자, 제목, 내용 가져오기
		String email = request.getParameter("email");
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		// 빈칸 체크
		if(email == null || email.length() == 0 || 
			title == null || title.length() == 0 || 
			content == null || content.length() == 0) {
			out.print("<script>alert('모든 항목이 빈칸 없이 입력되어야 합니다.'); history.back();</script>");
			return;
		}
	
	 	QnaDAO dao = new QnaDAO();
	 	int num = dao.getNum();
	 	
	 	QnaDTO dto = new QnaDTO();
	 	dto.setNum(num);
	 	dto.setWriter(writer);
	 	dto.setTitle(title);
	 	dto.setContent(content);
	 	dto.setEmail(email);


 	 	// [목록 보기]
	 	response.sendRedirect("qnaList.jsp");  
     %>

</body>
</html>