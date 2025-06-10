<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 탈퇴</title>
    <link href="./../assets/login.css" rel="stylesheet">
  
</head>
<body>
    <div class="wrapper">
    	<form action="deleteAction.jsp" method="post" id="frm">
	        <!-- 왼쪽 화면 -->
	        <div class="left">
	            <h1>회원 탈퇴</h1>
	            <div class="logo"><img src="./../assets/images/delete.png"></div>
	        </div>
	
	        <!-- 오른쪽 화면 -->
	        <div class="right">
	            <h2>회원 탈퇴</h2>
	            <div class="input-group">
	                <label for="id">아이디</label>
	                <input type="text" name="memValues" id="id" class="input" placeholder="아이디를 입력하세요." onkeydown="enter(event)">
	            </div>
	            <div class="input-group">
	                <label for="password">패스워드</label>
	                <input type="password" name="memValues" id="password" class="input" placeholder="패스워드를 입력하세요." onkeydown="enter(event)">
	            </div>
	
	            <button type="submit" class="login-btn" id="btn01" onclick="return validateLogIn();" onkeydown="return validateLogIn()">탈퇴</button>
	
	        </div>
        </form>
    </div>
    <script src = "./../assets/login.js"></script>
</body>
</html>