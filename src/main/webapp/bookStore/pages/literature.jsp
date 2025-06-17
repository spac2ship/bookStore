<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../assets/genre.css">
  <title>장르별</title>

</head>
<body>
  <header class="header-container">
	 <%@include file="./header.jsp" %>
  </header>
  <!-- 헤더 -->
  <div id="wrapper">


    <h1>장르별</h1>

    <div class="tab-container">
      <a href="genre.jsp" class="tab">전체</a>
      <a href="literature.jsp" class="tab active">문학</a>
      <a href="humanities.jsp" class="tab">인문과학</a>
      <a href="social.jsp" class="tab">사회과학</a>
      <a href="science.jsp" class="tab">자연과학</a>
    </div>

<section class="today-content">
  <div><h2>오늘의 책</h2></div>
  <div id="today-1">추천순</div>
  <div id="today-2">더보기→</div>
</section>


    <section class="main-content">
        <div class="flex-container">
          <!-- 1열: 오늘의 책 이미지 -->
          <div class="flex-item">
            <a href="./bookDetail.jsp?book_id=110"><img src="../assets/images/ntodaybook1.jpg" alt="오늘의 책" id="todaybook"></a>
          </div>
      
          <!-- 2열: 텍스트 정보 -->
          <div class="flex-item" id="todayinfo">
            <span id="book-category"><br><br><br>[문학]</span><br><br><br>
            <span id="book-category1">모순<br></span>
            <span id="book-category2">양귀자 지음<br>
              쓰다 | 2013년 4월<br>
              11,700원</span>
          </div>
      
          <div class="flex-item" id="third-column">
            <div class="grid-container">

              
              <div class="grid-item3"><a href="./bookDetail.jsp?book_id=114"><img src="../assets/images/dbanner31-1.jpg"></a></div>
              <div class="grid-item3"><a href="./bookDetail.jsp?book_id=104"><img src="../assets/images/dbanner35-1.jpg"></a></div>
              <div class="grid-item3"><a href="./bookDetail.jsp?book_id=122"><img src="../assets/images/dbanner34-1.jpg"></a></div>
              
              
              
              <div class="grid-item4"><div class="badge">1</div>
              <span class="title">소년이 온다</span><br><br>
              <span class="writer">한강 지음</span><br><br>
              <span class="publishing">창비</span>
            </div>
                            
              
            <div class="grid-item4"><div class="badge">2</div>
            <span class="title">급류</span><br><br>
            <span class="writer">정대건 지음</span><br><br>
            <span class="publishing">민음사</span>
          </div>
            
          <div class="grid-item4"><div class="badge">3</div>
          <span class="title">채식주의자</span><br><br>
          <span class="writer">한강 지음</span><br><br>
          <span class="publishing">창비</span>
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
