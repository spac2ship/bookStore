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
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    String bquery = "";
    if (id != null && pwd != null) {
        bquery = "&id=" + id + "&pwd=" + pwd;
    }
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
    	 <div id="form">
        <header>
            <h1 id="title">**Notice View**</h1>
        </header>
        <%
        	int vNo = 0, vHits = 0;
        	String vWriter="", vTitle="", vRegTime="", vContent="", tmep="";
        	
        	Connection conn = DBConnection.getConnection();
        	Statement stmt = conn.createStatement();
        	String temp = request.getParameter("num");
        	if(temp != null){
        		vNo = Integer.parseInt(temp);
        	}
        	String sql = "select * from noticeT01 where num = " + vNo;
        	ResultSet rs = stmt.executeQuery(sql);
        %>
        <nav>
            <span ><a id="list" href="javascript:location.href='noticeWrite.jsp?num=<%=vNo%><%=bquery%>'">[ 수 정 ]</a></span>
			<span ><a id="list" href="javascript:location.href='noticeDel.jsp?id=<%=id %>&pwd=<%=pwd%>&num=<%=vNo%>'">[ 삭 제 ]</a></span>
			<span ><a id="list" href="notice.jsp?id=<%=id %>&pwd=<%=pwd%>">[목록보기]</a></span>
        </nav>
        <section>
            <table>
            <%
            	while(rs.next()){
            		vNo = rs.getInt("num");
            		vWriter = rs.getString("writer");
            		vTitle = rs.getString("title");
            		vRegTime = rs.getString("regdate");
            		vContent = rs.getString("content");
            	}
            	vTitle = vTitle.replace(" ", "&nbsp;");
            	vContent = vContent.replace(" ","&nbsp;").replace("\n","<br>");
            %>
                <tr>
                    <th class="table_th">글번호</th>
                    <td class="head_txt"><%=vNo %></td>
                    <th class="table_th">Writer</th>
                    <td class="head_txt"><%=vWriter %></td>
                </tr>
                <tr>
                     <th class="table_th">Title</th>
                    <td class="head_txt"><%=vTitle %> </td>
                    <th class="table_th">Date</th>
                    <td class="head_txt"><%=vRegTime %></td>
                </tr>
                <tr>
                </tr>
                <tr>
                     <th id="table_foot" class="table_th">Contents</th>
                    <td colspan="3">
                        <textarea id="input_contents" name="content"><%=vContent %></textarea>
                    </td>
                </tr>
            </table>
        </section>
        </div>
    </div>
</div>
    <footer class="header-container">
    <%@include file="./footer.jsp" %>
</footer>
</body>
</html>