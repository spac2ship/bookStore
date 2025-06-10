<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="db.*" %>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ page import="java.util.List" %>

<% request.setCharacterEncoding("UTF-8"); %>
<%
    String memId = (String) session.getAttribute("log_id"); // 세션 쓸거면
    String bookId = request.getParameter("book_id");
    BookDTO book = null;
    try {
        book = BookDAO.getInstance().getBookById(bookId);
    } catch (Exception e) {
        out.println("DB 오류: " + e.getMessage());
    }
    
    // 페이징 변수 설정 - 한 곳에서만 선언
    int pageSize = 5; // 한 페이지당 리뷰 개수
    int pageNum = 1;  // 현재 페이지 번호
    
    String pageParam = request.getParameter("page");
    if (pageParam != null && !pageParam.isEmpty()) {
        try {
            pageNum = Integer.parseInt(pageParam);
            if (pageNum < 1) pageNum = 1;
        } catch (NumberFormatException e) {
            pageNum = 1;
        }
    }
%>

<%-- 리뷰 삭제 처리 --%>
<%
if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("delete_review_id") != null) {
    String deleteIdStr = request.getParameter("delete_review_id");
    try {
        int deleteId = Integer.parseInt(deleteIdStr);
        // 권한 확인: 본인 리뷰인지 체크
        boolean isOwner = false;
        BookReviewDTO review = BookReviewDAO.getInstance().getReviewById(deleteId);
        if (review != null && memId != null && memId.equals(review.getMem_id())) {
            isOwner = true;
        }
        
        if (isOwner) {
            int result = BookReviewDAO.getInstance().deleteReview(deleteId);
            if (result > 0) {
                response.sendRedirect("bookDetail.jsp?book_id=" + bookId + "&page=" + pageNum);
                return;
            }
        } else {
%>
    <script>alert("본인 리뷰만 삭제할 수 있습니다.");</script>
<%
        }
    } catch(Exception e) {
%>
    <script>alert("리뷰 삭제 실패: <%= e.getMessage() %>");</script>
<%
    }
}
%>

<%-- 리뷰 수정 처리 --%>
<%
if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("submit_edit_review") != null) {
    int reviewId = Integer.parseInt(request.getParameter("review_id"));
    int rating = Integer.parseInt(request.getParameter("rating"));
    String content = request.getParameter("content");
    
    try {
        BookReviewDTO originalReview = BookReviewDAO.getInstance().getReviewById(reviewId);
        if (memId == null || !memId.equals(originalReview.getMem_id())) {
%>
            <script>alert('본인 리뷰만 수정할 수 있습니다.'); history.back();</script>
<%
            return;
        }

        BookReviewDTO updatedReview = new BookReviewDTO();
        updatedReview.setReview_id(reviewId);
        updatedReview.setContent(content);
        updatedReview.setRating(rating);

        int result = BookReviewDAO.getInstance().updateReview(updatedReview);
        if (result > 0) {
            response.sendRedirect("bookDetail.jsp?book_id=" + bookId + "&page=" + pageNum);
            return;
        } else {
%>
            <script>alert('리뷰 수정 실패'); history.back();</script>
<%
        }
    } catch(Exception e) {
%>
        <script>alert("리뷰 수정 중 오류 발생: <%= e.getMessage() %>"); history.back();</script>
<%
    }
}
%>

<%-- 장바구니 추가 처리 --%>
<%
if ("POST".equalsIgnoreCase(request.getMethod()) && "Y".equals(request.getParameter("add_cart"))) {
    if(memId == null) { // 로그인 여부 체크
%>
    <script>
        alert("로그인이 필요한 서비스입니다.");
        location.href = "login.jsp";
    </script>
<%
        return;
    }
    CartDAO cartDAO = CartDAO.getInstance();
    int result = cartDAO.cartIns(memId, bookId); // memId 추가 전달
    
    if (result > 0) {
%>
    <script>alert("카트에 정상적으로 추가되었습니다.");</script>
<%
    } else {
%>
    <script>alert("카트 추가 실패!");</script>
<%
    }
}
%>

<%-- 주문 처리 --%>
<%
if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("buy_now") != null) {
    // 로그인 체크
    if (memId == null) {
        String currentPage = request.getRequestURI(); 
        String bookIdParam = "?book_id=" + request.getParameter("book_id");
        String returnUrl = currentPage + bookIdParam;
%>
    <script>
        alert("로그인이 필요한 서비스입니다.");
        window.location.href = "login.jsp?returnUrl=<%= java.net.URLEncoder.encode(returnUrl, "UTF-8") %>";
    </script>
<%
        return;
    }
    // 주문 처리
    int bookIdInt = Integer.parseInt(bookId);
    OrderDAO orderDAO = OrderDAO.getInstance();
    int orderId = orderDAO.createOrder(memId, bookIdInt);

    if (orderId > 0) {
%>
    <script>
        alert("주문이 완료되었습니다.");
        location.href = "./orderDelivery.jsp?order_id=<%= orderId %>";
    </script>
<%
    } else {
%>
    <script>alert("주문 처리 실패!");</script>
<%
    }
}
%>

