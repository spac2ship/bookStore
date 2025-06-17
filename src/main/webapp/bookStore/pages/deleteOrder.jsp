<%@ page import="dao.OrderDAO" %>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");

	String orderIdStr = request.getParameter("order_id");

	if (orderIdStr == null || orderIdStr.trim().equals("")) {
		out.println("<script>alert('order_id'); history.back();</script>");
		return;
	}

	int order_id = Integer.parseInt(orderIdStr);

	OrderDAO dao = OrderDAO.getInstance();
	boolean result = dao.deleteOrder(order_id);

	if (result) {
		response.sendRedirect("orderDelivery.jsp");
	} else {
		out.println("<script>alert('실패'); history.back();</script>");
	}
%>