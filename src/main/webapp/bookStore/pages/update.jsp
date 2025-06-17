<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 수정</title>
    <link href="./../assets/login.css" rel="stylesheet">
    <%
		String mem_id = request.getParameter("id");
	    MemberDAO dao = MemberDAO.getInstance();
	    MemberDTO dto = dao.getMemById(mem_id);
	%>
</head>
<body id = "update">
    <div class="wrapper">
    	<form action="updateAction.jsp" method="post" id="frm">
	        <!-- 왼쪽 화면 -->
	        <div class="left">
	            <h1>회원 수정</h1>
	            <div class="logo"><img src="./../assets/images/update.png"></div>
	        </div>
	
	        <!-- 오른쪽 화면 -->
	        <div class="right">
	            <h2>회원 수정</h2>
	            <div class="input-group">
	                <label for="id">아이디</label>
	                <!-- hidden : 사용자가 시각적으로 보거나 직접 수정할 수 없는 값을 나타내는 숨겨진 필드 -->
	                <input type="hidden" name="memValues" value="<%=mem_id%>">
	                <!-- 밑에 줄에 name="memValues"값을 주면 memValues[1]값에 id가 들어감 그래서 지워야 함 -->
	                <input type="text" id="id" class="input" placeholder="아이디를 입력하세요." value="<%= dto.getMem_id() %>" readonly>
	            </div>
	            <div class="input-group">
	                <label for="password">새 비밀번호</label>
	                <input type="password" name="memValues" id="password" class="input" placeholder="새 비밀번호를 입력하세요." onkeydown="enter(event)">
	            </div>
	            <div class="input-group">
	                <label for="name">이름</label>
	                <input type="text" name="memValues" id="name" class="input" value="<%= dto.getMem_name() %>" placeholder="이름을 입력하세요." onkeydown="enter(event)">
	            </div>
	            <div class="input-group">
	                <label for="email">이메일</label>
	                <input type="email" name="memValues" id="email" class="input" value="<%= dto.getMem_email() %>" placeholder="이메일을 입력하세요." onkeydown="enter(event)">
	            </div>
	            <div class="input-group">
	                <label for="phone">휴대폰 번호</label>
	                <input type="text" name="memValues" id="phone" class="input" value="<%= dto.getMem_phone() %>" placeholder="번호를 입력하세요." onkeydown="enter(event)">
	            </div>
	            <div class="input-group">
	                <label for="add1">주소</label>
	                <input type="text" name="memValues" id="add1" class="input" placeholder="주소를 입력하세요." value="<%= dto.getMem_add1() %>" onkeydown="enter(event)">
	                <input type="text" name="memValues" id="add2" class="input" placeholder="상세주소를 입력하세요." value="<%= dto.getMem_add2() %>" onkeydown="enter(event)">
	            </div>
	            <button type="submit" class="login-btn" id="btn01" onclick="return validateSignUp()" onkeydown="return validateSignUp()">확인</button>
     
	            <div class="signup">
	                <a href="./delete.jsp"><button type="button" class = "signup-btn">회원탈퇴</button></a>
	            </div>
	        </div>
        </form>
    </div>
    <script src = "./../assets/login.js"></script>
</body>
</html> 