<%-- 리뷰 등록 처리 --%>
<%
if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("submit_review") != null) {
    if(memId == null) {
%>
    <script>
        alert("로그인이 필요한 서비스입니다.");
        location.href = "login.jsp";
    </script>
<%
        return;
    }

    try {
        BookReviewDTO review = new BookReviewDTO();
        review.setBook_id(Integer.parseInt(bookId));
        review.setMem_id(memId);
        review.setContent(request.getParameter("content"));
        review.setRating(Integer.parseInt(request.getParameter("rating")));
        review.setReg_date(new java.sql.Date(System.currentTimeMillis()));

        int result = BookReviewDAO.getInstance().insertReview(review);
        if(result > 0) {
            // PRG 패턴 적용!
            response.sendRedirect("bookDetail.jsp?book_id=" + bookId);
            return;
        }
    } catch(Exception e) {
%>
    <script>alert("리뷰 등록 실패: <%= e.getMessage() %>");</script>
<%
    }
}
%>

<%
// 리뷰 목록과 페이징 처리
int totalCount = 0;
try {
    totalCount = BookReviewDAO.getInstance().getReviewCountByBookId(Integer.parseInt(bookId));
} catch(Exception e) {
    out.println("리뷰 개수 조회 오류: " + e.getMessage());
}

int totalPage = (totalCount == 0) ? 1 : (int) Math.ceil((double) totalCount / pageSize);
if (pageNum > totalPage) pageNum = totalPage;

int startRow = (pageNum - 1) * pageSize + 1; // Oracle은 1부터 시작
int endRow = pageNum * pageSize;

List<BookReviewDTO> reviews = null;
try {
    reviews = BookReviewDAO.getInstance().getReviewsByBookIdWithPaging(
        Integer.parseInt(bookId), startRow, endRow
    );
} catch(Exception e) {
    out.println("리뷰 조회 오류: " + e.getMessage());
}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title><%= (book != null) ? book.getTitle() : "도서 정보 없음" %></title>
    <link rel="stylesheet" href="../assets/bookDetail.css">
