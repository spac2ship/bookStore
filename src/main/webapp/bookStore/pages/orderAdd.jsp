<%@page import="dao.OrderDAO"%>
<%@page import="dto.OrderDTO"%>
<%@page import="dto.CartDTO"%>
<%@page import="dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>주문 처리</title>
</head>
<body>
	<%
	    request.setCharacterEncoding("UTF-8");
	
	    String id = request.getParameter("id");
	    String pwd = request.getParameter("pwd");
	    String bquery = "?id=" + id + "&pwd=" + pwd;
	    
	    
	    // 로그인 확인
	    if (id == null) {
	    	out.println("<script>alert('로그인이 필요한 서비스입니다.'); location.href='login.jsp';</script>");
	    	return;
	    }
	
	    String[] bookIds = request.getParameterValues("book_id");
	
	    OrderDAO orderDAO = OrderDAO.getInstance();
	    CartDAO cartDAO = CartDAO.getInstance();
	
	    if (bookIds != null) {
	        for (String bookIdStr : bookIds) {
	            int bookId = Integer.parseInt(bookIdStr);
	
	            // 주문 생성 및 주문 상세 생성 (트랜잭션 처리 포함)
	            int orderId = orderDAO.createOrder(id, bookId);
	
	            if (orderId > 0) {
	                // 장바구니 삭제
	                CartDTO cartDTO = new CartDTO(id, bookId);
	                cartDAO.cartDel(cartDTO);
	            }
	        }
	    } 
	
	    response.sendRedirect("orderDelivery.jsp" + bquery);
	%>
</body>
</html>