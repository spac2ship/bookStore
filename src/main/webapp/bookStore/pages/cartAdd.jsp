<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	    request.setCharacterEncoding("UTF-8");
	
	    String mem_id = request.getParameter("id");
	    String pwd = request.getParameter("pwd");
	    String book_id = request.getParameter("book_id");
	    
	    CartDAO cartDAO = CartDAO.getInstance();
	
	    int su = cartDAO.cartIns(mem_id, book_id);
	
	    if (su != 0 && mem_id != null) {
	    	out.println("<script>alert('장바구니에 담겼습니다.'); history.back();</script>");
	        /* response.sendRedirect("cart.jsp?id=" + mem_id + "&pwd=" + pwd); */
	    } else {
	        out.println("<script>alert('로그인이 필요한 서비스입니다.'); location.href='login.jsp';</script>");
	    }
    %>
</body>
</html>