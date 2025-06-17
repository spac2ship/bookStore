<%@page import="dto.CartDTO"%>
<%@page import="dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");  // POST 방식 처리

    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    String bquery = "";
    if (id != null && pwd != null) {
        bquery = "?id=" + id + "&pwd=" + pwd;
    }

    CartDAO cartDAO = CartDAO.getInstance();

    // 전체삭제인지 선택삭제인지 구분
    if ("true".equals(request.getParameter("all"))) { 
        // 전체삭제
        CartDTO cartDTO = new CartDTO(id);
        int su = cartDAO.cartDelId(cartDTO); 
    } else if (request.getParameterValues("book_id") != null) { 
        // 선택삭제
        String[] bookIds = request.getParameterValues("book_id");
        for (String bId : bookIds) {
            int book_id = Integer.parseInt(bId);
            CartDTO cartDTO = new CartDTO(id, book_id);
            int su = cartDAO.cartDel(cartDTO);  
        }
    }

    // 삭제 후 다시 장바구니로 이동
    response.sendRedirect("cart.jsp" + bquery);
%>
