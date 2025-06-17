<%@page import="db.DBConnection"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
	    String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String bquery = "";
		if (id != null && pwd != null) {
		    bquery = "?id=" + id + "&pwd=" + pwd;
		}
    
    	int num = Integer.parseInt(request.getParameter("num"));
    	String writer = request.getParameter("writer");
    	String title = request.getParameter("title");
    	String content = request.getParameter("content");
    	
    	if(writer == null || writer.length() == 0 ||
    			title == null || title.length() == 0 ||
    			content == null || content.length() == 0){
    %>
    <script>
    	alert("모든 항목이 빈칸 없이 입력되어야 합니다.");
    	history.back();
    </script>
    <%
    	return;
    	}
    
    Connection conn = DBConnection.getConnection();
    Statement stmt = conn.createStatement();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    String curTime = LocalDate.now() + " " + LocalTime.now().toString().substring(0, 8);
    
    stmt.executeUpdate(String.format(
    							"update noticeT01 set writer='%s', title='%s', " +
    							"content ='%s', regdate = sysdate where num = %d",
    							writer, title, content, num));
    
    response.sendRedirect("notice.jsp"+bquery);
    %>