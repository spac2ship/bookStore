<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>고객센터</title>
    <link rel="stylesheet" href="./../assets/faq.css">
    <%
    request.setCharacterEncoding("utf-8");

    %>
</head>
<body>
    <header class="header-container">
     <%@include file="./header.jsp" %>
      </header>
    <div id="wrap">
        <div class="aside">
            <div><p id="costomer_title">고객센터</p></div>
            <div id="costomer_menu"><p>자주 묻는 질문</p></div>
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
            </div>
            <div class="search_box">
                <div class="input_btn_box">
                        <input id="form_ip" type="text" placeholder="질문을 검색해 보세요.">
                    <button type="button" id="btn" style="cursor: pointer"><span id="search_btn">검색</span></button>
                </div>
            </div>
            <div class="customer_q">
                <h2>자주 묻는 질문</h2>
            </div>
	         <div class="tbl_col_wrap">
		          <div class="recordContainer">
				  </div>
				  <div class="recordDataContainer"></div>
				  <div class="pagination">
				  </div>
            </div>
        </div>
    </div>
    <footer class="header-container">
		<%@include file="./footer.jsp" %>
      </footer>
      <script src="./../assets/faq.js"></script>
</body>
</html>