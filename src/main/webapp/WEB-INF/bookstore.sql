-- 1. 주문 상세 테이블
DROP TABLE order_detailT01;BOOK_REVIEW

-- 2. 장바구니 테이블
DROP TABLE cartT01;

-- 3. QnA 테이블
DROP TABLE qna;

-- 4. 도서 리뷰 테이블
DROP TABLE book_review;

-- 5. 주문 테이블
DROP TABLE orderT01;

-- 6. 도서 테이블
DROP TABLE bookT01;

-- 7. 회원 테이블
DROP TABLE memberT02;

-- 8. 공지사항 테이블
DROP TABLE noticeT01;

-- 회원 테이블
CREATE TABLE memberT02 (
    mem_id     VARCHAR2(50) PRIMARY KEY,
    mem_pwd    VARCHAR2(50) NOT NULL,
    mem_name   VARCHAR2(50) NOT NULL,
    mem_email  VARCHAR2(100),
    mem_phone  VARCHAR2(100),
    mem_add1   VARCHAR2(100),
    mem_add2   VARCHAR2(200),
    join_date  DATE DEFAULT SYSDATE
);


CREATE TABLE bookT01 (
    book_id   NUMBER PRIMARY KEY,
    title     VARCHAR2(200) NOT NULL,
    author    VARCHAR2(100) NOT NULL,
    publisher VARCHAR2(100),
    price     NUMBER,
    category  VARCHAR2(100),
    genre     VARCHAR2(100),
    image     VARCHAR2(100),
    reg_date  DATE,
    book_int VARCHAR2(4000)
);

-- 주문 테이블
CREATE TABLE orderT01 (
    order_id     NUMBER PRIMARY KEY,
    mem_id       VARCHAR2(50),
    order_date   DATE DEFAULT SYSDATE,
    total_price  NUMBER,
    CONSTRAINT order_mem_id_fk FOREIGN KEY (mem_id) REFERENCES memberT02(mem_id) ON DELETE CASCADE
);

-- 장바구니 테이블
CREATE TABLE cartT01 (
    cart_id     NUMBER PRIMARY KEY,
    mem_id      VARCHAR2(50),
    book_id     NUMBER,
    quantity    NUMBER NOT NULL,
    CONSTRAINT cart_mem_id_fk FOREIGN KEY (mem_id) REFERENCES memberT02(mem_id) ON DELETE CASCADE,
    CONSTRAINT cart_book_id_fk FOREIGN KEY (book_id) REFERENCES bookT01(book_id)
);


-- 주문 상세 테이블
CREATE TABLE order_detailT01 (
    detail_id   NUMBER PRIMARY KEY,
    order_id    NUMBER,
    book_id     NUMBER,
    quantity    NUMBER,
    price       NUMBER,
    CONSTRAINT detail_order_id_fk FOREIGN KEY (order_id) REFERENCES orderT01(order_id) ON DELETE CASCADE,
    CONSTRAINT detail_book_id_fk FOREIGN KEY (book_id) REFERENCES bookT01(book_id)
);

-- QnA 테이블
CREATE TABLE qna (
    num        NUMBER PRIMARY KEY,
    writer     VARCHAR2(50) NOT NULL,
    title      VARCHAR2(100) NOT NULL,
    content    VARCHAR2(4000) NOT NULL,
    regtime    DATE DEFAULT SYSDATE,
    hits       NUMBER DEFAULT 0,
	email 	   VARCHAR2(100),
    CONSTRAINT qna_writer_fk FOREIGN KEY (writer) REFERENCES memberT02(mem_id) ON DELETE CASCADE
);

-- 도서 리뷰 테이블
CREATE TABLE book_review (
    review_id NUMBER PRIMARY KEY,
    book_id NUMBER NOT NULL,
    mem_id VARCHAR2(50) NOT NULL,
    content CLOB NOT NULL,
    rating NUMBER(1) CHECK (rating BETWEEN 1 AND 5),
    reg_date DATE DEFAULT SYSDATE,
    CONSTRAINT fk_book FOREIGN KEY (book_id) REFERENCES BookT01(book_id),
    CONSTRAINT fk_member FOREIGN KEY (mem_id) REFERENCES MemberT02(mem_id) ON DELETE CASCADE
);

-- 공지사항 테이블
CREATE TABLE noticeT01 (
    num NUMBER PRIMARY KEY,
    title VARCHAR2(30) NOT NULL, 
    writer VARCHAR2(20) NOT NULL, 
    regdate DATE DEFAULT SYSDATE, 
    content CLOB NOT NULL
);

-- 공지사항 테스트
INSERT INTO noticeT01 (num, title, writer, regdate, content)
VALUES (1, '공지사항', '고객센터', TO_CHAR(SYSDATE, 'YYYY-MM-DD'), 'test01');
INSERT INTO noticeT01 (num, title, writer, regdate, content)
VALUES (2, '공지사항', '고객센터', TO_CHAR(SYSDATE, 'YYYY-MM-DD'), 'test02');
INSERT INTO noticeT01 (num, title, writer, regdate, content)
VALUES (3, '공지사항', '고객센터', TO_CHAR(SYSDATE, 'YYYY-MM-DD'), 'test03');
INSERT INTO noticeT01 (num, title, writer, regdate, content)
VALUES (4, '공지사항', '고객센터', TO_CHAR(SYSDATE, 'YYYY-MM-DD'), 'test04');
INSERT INTO noticeT01 (num, title, writer, regdate, content)
VALUES (5, '공지사항', '고객센터', TO_CHAR(SYSDATE, 'YYYY-MM-DD'), 'test05');
INSERT INTO noticeT01 (num, title, writer, regdate, content)
VALUES (6, '공지사항', '고객센터', TO_CHAR(SYSDATE, 'YYYY-MM-DD'), 'test06');
INSERT INTO noticeT01 (num, title, writer, regdate, content)
VALUES (7, '공지사항', '고객센터', TO_CHAR(SYSDATE, 'YYYY-MM-DD'), 'test07');
INSERT INTO noticeT01 (num, title, writer, regdate, content)
VALUES (8, '공지사항', '고객센터', TO_CHAR(SYSDATE, 'YYYY-MM-DD'), 'test08');
INSERT INTO noticeT01 (num, title, writer, regdate, content)
VALUES (9, '공지사항', '고객센터', TO_CHAR(SYSDATE, 'YYYY-MM-DD'), 'test09');
INSERT INTO noticeT01 (num, title, writer, regdate, content)
VALUES (10, '공지사항', '고객센터', TO_CHAR(SYSDATE, 'YYYY-MM-DD'), 'test10');
INSERT INTO noticeT01 (num, title, writer, regdate, content)
VALUES (11, '공지사항', '고객센터', TO_CHAR(SYSDATE, 'YYYY-MM-DD'), 'test11');

