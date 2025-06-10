<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 내역</title>
    <link rel="stylesheet" href="./../assets/qnaList.css">
	<%
		request.setCharacterEncoding("utf-8");
		String id = (String)session.getAttribute("log_id");
		int vNo, vHits, totalRecord = 0;
		String vWrite, vTitle, vRegTime, vEmail;
	%>
</head>
<body>
	<header class="header-container">
     	<%@include file="./header.jsp" %>
    </header>
    <div id="wrapper">
    	<div class="aside">
            <div><p id="costomer_title">고객센터</p></div>
            <div id="costomer_menu"><p>1:1 문의 내역</p></div>
        </div>
        <form>
	        <h1>1:1 문의 내역</h1>
	        <div class="header">
	            <button type="button" class="left-span" onclick="location.href='qna-form.jsp'">✏️ 문의 하기</button>
	        </div>
	        <div class="detail-search">
	        	<p class="detail-show">상세조회</p><input type="text" class="title-search" placeholder="문의 제목을 입력하세요">
	        	<button type="button">조회</button>
	        </div>
            <div class="content">
	            <table id = "tb1">
	                <tr>
	                    <th>번호</th>
	                    <th>제목</th>
	                    <th>글쓴이</th>
	                    <th>등록일</th>
	                    <th>조회</th>
	                    <!-- <th>IP</th> -->
	                </tr>
	                <%
	                ResultSet rs;
					PreparedStatement pstmt;
					
			    	Connection conn = DBConnection.getConnection();
			    	Statement stmt = conn.createStatement();
			    	
			    	// 총 레코드 수 구해서 rs에 넣기
			    	rs = stmt.executeQuery("select count(*) from qna");
			    	// rs.getInt(1) = 첫번째 컬럼 값 가져오기 = count(*) = 255 
			    	while(rs.next()) {
			    		totalRecord = rs.getInt(1);
			    	}
			    	int recPerPage = 5; // 페이지당 보여질 레코드 수
			    	int pagePerBlock = 5; // 블록당 보여질 페이지 수
			    	
			    	int totalPage = (int)Math.ceil((double)totalRecord / recPerPage); // 총 페이지 수
			    	int totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock); // 총 블록 수
			
					int nowPage = 0; // 현재 페이지 위치
					int nowBlock = 0; // 현재 블록 위치
					
					// nowPage, nowBlock 값 받아오기
					if(request.getParameter("nowPage")!= null) {
						nowPage = Integer.parseInt(request.getParameter("nowPage"));
					}
					if(request.getParameter("nowBlock")!= null) {
						nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
					}
					int recOfBeginPage = nowPage * recPerPage; // 시작 페이지의 레코드 값
					int pageOfBeginBlock = nowBlock * pagePerBlock; // 시작 블록의 페이지 값
					
					String sql = "select outerQ.* from " +
							"(select rownum as rnum, innerQ.* " + 
									"from (select * from qna order by num desc) innerQ) outerQ " +
									" where outerQ.rnum between ? and ?";
					pstmt = conn.prepareStatement(sql);
					
					// rnum 범위 지정
					pstmt.setInt(1, recOfBeginPage + 1); // 시작 인덱스
					pstmt.setInt(2, (recOfBeginPage + 1) + recPerPage); // 끝 인덱스
					
					rs = pstmt.executeQuery();
					for (int idx = recOfBeginPage; idx < recOfBeginPage + recPerPage; idx++) {
	            		if(idx >= totalRecord) { // 총 레코드 수 넘으면 정지
	            			break;
	            		}
	            		rs.next();
	               		vNo = rs.getInt("num");
	               		vWrite = rs.getString("writer");
	               		vTitle = rs.getString("title");
	               		vRegTime = rs.getString("regtime");
	               		vHits = rs.getInt("hits");
	           
	                %>
	                <tr id = "tr2" onclick="location.href='qnaView.jsp?num=<%=vNo%>'">
	                	<td><input type="text" id="num" value="<%=vNo %>"></td>
	                    <td><input type="text" id="title" value="<%=vTitle %>"></td>
	                    <td><input type="text" id="author" value="<%=vWrite %>"></td>
	                    <td><input type="text" id="date" value="<%=vRegTime %>"></td>
	                    <td><input type="text" id="view" value="<%=vHits %>"></td>
	                    <!-- <td><input type="text" id="ip" value="0:0:0:0:0:0:1"></td> -->
	                </tr>
	                <% } %>
	            </table>
	            <div class="center">
	            	<div class="pagination">
	            		<%
	            			if(nowBlock != 0) { // 처음 블럭이 아니면
	            		%>
	            				<a href = "qnaList.jsp?nowBlock=<%=nowBlock-1 %>&nowPage=<%=(nowBlock-1)*pagePerBlock %>">&laquo;</a>
	            		<%
	            			} // 현재 블록과 페이지 category 값을 보내서 다시 nowBlock과 nowPage값을 받아올 수 있도록 함
	            		%>
	            		<%
	            			for(int idx1 = pageOfBeginBlock; idx1 < pageOfBeginBlock + pagePerBlock; idx1++) {
	            				// 시작 블록 페이지 값, 시작 블록의 페이지 값 + 블록당 보여질 페이지;
	            		%>
	            				<a href ="qnaList.jsp?nowBlock=<%=nowBlock %>&nowPage=<%=idx1 %>"
	            					class="page <%= (idx1 == nowPage) ? "active" : "" %>"><%=idx1 + 1 %></a>
	            		<%
	            				if(idx1 + 1 == totalPage) { // 전체 페이지 값과 같으면 멈춤
	            					break;
	            				}
	            			}
	            		%>
	            		<%
	            			if(nowBlock + 1 < totalBlock) {
	            		%>		
	            				<a href = "qnaList.jsp?nowBlock=<%=nowBlock+1 %>&nowPage=<%=(nowBlock+1)*pagePerBlock %>">&raquo;</a>
	            		<%
	            			} else {
	            				
	            			}
	            		%>
	            	</div>
	            </div>
	        </div>
        </form>
    </div>
    <footer class="header-container">
		<%@include file="./footer.jsp" %>
    </footer>
</body>
</html>