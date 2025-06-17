<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>고객센터</title>
    <link rel="stylesheet" href="./../assets/notice.css">
    <%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    String bquery = "";
    String noNumQ = "";
    if (id != null && pwd != null) {
        bquery = "&id=" + id + "&pwd=" + pwd;
        noNumQ = "?id=" + id + "&pwd=" + pwd;
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
            <span><a id="list" href="noticeWrite.jsp<%=noNumQ%>">[공지사항 쓰기]</a></span>
        </div>

        <div class="tbl_col_wrap">
                <table id="tb_header">
                	<tr>
                		<th id="num_wg">번호</th>
                		<th id="title_wg">제목</th>
                		<th id="writer_wg">작성자</th>
                		<th id="date_wg">등록일</th>
                	</tr>
                </table>
            <div class="recordContainer">
                <div class="recordDataContainer">
                </div>
                <div class="pagination"></div>
            </div>
        </div>
    </div>
</div>

<%-- JSP에서 JavaScript 배열에 데이터 전달 --%>
<script>
    const notices = [];
<%
    Connection conn = DBConnection.getConnection();
    Statement stmt = conn.createStatement();
    String sql = "SELECT num, writer, title, TO_CHAR(regdate, 'YYYY-MM-DD') AS regdate FROM noticeT01 ORDER BY num DESC";
    ResultSet rs = stmt.executeQuery(sql);

    while(rs.next()){
        int vNo = rs.getInt("num");
        String vWrite = rs.getString("writer");
        String vTitle = rs.getString("title");
        String vRegTime = rs.getString("regdate");
%>
    notices.push({
        num: <%=vNo%>,
        title: "<%=vTitle%>",
        writer: "<%=vWrite%>",
        date: "<%=vRegTime%>"
    });
<%
    }
    DBConnection.close(rs, stmt, conn);
%>
</script>

<script src="./../assets/notice.js"></script> <!-- 기존 JS 로직 여기에 추가로 분리 가능 -->
<script>
    let recordName = {
        totalRecord: notices.length,
        recPerPage: 10,
        pagePerBlock: 10,
        totalPage: 0,
        totalBlock: 0,
        nowPage: 1,
        nowBlock: 1,
        recOfBeginPage: 0,
        pageOfBeginBlock: 0
    };

    let pagination;
    let recordDataContainer;

    document.addEventListener("DOMContentLoaded", function () {
        mInit();
    });

    function mInit() {
        pagination = document.querySelector('.pagination');
        recordDataContainer = document.querySelector('.recordDataContainer');

        recordName.totalPage = Math.ceil(recordName.totalRecord / recordName.recPerPage);
        recordName.totalBlock = Math.ceil(recordName.totalPage / recordName.pagePerBlock);

        createPagination();
        createRecordData();
    }

    function createPagination() {
        pagination.innerHTML = '';

        const crtAFirst = document.createElement('a');
        crtAFirst.href = '#';
        crtAFirst.innerHTML = '&laquo;';
        crtAFirst.addEventListener('click', movePrevBlock);
        pagination.appendChild(crtAFirst);

        let startPage = (recordName.nowBlock - 1) * recordName.pagePerBlock + 1;
        let endPage = Math.min(startPage + recordName.pagePerBlock - 1, recordName.totalPage);

        for (let page = startPage; page <= endPage; page++) {
            const crtA = document.createElement('a');
            crtA.href = '#';
            crtA.innerHTML = page;
            crtA.addEventListener('click', function (e) {
                e.preventDefault();
                setActivePage(page);
            });
            pagination.appendChild(crtA);
        }

        const crtALast = document.createElement('a');
        crtALast.href = '#';
        crtALast.innerHTML = '&raquo;';
        crtALast.addEventListener('click', moveNextBlock);
        pagination.appendChild(crtALast);

        setActivePage(startPage);
    }

    function setActivePage(page) {
        let links = document.querySelectorAll('.pagination a');
        links.forEach(link => link.classList.remove('active'));

        links.forEach(link => {
            if (parseInt(link.innerHTML) === page) {
                link.classList.add('active');
            }
        });

        recordName.nowPage = page;
        recordName.nowBlock = Math.floor((recordName.nowPage - 1) / recordName.pagePerBlock) + 1;

        createRecord(recordName.recPerPage, recordName.nowPage);
    }

    function movePrevBlock(e) {
        e.preventDefault();
        if (recordName.nowBlock > 1) {
            recordName.nowBlock--;
            createPagination();
        } else {
            alert("첫 번째 블럭입니다.");
        }
    }

    function moveNextBlock(e) {
        e.preventDefault();
        if (recordName.nowBlock < recordName.totalBlock) {
            recordName.nowBlock++;
            createPagination();
        } else {
            alert("마지막 블럭입니다.");
        }
    }

    function createRecordData() {
        recordDataContainer.innerHTML = '';
        createRecord(recordName.recPerPage, recordName.nowPage);
    }

    function createRecord(recPerPage, nowPage) {
        recordDataContainer.innerHTML = '';

        let num = (nowPage - 1) * recPerPage;

        for (let i = 0; i < recPerPage; i++) {
            if (num + i >= recordName.totalRecord) break;

            const createData = document.createElement('div');
            createData.classList.add('recordData');
            
            createData.style.cursor = 'pointer';
            createData.addEventListener('mouseover', function () {
            	  this.style.backgroundColor = '#edf5ff';
            	});
            	createData.addEventListener('mouseout', function () {
            	  this.style.backgroundColor = '';
            	});
            const loginId = "<%= (id != null) ? id : "" %>";
            createData.onclick = function () {
                if (!loginId) {
                    location.href = 'noticeView.jsp?num=' + notices[num + i].num;
                } else {
                    location.href = 'noticeView.jsp?num=' + notices[num + i].num + '<%= bquery %>';
                }
            };

            let createDataInfo = document.createElement('div');
            createDataInfo.classList.add('recordDataNum');
            createDataInfo.innerHTML = notices[num + i].num;
            createData.appendChild(createDataInfo);

            createDataInfo = document.createElement('div');
            createDataInfo.classList.add('recordDataInfo');
            createDataInfo.innerHTML = notices[num + i].title;
            createData.appendChild(createDataInfo);

            let createDataWriter = document.createElement('div');
            createDataWriter.classList.add('recordDataWriter');
            createDataWriter.innerHTML = notices[num + i].writer;
            createData.appendChild(createDataWriter);

            let createDataDate = document.createElement('div');
            createDataDate.classList.add('recordDataDate');
            createDataDate.innerHTML = notices[num + i].date;
            createData.appendChild(createDataDate);

            recordDataContainer.appendChild(createData);
        }
    }
</script>

<footer class="header-container">
    <%@include file="./footer.jsp" %>
</footer>
</body>
</html>