-- bookT01 DB 무조건 추가 해야됨
INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (100, '갈 수 없지만 알 수 있는', '지웅배', '더숲', 28000, '국내', '과학', './../assets/images/detail/book13.jpg', TO_DATE('2025-03-28', 'YYYY-MM-DD'),'유튜브 〈우주먼지의 현자타임즈〉 〈보다BODA〉를 통해 대중에게 잘 알려진 지웅배 박사가 천문학의 탐구 여정을 거리 측정이라는 독창적 시선으로 풀어낸 흥미로운 과학책이다. 천문학자들은 직접 갈 수 없는 먼 우주의 거리를 어떻게 측정해 왔을까? 그 과정에서 그들은 어떤 우주의 비밀을 밝혀냈을까?<br>이 책에는 천문학자들이 우주의 거리를 헤아리기 위해 발버둥친 기나긴 여정이 담겨 있고, 그들이 탐구한 거리 재기의 결과로 알게 된 끝없이 펼쳐지는 우주 공간의 생생한 이야기가 펼쳐진다. 45억 년 전, 지구가 지금보다 훨씬 빠르게 자전했다는 사실을 통해 현대인보다 더 바빴던 공룡의 하루를 상상하게 만들고, 금성의 태양면 통과 관측 장면을 생생한 사진과 함께 소개해 마치 눈앞에서 우주의 장관을 보는 듯한 느낌을 준다. 또한 어려운 천문학 개념들도 역사적 일화와 함께 풀어내 쉽게 이해할 수 있도록 했다.<br>저자가 공개한 80여 장의 사진과 자료는 독자를 우주로의 여행으로 초대하며, 갈 수 없지만 알 수 있는 천문학의 본질을 더욱 선명하게 보여 준다. 이 책은 천문학이 단순한 숫자와 데이터가 아니라, 우리와 우주의 관계를 탐구하고 사유하는 특별한 여정임을 보여 준다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (101, '계엄령', '알베르 카뮈', '녹색광선', 22000, '국내', '문학', './../assets/images/detail/book28.jpg', TO_DATE('2025-03-14', 'YYYY-MM-DD'),'1947년, 소설 『페스트』는 평단과 독자 모두에게 찬사를 받으며 알베르 카뮈를 최고의 작가 반열에 올려놓는다. 『이방인』으로 이미 열광적인 반응을 이끌어내긴 했지만 상업적으로 큰 성공을 거둔 것은 『페스트』가 처음이고, 그렇기에 그의 다음 작품에 대한 기대치는 최고조에 이르렀다. 많은 이들이 기다리던 알베르 카뮈의 다음 작품은 소설이 아닌 희곡이었다.<br>「계엄령」이라는 제목의 이 희곡은 1948년 10월 27일 처음으로 무대에 올려진다. 스페인(에스파냐)의 작은 마을 카디스에 불길한 혜성이 나타난 후, 한 독재자가 불현듯 등장해 계엄을 선포하고 도시를 장악해 나가며 벌어지는 이야기가 이 희곡의 중심 줄기를 이룬다.<br>그러나, 초연 이후 평단의 반응은 호의적이지 않았다. 이에 따라 객석의 호응도 크지 않았다. 1939년부터 집필을 시작해 1947년에 상연된 또 다른 희곡 「칼리굴라」의 상업적 성공과는 대조적인 결과였다. 「계엄령」 비평에는 주로 정치적 시각이 개입되었기 때문이다. 주요한 비판은 "왜 극의 배경이 실제 민중에 대한 탄압이 이뤄지던 공산주의 국가(소련이나 동유럽 국가들)가 아니라 스페인인가?"라는 부분에 집중되었는데, 카뮈는 이에 대해 "그러한 지적은 논점을 일탈한 것이다"라는 취지의 답을 칼럼으로 작성하기도 했다.<br>카뮈가 이 작품을 통해 전하고 싶었던 것은 전체주의가 얼마나 폭력적이고 위험할 수 있는지에 대한 메시지였기에, "작품의 배경 도시가 어디인가?" 같은 문제는 그다지 중요하지 않았던 것으로 보인다. 카뮈는 실제로 전체주의의 위험성을 일찍부터 인지하고 있었고, 나치즘과 공산주의(특히 스탈린 치하의 소련)를 동일하게 비판해 왔다.<br>좋은 문학 작품이 가진 힘은 결국 시대를 뛰어넘는다. 초연 당시의 반응은 열광적이지 않았으나 폭력과 전체주의에 대한 은유를 담지하고 있기에, 「계엄령」은 최근까지도 여러 나라에서 무대에 올려지곤 한다. 정치적 억압 상황이 닥칠 때 자주 언급되는 작품이기도 하다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (102, '교육의 뇌과학', '바버라 오클리', '현대지성', 19900, '국내', '과학', './../assets/images/detail/book25.jpg', TO_DATE('2025-02-20', 'YYYY-MM-DD'), '열심히 공부하는데도 성적이 오르지 않는 학생, 초등학교 때는 잘했지만 중고등학교에서 성적이 하락하는 학생, 공부는 별로 안 하는데도 늘 상위권을 유지하는 학생. 이런 학습 능력의 차이는 타고난 머리가 아닌 뇌 사용법의 차이에서 비롯된다.<br>뇌과학 연구에 따르면, 효과적인 학습을 위해서는 새로운 지식을 뇌의 장기 기억에 저장하는 것이 핵심이다. 수학 포기자에서 공대 교수가 된 바버라 오클리를 비롯한 세계적 석학 3인이 뇌과학에 기반한 최적의 학습법을 제시한다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (103, '국민이 먼저입니다', '한동훈', '메디치미디어', 22000, '국내', '사회', './../assets/images/detail/book16.jpg', TO_DATE('2025-02-28', 'YYYY-MM-DD'),'새로운 시대로 나아가는 한동훈의 국민을 위한 선택과 생각이 담겨 있다. 한동훈의 선택에서는 비상계엄 반대, 계엄 해제 의결, 질서 있는 조기퇴진 시도, 대통령 탄핵소추안 통과, 그리고 당 대표 사퇴까지의 14일 300시간의 이야기가 생생하게 펼쳐진다. 아울러 대담형식으로 수록된 한동훈의 생각에서는 정치를 하는 이유, 공직자로서의 사명, 한동훈이 꿈꾸는 행복한 나라 등 그의 정치관과 철학을 들여다볼 수 있다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (104, '급류', '정대건', '민음사', 14000, '국내', '문학', './../assets/images/detail/book5.jpg', TO_DATE('2022-12-22', 'YYYY-MM-DD'),'2020년 《한경신춘문예》에 장편소설 <GV 빌런 고태경>이 당선되어 작품 활동을 시작한 소설가 정대건의 두 번째 장편소설 <급류>가 오늘의 젊은 작가 시리즈 40번으로 출간되었다. <급류>는 저수지와 계곡이 유명한 지방도시 진평을 배경으로, 열일곱 살 동갑내기인 도담과 해솔의 만남과 사랑을 그린 소설이다.<br>아빠와 함께 수영을 하러 갔던 도담이 한눈에 인상적인 남자아이 해솔이 물에 빠질 뻔한 것을 구하러 뛰어들며 둘의 인연은 시작된다. 운명적이고 낭만적으로 보이는 첫 만남 이후 둘은 모든 걸 이야기하고 비밀 없는 사이가 되지만, 그 첫사랑이 잔잔한 물처럼 평탄하지만은 않다. 모르는 사이에 디뎌 빠져나올 수 없이 빨려드는 와류처럼 둘의 관계는 우연한 사건으로 다른 국면을 맞이한다.<br>도담과 해솔의 관계가 연인으로 발전하던 어느 날, 해솔의 엄마와 도담의 아빠가 불륜 관계인 듯한 정황이 드러나고 이에 화가 난 도담은 그 둘이 은밀히 만나기로 한 날 밤 랜턴을 들고 그들의 뒤를 밟는다. 그리고 그곳에서 생각지도 못한 사고가 벌어진다. 그날 이후, 진평에서 오직 서로가 전부이던, 나누지 못할 비밀이 없던 도담과 해솔의 관계와 삶은 순식간에 바뀌어 버린다. 해솔의 엄마와 도담의 아빠는 어떤 관계였던 걸까? 그 날, 그 밤 도담과 해솔은 어떤 일을 겪게 된 걸까?');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (105, '기계는 왜 학습하는가', '아닐 아난타스와미', '까치', 25000, '국내', '과학', './../assets/images/detail/book24.jpg', TO_DATE('2025-02-28', 'YYYY-MM-DD'),'AI의 가장 대단하고 무서운 특성은 스스로 학습한다는 점일 것이다. 기계 학습은 어떻게 가능한가? 당연하겠지만, 기계학습엔 수학이 쓰인다. 이 책은 기계 학습에 사용되는 수학에 대해 설명한다. 로젠블랫의 퍼셉트론에서부터 현대의 심층 신경망까지, 책은 AI 알고리즘을 떠받치는 수학의 여정을 흥미롭게 보여준다.<br>AI에 관한 책이 많아지고 있지만 대체로는 미래 예측, 윤리, 철학, 비즈니스 분야에 집중되어 있다. AI의 등장으로 인한 사회적 변화보다 AI의 근본 원리에 관해 더 깊은 의문이 들었던 이들에겐 이 책이 단비가 되어줄 것이다. 2024년 노벨 물리학상 수상자인 제프리 힌턴은 "걸작"이라며 상찬했다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (106, '내가 아직 쓰지 않은 것', '최승호', '문학동네', 3000, '국내', '문학', './../assets/images/detail/book17.jpg', TO_DATE('2023-10-16', 'YYYY-MM-DD'),'문학동네시인선 200번을 기념하며 함께 펴내는 한정판 도서가 있다. 바로 시인선 001~199 시집의 시인의 말만을 묶은 책 『내가 아직 쓰지 않은 것』. 2010년 겨울 쓰인 최승호 시인의 시인의 말부터 2023년 한여름 한연희 시인이 쓴 시인의 말까지 한 권에 담았다.<br>시인의 말은 많은 경우 시집의 맨 마지막에 쓰이는 글, 그러나 맨 앞에 놓이는 글이다. 시인과 독자가 처음 만나 인사 나누는 그 자리에 놓인 글이며 시인의 고백적 육성이 오롯이 담긴 글이기도 하다. 세월이 흐르고 계절이 무수히 반복되는 가운데 새겨진 그 마디들을 한데 모아놓으니 문학동네시인선의 과거와 현재가 여기 다 있다. 결국 시는 몸이자 정신이자 언어이자 생활이자 개인이자 공동체란 것을 시인의 말만을 모아 읽고도 알겠다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (107, '넥스트 인텔리전스', '로랑 알렉상드로', '열린책들', 32000, '국내', '인문학', './../assets/images/detail/book11.jpg', TO_DATE('2025-03-10', 'YYYY-MM-DD'),'인공 지능의 발달로 인간 지능의 역할과 지위가 근본적으로 바뀌면서, 우리는 모든 영역에서 새로운 도전과 선택을 마주하고 있다. 이런 상황에서 우리가 궁금한 것은 하나다. 인공 지능의 시대를 어떻게 대비해야 하는가? 이 책의 저자 로랑 알렉상드르는 막연한 디스토피아적 우려나 상상 대신 초지능 시대에 인류가 직면할 기회와 위기를 심도 있게 분석한다.<br>인간다움의 본질과 미래 사회의 방향을 날카롭게 파헤친 끝에, 마침내 그는 인간과 기계의 공진화라는 목표에 도달한다. 이는 인류의 절반 이상이 GPT-5보다 지능이 낮을 것이라는 문제적 전망 앞에서도 희망을 갖게 한다. 초지능 세상을 준비하는 당신이 계속해서 성장하는 미래를 희망한다면, 지능 혁명을 통해 새로운 길을 개척하고 싶다면, 이 책은 그 무엇보다 더 강력한 통찰과 전략을 제시해 줄 것이다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (108, '다시 성장이다', '오세훈', '김영사', 20000, '국내', '사회과학', './../assets/images/detail/book15.jpg', TO_DATE('2025-03-24', 'YYYY-MM-DD'),'혼돈과 격변의 시대, 대한민국은 선택의 기로에 섰다. 대내적으로는 비상계엄과 후폭풍, 그리고 대외적으로는 전 세계가 거의 모든 분야에서 극심한 불확실성과 싸우는 상황이다. 정부와 여야 정치권이 정신을 똑바로 차리고 역량을 결집해도 제대로 헤쳐나갈 수 있을지 장담하기 어렵다. 이대로 대한민국은 골든타임을 흘려보낼 것인가! 오세훈3법 디딤돌소득 서울런 미리내집으로 개혁과 성장을 위한 새로운 정책 모델을 제시해온 오세훈이 바라보는 한국의 현재, 그리고 그가 꿈꾸는 한국의 미래를 담았다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (109, '모데란', '데이비드R 번치', '폴라북스', 20000, '국내', '문학', './../assets/images/detail/book29.jpg', TO_DATE('2025-02-28', 'YYYY-MM-DD'), '과학소설 총서 미래의 문학은 열한 번째 도서는 뉴웨이브 SF의 고전이자 SF계의 혁명선언문으로 꼽히는 데이비드 R. 번치의 『모데란』이다. 이 책은 모데란Moderan이란 하나의 세계관을 중심으로 쓰인 쉰일곱 편의 단편을 엮은 연작소설로 유토피아가 파멸, 곧 디스토피아라는 역설을 드러내며 물질문명과 인간성 상실의 비례성을 비유한 작품이다.<br>20세기 물질문명의 눈부신 발전과 거대하고 참혹한 전쟁, 대량 학살이 보여준 인간성의 말살, 냉전 시대의 부조리 등을 목도한 번치는 “필립 K. 딕의 천재적 착상, E. E. 커밍스의 기이한 시문을 한데 모아 자신만의 방식으로” 참극의 궤도에 오른 당시의 세태를 경고한다. 전쟁과 쾌락, 공포와 증오, 감시와 통제의 디스토피아를 예견한 그의 통찰은 동시대 어떤 작가보다도 첨예하다.<br>핵전쟁으로 파괴된 지구를 무대로 한 모데란의 단편들은 대부분 1960년대에서 70년대에 걸쳐 과학소설 잡지의 선구격인 『판타스틱Fantastic』과 『어메이징Amazing』에 발표되었고, 이후 일부 단편을 추가하여 1971년에 단편집 『모데란』으로 출간되었다. 그 이후로도 번치는 사망하기 전까지 장르와 주류 문학의 경계선상에서 모데란 단편을 꾸준히 발표하며, 평생에 걸쳐 모데란의 세계관을 구축했다.<br>그만큼 『모데란』은 작가 필생의 역작이자 정치적, 역사적, 철학적 성찰이나 다름없다. 시대를 앞선 예언자이며 소외된 선구자 데이비드 R. 번치 탄생 100주기를 맞아 비로소 국내 처음으로 소개되는 『모데란』의 출간은 “우리가 그의 업적을 온전히 감상할 수 있는 시점에 도달했다”는 문학적 진보의 증거다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (110, '모순', '양귀자', '쓰다', 13000, '국내', '문학', './../assets/images/detail/book6.jpg', TO_DATE('2013-04-01', 'YYYY-MM-DD'),'작가 양귀자가 1998년 펴낸 네 번째 장편소설로, 책이 나온 지 한 달 만에 무서운 속도로 베스트셀러 1위에 진입, 출판계를 놀라게 하고 그해 최고의 베스트셀러로 자리 잡으면서 양귀자 소설의 힘을 다시 한 번 유감없이 보여준 소설이다.<br>초판이 나온 지 벌써 15년이 흘렀지만 이 소설 <모순>은 아주 특별한 길을 걷고 있다. 그때 20대였던 독자들은 지금 결혼을 하고 30대가 되어서도 가끔씩 <모순>을 꺼내 다시 읽는다고 했다. 다시 읽을 때마다 전에는 몰랐던 소설 속 행간의 의미를 깨우치거나 세월의 힘이 알려준 다른 해석에 놀라면서 “내 인생의 가장 소중한 책 한 권”으로 꼽는 것을 주저하지 않는다. <모순>이 특별한 것은 대다수의 독자들이 한 번만 읽고 마는 것이 아니라 적어도 두 번, 혹은 세 번 이상 되풀이 읽고 있다는 사실에 있다.<br><모순>을 열 번도 더 읽었다는 블로그 독후감도 종종 만난다. 열성 독자들은 끊임없이 소설 속 문장들을 기록하고 전달하고 반추하며 흔적을 남기고 있다. 이 소설이 지금까지 132쇄를 찍으면서 끊임없이 독자들에게 회자되고 있는 힘은 참 불가사의하다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (111, '무의식은 어떻게 나를 설계하는가', '데이비드 이글먼', '알에이치코리아', 25000, '국내', '과학', './../assets/images/detail/book27.jpg', TO_DATE('2024-11-22', 'YYYY-MM-DD'), '우리는 뇌의 이성을 믿는다. 당연하지 않은가? 대부분의 사람들은 의식이 우리 자신을 구성하는 알파이자 오메가라고 생각한다. 그리고 뇌과학계의 칼 세이건이라 불리는 저자 데이비드 이글먼은 이에 의미심장한 웃음을 지을 것 같다. 과연 그럴까? 당신의 의식이 곧 당신일까?<br>그는 인간이라는 종이 얼마나 무의식에 의존하는지 알려준다. 뇌가 얼마나 논리적으로 설명할 수 없는 작용을 남발하는가, 우리의 마음은 얼마나 여러 갈래의 비의식으로 구성되어 있는가. 이를 증명하기 위해 책은 온통 흥미로운 사례들을 소개한다. 우리가 변하지 않는 사실이라고 감각하는 것들이 사실은 얼마나 선택적으로 재구성되는 것인지, 의식이 모르는 일을 신체는 어떻게 해내는 것인지. 뇌는 의식이 닿지 않는 우주 속에서 나를 구체적으로 조종한다. <br>데이비드 이글먼의 흡입력 있는 글쓰기는 이번 책에서 역시 독자를 빨아들인다. 신기하고 놀라운 예시들과 정리 잘 된 설명들은 무의식의 뇌과학이라는 어려운 세계로 진입하는 문턱을 낮춘다. 이 책을 읽고 나면 행동하고 감각하는 나를 완전히 새롭게 발견하게 될 것이다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (112, '미키 7', '에드워드 애슈턴', '황금가지', 17000, '국내', '문학', './../assets/images/detail/book30.jpg', TO_DATE('2022-07-22', 'YYYY-MM-DD'), '세계적인 거장의 반열에 올라선 봉준호 감독의 여덟 번째 영화 <미키17>의 제작 전 과정을 흥미롭게 담아낸 책이다. 영화 <기생충>으로 2020년 아카데미 4관왕을 달성한 봉 감독은 차기작으로 상상력과 철학적 질문이 절묘하게 결합된 SF 판타지를 선택했다.<br>에드워드 애슈턴의 소설 『미키7』을 원작으로 삼고 있지만, <미키17>은 봉준호라는 필터를 거쳐 새로운 캐릭터와 밀도 높은 구성을 통해 흥미로운 스토리로 탄생했다. 제작사 워너브라더스 또한 대중성과 작품성이 검증된 감독에게 지원을 아끼지 않았다. 이 영화는 지금까지 봉준호 감독이 연출했던 작품 중 최대 제작비용, 무려 1억5천 달러가 투입되어 로버트 패틴슨, 마크 러팔로 등 유명 출연진과 다리우스 콘지(촬영감독), 도미닉 투오히(특수효과 감독) 등 명성이 자자한 제작진과 협업하여 만들어졌다.<br><미키17: 아트 앤 메이킹>은 봉준호 감독의 최신작이 각본에서 스크린으로 옮겨지기까지의 과정을 추적한다. 감독, 출연진, 제작진과의 속마음이 담긴 깊이 있는 인터뷰뿐만 아니라 제작 과정에서 공개되지 않은 이미지, 스토리보드, 촬영 현장 사진, 콘셉트 아트를 포함하고 있다. 독보적인 아트북으로서 영화의 창작 과정을 폭넓게 조망하며, 영화 속 독특한 배경과 크리처는 물론, 로버트 패틴슨, 마크 러팔로, 토니 콜렛, 스티븐 연, 나오미 애키와 같은 출연진이 생생하게 구현해 낸 매력적인 캐릭터들을 심도 있게 탐구한다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (113, '삶이라는 완벽한 농담', '이경규', '쌤앤파커스', 17800, '국내', '에세이', './../assets/images/detail/book31.jpg', TO_DATE('2025-03-12', 'YYYY-MM-DD'), '양심냉장고, 몰래카메라, 마이 리틀 텔레비전, 남자의 자격, 도시 어부... 코미디언 이경규 하면 누구나 떠올릴만한, 대한민국의 대표 프로그램들이다. 그의 방송은 1990년대부터 2025년 현재까지 계속되고 있다. 말만 현역이 아닌, 진짜 제대로 된 현역 방송인인 셈이다. "예능 대부" 이경규는 어떤 삶을 살아왔으며 어떤 삶을 꿈꾸는가? 대한민국의 대표 코미디언, 평생 현역 이경규의 삶이 이 책 안에 빼곡히 들어 있다.<br>책은 단순한 회고록이 아니라, 살아오면서 겪은 실패와 성공, 그리고 그 과정에서 터득한 인생의 지혜를 담백하게 풀어낸다. 익살스러운 문체 속에서도 깊은 성찰이 녹아 있으며, 특히 유머를 통해 삶의 무게를 덜어내는 태도가 인상적이다. 마치 한 편의 토크쇼를 보듯 편안하게 읽히면서도, 문득문득 가슴을 울리는 문장이 등장해 생각할 거리를 던져준다. 가벼운 마음으로 시작했다가도 어느새 진지한 깨달음을 얻게 되는 독특한 매력을 지닌 이 책처럼, 그의 삶이 완벽히 녹아 있어 독특한 개성이 있는 그의 코미디도 더 많은 이들에게 더 각별히 사랑받길 바라본다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (114, '소년이 온다', '한강', '창비', 15000, '국내', '문학', './../assets/images/detail/book1.jpg', TO_DATE('2014-05-19', 'YYYY-MM-DD'), '소설가 한강이 5월 18일 광주 이야기를 썼다. 참혹한 생채기를 응시하던 작가의 고요한 방식을 떠올리면 쉽게 읽을 수 없으리라는 생각이 먼저 든다. 죽은 자를 보는 정결한 눈, 예를 들면 "발톱에 투명한 매니큐어를 바른 발가락들은 외상이 없어 깨끗했지만 시간이 흐르며 생강 덩어리들처럼 굵고 거무스레해졌다."와 같은 묘사를 보면 질끈 눈을 감고 싶다. 그러나 돌아오지 못한 죽음들에 관해 쓴 이 이야기를 읽으며 어떻게 감히 그럴 수 있을까.<br>중간고사를 보고, 늦잠을 자고, 배드민턴을 칠 수도 있었던 일요일. 도시는 점령당했고, 중학교 3학년 소년 동호는 친구 정대의 죽음을 목격한다. 도청으로 들어오는 시신을 수습하며, 초를 밝히고 혼을 붙잡는 소년의 열흘을 작가는 소설로 기록했다. 아버지가 가르치던 학생의 이야기, "왜 그 학생의 이름을 말하기 직전에는 알 수 없는 망설임이 끼어드는가?" 의문에서 소설이 시작된다. 작가 스스로 "이 소설을 통과하지 않고는 어디로도 갈 수 없다고 느꼈다"고 말하는, "한강을 뛰어넘은 한강의 소설"');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (115, '어른을 위한 영어 수업', '채서영', 'BOOKERS', 17800, '국내', '인문학', './../assets/images/detail/book22.jpg', TO_DATE('2025-04-10', 'YYYY-MM-DD'),'나이가 들어 다시 영어 공부를 시작하려는 사람들이 많아지고 있다. 하지만 10대에 시작해 사회생활을 하면서도 영어 공부를 게을리하지 않았던 사람들조차 여전히 영어를 어렵게 생각하는 이들이 대부분이다. 그렇다면 어른의 영어 공부는 어떻게 해야 좋을까. 무엇보다 영어를 지금까지와는 다른 시선으로 바라보는 태도가 필요하다. 문자보다는 소리에 주목하고, 무조건 암기하기보다는 원리를 이해하려 노력한다면 조금 뒤늦게 시작하는 영어 공부라도 한결 쉽고 재미있게 느껴질 것이다.<br>《어른을 위한 영어 수업》은 시험과 성적이라는 시기를 지나 더 다양한 사람, 더 넓은 세상과의 연결을 필요로 하는 이들을 위해 쓰여진 영어 공부에 관한 이야기이다. 최근에는 영어에 대한 관심이 새롭게 생겨나고 있는 추세이다. 보다 자유로운 해외여행을 위해, 드라마와 강연을 원어로 감상하기 위해, 해외에 사는 가족들과의 소통을 위해, 업무에 필요한 영어 화상회의나 사업 프리젠테이션을 위해… 이외에도 자기 계발과 성장을 목표로 많은 이들이 영어 공부를 시작하는 것이다.<br>책을 읽다 보면 영어 별거 아니구나, 영어 할 만하네…라는 자신감을 얻게 될 것이다. 영어 공부를 다시 시작하고자 하는 이유와 계기, 목표는 다를지라도 누구나 이 책을 통해 영어라는 매력적인 언어의 세계에서 새로운 삶의 즐거움을 발견할 수 있을 것이다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (116, '어른의 행복은 조용하다', '태수', '페이지2', 17800, '국내', '에세이', './../assets/images/detail/book9.jpg', TO_DATE('2024-11-04', 'YYYY-MM-DD'), '《1cm 다이빙》, 《홈 in 홈》으로 많은 사랑을 받았던 에세이스트 태수가 2년 만의 신작 《어른의 행복은 조용하다》로 돌아왔다. 이번 신작에서 저자 태수는 그동안 선보였던 이야기보다 한층 성숙하고 현명하게 삶의 행복에 가까워지는 방법에 대해 이야기한다. 새로운 것, 짜릿한 것, 남들보다 높은 곳에서 행복하고 싶어 발버둥치는 사람들에게 행복은 꼭 그런 데에만 있는 게 아니라 불행해지지 않는 것에서부터 출발한다고 조용히 일러준다.<br>《어른의 행복은 조용하다》는 요란한 세상에서도 흔들리지 않고 내 삶을 살아가는 튼튼하고 단단한 태도를 담아냈다. 시끌벅적 기쁜 일을 찾아다니기보다도, 울 일이 없고 별다른 나쁜 일이 없는 하루를 만들어야 한다고 강조한다. 그랬을 때에야 비로소 진정한 행복이 우리 곁에 온다는 사실을 다시 한번 일깨워준다.<br>이 책을 먼저 읽은 독자들의 반응 역시 뜨겁다. “울고 싶어지는 날이면 태수 작가의 글을 찾는다. 충분히 울고 다시 나아가기 위해”, “<불편한 편의점> 이후로 오랜만에 끝나지 않길 바라던 책”이라며 극찬하하며, 저자의 SNS에서 5만여 명의 독자에게 선보인 선공개 원고에도 빨리 책으로 출간해달라는 요청이 쇄도했다.<br>이제 당신 차례다. 《어른의 행복은 조용하다》를 읽고 현명하게 행복을 찾아보자. 혹자는 여전히 의심스러운 목소리로 그토록 조용한 인생에서도 행복을 발견할 수 있냐고 묻지만 저자는 확신에 찬 목소리로 단호하게 답한다. “물론”이라고.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (117, '오늘이 내일이면 좋겠다', '남유하', '사계절', 18000, '국내', '에세이', './../assets/images/detail/book32.jpg', TO_DATE('2025-01-03', 'YYYY-MM-DD'), '스위스 조력사망기관 디그니타스에서 생을 마감한 여덟 번째 한국인. 정확하고도 짧은 이 사실만으로는 故조순복 님을 다 설명할 수 없다. 남유하 작가는 이렇게 기록했다. 누구보다 삶을 사랑했고, 힘들 때 더 크게 웃었고, 암세포와 더불어 살고자 했으며, 고통을 끝낼 시기를 직접 결정한 뒤 마지막까지 하늘을 바라본 용감한 사람.<br>『오늘이 내일이면 좋겠다』는 긴 투병 끝에 마지막 자기 결정권을 행사하기 위해, 아픈 몸으로 8770km를 날아 스위스로 향한 故조순복 님에 대한 기록이다. 동시에 그 선택을 딸로서 또 같은 인간으로서 지켜보고, 동행하고, 한국에 돌아와 그 존엄한 죽음 이후를 맞닥뜨린 소설가 남유하의 이야기이기도 하다. 두 사람이 함께한 시간들, 어쩌면 함께할 수도 있었던 시간들은 삶의 소중함과 존엄한 죽음이 깊이 연결되어 있음을 상기시킨다. 동시에 고통을 끝낼 수 있다는 사실이 오히려 삶을 지탱하는 희망이 되는, 고통 받는 사람들의 존재를 담담히 알린다. 그러므로 이 책은 죽음이 아닌, 존엄한 삶에 대한 이야기로 완성된다.<br>자신과 같은 환자들이 언젠가는 한국에서 죽음을 맞이하기를 바라며 임종 순간까지 다큐멘터리를 촬영한 어머니. 어머니를 기억하고 그 용기를 전하기 위해 작가는 이 모든 과정을 글로 썼다. 어머니의 죽음이 남긴 의미를 다른 사람을 위한, 이제까지와는 다른 내일을 만드는 데에서 찾기 위해서다. 이 책은 어머니와 딸이 함께 쓴 특별한 사랑의 기록이자, 존엄한 삶을 지키려 애쓴 한 사람의 눈부신 분투기이고, 동시대인들에게 던지는 존엄한 삶에 대한 묵직한 질문이다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (118, '이기적 유전자', '리처드 도킨스', '을유문화사', 20000, '국내', '과학', './../assets/images/detail/book26.jpg', TO_DATE('2018-10-20', 'YYYY-MM-DD'), '세계적 베스트셀러, 과학을 넘어선 우리 시대의 고전, 『이기적 유전자』의 40주년 기념판. 진화론의 새로운 패러다임을 제시한 이 책은 다윈의 적자생존과 자연선택이라는 개념을 유전자 단위로 끌어내려 진화를 설명한다.<br>2013년 영국의 정치평론지 『프로스펙트』지가 독자들의 투표로 선정하는 세계 최고의 지성 1위에 오른 바 있는 도킨스는 일찍이 촉망받는 젊은 과학자로 간결한 문체와 생생한 비유, 논리적인 전개를 갖춘 글로 능력을 인정받아 왔다. 도킨스는 자신의 동물행동학 연구를 진화의 역사에서 유전자가 차지하는 중심적 역할에 대한 좀 더 넓은 이론적 맥락과 연결시키기 시작했는데, 그 결과가 바로 『이기적 유전자』다.<br>이번 40주년 기념판에 새롭게 수록된 에필로그에서 도킨스는 여전히 이기적 유전자라는 개념이 갖고 있는 지속적인 타당성을 이야기하며 이 책이 전하는 메시지를 되새긴다. 새로운 에필로그를 수록하는 것은 물론 새로운 디자인과 휴대하기 좋은 판형으로 갈아입은 40주년 기념판을 통해 독자들은 『이기적 유전자』가 주는 울림을 더욱더 선명하게 느낄 수 있을 것이다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (119, '이스라엘을 위한 변명', '제이크 월리스 사이먼스', '님로드', 20000, '국내', '사회과학', './../assets/images/detail/book21.jpg', TO_DATE('2025-03-10', 'YYYY-MM-DD'), '왜 이스라엘은 이렇게 비난당하고 악마화되는 것일까? 저자는 그 원인을 인류에 DNA처럼 남아있는 반유대주의도 요인 중에 하나지만 중동에서 제국주의가 물러난 진공 상태에서 벌어진 민족과 종교 분쟁에서 비롯되었다고 주장한다.<br>로마의 팔레스타인 정복 이후 조상의 터전을 잃은 유대인은 선택받은 민족과 예수를 팔아넘긴 자라는 이중적 인식 아래 박해와 조롱을 받았고 결국 20세기에 홀로코스트라는 비극적인 참상을 겪었다. 시온으로 돌아가려는 유대인의 염원은 1948년 이스라엘의 건국으로 실현되었지만, 팔레스타인 정착민들과 생존 투쟁이 뒤따랐다. 중동 지역에서 영국의 압제에서 벗어나려는 아랍 민족주의자들의 열망과 지정학적인 분쟁을 일으켜 제2차 세계 대전에서 우위를 점하고자 했던 나치 독일의 이해가 일치해 유럽을 넘어 중동 지역에서도 유대인 절멸의 시나리오가 진행되었다.<br>전쟁 이후 나치의 공백을 메운 것은 소련이었다. 소련은 냉전 시대에 미국의 궤도로 빨려 들어간 이스라엘을 비난하며 아랍 국가들을 지원했지만, 이들이 이스라엘에 궤멸적인 패배를 당하자 큰 충격에 빠졌다. 이후 소련은 정보기관 KGB를 통해 이스라엘에 대한 적극적 조치라는 흑색선전을 펼쳤는데, 이는 나치 독일이 유대인을 공격했던 선전 기법을 그대로 베낀 것이었다. 유대인에서 시온주의자로 공격 대상을 집중했지만 오래된 반유대주의적 편견은 그대로였고 이스라엘을 새로운 혐오의 숙주로 삼아 이스라엘 혐오(이스라엘 포비아)라는 바이러스를 세계에 퍼뜨렸다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (120, '작별하지 않는다', '한강', '문학동네', 16800, '국내', '소설', './../assets/images/detail/book8.jpg', TO_DATE('2021-09-09', 'YYYY-MM-DD'), '한강을 사랑하는 독자의 입장을 떠나, 서점 직원의 입장에서도 매 해마다 소설가 한강의 신작을 기다렸다. 황순원문학상을 수상한 <눈 한 송이가 녹는 동안>, 김유정문학상을 수상한 <작별>을 함께 엮어 출간될 "눈 3부작"의 물성을 상상하며. 본래 3부작의 마지막 이야기로 놓일 것이었던 이야기, <작별하지 않는다>가 (3부작의 두번째 이야기가 "작별"이었다는 점도 의미심장하게 읽힌다.) 독립된 이야기로 드디어 독자를 찾았다. 한강의 소설을 사랑한 독자라면 첫 문장을 읽는 것만으로도 그의 다정하고 조심스러운 음색이 상상될 법한 시적인 풍경으로, 눈보라가 친다.<br>소설가 경하는(당연히 이 인물은 소설적 인물이다.) 5월의 광주에 대한 소설을 썼다. "학살과 고문에 대해 쓰기로 마음먹었으면서, 언젠가 고통을 뿌리칠 수 있을 거라고, 모든 흔적들을 손쉽게 여읠 수 있을 거라고"(23쪽) 생각했던 그는 정작 소설을 끝내고도 한참 그 소설에서 놓이지 못하고 있다. 경하에겐 만주와 베트남 등에서 "역사를 통과한 여성들"(34쪽)의 모습을 다큐멘터리로 남겨온 친구 인선이 있다. 고향인 제주 중산간에서 목수가 된 인선이 손가락 두 개가 잘리는 부상을 입고 자신을 찾고 있다는 연락을 받고 경하는 오랜만에 인선을 만나게 된다. 그리고 인선의 부탁으로 경하는 제주의 눈보라를 무릅쓰고 1948년의 제주, 정심의 이야기 속, "유골 수백 구가 묻힌 구덩이가 맥락도 설명도 없이"(167쪽) 놓인 풍경에 닿는다.<br>5월 광주, <소년이 온다>의 모진 문장을 읽은 독자들이 그 시대를 살았던 것처럼 깊은 상처를 경험했듯, 작가도 "그 소설"을 쓰기 이전으로는 돌아갈 수 없을 듯하다고 한강은 출간 기념 간담회에서 말했다. 죽은 사람의 얼굴 위에 내려앉은 눈송이는 녹지 않는다는 걸 알게 된 1948년의 소녀가 그 이후에도 긴 삶을 살아냈다는 걸 우리는 어떻게 받아들여야 할까. 한강이 쓴 1948년 4월 3일 제주에서 벌어진 일에 관한 이야기, 혹은 우리를 살게하는 지극한 사랑에 관한 이야기. 작가 스스로를 구한 이 소설이, 독자에게도 가닿길 바란다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (121, '집중하는 뇌는 식탁에서 자란다', '강보경', '미다스북스', 18500, '국내', '요리', './../assets/images/detail/book23.jpg', TO_DATE('2025-04-04', 'YYYY-MM-DD'), '집중력 결핍의 시대, 건강한 식습관을 통한 아이의 집중력 향상 비결을 전하는 푸드 테라피스트가 찾아왔다. 『집중하는 뇌는 식탁에서 자란다』는 쌍둥이 워킹맘 저자가 전하는 식탁 위 노하우를 다채롭게 담아낸 식생활 가이드다.<br>이 책은 아이의 집중력과 감정 조절에 영향을 주는 가장 큰 요인 중 하나로 매일 반복되는 식사 시간을 제시한다. 하루 세 끼의 식단을 어떻게 채워가면 좋을까? 어떤 영양소를 어떻게 챙겨 먹어야 건강에 유익할까? 아이의 식습관 개선을 위해 부모가 해야 할 노력으로는 무엇이 있을까? 육아와 가사에 고군분투하는 학부모들이라면 누구나 주목할 법한, 집중력 향상을 위한 영양 관리 비결을 꼼꼼히 녹여냈다.<br>1장에서는 집중력과 영양의 관계를 소개하며, 도움이 되는 음식과 방해가 되는 음식을 구분할 수 있는 가이드를 제공한다. 2장에서는 아침, 점심, 저녁과 간식을 포함한 매 끼니를 균형 있게 꾸려가기 위한 추천 식단과 구체적인 레시피를 소개한다. 3장에는 아이와 함께 생활 속에서 적용해 볼 수 있는 실전 영양 습관을 담았다. 이론에서부터 실전까지, 단 한 권으로 아이의 영양 관리를 책임질 수 있는 최고의 식생활 가이드로 칭하기에 부족함이 없다. 집중하는 아이들의 식탁에서 벌어지는 마법 같은 비밀들이 궁금하지 않은가? 그렇다면 지금이 바로 『집중하는 뇌는 식탁에서 자란다』를 펼칠 시간이다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (122, '채식주의자', '한강', '창비', 15000, '국내', '소설', './../assets/images/detail/book4.jpg', TO_DATE('2022-03-28', 'YYYY-MM-DD'), '2007년 출간된 연작 소설집. 2015년 말 영문명 "더 베지터리언"(The Vegetarian) 영국에서 출간된 후, 가디언, 인디펜던트지 등 유수 언론으로부터 대대적인 호평을 받았다. 이 책으로 한강은 한국인 최초로 부커상을 수상했다.<br>한 여자가 아파트 베란다에서 식물이 되고, 함께 살던 남자는 그녀를 화분에 심는 이야기(<내 여자의 열매>)에서 이 이야기는 출발한다. 표제작 <채식주의자>, 2005년 이상문학상 수상작 <몽고반점>, 그리고 <나무 불꽃>이 죽어가는 개에 대한 어린시절의 기억으로 점점 육식을 멀리하고 스스로가 나무가 되어간다고 생각하는 "영혜"를 주인공으로 공유하며 교차한다. 단아한 문체, 밀도있는 구성으로 섬뜩한 아름다움을 형상화한다.<br>"여전히 계속 나아가고 있다", "이제는 아름다움과 빛과 같이 어떻게도 파괴될 수 없는 것에 관해 이야기하고 싶다."고 말하는 소설가 한강의 길에 박수를 보낸다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (123, '초역 부처의 말', '코이케 류노스케', '포레스트북스', 17800, '국내', '인문학', './../assets/images/detail/book2.jpg', TO_DATE('2024-05-30', 'YYYY-MM-DD'), '2500년 동안 사람들에게 사랑받으며 회자되어 온 부처의 말을 코이케 류노스케 스님이 현대어로 재해석해 책으로 출간했다. 간결하게 축약된 핵심만을 담은 부처의 메시지는, 마음이 약해지고 어려움에 처한 사람들에게 힘과 용기를 불어넣어 준다. 부처의 말이 간결하듯 이 책의 기획 의도 역시 매우 단순하다. 저자는 서문에 독자들이 이 책을 손에 들고 어디를 펼치더라도 그곳에 적힌 부처의 말이 스르륵 마음을 물들이고, 어느 순간 그 속에서 기분 좋은 바람이 일어나 더 좋은 방향으로 이끌어 주길 바란다고 썼다.<br>독일의 철학자인 쇼펜하우어는 동양의 철학에 깊이 매혹되었던 철학자이다. 그는 젊은 시절부터 동양 철학을 읽는 것에 집중했고 부처의 말들에서 인생의 해답을 찾을 수 있다고 말했다. 세계적인 배우 키아누 리브스 역시, 부처의 가르침을 되새기며 생활하는 것으로 유명하다. 부처의 말은 그가 커다란 시련에 직면할 때마다 큰 힘이 됐다. 12개의 주제로 묶인 190가지 부처의 말을 담은 이 책은 복잡한 세상살이에 지친 현대인을 위로하는 동시에 꼭 필요한 삶의 지혜를 전해 준다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (124, '코스모스', '칼 세이건', '사이언스북스', 19900, '국내', '과학', './../assets/images/detail/book14.jpg', TO_DATE('2006-12-20', 'YYYY-MM-DD'), '칼 세이건의 <코스모스> 특별판이 세이건의 서거 10주기를 기념하여 출간되었다. 이 특별판은 지난 2004년 12월에 출간된 <코스모스>(양장본)의 텍스트 전문과 도판 일부를 사용하고 판형을 휴대하기 쉬운 신국판으로 바꿔 출간한 책으로, 독자들이 좀 더 쉽게 칼 세이건의 메시지를 만날 수 있도록 배려한 책이다.<br>이번 특별판은 기존의 양장본의 텍스트 전문을 그대로 싣고 도판 중 본문을 이해하는데 꼭 필요한 것들을 골라 실었다. 그중에서도 컬러로 봐야 할 도판 자료들을 60컷 가까이 골라 컬러 화보로 본문 중간중간에 배치해 넣었다.<br>또 하나 특기할 만한 것은 칼 세이건의 부인인 앤 드루얀이 칼 세이건의 서거 10주기를 맞춰 세이건의 빈자리를 생각하는 아름다운 글을 한국어판 서문으로 실은 것이다. 세이건이 생전에 이루어 놓은 일들과 그가 살아 있었다면 지금 해냈을 일들을 생각하는 이 글을 <코스모스>가 가진 가치를 한층 빛내 주고 있다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (125, '행동하지 않으면 인생은 바뀌지 않는다', '브라이언 트레이시', '현대지성', 16900, '국내', '자기계발', './../assets/images/detail/book7.jpg', TO_DATE('2024-11-19', 'YYYY-MM-DD'), '새해가 다가오면 우리는 변화에 대한 열망으로 가득 차곤 한다. 그리고 건강, 자기계발, 경력 등 인생의 다양한 영역에서 더 나은 모습을 그리며 구체적인 계획을 세워 실천하기 시작한다. 하지만 안타깝게도 대부분의 계획은 현실과 부딪히며 빠르게 무너진다. 다이어트는 며칠을 버티지 못하고, 독서는 몇 쪽 넘기지 못한 채 흐지부지 되며 , 외국어 공부는 첫 주를 넘기지 못하는 경우가 다반사다. 이는 단순히 의지 부족이 아니라 실제 행동으로 옮기지 못하는 우리의 근본적인 문제를 보여준다. 이런 이유로 진정한 변화에 필요한 것은 "동기부여"가 아니라 "행동력"이라고 할 수 있다. 우리는 지금까지 "가짜 동기부여"에 속아 왔다.<br>브라이언 트레이시의 신작 <행동하지 않으면 인생은 바뀌지 않는다>는 행동의 중요성을 구체적이고 설득력 있게 설명한다. 저자는 시급 300원짜리 잡초 제거 알바에서 시작해 회당 8억 원을 받는 세계적인 강연자로 성장했는데, 이 과정에서 배운 단 하나의 성공 메커니즘이 있다. 바로 성공한 사람들은 결코 동기부여에만 의존하지 않는다는 것, 그들의 비밀은 바로 "작은 행동의 반복"에 있다는 것이다. 이 책은 행동이 가져오는 변화의 메커니즘을 다양한 사례와 함께 풀어내며, 하루 5분의 실천과 3일의 루틴으로도 삶의 방향을 바꿀 수 있음을 보여준다. 목표 시각화, 시간 관리, 긍정 확언 등 실질적인 방법을 통해 독자가 스스로 실행할 수 있도록 이끄는 점이 특히 돋보인다. 각 장마다 마련된 ‘실행 프로젝트’는 독자의 잠재력을 깨우고, 행동을 통해 목표를 구체화할 수 있도록 돕는다.<br>2025년이 다가오고 있다. 새해 계획을 세우기 전에 반드시 이 책을 읽어 보길 권해본다. 이 책은 다짐만으로 그쳤던 당신의 계획을 구체적인 행동으로 바꿀 실천의 비법을 담고 있다. 작은 행동이 큰 변화를 만든다는 저자의 메시지는 다가올 한 해를 새롭게 시작할 강력한 동력이 될 것이라고 확신한다. 올해가 가기 전, 행동으로 새해를 맞이하길 바라며 글을 마친다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (126, '황현필의 진보를 위한 역사', '황현필', '역바연', 22000, '국내', '역사', './../assets/images/detail/book10.jpg', TO_DATE('2025-02-07', 'YYYY-MM-DD'), '뉴라이트는 역사를 왜곡하며 대한민국의 정체성을 뒤흔들기 시작했다. 이들은 식민지근대화론을 통해 일제강점기를 미화하고, 김구를 테러리스트로 묘사하는 등 독립운동가를 폄훼한다. 또, 제주4·3사건과 5·18광주민주화운동을 왜곡하고 이승만과 박정희를 우상화한다. 이들의 역사 왜곡은 성공했다. 윤석열 정부의 주요 역사기관의 기관장은 모두 뉴라이트가 차지했다. 역사를 제대로 교육받지 못한 청소년들은 유튜브와 커뮤니티에서 잘못된 역사를 접하고, 이를 사실로 받아들인다.<br>저자 황현필은 그동안 역사 최전방에서 이들과 싸워 왔다. 그리고 이 책을 통해 뉴라이트의 역사 왜곡을 하나하나 짚어 가며 그들의 거짓말을 잡아냈고, 진실을 알리는 작업을 완수했다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (127, 'A Long Walk to Water', '린다 수 박', 'Sandpiper', 11600, '해외', '어린이', './../assets/images/detail/book12.jpg', TO_DATE('2011-10-04', 'YYYY-MM-DD'), '뉴베리 상 수상에 빛나는 한국계 작가 Linda Sue Park이 실화를 바탕으로 선보이는 새로운 이야기!<br>1990년대 후반의 딩카 족 소년 살바, 2000년대 초반의 누어 족 소녀 니아가 만났을 때!<br>니아는 가족들을 위해 우물에 가서 물을 길어 와야 한다. 그것도 매일 같이 8시간을 걸어서. 한편 살바는 전쟁으로 피폐해진 마을 떠난다. 가족들과 혼자 떨어지게 된 살바는 가족들을 찾아 그리고 자신의 안전을 위해서 아프리카를 떠돈다.<br>독자들로 하여금 넋을 잃게 만드는 두 이야기는 두 개의 실마리를 따라간다. 하나는 2008년에서 이어지는 또 다른 하나는 1985년에서 이어지는 희망적인 메시지를 따라간다. 그것은 절망스런 환경의 나라에서도 살아남은 자는 그들이 꿈꾸는 희망을 찾아야 하는 숙명을 가졌다는 것이다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (128, 'basic Grammar in use', 'Raymond Murphy', 'Cambridge University Press', 37000, '해외', '어학', './../assets/images/detail/book18.jpg', TO_DATE('2017-09-21', 'YYYY-MM-DD'), 'Raymond Murphy: 세계적인 저자이자 Cambridge University Press의 간판 저자로서 문법학습의 Bible인 세계적 베스트셀러 in use 시리즈를 모두 저술하였습니다. 영어학습에 있어서 문법의 중요성을 중요시하며, 비 영어권 국가의 영어교육에 크게 이바지하고 있습니다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (129, 'Holes', '루이스 새커', 'Random House', 11600, '해외', '어린이', './../assets/images/detail/book20.jpg', TO_DATE('2000-05-09', 'YYYY-MM-DD'), '1999년 뉴베리상을 받은 청소년과 성인을 위한 소설. <There"s a Boy in the Girls" Bathroom>의 지은이 루이스 새커의 이름을 알린 소설이다.<br>주인공 소년 스탠리의 가문은 고조할아버지 대로부터 전해져 내려오는 "저주"에 걸린 집안이다. 그 저주 때문에 스탠리는 "재수없게도" 청소년 감호소에 보내지게 된다. 캠프 그린 레이크라는 그 감호소에서 소년들이 하는 일은 매일 하루종일 커다란 구덩이를 파는 일.<br>감호소에 모인 소년들은 어느 날 문득, 이 일이 그저 자신들을 벌주기 위한 것이 아니라, 감독관이 무언가 절실히 찾는 것이 있어 계획되었음을 알게 된다. 그러나 과연 그것이 무엇일까? 모험, <파리대왕>과 같은 집단과 개인의 이야기가 있는, 그러면서도 유머러스한 이야기.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (130, 'STOP THE STEAL 대법원의 부정선거 은폐기록', '도태우', '스카이', 15000, '국내', '사회과학', './../assets/images/detail/book3.jpg', TO_DATE('2025-01-20', 'YYYY-MM-DD'), '2020년 4.15 총선에서 인천 연수구을에 출마한 민경욱 전 의원을 대리했던 네 명의 변호사가 대법원의 판결문을 비판하는 책을 출간했다.<br>2020년 4.15 총선은 120건이 넘는 선거소송이 제기되어 중앙선관위의 부정선거 의혹을 증폭시킨 계기가 되었다. 4.15 총선 선거소송 중에서 연수구을 소송은 가장 먼저 증거보전 및 소장 접수가 이루어졌고 가장 많은 변론이 이루어진 대표적인 사건이었다.<br>책은 소 제기 후 180일 이내에 대법원 단심제로 선거소송을 판결하도록 한 법규를 위반하고 2년3개월, 즉 820여 일 후에 내려진 대법원의 판결이 가진 문제점들을 조목조목 비판했다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (131, 'wonder', 'R.J.Palacio', 'Random House USA Inc', 11900, '해외', '어린이', './../assets/images/detail/book19.jpg', TO_DATE('2014-06-01', 'YYYY-MM-DD'), '2012년 출간 이후 어린이 책 분야 스테디셀러로 자리잡은 『아름다운 아이』의 개정판이 새롭게 출간되었다. 주인공 어거스트가 늘 쓰고 다니는 우주 비행사 헬멧을 그린 이번 개정판의 표지는 세상에 나가기를 두려워하면서도 마음속으로는 누구보다 환하게 빛날 준비가 되어 있는 어거스트의 내면을 잘 보여 주고 있다.<br>『아름다운 아이』는 선천적 안면 기형으로 태어난 열 살 소년 어거스트가 처음으로 학교에 들어간 뒤 벌어지는 일 년 동안의 일을 다룬 이야기이다. 작가는 어거스트가 안면 기형이라는 자신의 장애, 얼굴만 보고 사람을 평가하는 사람들의 편견, 아이들의 끈질긴 괴롭힘을 불굴의 의지와 가족의 사랑과 친절을 베푸는 친구의 우정의 힘으로 극복하며 세상에서 가장 아름다운 아이로 거듭나는 과정을 유쾌하게 풀어내고 있다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (132, '구의 증명', '최진영', '은행나무', 12000, '국내', '문학', './../assets/images/detail/book32.jpg', TO_DATE('2023-04-26', 'YYYY-MM-DD'), '2014년 론칭해 2016년까지 총 13권을 출간하고 잠시 멈춰 있던 은행나무 노벨라 시리즈가 새로운 명명과 지금 이 시대를 대표하는 젊은 작가들의 작품으로 다시 출간되었다. 배명훈 최진영 정세랑 안보윤 황현진 윤이형 문지혁 등 3~4백매 분량의 중편소설 시리즈로 한국문학에 새로운 기운을 불어넣었던 ‘은행나무 노벨라’. 그 의미를 동력 삼아 현재 한국문학 장에서 활발하게 활동 중인 젊은 작가들의 장편소설선 ‘시리즈 N°’으로 바통을 건네받아 이어간다.<br><br>이번 신작 3종(박문영, 장진영, 황모과)을 비롯해 구간 리커버(최진영 윤이형 황현진, 이하 순차적으로 리커버)를 동시에 출간하며 서이제 장희원 한정현 정용준 정지돈 등 각자의 개성과 상상력이 담긴 작품들을 선보일 계획이다.<br><br>최진영 소설 《구의 증명》은 사랑하는 연인의 갑작스러운 죽음 이후 겪게 되는 상실과 애도의 과정을 통해 삶의 의미 혹은 죽음의 의미를 되묻는 소설이다. 이 작품에서 최진영은 퇴색하지 않는 사랑의 가치를 전면에 내세우고 아름다운 문장과 감성적이며 애절한 감수성을 통해 젊고 아름다운 남녀의 열정적인 사랑과 냉정한 죽음에 대해 세련된 감성과 탁월한 문체로 담아내고 있다.');

INSERT INTO BOOKT01 (BOOK_ID, TITLE, AUTHOR, PUBLISHER, PRICE, CATEGORY, GENRE, IMAGE, REG_DATE, BOOK_INT) VALUES (133, '인간실격', '다자이 오사무', '민음사', 9000, '국내', '문학', './../assets/images/detail/book33.jpg', TO_DATE('2004-05-15', 'YYYY-MM-DD'), '자살 미수와 약물 중독, 39세의 젊은 나이에 자살로 생을 마감한 다자이 오사무의 작품 <인간 실격>이 출간됐다. 오직 순수함만을 갈망하는 한 젊은이가 파멸해가는 과정이 그려진다. 뉴욕 타임스는 인간의 나약함을 드러내는 데 있어 다자이보다 뛰어난 작가는 드물다고 평했다.<br><br>작품은 나라는 화자가 서술하는 서문과 후기, 작품의 주인공인 요조가 쓴 세 개의 후기로 구성되어 있다. 태어날 때부터 다른 인간들을 이해할 수 없었던 요조는 세상에 동화되기 위해 익살꾼을 자처하지만 번번히 좌절하고 결국 마약에 중독, 자살을 기도하기에 이른다. 하지만 거듭된 동반 자살 시도에서 혼자만 살아남은 요조는 본가로부터 절연 당하고 외딴 시골집에서 쓸쓸히 죽음을 기다리는 인간 실격자가 되고 만다.<br><br>함께 실린 직소는 유다가 예수를 고발하는 자리에서 늘어놓는 이야기이다. 일반적인 해석과 달리, 예수를 흠모하고 사랑했지만 그 사랑을 거부당한 데 대한 분노와 반발심으로 예수를 팔아넘긴 유다의 갈등과 번민을 생생하게 묘사한다.');

-- 회원 테이블 테스트
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user01', '0101', '홍길동', 'user01@test.com', '010-1001-1001', '서울특별시', '테스트동 101호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user02', '0202', '김철수', 'user02@test.com', '010-1002-1002', '서울특별시', '테스트동 102호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user03', '0303', '이영희', 'user03@test.com', '010-1003-1003', '서울특별시', '테스트동 103호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user04', '0404', '박지훈', 'user04@test.com', '010-1004-1004', '서울특별시', '테스트동 104호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user05', '0505', '최유리', 'user05@test.com', '010-1005-1005', '서울특별시', '테스트동 105호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user06', '0606', '정다은', 'user06@test.com', '010-1006-1006', '서울특별시', '테스트동 106호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user07', '0707', '강동원', 'user07@test.com', '010-1007-1007', '서울특별시', '테스트동 107호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user08', '0808', '배수지', 'user08@test.com', '010-1008-1008', '서울특별시', '테스트동 108호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user09', '0909', '한지민', 'user09@test.com', '010-1009-1009', '서울특별시', '테스트동 109호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user10', '1010', '서강준', 'user10@test.com', '010-1010-1010', '서울특별시', '테스트동 110호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user11', '1111', '이수민', 'user11@test.com', '010-1011-1011', '서울특별시', '테스트동 111호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user12', '1212', '오하늘', 'user12@test.com', '010-1012-1012', '서울특별시', '테스트동 112호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user13', '1313', '윤지후', 'user13@test.com', '010-1013-1013', '서울특별시', '테스트동 113호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user14', '1414', '장도윤', 'user14@test.com', '010-1014-1014', '서울특별시', '테스트동 114호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user15', '1515', '심가은', 'user15@test.com', '010-1015-1015', '서울특별시', '테스트동 115호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user16', '1616', '조유정', 'user16@test.com', '010-1016-1016', '서울특별시', '테스트동 116호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user17', '1717', '김태형', 'user17@test.com', '010-1017-1017', '서울특별시', '테스트동 117호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user18', '1818', '권나라', 'user18@test.com', '010-1018-1018', '서울특별시', '테스트동 118호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user19', '1919', '문가영', 'user19@test.com', '010-1019-1019', '서울특별시', '테스트동 119호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user20', '2020', '안유진', 'user20@test.com', '010-1020-1020', '서울특별시', '테스트동 120호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user21', '2121', '유승호', 'user21@test.com', '010-1021-1021', '서울특별시', '테스트동 121호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user22', '2222', '전소민', 'user22@test.com', '010-1022-1022', '서울특별시', '테스트동 122호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user23', '2323', '하도권', 'user23@test.com', '010-1023-1023', '서울특별시', '테스트동 123호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user24', '2424', '배인혁', 'user24@test.com', '010-1024-1024', '서울특별시', '테스트동 124호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user25', '2525', '이준호', 'user25@test.com', '010-1025-1025', '서울특별시', '테스트동 125호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user26', '2626', '한소희', 'user26@test.com', '010-1026-1026', '서울특별시', '테스트동 126호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user27', '2727', '이세영', 'user27@test.com', '010-1027-1027', '서울특별시', '테스트동 127호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user28', '2828', '김남길', 'user28@test.com', '010-1028-1028', '서울특별시', '테스트동 128호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user29', '2929', '박보영', 'user29@test.com', '010-1029-1029', '서울특별시', '테스트동 129호', SYSDATE);
INSERT INTO memberT02 (mem_id, mem_pwd, mem_name, mem_email, mem_phone, mem_add1, mem_add2, join_date) VALUES ('user30', '3030', '임시완', 'user30@test.com', '010-1030-1030', '서울특별시', '테스트동 130호', SYSDATE);

-- 도서리뷰 소년이 온다 데이터 테스트
INSERT INTO book_review (REVIEW_ID, BOOK_ID, MEM_ID, CONTENT, RATING, REG_DATE) VALUES (1, 114, 'user01', '테스트1', 5, SYSDATE);
INSERT INTO book_review (REVIEW_ID, BOOK_ID, MEM_ID, CONTENT, RATING, REG_DATE) VALUES (2, 114, 'user01', '테스트2', 4, SYSDATE);
INSERT INTO book_review (REVIEW_ID, BOOK_ID, MEM_ID, CONTENT, RATING, REG_DATE) VALUES (3, 114, 'user01', '테스트3', 3, SYSDATE);
INSERT INTO book_review (REVIEW_ID, BOOK_ID, MEM_ID, CONTENT, RATING, REG_DATE) VALUES (4, 114, 'user01', '테스트4', 5, SYSDATE);
INSERT INTO book_review (REVIEW_ID, BOOK_ID, MEM_ID, CONTENT, RATING, REG_DATE) VALUES (5, 114, 'user01', '테스트5', 2, SYSDATE);
INSERT INTO book_review (REVIEW_ID, BOOK_ID, MEM_ID, CONTENT, RATING, REG_DATE) VALUES (6, 114, 'user01', '테스트6', 4, SYSDATE);
INSERT INTO book_review (REVIEW_ID, BOOK_ID, MEM_ID, CONTENT, RATING, REG_DATE) VALUES (7, 114, 'user01', '테스트7', 1, SYSDATE);
INSERT INTO book_review (REVIEW_ID, BOOK_ID, MEM_ID, CONTENT, RATING, REG_DATE) VALUES (8, 114, 'user01', '테스트8', 3, SYSDATE);
INSERT INTO book_review (REVIEW_ID, BOOK_ID, MEM_ID, CONTENT, RATING, REG_DATE) VALUES (9, 114, 'user01', '테스트9', 5, SYSDATE);
INSERT INTO book_review (REVIEW_ID, BOOK_ID, MEM_ID, CONTENT, RATING, REG_DATE) VALUES (10, 114, 'user01', '테스트10', 2, SYSDATE);

