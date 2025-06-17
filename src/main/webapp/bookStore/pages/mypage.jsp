<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ page import="db.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <link rel="stylesheet" href="./../assets/mypage.css">
    <script src="./mypage.js"></script>
    <%
    	request.setCharacterEncoding("utf-8");
    	String id = (String) session.getAttribute("log_id");
        /* out.println("넘어온 id: " + id); */
    	MemberDTO memDTO = new MemberDTO();
    	memDTO.setMem_id(id);
        MemberDAO memDAO = MemberDAO.getInstance();
	    String name = memDAO.memName(memDTO);
    %>
</head>
<body>
    <header class="header-container">
		 <%@include file="./header.jsp" %>
      </header>
    <div id="wrap">
        <section class="breadcrumb_wrap">
            <div class="breadcrumb_inner">
                <ol id="TopBreadcrumb">
                    <li class="breadcrumb_item_no"><a class="home_link" style="cursor: pointer;" href="../index.jsp"></a></li>
                    <li class="breadcrumb_item"><a class="btn_sub_depth" href="./mypage.jsp">마이</a></li>
                </ol>
            </div>
        </section>
        <section class="content_wrap">
            <div class="content_inner">
                <aside class="aside_wrap">
                    <div class="aside_body">
                        <div id="AsideMyProfile" class="my_profile_area">
                            <div class="profile_inner">
                                <div class="profile_thumb_box" title="회원수정" style="cursor: pointer;" onclick="location.href='<%=contextPath %>/ControllerMem.do?category=update'">
                                    <a class="btn_setting" title="회원수정" href="<%=contextPath %>/ControllerMem.do?category=update">
                                        <div class="thumb_box" ></div>
                                    </a>
                            </div>
                            <div class="profile_name_box">
                                <span class="name_row"><%=name %>님</span>
                                <span class="badge" style="cursor: pointer;"><a class="badge_img" style="cursor: pointer;">   
                                </a>프렌즈 ></span>
                                <ul class="profile_info_list">
                                    <li class="info_item"><a class="info_link">찜</a></li>
                                    <li class="info_item"><a class="info_link">리스트</a></li>
                                </ul>
                            </div>
                            </div>
                        </div>
                    </div>
                </aside>
                <section class="switch_toggle">
                    <div class="btn_switch">
                        <button type="button" class="notify_btn" onclick="notifyBtn()">알림 추천</button>
                        <button type="button" class="access_btn" onclick="accessBtn()">전체 이용</button>
                    </div>
                </section>
            </div>
        </section>
        <section class="main">
            <aside id="aside_menu">
            </aside>
            <section class="section_main">
            <div class="box_container">
                <div class="box_item01">통합포인트<br><strong>0P</strong></div>
                <div class="box_item02">e쿠폰함<br><strong>0개</strong></div>
                <div class="box_item03">기프트카드<br><strong>0건</strong></div>
            </div>
        
            <div class="box_row">
                <div class="box_row_item01">쿠폰<br><strong>6장</strong></div>
                <div class="box_row_item02">예치금<br><strong>0원</strong></div>
            </div>

            <div class="recent_section">
                <h2>최근 봤던 상품</h2>
                <div class="recent_box">최근 본 책</div>
            </div>
             </section>
          </section>
    </div>
    <footer class="header-container">
		<%@include file="./footer.jsp" %>
      </footer>
</body>
</html>