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
    <div class="wrapper">
        <!-- 왼쪽 화면 -->
        <div class="left">
            <h1>Sign-Up</h1>
            <div class="logo"><img src="./../assets/images/signup.png"></div>
        </div>

        <!-- 오른쪽 화면 -->
        <div class="right">
            <h2>회원가입</h2>

            <button class="login-btn2" onclick="window.location.href='signup02.jsp'">아이디로 가입</button>

            <div class="social-login">
                <button class="btn-google">
                    <img src="./../assets/images/google.png">&nbsp;구글로 가입</button>
                <button class="btn-facebook">
                    <img src="./../assets/images/facebook.png">&nbsp;페이스북으로 가입</button>
                <button class="btn-github">
                    <img src="./../assets/images/github.png">&nbsp;깃허브로 가입</button>
            </div>

            <div class="forgot-password"><a href="forgotPassword.jsp">패스워드를 잊어버리셨나요?</a></div>
            
            <div class="signup">
                <a href="./login.jsp"><button class = "signup-btn">이미 가입했습니까? <span>로그인</span>하세요</button></a>
            </div>
        </div>
    </div>
    <script src = "./../assets/login.js"></script>
</body>
</html> 