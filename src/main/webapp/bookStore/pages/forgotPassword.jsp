<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>forgot-password</title>
    <link href="./../assets/login.css" rel="stylesheet">
</head>
<body>
    <div class="wrapper">
    	<form action="forgotPwdAction.jsp" method="post" id="frm">
	        <!-- 왼쪽 화면 -->
	        <div class="left">
	            <h1></h1>
	            <div class="logo"><img src="./../assets/images/login.png"></div>
	        </div>
	
	        <!-- 오른쪽 화면 -->
	        <div class="right">
	            <h2>비밀번호 찾기</h2>
	            <div class="input-group">
	                <label for="id">아이디</label>
	                <input type="text" name="id" id="id" class="input" placeholder="아이디를 입력하세요." onkeydown="enter(event)">
	            </div>
	            <div class="input-group">
	                <label for="email">이메일</label>
	                <input type="text" name="email" id="email" class="input" placeholder="이메일을 입력하세요." onkeydown="enter(event)">
	            </div>
	
	            <button type="submit" class="login-btn" id="btn01" onclick="return validateFind()" onkeydown="return validateFind()">비밀번호 찾기</button>
	
	            <div class="forgot-password"><a href="#"></a></div>
	
	            <div class="signup">
	                <a href="./signup.jsp"><button type="button" class = "signup-btn">계정이 없습니까? <span>가입</span>하세요</button></a>
	            </div>
	        </div>
        </form>
    </div>
    <script src = "./../assets/login.js"></script>
</body>
</html>