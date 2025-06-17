<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>국내도서</title>
  <link rel="stylesheet" href="../assets/domestic.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
  <script>var contextPath = '<%= request.getContextPath() %>';</script>
  <%
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    String dquery = "";
    if (id != null && pwd != null) {
    	dquery = "?id=" + id + "&pwd=" + pwd;
    } else {
    	dquery = "?";
    }
  %>
</head>
<body>
  <header class="header-container">
	 <%@include file="./header.jsp" %>
  </header>
  <!-- 헤더 -->
  <div id="wrapper">
    
    <h1>국내도서</h1>
    <!-- 메인 콘텐츠 -->
    <main class="container">
      <!-- 배너 섹션 -->
      <section class="banner-section">
         <!-- Swiper Container -->
        <div class="swiper" id="mainSwiper">
          <div class="swiper-wrapper">
            <!-- Slides -->
            <div class="swiper-slide"><img src="../assets/images/dbanner01.jpg" alt="배너 이미지"></div>
            <div class="swiper-slide"><img src="../assets/images/dbanner02.jpg" alt="배너 이미지"></div>
            <div class="swiper-slide"><img src="../assets/images/dbanner03.jpg" alt="배너 이미지"></div>
            <div class="swiper-slide"><img src="../assets/images/dbanner04.jpg" alt="배너 이미지"></div>
            <div class="swiper-slide"><img src="../assets/images/dbanner05.jpg" alt="배너 이미지"></div>
            <div class="swiper-slide"><img src="../assets/images/dbanner06.jpg" alt="배너 이미지"></div>
            <div class="swiper-slide"><img src="../assets/images/dbanner07.jpg" alt="배너 이미지"></div>
            <div class="swiper-slide"><img src="../assets/images/dbanner08.jpg" alt="배너 이미지"></div>
            <div class="swiper-slide"><img src="../assets/images/dbanner09.jpg" alt="배너 이미지"></div>
            <div class="swiper-slide"><img src="../assets/images/dbanner10.jpg" alt="배너 이미지"></div>
          </div>
            <!-- Navigation buttons -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
            <div class="swiper-pagination custom-pagination"></div>
            
        </div>

        <div class="swiper" id="sideSwiper" style="width: 274px; height: 380px; margin-left: 16px;">
		  <div class="swiper-wrapper">
		    <div class="swiper-slide">
		      <img src="../assets/images/dbanner11.jpg" alt="배너 이미지1" class="banner-img3">
		    </div>
		    <div class="swiper-slide">
		      <img src="../assets/images/dbanner12.jpg" alt="배너 이미지2" class="banner-img3">
		    </div>
		    <div class="swiper-slide">
		      <img src="../assets/images/dbanner13.jpg" alt="배너 이미지3" class="banner-img3">
		    </div>
		    <!-- 추가 이미지가 있으면 계속 추가 -->
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
            <a href="./bookDetail.jsp<%=dquery %>&book_id=107"><img src="../assets/images/dtodaybook.jpg" alt="오늘의 책" id="todaybook"></a>
          </div>
      
          <!-- 2열: 텍스트 정보 -->
          <div class="flex-item" id="todayinfo">
            <span id="book-category"><br><br><br>[국내도서]</span><br><br><br>
            <span id="book-category1">넥스트 인텔리전스<br></span>
            <span id="book-category2">로랑 알렉상드로 (지은이), 임호경(옮긴이)<br>
              열린책들 | 2025년 3월<br>
              32,000원 → 28,800원</span> (10% 할인)
          </div>
      
          <div class="flex-item" id="third-column">
            <div class="grid-container">

              
              <div class="grid-item3"><a href="./bookDetail.jsp<%=dquery %>&book_id=108"><img src="../assets/images/drecommandcount1.jpg"></a></div>
              <div class="grid-item3"><a href="./bookDetail.jsp<%=dquery %>&book_id=103"><img src="../assets/images/drecommandcount2.jpg"></a></div>
              <div class="grid-item3"><a href="./bookDetail.jsp<%=dquery %>&book_id=106"><img src="../assets/images/drecommandcount3.jpg"></a></div>
              
              
              
              <div class="grid-item4"><div class="badge">1</div>
              <span class="title">다시 성장이다.</span><br><br>
              <span class="writer">오세훈 지음</span><br><br>
              <span class="publishing">김영사</span>
            </div>
                            
              
              <div class="grid-item4"><div class="badge">2</div>
                <span class="title">국민이 먼저입니다.</span><br><br>
                <span class="writer">한동훈 지음</span><br><br>
                <span class="publishing">메디치미디어</span>
              </div>
            
              <div class="grid-item4"><div class="badge">3</div>
                <span class="title" style="font-size: 14px;">내가 아직 쓰지 않은</span><br><br>
                <span class="writer">강신애 지음</span><br><br>
                <span class="publishing">문학동네</span>
              </div>

            </div>
            </div>
          </div>
      </section>
      
      <div><h2>화제의 책</h2></div>
      <section class="grid-section">
        <div class="grid-container1">
          <div class="grid-item11">
            <a href="./bookDetail.jsp<%=dquery %>&book_id=107" class="image-link"><img id="image1" src="../assets/images/dbanner25.jpg" width="200px" height="280px"></a><br>
          </div>
          <div class="grid-item11">
            <a href="./bookDetail.jsp<%=dquery %>&book_id=120" class="image-link"><img id="image2" src="../assets/images/dbanner26.jpg" width="200px" height="280px"></a><br>
          </div>
          <div class="grid-item11">
            <a href="./bookDetail.jsp<%=dquery %>&book_id=116" class="image-link"><img id="image3" src="../assets/images/dbanner27.jpg" width="200px" height="280px"></a><br>
          </div>
          <div class="grid-item11">
            <a href="./bookDetail.jsp<%=dquery %>&book_id=126" class="image-link"><img id="image4" src="../assets/images/dbanner28.jpg" width="200px" height="280px"></a><br>
          </div>
          <div class="grid-item11">
            <a href="./bookDetail.jsp<%=dquery %>&book_id=124" class="image-link"><img id="image5" src="../assets/images/dbanner29.jpg" width="200px" height="280px"></a><br>
          </div>
        </div>
      </section>
      <br><br>

    <!-- 푸터 -->
    
  </div>
  <footer class="footer-container">
		<%@include file="./footer.jsp" %>
	</footer>
	<script>window.dquery = '<%=dquery %>';</script>
	<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
  	<script src="../assets/domestic.js"></script>
</body>
</html>
