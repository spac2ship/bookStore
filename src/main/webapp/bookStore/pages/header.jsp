<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./../assets/header.css">
    <%
	    String log_id = request.getParameter("id");
	    String log_pwd = request.getParameter("pwd");
	    String query = "";
	    if (log_id != null && log_pwd != null) {
	    	query = "?id=" + log_id + "&pwd=" + log_pwd;
	    }
	%>
    <script>
	    let id = "<%=log_id %>";
	    let pwd = "<%= log_pwd %>";
	    console.log("id:", id);
	    console.log("pwd:", pwd);

	    window.onload = function () {
	        // login / out 버튼 토글
	        if (id != "null" && pwd != "null") {
	        	console.log("로그인 상태");
	            document.getElementById("loginButton").style.display = "none";
	            document.getElementById("logoutBtn").style.display = "block";
	        } else {
	        	console.log("비로그인 상태");
	            document.getElementById("loginButton").style.display = "block";
	            document.getElementById("logoutBtn").style.display = "none";
	        }
	    } 
	    function logChk() {
	        if(id != "null" && pwd != "null") {
	        	window.top.location.href = "./mypage.jsp?id=" + id + "&pwd=" + pwd;
	        } else {
	            alert("로그인이 필요합니다.");
	            window.top.location.href = "./login.jsp";
	        }
	    }
	</script>
</head>
<body>
    <header>
            <nav class="top-menu">
                <ul>
                  <li><a href="./../index.jsp<%=query %>" target="_parent">홈</a></li>
                  <li><a href="orderDelivery.jsp<%=query %>" target="_parent">주문배송</a></li>
                  <li><a href="customerCenter.jsp<%=query %>" target="_parent">고객센터</a></li>
                  <li><a href="signup.jsp" target="_parent">회원가입</a></li>
                  <li><a href="login.jsp" id="loginButton" target="_parent">로그인</a></li>
                  <li style="margin-left: 0px"><a href="logout.jsp" id="logoutBtn" target="_parent" style="display:none;">로그아웃</a></li>
                </ul>
            </nav>
            <div class="header-container">
            <div class="main-header">
                <div class="logo">
                  <a href ="./../index.jsp<%=query %>" target="_parent"><img src="./../assets/images/logo.jpg" alt="로고 이미지"></a>
                </div>
                <div class="search-container">
                  <!-- 검색 바 -->
                  <div class="search-bar">
                    <input type="text" placeholder="검색어를 입력해주세요">
                    <button type="submit">🔍</button>
                  </div>
              
                  <!-- 아이콘 컨테이너 -->
                  <div class="icon-container">
                    <div class="tooltip-icon">
                    	<a href="cart.jsp<%=query %>" target="_parent"><img src="./../assets/images/cart.jpg" alt="카트 아이콘"></a>
                    	<span class="tooltip-text">장바구니</span>
                    </div>
                    <div class="tooltip-icon">
                    	<a href="#" onclick="logChk(); return false;"><img src="./../assets/images/mypage.jpg" alt="사용자 아이콘"></a>
                    	<span class="tooltip-text">마이페이지</span>
                    </div>
                  </div>
                </div>
              </div>
            <nav class="main-nav">
                <ul>
                  <li><a href="best.jsp<%=query %>" target="_parent">베스트</a></li>
                  <li><a href="domestic.jsp<%=query %>" target="_parent">국내도서</a></li>
                  <li><a href="foreign.jsp<%=query %>" target="_parent">해외도서</a></li>
                  <li><a href="new.jsp<%=query %>" target="_parent">신작</a></li>
                  <li><a href="genre.jsp<%=query %>" target="_parent">장르</a></li>
                </ul>
            </nav>
        </div>
    </header>
</body>
</html>
