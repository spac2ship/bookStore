<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.*" %>
<%@ page import="java.sql.*" %>
<%@page import="java.time.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 수정</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
	    String bquery = "";
	    if (id != null && pwd != null) {
	    	bquery = "?id=" + id + "&pwd=" + pwd;
	    } else {
	    	bquery = "?";
	    }
	
		// 글 번호, 저자, 제목, 내용 가져오기
		int num = Integer.parseInt(request.getParameter("num"));
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String email = request.getParameter("email");
		
		// 빈칸 체크
		if(email == null || email.length() == 0 || 
			title == null || title.length() == 0 || 
			content == null || content.length() == 0) {
			out.print("<script>alert('모든 항목이 빈칸 없이 입력되어야 합니다.'); history.back();</script>");
			return;
		}
	
     	Connection conn = DBConnection.getConnection();
     	Statement stmt = conn.createStatement();
     	PreparedStatement pstmt = null;
     	ResultSet rs = null;
     
     	
     	// 쿼리 실행
     	String sql = "update qna set writer = '%s', title = '%s', " +
             "content = '%s', email = '%s' where num = %d";
		stmt.executeUpdate(String.format(sql, writer, title, content, email, num));
		
     	// [목록 보기]
     	response.sendRedirect("qnaList.jsp" + bquery); 

     %>
</body>
</html>