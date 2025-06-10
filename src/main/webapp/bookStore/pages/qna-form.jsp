<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ page import="db.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1 문의</title>
    <link rel="stylesheet" href="./../assets/qna.css">
    <%
		request.setCharacterEncoding("utf-8");
    	String id = (String)session.getAttribute("log_id");
       
    	if (id == null) {
    		out.println("<script>alert('로그인이 필요한 서비스입니다.'); location.href='login.jsp';</script>");
    	}
    %>
</head>
<body>
	<%
		int vNo, vHits;
		String vWrite, vTitle, vRegTime, vContent, vAction, vEmail = "";
		String currTitle = "1:1 문의 접수";
		String curSubmit = "접수";
		// 글 번호 얻기, num이 안넘어오면 0으로 설정
		String tmp = request.getParameter("num");
		vNo = (tmp!=null && tmp.length() > 0) ? Integer.parseInt(tmp) : 0;
	
     	Connection conn = DBConnection.getConnection();
     	Statement stmt = conn.createStatement();
     	
     	// 새 글쓰기 모드를 가정하고 변수 초기값 설정
     	vWrite = id;
     	vTitle = "";
     	vContent = "";
     	vAction = "qnaInsert.jsp";
     	
     	// num이 null이 아니라면 (글을 수정할 때)
     	if(vNo > 0) {
         	String sql = "select * from qna where num =" + vNo;  
         	ResultSet rs = stmt.executeQuery(sql);
         	
         	if(rs.next()) {
         		vTitle = rs.getString("title");
         		vContent = rs.getString("content");
         		vEmail = rs.getString("email");
         		currTitle = "1:1 문의 수정";
         		curSubmit = "수정";
         		// 글 수정일 때 저장 버튼을 누르면 업데이트 실행
         		vAction = "qnaUpdate.jsp?num=" + vNo;
         	}
     	} else { // 아니면 memberT02에 있는 email 가져오기 (글 작성할 때)
        	MemberDTO memDTO = new MemberDTO();
        	memDTO.setMem_id(id);
            MemberDAO memDAO = MemberDAO.getInstance();
    	    vEmail = memDAO.memEmail(memDTO);
     	}
     %>
	<!-- 헤더 로드될 위치 -->
    <header class="header-container">
        <%@include file="./header.jsp" %>
    </header>
    <div id="wrapper">
    	<div class="aside">
            <div><p id="costomer_title">고객센터</p></div>
            <div id="costomer_menu"><p><%=currTitle %></p></div>
        </div>
        <form name="frm" method="post" class = "qna-form" action="<%=vAction %>">
	        <h1><%=currTitle %></h1>
	        <div class="header">
	            <button type="button" class="right-span" onclick="location.href='qnaList.jsp'">📜 1:1 문의 내역</button>
	        </div>
            <hr>
            <input type="hidden" name="writer" value="<%= id %>">
        
            <table>
                <tr>
                    <th>내용<span class="required">*</span></th>
                    <td><input type="text" id="title" name="title" placeholder="제목을 입력해주세요" value="<%=vTitle%>"></td>
                </tr>
                <tr>
                    <th></th>
                    <td colspan="3"><textarea placeholder="문의 내용을 입력해주세요" name="content"><%=vContent%></textarea></td>
                </tr>
                <tr>
                    <th>사진첨부</th>
                    <td><input type="file" id="imageInput" class="file_input_hidden" accept="images/*">
					<div id="preview"></div></td>
                </tr>
            </table>
            <hr>
            <p><b>문의에 대한 답변 등록 시 알려드립니다.</b></p>
            <table>
                <tr>
                    <th>이메일<span class="required">*</span></th>
                    <td><input type="email" name="email" value="<%=vEmail %>"></td>
                </tr>
            </table>
	        <div class = "btn">
	            <input type="submit" id="btn01" value="<%=curSubmit%>">
	            <input type="reset" id="btn02" value="취소">
	        </div>
        </form>
    </div>
	<!-- 푸터 로드될 위치 -->
    <footer class="footer-container">
       <%@include file="./footer.jsp" %>
    </footer>
    <script src ="./../assets/qna-form.js"></script>
</body>
</html>