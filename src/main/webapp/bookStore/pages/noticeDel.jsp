<%@page import="db.DBConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	int num = Integer.parseInt(request.getParameter("num"));
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String bquery = "";
	if (id != null && pwd != null) {
	    bquery = "?id=" + id + "&pwd=" + pwd;
	}
	
	Connection conn = DBConnection.getConnection();
	Statement stmt = conn.createStatement();
	
	String sql = "delete from noticeT01 where num=" + num;
	stmt.executeUpdate(sql);
	
	response.sendRedirect("notice.jsp?id="+ id + "&pwd="+ pwd);

%>