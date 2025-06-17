<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>장르별</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
  <link rel="stylesheet" href="../assets/genre.css">
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


    <h1>장르별</h1>

    <div class="tab-container">
      <a href="genre.jsp<%=dquery %>" class="tab">전체</a>
      <a href="literature.jsp<%=dquery %>" class="tab">문학</a>
      <a href="humanities.jsp<%=dquery %>" class="tab">인문과학</a>
      <a href="social.jsp<%=dquery %>" class="tab">사회과학</a>
      <a href="science.jsp<%=dquery %>" class="tab active">자연과학</a>
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
            <a href="./bookDetail.jsp<%=dquery %>&book_id=124"><img src="../assets/images/dbanner41-1.jpg" alt="오늘의 책" id="todaybook"></a>
          </div>
      
          <!-- 2열: 텍스트 정보 -->
          <div class="flex-item" id="todayinfo">
            <span id="book-category"><br><br><br>[자연과학]</span><br><br><br>
            <span id="book-category1">코스모스<br></span>
            <span id="book-category2">칼 세이건 지음<br>
              사이언스북스  | 2004년 12월<br>
              45,000원</span>
          </div>
      
          <div class="flex-item" id="third-column">
            <div class="grid-container">

              
              <div class="grid-item3"><a href="./bookDetail.jsp<%=dquery %>&book_id=102"><img src="../assets/images/dbanner42-1.jpg"></a></div>
              <div class="grid-item3"><a href="./bookDetail.jsp<%=dquery %>&book_id=118"><img src="../assets/images/dbanner43-1.jpg"></a></div>
              <div class="grid-item3"><a href="./bookDetail.jsp<%=dquery %>&book_id=111"><img src="../assets/images/dbanner44-1.jpg"></a></div>
              
              
              
              <div class="grid-item4"><div class="badge">1</div>
              <span class="title">교육의 뇌과학</span><br><br>
              <span class="writer">바버라 오클리 지음</span><br><br>
              <span class="publishing">현대지성</span>
            </div>
                            
              
            <div class="grid-item4"><div class="badge">2</div>
            <span class="title">이기적 유전자</span><br><br>
            <span class="writer">리처드 도킨스 지음</span><br><br>
            <span class="publishing">을유문화사</span>
          </div>
            
          <div class="grid-item4"><div class="badge">3</div>
          <span class="title">무의식은 어떻게<br> 나를 설계하는가</span><br><br>
          <span class="writer">데이비드 이글먼 지음</span><br><br>
          <span class="publishing">RHK</span>
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
  <script src="../assets/genre.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
  <script src="../assets/domestic.js"></script>
</body>
</html>
