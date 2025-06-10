<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>신규도서</title>
  <link rel="stylesheet" href="../assets/domestic.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>

</head>
<body>
  <header class="header-container">
		 <%@include file="./header.jsp" %>
  </header>
  <div id="wrapper">
    <!-- 헤더 -->



    <h1>신규도서</h1>
<!-- 메인 콘텐츠 -->
<main class="container">
  <!-- 배너 섹션 -->
  <section class="banner-section">
     <!-- Swiper Container -->
    <div class="swiper" id="mainSwiper">
      <div class="swiper-wrapper">
        <!-- Slides -->
        <div class="swiper-slide"><img src="../assets/images/dbanner07.jpg" alt="배너 이미지"></div>
        <div class="swiper-slide"><img src="../assets/images/dbanner08.jpg" alt="배너 이미지"></div>
        <div class="swiper-slide"><img src="../assets/images/dbanner09.jpg" alt="배너 이미지"></div>
        <div class="swiper-slide"><img src="../assets/images/dbanner05.jpg" alt="배너 이미지"></div>
        <div class="swiper-slide"><img src="../assets/images/dbanner04.jpg" alt="배너 이미지"></div>
        <div class="swiper-slide"><img src="../assets/images/dbanner02.jpg" alt="배너 이미지"></div>
        <div class="swiper-slide"><img src="../assets/images/dbanner03.jpg" alt="배너 이미지"></div>
        <div class="swiper-slide"><img src="../assets/images/dbanner01.jpg" alt="배너 이미지"></div>
        <div class="swiper-slide"><img src="../assets/images/dbanner06.jpg" alt="배너 이미지"></div>
        <div class="swiper-slide"><img src="../assets/images/dbanner10.jpg" alt="배너 이미지"></div>
      </div>
        <!-- Navigation buttons -->
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
		<div class="swiper-pagination custom-pagination"></div>
		
    </div>
    <div class="swiper" style="width: 274px; height: 380px; margin-left: 16px;">
      <div class="swiper-wrapper">
        <div class="swiper-slide"><img id="banner-img" src="../assets/images/dbanner11.jpg" alt="배너 이미지" class="banner-img3"></div>
      </div>
    </div>
</section>


      <section class="main-content">
        <!-- 추천 도서 1 -->
        <div>
          <img src="../assets/images/dbanner14.jpg" alt="추천도서1" id="subb1">
          <img src="../assets/images/dbanner15.jpg" alt="추천도서2" id="subb2">
        </div>
        <div id="subb3"></div>
    </section>

    
<section class="today-content">
  <div><h2>오늘의 책</h2></div>
  <div id="today-1">추천순</div>
  <div id="today-2">더보기→</div>
</section>


    <section class="main-content">
        <div class="flex-container">
          <!-- 1열: 오늘의 책 이미지 -->
          <div class="flex-item">
            <a href="./bookDetail.jsp?book_id=100"><img src="../assets/images/ntodaybook.jpg" alt="오늘의 책" id="todaybook"></a>
          </div>
      
          <!-- 2열: 텍스트 정보 -->
          <div class="flex-item" id="todayinfo">
            <span id="book-category"><br><br><br>[신규도서]</span><br><br><br>
            <span id="book-category1">갈 수 없지만 알 수 있는<br></span>
            <span id="book-category2">지웅배 지음<br>
              더 숲 | 2025년 3월<br>
              25,200원</span>
          </div>
      
          <div class="flex-item" id="third-column">
            <div class="grid-container">

              
              <div class="grid-item3"><a href="./bookDetail.jsp?book_id=119"><img src="../assets/images/nrecommandcount1.jpg"></a></div>
              <div class="grid-item3"><a href="./bookDetail.jsp?book_id=115"><img src="../assets/images/nrecommandcount2.jpg"></a></div>
              <div class="grid-item3"><a href="./bookDetail.jsp?book_id=121"><img src="../assets/images/nrecommandcount3.jpg"></a></div>
              
              
              
              <div class="grid-item4"><div class="badge">1</div>
              <span class="title">이스라엘을 위한 변경</span><br><br>
              <span class="writer">제이크 월리스</span><br><br>
              <span class="publishing">님로드</span>
            </div>
                            
              
              <div class="grid-item4"><div class="badge">2</div>
                <span class="title">어른을 위한 영어 수업</span><br><br>
                <span class="writer">채서영 지음</span><br><br>
                <span class="publishing">북커스</span>
              </div>
            
              <div class="grid-item4"><div class="badge">3</div>
                <span class="title">집중하는 뇌는 <br>식탁에서 자란다</span><br><br>
                <span class="writer">강보경  지음</span><br><br>
                <span class="publishing">미다스북스</span>
              </div>

            </div>
            </div>
          </div>
      </section>

      <div><h2>화제의 책</h2></div>
      <section class="grid-section">
        <div class="grid-container1">
          <div class="grid-item11">
            <a href="./bookDetail.jsp?book_id=107" class="image-link"><img id="image1" src="../assets/images/dbanner25.jpg" width="200px" height="280px"></a><br>
          </div>
          <div class="grid-item11">
            <a href="./bookDetail.jsp?book_id=120" class="image-link"><img id="image2" src="../assets/images/dbanner26.jpg" width="200px" height="280px"></a><br>
          </div>
          <div class="grid-item11">
            <a href="./bookDetail.jsp?book_id=116" class="image-link"><img id="image3" src="../assets/images/dbanner27.jpg" width="200px" height="280px"></a><br>
          </div>
          <div class="grid-item11">
            <a href="./bookDetail.jsp?book_id=126" class="image-link"><img id="image4" src="../assets/images/dbanner28.jpg" width="200px" height="280px"></a><br>
          </div>
          <div class="grid-item11">
            <a href="./bookDetail.jsp?book_id=124" class="image-link"><img id="image5" src="../assets/images/dbanner29.jpg" width="200px" height="280px"></a><br>
          </div>
        </div>
      </section>
      <br><br>

    <!-- 푸터 -->

  </div>
  <footer class="footer-container">
  	<%@include file="./footer.jsp" %>
  </footer>
	<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
  	<script src="../assets/domestic.js"></script>
</body>
</html>
