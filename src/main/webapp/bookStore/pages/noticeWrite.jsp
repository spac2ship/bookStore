<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>고객센터</title>
    <link rel="stylesheet" href="./../assets/noticeWrite.css">
    <%
    request.setCharacterEncoding("utf-8");

    %>
</head>
<body>
<header class="header-container">
    <%@include file="./header.jsp" %>
</header>

<div id="wrap">
    <div class="aside">
        <div><p id="costomer_title">고객센터</p></div>
        <div id="costomer_menu"><p>공지사항</p></div>
    </div>

    <div class="customer_wrap">
        <div class="title_wrap">
            <h1>
                <span id="help">무엇을 도와드릴까요?</span><br>
                고객센터
                <span id="help">입니다.</span>
            </h1>
        </div>
        <div class="customer_q">
            <h2>공지 사항</h2>
        </div>
        <div class="search_box">
            <div class="input_btn_box">
                <input id="form_ip" type="text" placeholder="질문을 검색해 보세요.">
                <button type="button" id="btn" style="cursor: pointer"><span id="search_btn">검색</span></button>
            </div>
        </div>
        <div class="customer_q">
            <h2>공지사항</h2>
        </div>
<%
	int vNo, vHits;
	String vWrite, vTitle, vRegTime, vContent, vAction;
	String currTitle = "Create Notice";
	
	String tmp = request.getParameter("num");
	vNo = (tmp != null && tmp.length() > 0) ? Integer.parseInt(tmp) : 0;
	
	Connection conn = DBConnection.getConnection();
	Statement stmt = conn.createStatement();
	
	vWrite=""; vTitle=""; vContent=""; vAction="noticeIns.jsp?num=null";
	
	if(vNo > 0){
		String sql = "select * from noticeT01 where num=" + vNo;
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			vWrite = rs.getString("writer");
			vTitle = rs.getString("title");
			vContent = rs.getString("content");
			currTitle = "Update Notice";
			vAction = "noticeUpd.jsp?num=" + vNo;
		}
	}
%>
    <form id="form" name="frm01" method="post" action="<%=vAction%>">
        <header>
            <h1 id="title"><%=currTitle %></h1>
        <nav>
            <span><a id="list" href="#">[목록보기]</a></span>
        </nav>
        </header>
        <section id="section">
            <table id="tb">
                <tr>
                    <th class="table_th">Title</th>
                    <td><input type="text" id="input_title" name="title" value="<%=vTitle%>"></td>
                </tr>
                <tr>
                    <th class="table_th">Writer</th>
                    <td>
                        <input type="text" id="input_title" name="writer" value="<%=vWrite%>">
                    </td>
                </tr>
                <tr>
                    <th id="table_foot" class="table_th">Contents</th>
                    <td>
                        <textarea id="input_contents" name="content"><%=vContent %></textarea>
                    </td>
                </tr>
            </table>
        </section>
            <footer>
            <div class="btn_wrap">
                <input type="submit" class="btn1" value="Write">
                <input type="reset" class="btn2" value="Reset">
            </div>
        </footer>
        </form>
    </div>
</div>
    <footer class="header-container">
    <%@include file="./footer.jsp" %>
</footer>
<script type="text/javascript">
document.getElementById("list").onclick = function () {
    location.href = "notice.jsp";
};
</script>
</body>
</html>