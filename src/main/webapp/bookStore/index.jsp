<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BOOKSTORE</title>
    <link rel="stylesheet" href="./assets/index.css">
    <link rel="stylesheet" href="./assets/header.css">
	<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String query = "";
	    if (id != null && pwd != null) {
	    	query = "?id=" + id + "&pwd=" + pwd;
	    } else { // null일 경우 book_id 앞에 ?작성
	    	query = "?";
	    }
		/* out.println("넘어온 id: " + id); */
	%> 
</head>
<body>
    <!-- 헤더 로드될 위치 -->
 
    <header class="header-container">
   		 <iframe id = "header" src="./pages/header.jsp<%=query %>" frameborder="0" width="100%" height="240" scrolling="no"></iframe>
    </header>
    
    <div class="wrapper">

        <div class="content-wrapper">
            <!-- 배너 슬라이더 -->
            <section class="banner">
                <button id="preBtn"><img src="./assets/images/preBtn.png"></button>
                <div class="slides">
                    <div class="slide"><img src="./assets/images/banner03.jpg"></div>
                    <div class="slide"><img src="./assets/images/banner04.jpg"></div>
                    <div class="slide"><img src="./assets/images/banner05.jpg"></div>
                    <div class="slide"><img src="./assets/images/banner06.jpg"></div>
                    <div class="slide"><img src="./assets/images/banner07.jpg"></div>
                </div>
                <button id="nextBtn"><img src="./assets/images/nextBtn.png"></button>
                <div class="banner-pagination">
				    <span class="banner-dot" data-index="0"></span>
				    <span class="banner-dot" data-index="1"></span>
				    <span class="banner-dot" data-index="2"></span>
				    <span class="banner-dot" data-index="3"></span>
				    <span class="banner-dot" data-index="4"></span>
				</div>
            </section>
            <!-- 오른쪽 공간 창출 -->
            <aside class="right-space">
                <!-- 탭 메뉴 -->
                <div class="tab-menu">
                    <input type="radio" name="menu" id="tab01" checked>
                    <label for="tab01">베스트셀러</label>
                    <input type="radio" name="menu" id="tab02">
                    <label for="tab02">인기검색어</label>
                
                    <div id="bestseller" class="tab-box con1">
                        <span class="ranked">1~5위</span>
                        <ul class="best-list">
                            <li>
                                <span class="rank rank-1">1</span>
                                <a href="./pages/bookDetail.jsp<%=query%>&book_id=114">
                                    <img src="./assets/images/book/humanActs.jpg">
                                    <div class="rank-info">
                                        <div class="ranking-title">소년이 온다</div>
                                        <p class="ranking-author">한강 저</p>
                                    </div>
                                </a>
                            </li>
                            <li><span class="rank">2</span>
                                <a href="./pages/bookDetail.jsp<%=query%>&book_id=123">
                                    <img src="./assets/images/book/buddha'sWords.jpg">
                                    <div class="rank-info">
                                        <div class="ranking-title">초역 부처의 말</div>
                                        <p class="ranking-author">코이케 류노스케 저</p>
                                    </div>
                                </a>
                            </li>
                            <li><span class="rank">3</span>
                                <a href="./pages/bookDetail.jsp<%=query%>&book_id=130">
                                <img src="./assets/images/book/stopTheStill.jpg">
                                    <div class="rank-info">
                                        <div class="ranking-title">STOP THE STEAL 대법원의 <br>부정선거 은폐기록</div>
                                        <p class="ranking-author">도태우 저</p>
                                    </div>
                                </a>
                            </li>
                            <li><span class="rank">4</span>
                                <a href="./pages/bookDetail.jsp<%=query%>&book_id=122">
                                <img src="./assets/images/book/vegetarian.jpg">
                                    <div class="rank-info">
                                        <div class="ranking-title">채식주의자</div>
                                        <p class="ranking-author">한강 저</p>
                                    </div>
                                </a>
                            </li>
                            <li><span class="rank">5</span>
                                <a href="./pages/bookDetail.jsp<%=query%>&book_id=104">
                                <img src="./assets/images/book/torrent.jpg">
                                    <div class="rank-info">
                                        <div class="ranking-title">급류</div>
                                        <p class="ranking-author">정대건 저</p>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>

                    <div id="search-trends" class="tab-box con2">
                        <span class="ranked">1~10위</span>
                        <ul class="search-list">
                            <li><span class="rank rank-1">1</span> 기간한정특가</li>
                            <li><span class="rank">2</span> 한강</li>
                            <li><span class="rank">3</span> AI</li>
                            <li><span class="rank">4</span> 필사</li>
                            <li><span class="rank">5</span> 토익</li>
                            <li><span class="rank">6</span> 김영하</li>
                            <li><span class="rank">7</span> 넥서스</li>
                            <li><span class="rank">8</span> 수학</li>
                            <li><span class="rank">9</span> 모순</li>
                            <li><span class="rank">10</span> 마법천자문</li>
                        </ul>
                    </div>
                </div>
            </aside>  
        </div>

        <!-- 신작 도서 섹션 -->
        <section class="new-books">
            <h2>신작 도서</h2>
            <div class="book-list">
                <div class="item-inner">
                    <div class="book">
                        <a href="./pages/bookDetail.jsp<%=query%>&book_id=110">
                            <img src="./assets/images/book/contradiction.jpg" alt="책 1">
                        </a>
                        <p class="book-title">모순</p>
                        <p class="book-author">양귀자</p>
                    </div>
                </div>
                <div class="item-inner">
                    <div class="book">
                    	<a href="./pages/bookDetail.jsp<%=query%>&book_id=112">
                        	<img src="./assets/images/book/mickey7.jpg" alt="책 2">
                        </a>
                        <p class="book-title">미키 7</p>
                        <p class="book-author">에드워드 애슈턴</p>
                    </div>
                </div>
                <div class="item-inner">
                    <div class="book">
                    	<a href="./pages/bookDetail.jsp<%=query%>&book_id=113">
                        	<img src="./assets/images/book/theperfectjoke.jpg" alt="책 3">
                        </a>
                        <p class="book-title">삶이라는 완벽한 농담</p>
                        <p class="book-author">이경규</p>
                    </div>
                </div>
                <div class="item-inner">
                    <div class="book">
                    	<a href="./pages/bookDetail.jsp<%=query%>&book_id=101">
                        	<img src="./assets/images/book/martiallaw.jpg" alt="책 4">
                        </a>
                        <p class="book-title">계엄령</p>
                        <p class="book-author">알베르 카뮈</p>
                    </div>
                </div>
            </div>
            <div class="pagination">
                <input type="radio" id="dot1" name="pagination" checked>
                <label for="dot1" class="dot"></label>
        
                <input type="radio" id="dot2" name="pagination">
                <label for="dot2" class="dot"></label>
        
                <input type="radio" id="dot3" name="pagination">
                <label for="dot3" class="dot"></label>
        
                <input type="radio" id="dot4" name="pagination">
                <label for="dot4" class="dot"></label>
            </div>
            <button class="more"><a href="./pages/new.jsp?id=<%=id%>&pwd=<%=pwd%>">더보기 →</a></button>
        </section>
        

        <!-- 오늘의 책 섹션 -->
        <section class="today-book">
            <div class="section-header">
                <h2>오늘의 책</h2>
                <div id="current_date"></div>
                <!--<button class="more"><a>더보기 →</a></button>-->
            </div>
            <div class="content">
                <div class="content-large">
                    <div class="book-cover" onclick="location.href='./pages/bookDetail.jsp<%=query%>&book_id=132';">
                        <img src="./assets/images/book/gu'sProof.jpg" alt="책 이미지">
                        <div class="overlay">
                            <p class="book-quote">"만약 네가 먼저 죽는다면 나는 너를 먹을 거야"</p>
                        </div>
                    </div>
                    <div class="book-info">
                        <h3>구의 증명</h3>
                        <p>최진영</p>
                        <div class="book-price"><span>10%</span>&nbsp;10,800원</div>
                        <p class="book-details">어릴적부터 같이 자란 여주인공 담과 남주인공 구를 중심으로 이어지며, 
                            구의 죽음으로 그를 끈질기게 사랑했던 담이 구를 곧이곧대로 기억하겠다는 마음가짐으로 구의 시체를 먹는다.</p>
                    </div>
                </div>
                <div class="content-small">
                    <div class="book-inner">
                        <div class="book-small" onclick="location.href='./pages/bookDetail.jsp<%=query%>&book_id=114';">
                            <img src="./assets/images/book/humanActs.jpg" >
                            <div class="overlay">
                                <p class="book-quote">"당신이 나를 밝은 쪽으로, 빛이 비치는 쪽으로, 꽃이 핀 쪽으로 끌고 가기를 바랍니다."</p>
                            </div>
                        </div>
                        <div class="book-small" onclick="location.href='./pages/bookDetail.jsp<%=query%>&book_id=133';">
                            <img src="./assets/images/book/nolongerhuman.jpg">
                            <div class="overlay">
                                <p class="book-quote">"부끄럼 많은<br> 생애를 보냈습니다."</p>
                            </div>
                        </div>
                        <div class="book-small" onclick="location.href='./pages/bookDetail.jsp<%=query%>&book_id=123';">
                            <img src="./assets/images/book/buddha'sWords.jpg">
                            <div class="overlay">
                                <p class="book-quote">"인내심을 가져라. 모든 것은 적당한 때에 결국 네게 올테니"</p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <hr>
        <div class="notice" onclick="location.href='./pages/notice.jsp;'">
            <p style="cursor: pointer;"><b>📢notice! : 좋은 하루 되세요</b></p>
        </div>

    </div>
    <footer class="footer-container">
       <iframe id = "footer" src="./pages/footer.jsp?id=<%=id%>&pwd=<%=pwd%>" frameborder="0" width="100%" height="240" scrolling="no"></iframe>
    </footer>
    <script src="./assets/index.js"> 
    </script>
</body>
</html>
