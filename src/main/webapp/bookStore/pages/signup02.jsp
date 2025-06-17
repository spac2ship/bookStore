<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign-Up</title>
    <link href="./../assets/login.css" rel="stylesheet">
</head>
<body>
	<%
	    String msg = request.getParameter("msg");
	    if (msg != null && !msg.isEmpty()) {
	%>
	    <script>
	        alert("<%=msg %>");
	        console.log("<%=msg %>");
	    </script>
	<%
	    }
	%>
    <div class="wrapper">
    	<!-- <form action="signupAction.jsp" method="post" id="frm"> -->
    	<form action="<%= request.getContextPath() %>/ControllerMem.do" method="post" id="frm">
			<input type="hidden" name="category" value="frmIns">
	        <!-- 왼쪽 화면 -->
	        <div class="left">
	            <h1>Sign-Up</h1>
	            <div class="logo"><img src="./../assets/images/signup.png"></div>
	        </div>
	
	        <!-- 오른쪽 화면 -->
	        <div class="right">
	            <h2>회원가입</h2>
	            <div class="input-group">
	                <label for="id">아이디</label>
	                <input type="text" name="mem_id" id="id" class="input" placeholder="아이디를 입력하세요." onkeydown="enter(event)">
	            </div>
	            <div class="input-group">
	                <label for="password">패스워드</label>
	                <input type="password" name="mem_pwd" id="password" class="input" placeholder="패스워드를 입력하세요." onkeydown="enter(event)">
	            </div>
	            <div class="input-group">
	                <label for="name">이름</label>
	                <input type="text" name="mem_name" id="name" class="input" placeholder="이름을 입력하세요." onkeydown="enter(event)">
	            </div>
	            <div class="input-group">
	                <label for="email">이메일</label>
	                <input type="email" name="mem_email" id="email" class="input" placeholder="이메일을 입력하세요." onkeydown="enter(event)">
	            </div>
	            <div class="input-group">
	                <label for="phone">휴대폰 번호</label>
	                <input type="text" name="mem_phone" id="phone" class="input" placeholder="번호를 입력하세요." onkeydown="enter(event)">
	            </div>
	            <div class="input-group">
	                <label for="add1">주소</label>
	                <input type="text" name="mem_add1" id="add1" class="input" placeholder="주소를 입력하세요." onkeydown="enter(event)">
	                <input type="text" name="mem_add2" id="add2" class="input" placeholder="상세주소를 입력하세요." onkeydown="enter(event)">
	            </div>
	            <button type="submit" class="login-btn" id="btn01" onclick="return validateSignUp()" onkeydown="return validateSignUp()">가입</button>
	            
	
	            <div class="forgot-password"><a href="#">패스워드를 잊어버리셨나요?</a></div>
	            
	            <div class="signup">
	                <a href="./login.jsp"><button type="button" class = "signup-btn">이미 가입했습니까? <span>로그인</span>하세요</button></a>
	            </div>
	        </div>
        </form>
    </div>
    <script src = "./../assets/login.js"></script>
</body>
</html> 