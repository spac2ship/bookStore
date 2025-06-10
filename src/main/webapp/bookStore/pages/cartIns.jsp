<%@page import="dao.CartDAO"%>
<%@page import="dto.CartDTO"%>
<%@page import="dao.OrderDAO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("log_id");
    String[] bookIds = request.getParameterValues("book_id");
    String[] qtys = request.getParameterValues("qty");
    String[] prices = request.getParameterValues("resultPrice");

    if (id == null) {
    	out.println("<script>alert('로그인이 필요한 서비스입니다.'); location.href='login.jsp';</script>");
    	return;
    }

    OrderDAO dao = OrderDAO.getInstance();
    boolean allSuccess = true;

    for (int i = 0; i < bookIds.length; i++) {
        try {
            int bookId = Integer.parseInt(bookIds[i]);
            int quantity = Integer.parseInt(qtys[i]);
            int totalPrice = Integer.parseInt(prices[i]);

            boolean result = dao.createOrderWithQuantity(id, bookId, quantity, totalPrice); // DAO에 정의 필요
            if (result == true) {
                // 장바구니 삭제
                CartDTO cartDTO = new CartDTO(id, bookId);
                CartDAO cartDAO = CartDAO.getInstance();
                cartDAO.cartDel(cartDTO);
                }
            
            if (!result) {
                allSuccess = false;
                break;
            }
        } catch (Exception e) {
            allSuccess = false;
            e.printStackTrace();
            break;
        }
    }

    if (allSuccess) {
        response.sendRedirect("orderDelivery.jsp");
    } else {
        out.println("<script>alert('일부 주문 처리에 실패했습니다.'); history.back();</script>");
    }
%>