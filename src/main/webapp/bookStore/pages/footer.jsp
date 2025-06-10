<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Footer Layout</title>
  <link rel="stylesheet" href="./../assets/footer.css">

</head>
<body>
  <footer class="footer-container">
    <!-- 왼쪽 메뉴 -->
    <div class="footer-menu">
      <ul>
        <li><a href="./../index.jsp" target="_parent">홈</a></li>
        <li><a href="#">설정</a></li>
        <li><a href="customerCenter.jsp" target="_parent">고객센터</a></li>
      </ul>
    </div>

    <!-- 중앙 로고 및 SNS 아이콘 -->
    <div class="footer-logo-social">
      <img src="./../assets/images/logo.jpg" alt="로고 이미지" class="footer-logo">
      <div class="footer-social">
        <a href="#"><img src="./../assets/images/facebook.png" alt="Facebook"></a>
        <a href="#"><img src="./../assets/images/twitter.jpg" alt="Twitter"></a>
        <a href="#"><img src="./../assets/images/instargram.png" alt="Instagram"></a>
      </div>
    </div>

    <!-- 오른쪽 연락처 -->
    <div class="footer-contact">
      <p>📧 info@gmail.com</p>
      <p>📞 000 000 0000</p>
      <p>📍 SEOUL, KOREA</p>
    </div>
  </footer>
</body>
</html>
