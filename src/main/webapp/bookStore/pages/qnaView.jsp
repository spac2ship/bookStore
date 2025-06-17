<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="./../assets/qna.css">
<title>Insert title here</title>
</head>
<body>
	
	<%
		request.setCharacterEncoding("utf-8");
		int vNo = 0;
		int vHits = 0;
		String vWrite = "", vTitle = "", vRegTime="", vContent="", temp="", vEmail = "";
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
	    String bquery = "";
	    if (id != null && pwd != null) {
	    	bquery = "?id=" + id + "&pwd=" + pwd;
	    } else {
	    	bquery = "?";
	    }
	    vWrite = id;
		
		Connection conn = DBConnection.getConnection();
    	Statement stmt = conn.createStatement();
    	temp = request.getParameter("num");
    	if(temp != null) {
    		vNo = Integer.parseInt(temp);
    	}
    	String sql = "select * from qna where num=" + vNo;
    	ResultSet rs = stmt.executeQuery(sql);
    	
    	while(rs.next()) {
    		vNo = rs.getInt("num");
    		vWrite = rs.getString("writer");
    		vTitle = rs.getString("title");
    		vRegTime = rs.getString("regtime");
    		vContent = rs.getString("content");
    		vEmail = rs.getString("email");
    		vHits = rs.getInt("hits") + 1;
    		
    		// 글 제목과 내용이 웹 페이지에 올바르게 출력되도록 공백과 줄바꿈 처리
    		vTitle = vTitle.replace(" ", "&nbsp;");
    		vContent = vContent.replace(" ", "&nbsp;").replace("\n", "<br>");
    		
    		stmt.executeUpdate("update qna set hits = hits + 1 where num=" + vNo);
    	}
	%>
   	<script>
	    const writer = "<%=vWrite%>";
	    const mem_id = "<%=id%>";
	    const email = "<%=vEmail%>"
	    
	    
	    function qnaUpdate() {
	        if (writer === mem_id) {
	            location.href = "qna-form.jsp<%=bquery%>&num=<%=vNo%>";
	        } else {
	            alert("작성자만 수정하실 수 있습니다.");
	        }
	    }
	
	    function qnaDelete() {
	        if (writer === mem_id) {
	            if (confirm("정말 삭제하시겠습니까?")) {
	                location.href = "qnaDelete.jsp<%=bquery%>&num=<%=vNo%>";
	            }
	        } else {
	            alert("작성자만 삭제하실 수 있습니다.");
	        }
	    }
	</script>

	
	<!-- 헤더 로드될 위치 -->
    <header class="header-container">
        <%@include file="./header.jsp" %>
    </header>
    <div id="wrapper">
    	<div class="aside">
            <div><p id="costomer_title">고객센터</p></div>
            <div id="costomer_menu"><p>1:1 문의 내역</p></div>
        </div>
        <form class = "qna-form">
	        <h1>1:1 문의 내역</h1>
	        <div class="header">
	            <span class="left-span" onclick="qnaUpdate()">[ 수 정 ]</span>
	            <span class="left-span" onclick="qnaDelete()">[ 삭 제 ]</span>
	            <span class="right-span" onclick="location.href='qnaList.jsp<%=bquery%>&num=<%=vNo%>'">[목록보기]</span>
	        </div>
        	<table class="list-table" style="width:100%">
                <tr>
                    <th>글번호</th>
                    <td><input type="text" id="num" value="<%=vNo %>" readonly></td>
                    <th>조회수</th>
                    <td><input type="text" id="hits" value="<%=vHits %>" readonly></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td><input type="text" id="author" value="<%=vWrite %>" readonly></td>
                    <th>작성일자</th>
                    <td><input type="text" id="date" value="<%=vRegTime %>" readonly></td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td colspan="3"><input type="text" id="title" value="<%=vTitle %>" readonly></td>
                </tr>
                <tr>
                    <th style="vertical-align: top;">내용</th>
                    <td colspan="3"><textarea readonly><%=vContent %></textarea></td>
                </tr>
                <tr>
                	<th>이메일</th>
                	<td colspan="3"><input type="text" id="title" value="<%=vEmail %>" readonly></td>
                </tr>
            </table>
        </form>
    </div>
	<!-- 푸터 로드될 위치 -->
    <footer class="footer-container">
       <%@include file="./footer.jsp" %>
    </footer>
</body>
</html>