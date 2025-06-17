package dao;

import java.sql.*;
import db.DBConnection;
import dto.*;

public class QnaDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public int getNum() {
		int number = 1;
		
		try {
			conn = DBConnection.getConnection();
			// 쿼리 실행
		 	// board에서 num에 최대값 가져옴, 그리고 그 최대값에 + 1씩해서 number에 집어넣음 
		 	// (insert하면 최대값 + 1)로 num에 저장
		 	String selSql = "select max(num) as num from qna";
		 	pstmt = conn.prepareStatement(selSql);
		 	rs = pstmt.executeQuery();
		 	while(rs.next()) {
		 		number = rs.getInt("num") + 1;
		 	}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, pstmt, conn);
		}
		return number;
	}
	
	public void insert(QnaDTO qna) {
		try {
			conn = DBConnection.getConnection();
			// insert 쿼리 실행
		 	String sql = "INSERT INTO qna (num, writer, title, content, email) " +
	             "VALUES (?, ?, ?, ?, ?)";
		 	pstmt.setInt(1, qna.getNum());
		 	pstmt.setString(2, qna.getWriter());
		 	pstmt.setString(3, qna.getTitle());
		 	pstmt.setString(4, qna.getContent());
		 	pstmt.setString(5, qna.getEmail());
		 	
		 	pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(pstmt, conn);
		}
	}
}