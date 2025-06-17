<%@ page import="dao.OrderDAO" %>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");

	String orderIdStr = request.getParameter("order_id");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");

	if (orderIdStr == null || orderIdStr.trim().equals("")) {
		out.println("<script>alert('order_id가 없습니다.'); history.back();</script>");
		return;
	}

	int order_id = Integer.parseInt(orderIdStr);

	OrderDAO dao = OrderDAO.getInstance();
	boolean result = dao.deleteOrder(order_id);

	if (result) {
		response.sendRedirect("orderDelivery.jsp?id=" + id + "&pwd=" + pwd);
	} else {
		out.println("<script>alert('삭제 실패'); history.back();</script>");
	}
%>