</head>
<body>
  <header class="header-container">
	 <%@include file="./header.jsp" %>
  </header>
  <div id="wrapper">
    <br>
    <span id="title"><%= (book != null) ? book.getTitle() : "" %></span>
    <hr><br>
    <div class="container">
      <div class="photo">
        <% if (book != null) { %>
          <img src="<%= book.getImage() %>">
        <% } %>
      </div>
      <div class="info">
        <% if (book != null) { %>
          <h2><%= book.getTitle() %></h2>
          <span id="bookInt"><%= book.getBook_int() %></span><br>
          <span id="author"><b> 저자 : </b><%= book.getAuthor() %></span><br>
          <span id="publisher"><b> 출판사 : </b><%= book.getPublisher() %></span><br>
          <span id="price"><b> 가격 : </b><%= book.getPrice() %></span><br>
          <span id="category"><b> 분류 : </b><%= book.getCategory() %></span><br>
          <span id="genre"><b> 장르 : </b><%= book.getGenre() %></span><br>
          <span id="regDate"><b> 등록일 : </b><%= book.getReg_date() %></span>
          
          <form method="post" style="display:inline;">
            <input type="hidden" name="book_id" value="<%= book.getBook_id() %>">
            <input type="hidden" name="memId" value="<%= memId %>">
            <input type="hidden" name="add_cart" value="Y">
            <button type="submit" class="button1">장바구니 담기</button>
          </form>
          
          <form method="post" style="display:inline;">
            <input type="hidden" name="book_id" value="<%= book.getBook_id() %>">
            <input type="hidden" name="memId" value="<%= memId %>">
            <input type="hidden" name="buy_now" value="Y">
            <button type="submit" class="button2">바로구매</button>
          </form>
        <% } else { %>
          <p>도서 정보를 찾을 수 없습니다.</p>
        <% } %>
      </div>
    </div>

    <%-- 리뷰 작성 폼 --%>
    <div class="review-form">
        <h3>리뷰 작성</h3>
        <% if (memId != null) { %>
        <form method="post">
            <input type="hidden" name="book_id" value="<%= bookId %>">
            <div class="star-rating">
                <span class="star" data-value="1">&#9733;</span>
                <span class="star" data-value="2">&#9733;</span>
                <span class="star" data-value="3">&#9733;</span>
                <span class="star" data-value="4">&#9733;</span>
                <span class="star" data-value="5">&#9733;</span>
                <input type="hidden" name="rating" id="rating-value" value="0">
            </div>
            <textarea name="content" rows="4" placeholder="리뷰 내용을 작성해주세요" required></textarea>
            <button type="submit" name="submit_review">리뷰 등록</button>
        </form>
        <% } else { %>
        <p>리뷰 작성을 위해선 <a href="login.jsp">로그인</a>이 필요합니다.</p>
        <% } %>
    </div>

    <%-- 리뷰 목록 출력 --%>
    <div class="review-section">
        <h3>도서 리뷰</h3>
        <% if (reviews != null && !reviews.isEmpty()) {
            for (BookReviewDTO review : reviews) {
        %>
        <div class="review-aladin">
            <div class="review-starbox">
                <span class="review-stars">
                    <% for(int i=0; i<review.getRating(); i++) { %>
                        <span class="star on">&#9733;</span>
                    <% } %>
                    <% for(int i=review.getRating(); i<5; i++) { %>
                        <span class="star">&#9733;</span>
                    <% } %>
                </span>
            </div>
            <div class="review-main">
                <div class="review-title">
                    <b><%= review.getContent().length() > 30 ? review.getContent().substring(0, 30) + "..." : review.getContent() %></b>
                </div>
                <div class="review-body">
                    <%= review.getContent() %>
                </div>
                <div class="review-meta">
				    <span class="review-writer"><%= review.getMem_id() %></span>
				    <span class="review-date"><%= review.getReg_date() %></span>
				    <% if (memId != null && memId.equals(review.getMem_id())) { %>
				        <div class="review-btns">
				            <button type="button" onclick="toggleEditForm(<%= review.getReview_id() %>)">수정</button>
				            <form method="post" style="display:inline;">
				                <input type="hidden" name="delete_review_id" value="<%= review.getReview_id() %>">
				                <input type="hidden" name="id" value="<%= memId %>">
				                <input type="hidden" name="page" value="<%= pageNum %>">
				                <button type="submit" class="delete-btn" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</button>
				            </form>
				        </div>
				    <% } %>
				</div>
                
                <!-- 숨겨진 수정 폼 -->
                <form id="edit-form-<%= review.getReview_id() %>" class="review-form" method="post" style="display:none; margin-top:10px;">
                    <input type="hidden" name="review_id" value="<%= review.getReview_id() %>">
                    <input type="hidden" name="book_id" value="<%= bookId %>">
                    <input type="hidden" name="id" value="<%= memId %>">
                    <input type="hidden" name="page" value="<%= pageNum %>">
                    <div class="star-rating">
                        <% for (int i = 1; i <= 5; i++) { %>
                            <span class="star <%= (review.getRating() >= i) ? "selected" : "" %>" data-value="<%= i %>">&#9733;</span>
                        <% } %>
                        <input type="hidden" name="rating" id="edit-rating-value-<%= review.getReview_id() %>" value="<%= review.getRating() %>">
                    </div>
                    <textarea name="content" rows="4" required><%= review.getContent() %></textarea>
                    <button type="submit" name="submit_edit_review">수정 완료</button>
                    <button type="button" onclick="toggleEditForm(<%= review.getReview_id() %>)">취소</button>
                </form>
            </div>
        </div>
        <% } } else { %>
        <p>아직 등록된 리뷰가 없습니다.</p>
        <% } %>
    </div>

    <!-- 페이징 네비게이션 -->
    <div class="pagination">
        <% if (totalPage > 1) { %>
            <% if(pageNum > 1) { %>
                <a href="bookDetail.jsp?book_id=<%= bookId %>&page=<%= pageNum - 1 %>">◀ 이전</a>
            <% } %>
            <% for(int i = 1; i <= totalPage; i++) {
                String link = "bookDetail.jsp?book_id=" + bookId + "&page=" + i;
            %>
                <% if(i == pageNum) { %>
                    <span class="current-page"><%= i %></span>
                <% } else { %>
                    <a href="<%= link %>"><%= i %></a>
                <% } %>
            <% } %>
            <% if(pageNum < totalPage) { %>
                <a href="bookDetail.jsp?book_id=<%= bookId %>&page=<%= pageNum + 1 %>">다음 ▶</a>
            <% } %>
        <% } %>
    </div>

  </div><!-- wrapper -->
  <footer class="footer-container">
    <%@include file="./footer.jsp" %>
  </footer>
  <script src="../assets/bookDetail.js"></script>
</body>
</html>
