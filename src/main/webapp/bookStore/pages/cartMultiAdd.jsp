<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	    request.setCharacterEncoding("UTF-8");
	
	    String id = request.getParameter("id");
	    String[] bookIds = request.getParameterValues("book_id");
	    
	    int su = 0;
	    CartDAO cartDAO = CartDAO.getInstance();
	
	    if (id != null && bookIds != null) {
	        for (String bookId : bookIds) {
	            int result = cartDAO.cartIns(id, bookId);
	            if (result != 0) {
	            	su++;
	            }
	        }
	    }
	
	    if (su > 0) {
	        out.println("<script>alert('" + su + "개 도서가 장바구니에 담겼습니다.'); history.back();</script>");
	    } else if (bookIds == null){
	        out.println("<script>alert('장바구니 담기 실패, 체크하셨는지 확인하세요.'); history.back();</script>");
	    } else {
	    	out.println("<script>alert('로그인이 필요한 서비스입니다.'); location.href='login.jsp';</script>");
	    }
	%>
</body>
</html>