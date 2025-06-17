<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String msg = request.getParameter("msg");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log-In</title>
    <link href="./../assets/login.css" rel="stylesheet">
	<%
		if (msg != null && !msg.isEmpty()) {
	%>
	    <script>
	        alert("<%=msg %>");
	        console.log("<%=msg %>");
	    </script>
	<%
	    }
	%>
</head>
<body>
    <div class="wrapper">
    	<form action="<%= request.getContextPath() %>/ControllerMem.do" method="post" id="frm">
			<input type="hidden" name="category" value="frmLog">
	        <!-- 왼쪽 화면 -->
	        <div class="left">
	            <h1>Log-In</h1>
	            <div class="logo"><img src="./../assets/images/login.png"></div>
	        </div>
	
	        <!-- 오른쪽 화면 -->
	        <div class="right">
	            <h2>로그인</h2>
	            <div class="input-group">
	                <label for="id">아이디</label>
	                <input type="text" name="mem_id" id="id" class="input" placeholder="아이디를 입력하세요." onkeydown="enter(event)">
	            </div>
	            <div class="input-group">
	                <label for="password">패스워드</label>
	                <input type="password" name="mem_pwd" id="password" class="input" placeholder="패스워드를 입력하세요." onkeydown="enter(event)">
	                <div class="togglePwd">
	                	<label class="pw_show"><input type="checkbox">비밀번호 표시</label>
	                </div>
	            </div>
	
	            <button type="submit" class="login-btn" id="btn01" onclick="return validateLogIn()" onkeydown="return validateLogIn()">로그인</button>
	
	            <div class="social-login">
	                <button type="button" class="btn-google">
	                    <img src="./../assets/images/google.png">&nbsp;구글로 로그인</button>
	                <button type="button" class="btn-facebook">
	                    <img src="./../assets/images/facebook.png">&nbsp;페이스북으로 로그인</button>
	                <button type="button" class="btn-github">
	                    <img src="./../assets/images/github.png">&nbsp;깃허브로 로그인</button>
	            </div>
	
	            <div class="forgot-password"><a href="forgotPassword.jsp">패스워드를 잊어버리셨나요?</a></div>
	
	            <div class="signup">
	                <a href="./signup.jsp"><button type="button" class = "signup-btn">계정이 없습니까? <span>가입</span>하세요</button></a>
	            </div>
	        </div>
        </form>
    </div>
    <script src = "./../assets/jQueryLib/jquery-3.7.1.js"></script>
    <script src = "./../assets/login.js"></script>
</body>
</html>