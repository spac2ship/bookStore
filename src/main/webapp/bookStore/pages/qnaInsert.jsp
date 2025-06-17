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
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
	    String bquery = "";
	    if (id != null && pwd != null) {
	    	bquery = "?id=" + id + "&pwd=" + pwd;
	    } else {
	    	bquery = "?";
	    }
		
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
	
	 	Connection conn = DBConnection.getConnection();
	 	Statement stmt = conn.createStatement();
	 	PreparedStatement pstmt = null;
	 	ResultSet rs = null;
	 	
	 	
	 	// 쿼리 실행
	 	// board에서 num에 최대값 가져옴, 그리고 그 최대값에 + 1씩해서 number에 집어넣음 
	 	// (insert하면 최대값 + 1)로 num에 저장
	 	String selSql = "select max(num) as num from qna";
	 	pstmt = conn.prepareStatement(selSql);
	 	rs = pstmt.executeQuery();
	 	int number = 1;
	 	while(rs.next()) {
	 		number = rs.getInt("num") + 1;
	 	}
	 	
	 	out.println("number: " + number);
	 	out.println("writer: " + writer);
	 	out.println("title: " + title);
	 	out.println("content: " + content);
	 	out.println("email: " + email);

	 	
	 	// insert 쿼리 실행
	 	String sql = "INSERT INTO qna (num, writer, title, content, email) " +
             "VALUES (%d, '%s', '%s', '%s', '%s')";
     	
	 	stmt.executeUpdate(String.format(sql, number, writer, title, content, email));

 	 	// [목록 보기]
	 	response.sendRedirect("qnaList.jsp" + bquery);  
     %>

</body>
</html>