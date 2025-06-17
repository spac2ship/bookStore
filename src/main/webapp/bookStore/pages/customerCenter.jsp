<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>고객센터</title>
    <link rel="stylesheet" href="./../assets/customerCenter.css">
    <%
    request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
    String bquery = "";
    String bquery01 = "";
    if (id != null && pwd != null) {
    	bquery = "?id=" + id + "&pwd=" + pwd;
    	bquery01 = "&id=" + id + "&pwd=" + pwd;
    } 
    %>
</head>
<body>
    <header class="header-container">
     <%@include file="./header.jsp" %>
      </header>
    <div id="wrap">
        <div class="aside">
            <div><p id="costomer_title">고객센터</p></div>
            <div id="costomer_menu"><p>메인</p></div>
            <div id="costomer_menu"><a  style="cursor: pointer " href="./faq.jsp<%=bquery%>" class="textNone">자주 묻는 질문</a></div>
            <div id="costomer_menu"><a  style="cursor: pointer " href="./notice.jsp<%=bquery%>" class="textNone">공지사항</a></div>
            <hr>
            <div id="costomer_menu"><a  href="#" class="textNone"><b>1:1 문의</b></a></div><br>
            <div id="costomer_menu"><a  style="cursor: pointer " href="./qna-form.jsp<%=bquery%>" class="textNone">1:1 문의 접수</a></div>
            <div id="costomer_menu"><a  style="cursor: pointer " href="./qnaList.jsp<%=bquery%>" class="textNone">1:1 문의 내역</a></div>
        </div>
        <div class="customer_wrap">
            <div class="title_wrap">
                <h1>
                    <span id="help">무엇을 도와드릴까요?</span><br>
                    고객센터
                    <span id="help">입니다.</span>
                </h1>
            </div>
            <div class="customer_q">
                <h2>자주 묻는 질문</h2>
                <span id="text"><a  style="cursor: pointer " href="./faq.jsp<%=bquery%>" class="textNone">더보기 ></a></span>
            </div>
            <div class="search_box">
                <div class="input_btn_box">
                        <input id="form_ip" type="text" placeholder="질문을 검색해 보세요.">
                    <button type="button" id="btn" style="cursor: pointer"><span id="search_btn">검색</span></button>
                </div>
            </div>
            <div class="category_list">
                <ul id="category_ul">
                    <li><a id="category" style="cursor: pointer" href="./best.jsp<%=bquery%>">BEST 10</a></li>
                    <li><a id="category" style="cursor: pointer" href="./orderDelivery.jsp<%=bquery%>">주문/결제</a></li>
                    <li><a id="category" style="cursor: pointer" href="./cart.jsp<%=bquery%>">장바구니</a></li>
                    <li><a id="category" style="cursor: pointer" href="./domestic.jsp<%=bquery%>">국내도서</a></li>
                    <li><a id="category" style="cursor: pointer" href="./foreign.jsp<%=bquery%>">해외도서</a></li>
                </ul>
            </div>
            <div class="title_wrap_title">
                <h2>1:1 문의</h2>
            </div>
            <div class="inquiry_box">
                <div class="box_bg">
                    <a class="inquiry" href="qna-form.jsp<%=bquery%>">
                        <span class="ico_inquiry01"></span>
                        <p class="name">1:1 문의 접수</p>
                    </a>
                    <a class="inquiry" href="./qnaList.jsp<%=bquery%>">
                        <span class="ico_inquiry02"></span>
                        <p class="name">1:1 문의 내역</p>
                    </a>
                </div>
                <div class="box_size_sm">
                    <p class="title">전화 상담</p>
                    <div class="tel_container">
                        <a class="tel" href="tel:000-0000">전화번호 000-0000</a>
                        <span class="gap">|</span>
                        <a class="tel" href="tel:000-0000">센터 000-0000</a>
                    </div>
                    <p class="desc">"평일 09:00~18:00 (주말 및 공휴일 휴무)"
                        <br>
                        "점심 12:00~13:00 (전화상담만 가능)"
                    </p>
                </div>
                <div class="box_size_sm">
                    <p class="title">보이는 ARS</p>
                    <p class="desc">"평일 09:00~18:00 (주말 및 공휴일 휴무)"
                    </p>
                </div>
            </div>
            <div class="customer_q">
                <h2>공지사항</h2>
                <span id="text" ><a  style="cursor: pointer "  href="./notice.jsp<%=bquery%>" class="textNone">더보기 ></a></span>
            </div>
            <div class="tbl_col_wrap">
                <table class="tbl_col_line">
                    <colgroup>
                    <col style="width: 75px">
                    <col style="width: 655px">
                    <col style="width: 130px">
                    <col style="width: 124px">
                    </colgroup>
                    <tbody class="notice_tbody">
                    <tr>
                       <td class="fc_light_gray"><a  style="cursor: pointer" href="noticeView.jsp?num=1<%= bquery01 %>">1</a></td>
                       <td class="align_left"><a  style="cursor: pointer" href="noticeView.jsp?num=1<%= bquery01 %>"><span>
                        공지사항
                       </span></a></td>
                       <td class="fc_light_gray"><a  style="cursor: pointer" href="noticeView.jsp?num=1<%= bquery01 %>">고객센터</a></td>
                       <td class="fc_light_gray"><a  style="cursor: pointer" href="noticeView.jsp?num=1<%= bquery01 %>">2025.05.07</a></td> 
                    </tr>
                    	<tr>
                        <td class="fc_light_gray"> <a  style="cursor: pointer" href="noticeView.jsp?num=2<%= bquery01 %>">2</a></td>
                       <td class="align_left"> <a  style="cursor: pointer" href="noticeView.jsp?num=2<%= bquery01 %>"><span>
                        공지사항
                       </span></a></td>
                       <td class="fc_light_gray"> <a  style="cursor: pointer" href="noticeView.jsp?num=2<%= bquery01 %>">고객센터</a></td>
                       <td class="fc_light_gray"> <a  style="cursor: pointer" href="noticeView.jsp?num=2<%= bquery01 %>">2025.05.07</a></td>
                     </tr>
                     <tr>
                        <td class="fc_light_gray"><a  style="cursor: pointer" href="noticeView.jsp?num=3<%= bquery01 %>">3</a></td>
                       <td class="align_left"> <a  style="cursor: pointer" href="noticeView.jsp?num=3<%= bquery01 %>"><span>
                        공지사항
                       </span></a></td>
                       <td class="fc_light_gray"><a  style="cursor: pointer" href="noticeView.jsp?num=3<%= bquery01 %>">고객센터</a></td>
                       <td class="fc_light_gray"><a  style="cursor: pointer" href="noticeView.jsp?num=3<%= bquery01 %>">2025.05.07</a></td>
                     </tr>
                    </tbody>
                </table>
            </div>
            <div class="cutomer_content_area">
                <div class="search_box01">
                    <div class="input_box">
                        <span id="name">출판사 연락처 안내</span>
                        <input id="form_ip" type="text" placeholder="출판사명 또는 ISBN-13을 입력">
                        <button type="button" id="btn" style="cursor: pointer">
                            <span id="search_btn">검색</span></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="header-container">
		<%@include file="./footer.jsp" %>
      </footer>
</body>
</html>