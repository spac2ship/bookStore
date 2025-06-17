<%@page import="dto.MemberDTO"%>
<%@page import="dto.OrderDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>주문/배송</title>
    <link rel="stylesheet" href="./../assets/orderDelivery.css">
<%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    String bquery = "";
    if (id != null && pwd != null) {
        bquery = "?id=" + id + "&pwd=" + pwd;
    }

    MemberDTO memDTO = new MemberDTO();
    memDTO.setMem_id(id);
    memDTO.setMem_pwd(pwd);

    OrderDAO dao = OrderDAO.getInstance();
    List<OrderDTO> orderList = dao.orderSelOrderDTO(id);  // 변경: OrderDTO 기반
    MemberDAO memDAO = MemberDAO.getInstance();
    String name = memDAO.memName(memDTO);
    if (name == null) {
        name = "비회원";
    }
    int count = orderList.size();
%>
</head>
<body>
    <header class="header-container">
        <%@include file="./header.jsp" %>
    </header>
    <div id="wrap">
        <section class="breadcrumb_wrap">
            <div class="breadcrumb_inner">
                <ol id="TopBreadcrumb">
                    <li class="breadcrumb_item_no"><a class="home_link" href="../index.jsp<%=bquery%>"></a></li>
                    <li class="breadcrumb_item"><a class="btn_sub_depth" href="./mypage.jsp<%=bquery%>">마이</a></li>
                    <li class="breadcrumb_item"><a class="btn_sub_depth" href="./cart.jsp<%=bquery%>">장바구니</a></li>
                    <li class="breadcrumb_item"><a class="btn_sub_depth" href="./orderDelivery.jsp<%=bquery%>">주문/배송목록</a></li>
                </ol>
            </div>
        </section>

        <section class="content_wrap aside">
            <div class="content_inner">
                <aside class="aside_wrap">
                    <div class="aside_body">
                        <div id="AsideMyProfile" class="my_profile_area">
                            <div class="profile_inner">
                                <div class="profile_thumb_box" onclick="location.href = 'mypage.jsp<%=bquery %>'" style="cursor: pointer;">
                                    <a class="btn_setting"></a>
                                </div>
                                <div class="profile_name_box">
                                    <span class="name_row"><%=name %>님</span>
                                    <span class="badge"><a class="badge_img"></a>프렌즈 ></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </aside>
            </div>

            <section id="title_hg">
                <div class="title_wrap">
                    <p class="title_heading">주문/배송 목록</p>
                    <div class="right_area">
                        <p class="right_area_text">"최근 1개월 주문내역 입니다."</p>
                        <div class="prod_filter">
                            <button type="button" class="btn_sm" id="toggleCalendar">
                                <span class="ico_calendar"></span>
                                <span class="text">상세조회</span>
                            </button>
                            <div class="calendar_popup" id="calendarPopup">
                                <input type="date" id="date_picker">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="order_history_group">
                    <div class="order_history_box">
                        <span class="history_val">주문내역</span>
                        <span class="history_desc">주문/배송안내</span>
                    </div>
                    <div class="order_history_box">
                        <span class="history_val">0</span>
                        <span class="history_desc">준비중</span>
                    </div>
                    <div class="order_history_box">
                        <span class="history_val"><%=count %></span>
                        <span class="history_desc">배송중</span>
                    </div>
                    <div class="order_history_box">
                        <span class="history_val">0</span>
                        <span class="history_desc">배송완료</span>
                    </div>
                    <div class="order_history_box">
                        <span class="history_val">0</span>
                        <span class="history_desc">취소</span>
                    </div>
                    <div class="order_history_box">
                        <span class="history_val">0</span>
                        <span class="history_desc">교환/환불</span>
                    </div>
                </div>

<%
    for (OrderDTO order : orderList) {
        int discountPrice = order.getTotal_price() - (order.getTotal_price() / 10);
%>
                <div class="product-item">
                    <img src="<%=order.getImage() %>" alt="" class="product-img">
                    <div class="product-info">
                        <p class="product-title"><%=order.getTitle()%></p>
                        <p class="product-price"><%=discountPrice%>원</p>
                    </div>
                    <div class="product-actions">
                        <span class="final-price"></span>
                        <div class="quantity-control">
                            <span class="qty"><%=order.getQty()%>개</span>
                        </div>
                        <div class="shipping-info">
                            <p class="pickup-info">배송중</p>
                        </div>
                        <form method="post" action="deleteOrder.jsp">
                            <input type="hidden" name="order_id" value="<%=order.getOrder_id()%>">
                            <input type="hidden" name="id" value="<%=id%>">
                            <input type="hidden" name="pwd" value="<%=pwd%>">
                            <button type="submit" class="delete-btn" onclick="return confirm('이 주문을 삭제하시겠습니까?');">✕</button>
                        </form>
                    </div>
                </div>
<%
    }
%>

                <div class="info_text_box"> 
                    <p class="title_heading">유의사항</p>
                    <ul class="bul_list">
                        <li class="bul_item">배송조회는 택배사로 상품전달 후 조회 가능합니다.</li>
                        <li class="bul_item">eBook은 구매 후 다운로드 시 이용할 수 있습니다.</li>
                        <li class="bul_item">eBook ‘sam’ 이용내역 조회 및 서비스 해지는 마이룸 > sam이용내역 > my이용권 페이지에서 가능합니다.</li>
                        <li class="bul_item">반환된 예치금은 나의 통장 > 예치금에서 환불신청 시 신청계좌로 환불해 드립니다.</li>
                    </ul>
                </div>
                <div class="info_text_box01"> 
                    <p class="title_heading">카드결제</p>
                    <ul class="bul_list">
                        <li class="bul_item">카드사 정책에 따라 주문당일 부분취소한 경우 당일 취소 및 환불 불가합니다.</li>
                        <li class="bul_item">부분취소한 경우 카드사 승인 취소는 약 3~5일 소요됩니다.</li>
                        <li class="bul_item">카드사에서 부분취소를 지원하지 않는 카드의 경우 승인취소가 아닌 예치금으로 환불됩니다.</li>
                        <li class="bul_item">주문취소시 오류가 발생하거나 환불이 정상 처리되지 않을 경우 1:1로 문의 주시기 바랍니다.</li>
                    </ul>
                </div>
            </section>
        </section>
    </div>
    <footer class="header-container">
        <%@include file="./footer.jsp" %>
    </footer>
</body>
</html>
