<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 글 번호 얻기
		int num = Integer.parseInt(request.getParameter("num"));
	
     	Connection conn = DBConnection.getConnection();
     	Statement stmt = conn.createStatement();
     	// 쿼리 실행
     	String sql = "delete from qna where num =" + num;     	
     	stmt.executeUpdate(sql);
     	
     	// [목록 보기]
     	response.sendRedirect("qnaList.jsp");

     %>
</body>
</html>