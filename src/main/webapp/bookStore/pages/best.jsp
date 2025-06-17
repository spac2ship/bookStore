<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.*" %>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<!DOCTYPE jsp>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>베스트셀러</title>
    <link rel="stylesheet" href="./../assets/best.css">
    <%
	    String id = request.getParameter("id");
	    String pwd = request.getParameter("pwd");
	    String bquery = "";
	    if (id != null && pwd != null) {
	    	bquery = "?id=" + id + "&pwd=" + pwd;
	    } else {
	    	bquery = "?";
	    }
	%>

</head>
<body>
    <!-- 헤더 로드될 위치 -->
    <header class="header-container">
        <%@include file="./header.jsp" %>
    </header>
    <div class="wrapper">


        <div id = "current-position">
            <ol class="items-center">
                <li class="relative items-center">
                    <a href="./../index.jsp<%=bquery%>"><img src="./../assets/images/home.png">
                    </a>
                </li>
                <li class="best-page">
                    <a href="best.jsp<%=bquery%>">&nbsp;/&nbsp;베스트셀러</a></li>
            </ol>
        </div>
        
        <nav class="best">
            <div class="local-nav">
                <h2>베스트 셀러</h2>
                <p>월간 베스트</p>
            </div>
            <div class="filter-box">
                <span>2025.03 기준</span>
                <div class="filter-options">
                    <select class="show-items" id="pg-size">
                        <option value="5" selected>5개씩 보기</option>
                        <option value="10">10개씩 보기</option>
                    </select>
                </div>
            </div>
        </nav>
        <form action="cartMultiAdd.jsp<%=bquery %>" method="post" id="multiAdd">
		    <input type="hidden" name="id" value="<%= id %>">
		    <input type="hidden" name="pwd" value="<%= pwd %>">
	        <nav class="items-end">
	            <input type="checkbox" id="checkbox" name="book_id" onclick="selectAll(this)"><label for="checkbox"> 전체선택 </label> 
	            <button type="submit" class="cart-btn"><img src="./../assets/images/cart.jpg">&nbsp;장바구니</button>
	        </nav>


	        <div class="content-wrapper">
	            <!-- 왼쪽 공간 창출 -->
	            <aside class="left-space"></aside>  
	                <section class="book-list">
	                    <!-- 1위 -->
	                    <div class="book-item">
	                        <input type="checkbox" name="book_id" value="114">
	                        <div class="book-image"><a href="bookDetail.jsp<%=bquery%>&book_id=114">
	                            <img src="./../assets/images/book/humanActs.jpg"></a></div>
	                        <div class="book-info">
	                            <div class="book-ranking">1</div>
	                            <div class="book-title"><a href="bookDetail.jsp<%=bquery%>&book_id=114">소년이 온다</a></div>
	                            <div class="book-meta">한강 / 창비 / 2014.05.19</div>
	                            <div class="book-price"><span>10%</span>&nbsp;13,500원</div>
	                            <div class="book-description">2014년 만해문학상, 2017년 이탈리아 말라파르테 문학상을 수상하고 
	                                전세계 20여개국에 번역 출간되며 세계를 사로잡은 우리 시대의 소설 『소년이 온다』. 이 작품은 『채식주의...</div>
	                        </div>
	                        <div class="buttons">
	                            <a href="cartAdd.jsp<%=bquery%>&book_id=114"><button type="button" class="cart-btn"><img src="./../assets/images/cart.jpg">&nbsp;장바구니</button></a>
	                            <a href="orderAdd.jsp<%=bquery%>&book_id=114"><button type="button" class="buy-btn">바로구매</button></a>
	                        </div>
	                    </div>
	
	                    <!-- 2위 -->
	                    <div class="book-item">
	                        <input type="checkbox" name="book_id" value="123">
	                        <div class="book-image"><a href="bookDetail.jsp<%=bquery%>&book_id=123">
	                            <img src="./../assets/images/book/buddha'sWords.jpg"></a>
	                        </div>
	                        <div class="book-info">
	                            <div class="book-ranking">2</div>
	                            <div class="book-title"><a href="bookDetail.jsp<%=bquery%>&book_id=123">초역 부처의 말</a></div>
	                            <div class="book-meta">코이케 류노스케 / 포레스트북스 / 2024.05.30</div>
	                            <div class="book-price"><span>10%</span>&nbsp;16,020원</div>
	                            <div class="book-description">인내심을 가져라. 모든 것은 적당한 때에 결국, 네게 올 테니. 
	                                언젠가 너는 네가 있어야 할 곳에서 너와 함께할 운명인 사람과 네가 해야 할 일을 하며 살게 될 것이다. 「부처」 2500년...</div>
	                        </div>
	                        <div class="buttons">
	                            <a href="cartAdd.jsp<%=bquery%>&book_id=123"><button type="button" class="cart-btn"><img src="./../assets/images/cart.jpg">&nbsp;장바구니</button></a>
	                            <a href="orderAdd.jsp<%=bquery%>&book_id=123"><button type="button" class="buy-btn">바로구매</button></a>
	                        </div>
	                    </div>
	
	                    <!-- 3위 -->
	                    <div class="book-item">
	                        <input type="checkbox" name="book_id" value="130">
	                        <div class="book-image"><a href="bookDetail.jsp<%=bquery%>&book_id=130">
	                            <img src="./../assets/images/book/stopTheStill.jpg"></a>
	                        </div>
	                        <div class="book-info">
	                            <div class="book-ranking">3</div>
	                            <div class="book-title"><a href="bookDetail.jsp<%=bquery%>&book_id=130">STOP THE STEAL 대법원의 부정선거 은폐기록</a></div>
	                            <div class="book-meta">도태우 외 / 도서출판 스카이 / 2025.01.20</div>
	                            <div class="book-price"><span>10%</span>&nbsp;13,500원</div>
	                            <div class="book-description">도태우·박주현·윤용진·현성삼 변호사 ‘Stop the steal’ 출간 4.15 총선 인천 연수구을 
	                                선거무효소송 판결문 비판서 대법원 판결이 가진 문제점들 조목조목 비판</div>
	                        </div>
	                        <div class="buttons">
	                            <a href="cartAdd.jsp<%=bquery%>&book_id=130"><button type="button" class="cart-btn"><img src="./../assets/images/cart.jpg">&nbsp;장바구니</button></a>
	                            <a href="orderAdd.jsp<%=bquery%>&book_id=130"><button type="button" class="buy-btn">바로구매</button></a>
	                        </div>
	                    </div>
	
	                    <!-- 4위 -->
	                    <div class="book-item">
	                        <input type="checkbox" name="book_id" value="122">
	                        <div class="book-image"><a href="bookDetail.jsp<%=bquery%>&book_id=122">
	                            <img src="./../assets/images/book/vegetarian.jpg"></a>
	                        </div>
	                        <div class="book-info">
	                            <div class="book-ranking">4</div>
	                            <div class="book-title"><a href="bookDetail.jsp<%=bquery%>&book_id=122">채식주의자</a></div>
	                            <div class="book-meta">한강 / 창비 / 2022.03.28</div>
	                            <div class="book-price"><span>10%</span>&nbsp;13,500원</div>
	                            <div class="book-description">2016년 인터내셔널 부커상을 수상하며 한국문학의 입지를 한단계 확장시킨 한강의 장편소설 『채식주의자』를 15년 만에 새로운 장정으로 선보인다. 
	                                상처받은 영혼의 고통과 식물...</div>
	                        </div>
	                        <div class="buttons">
	                            <a href="cartAdd.jsp<%=bquery%>&book_id=122"><button type="button" class="cart-btn"><img src="./../assets/images/cart.jpg">&nbsp;장바구니</button></a>
	                            <a href="orderAdd.jsp<%=bquery%>&book_id=122"><button type="button" class="buy-btn">바로구매</button></a>
	                        </div>
	                    </div>
	
	                    <!-- 5위 -->
	                    <div class="book-item">
	                        <input type="checkbox" name="book_id" value="104">
	                        <div class="book-image"><a href="bookDetail.jsp<%=bquery%>&book_id=104">
	                            <img src="./../assets/images/book/torrent.jpg"></a>
	                        </div>
	                        <div class="book-info">
	                            <div class="book-ranking">5</div>
	                            <div class="book-title"><a href="bookDetail.jsp<%=bquery%>&book_id=104">급류</a></div>
	                            <div class="book-meta">정대건 / 민음사 / 2022.12.22</div>
	                            <div class="book-price"><span>10%</span>&nbsp;12,600원</div>
	                            <div class="book-description">2020년 《한경신춘문예》에 장편소설 『GV 빌런 고태경』이 당선되어 작품 활동을 시작한 소설가 정대건의 
	                                두 번째 장편소설 『급류』가 오늘의 젊은 작가 시리즈 40번으로 출간...</div>
	                        </div>
	                        <div class="buttons">
	                            <a href="cartAdd.jsp<%=bquery%>&book_id=104"><button type="button" class="cart-btn"><img src="./../assets/images/cart.jpg">&nbsp;장바구니</button></a>
	                            <a href="orderAdd.jsp<%=bquery%>&book_id=104"><button type="button" class="buy-btn">바로구매</button></a>
	                        </div>
	                    </div>
	
	                    <!-- 6위 -->
	                    <div class="book-item">
	                        <input type="checkbox" name="book_id" value="110">
	                        <div class="book-image"><a href="bookDetail.jsp<%=bquery%>&book_id=110">
	                            <img src="./../assets/images/book/contradiction.jpg"></a>
	                        </div>
	                        <div class="book-info">
	                            <div class="book-ranking">6</div>
	                            <div class="book-title"><a href="bookDetail.jsp<%=bquery%>&book_id=110">모순</a></div>
	                            <div class="book-meta">양귀자 / 쓰다 / 2013.04.01</div>
	                            <div class="book-price"><span>10%</span>&nbsp;11,700원</div>
	                            <div class="book-description">양귀자 소설의 힘을 보여준 베스트셀러 『모순』. 1998년에 초판이 출간된 이후 132쇄를 찍으며 여전히 많은 사랑을 받고 있는 작품을, 
	                                오래도록 소장할 수 있는 양장본으로 새롭게...</div>
	                        </div>
	                        <div class="buttons">
	                            <a href="cartAdd.jsp<%=bquery%>&book_id=110"><button type="button" class="cart-btn"><img src="./../assets/images/cart.jpg">&nbsp;장바구니</button></a>
	                            <a href="orderAdd.jsp<%=bquery%>&book_id=110"><button type="button" class="buy-btn">바로구매</button></a>
	                        </div>
	                    </div>
	
	                    <!-- 7위 -->
	                    <div class="book-item">
	                        <input type="checkbox" name="book_id" value="125">
	                        <div class="book-image"><a href="bookDetail.jsp<%=bquery%>&book_id=125">
	                            <img src="./../assets/images/book/unstoppable.jpg"></a>
	                        </div>
	                        <div class="book-info">
	                            <div class="book-ranking">7</div>
	                            <div class="book-title"><a href="bookDetail.jsp<%=bquery%>&book_id=125">행동하지 않으면 인생은 바뀌지 않는다</a></div>
	                            <div class="book-meta">브라이언 트레이시 / 현대지성 / 2024.11.19</div>
	                            <div class="book-price"><span>10%</span>&nbsp;15,210원</div>
	                            <div class="book-description">당신은 오늘도 ‘갓생’을 외치지만 3일을 버티지 못한다. 매일 밤 동기부여 영상을 보며 감동하지만 아침이면 무너진다. 
	                                수많은 자기계발서를 읽었지만 인생은 제자리걸음이다. 왜일까?...</div>
	                        </div>
	                        <div class="buttons">
	                            <a href="cartAdd.jsp<%=bquery%>&book_id=125"><button type="button" class="cart-btn"><img src="./../assets/images/cart.jpg">&nbsp;장바구니</button></a>
	                            <a href="orderAdd.jsp<%=bquery%>&book_id=125"><button type="button" class="buy-btn">바로구매</button></a>
	                        </div>
	                    </div>
	
	                    <!-- 8위 -->
	                    <div class="book-item">
	                        <input type="checkbox" name="book_id" value="120">
	                        <div class="book-image"><a href="bookDetail.jsp<%=bquery%>&book_id=120">
	                            <img src="./../assets/images/book/weDoNotPart.jpg"></a>
	                        </div>
	                        <div class="book-info">
	                            <div class="book-ranking">8</div>
	                            <div class="book-title"><a href="bookDetail.jsp<%=bquery%>&book_id=120">작별하지 않는다</a></div>
	                            <div class="book-meta">한강 / 문학동네 / 2021.09.09</div>
	                            <div class="book-price"><span>10%</span>&nbsp;15,120원</div>
	                            <div class="book-description">2016년 『채식주의자』로 인터내셔널 부커상을 수상하고 
	                                2018년 『흰』으로 같은 상 최종 후보에 오른 한강 작가의 5년 만의 신작 장편소설 『작별하지 않는다』가 출간되었다....</div>
	                        </div>
	                        <div class="buttons">
	                            <a href="cartAdd.jsp<%=bquery%>&book_id=120"><button type="button" class="cart-btn"><img src="./../assets/images/cart.jpg">&nbsp;장바구니</button></a>
	                            <a href="orderAdd.jsp<%=bquery%>&book_id=120"><button type="button" class="buy-btn">바로구매</button></a>
	                        </div>
	                    </div>
	
	                    <!-- 9위 -->
	                    <div class="book-item">
	                        <input type="checkbox" name="book_id" value="116">
	                        <div class="book-image"><a href="bookDetail.jsp<%=bquery%>&book_id=116">
	                            <img src="./../assets/images/book/adultHappinessisQuiet.jpg"></a>
	                        </div>
	                        <div class="book-info">
	                            <div class="book-ranking">9</div>
	                            <div class="book-title"><a href="bookDetail.jsp<%=bquery%>&book_id=116">어른의 행복은 조용하다</a></div>
	                            <div class="book-meta">태수 / 페이지2북스 / 2024.11.04</div>
	                            <div class="book-price"><span>10%</span>&nbsp;16,020원</div>
	                            <div class="book-description">《1cm 다이빙》, 《홈 in 홈》으로 많은 사랑을 받았던 에세이스트 태수가 2년 만의 신작 《어른의 행복은 조용하다》로 돌아왔다. 
	                                이번 신작에서 저자 태수는 그동안 선보였던 이...</div>
	                        </div>
	                        <div class="buttons">
	                            <a href="cartAdd.jsp<%=bquery%>&book_id=116"><button type="button" class="cart-btn"><img src="./../assets/images/cart.jpg">&nbsp;장바구니</button></a>
	                            <a href="orderAdd.jsp<%=bquery%>&book_id=116"><button type="button" class="buy-btn">바로구매</button></a>
	                        </div>
	                    </div>
	
	                    <!-- 10위 -->
	                    <div class="book-item">
	                        <input type="checkbox" name="book_id" value="126">
	                        <div class="book-image"><a href="bookDetail.jsp<%=bquery%>&book_id=126">
	                            <img src="./../assets/images/book/historyforProgress.jpg"></a>
	                        </div>
	                        <div class="book-info">
	                            <div class="book-ranking">10</div>
	                            <div class="book-title"><a href="bookDetail.jsp<%=bquery%>&book_id=126">황현필의 진보를 위한 역사</a></div>
	                            <div class="book-meta">황현필 / 역바연 / 2025.02.07</div>
	                            <div class="book-price"><span>10%</span>&nbsp;19,800원</div>
	                            <div class="book-description">뉴라이트는 역사를 왜곡하며 대한민국의 정체성을 뒤흔들기 시작했다. 
	                                이들은 식민지근대화론을 통해 일제강점기를 미화하고, 김구를 테러리스트로 묘사하는 등 독립운동가를 폄훼한...</div>
	                        </div>
	                        <div class="buttons">
	                            <a href="cartAdd.jsp<%=bquery%>&book_id=126"><button type="button" class="cart-btn"><img src="./../assets/images/cart.jpg">&nbsp;장바구니</button></a>
	                            <a href="orderAdd.jsp<%=bquery%>&book_id=126"><button type="button" class="buy-btn">바로구매</button></a>
	                        </div>
	                    </div>
	                </section>
            	</div>
            </form>
            
            <div class ="page-num">
                <ul class="pagination modal">
                    <li><a href="#" class="first">처음 페이지</a></li>
                    <li><a href="#" class="left"><<</a></li>
                    <li><a href="#" class="active num">1</a></li>
                    <li><a href="#" class="num">2</a></li>
                    <li><a href="#" class="num">3</a></li>
                    <li><a href="#" class="num">4</a></li>
                    <li><a href="#" class="num">5</a></li>
                    <li><a href="#" class="num">6</a></li>
                    <li><a href="#" class="num">7</a></li>
                    <li><a href="#" class="num">8</a></li>
                    <li><a href="#" class="num">9</a></li>
                    <li><a href="#" class="right">>></a></li>
                    <li><a href="#" class="last">마지막 페이지</a></li>
                </ul>
            </div>
    </div>
		
        <!-- 푸터 로드될 위치 -->
    <footer class="footer-container">
       <%@include file="./footer.jsp" %>
    </footer>
    <script src="./../assets/best.js"></script>
</body>
</html>