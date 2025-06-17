package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnection {
    // DB 연결
    public static Connection getConnection() {
        // DB 접속
        String URL = "jdbc:oracle:thin:@localhost:1522:xe"; 
        String ID = "hr";       
        String PWD = "hr"; 
        Connection conn = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver"); // 드라이버 로딩
            conn = DriverManager.getConnection(URL, ID, PWD);
            System.out.println("DB 연결 성공");
        } catch (ClassNotFoundException e) {
        	e.printStackTrace();
            System.out.println("드라이버 로딩 실패");
        } catch (SQLException e) {
        	e.printStackTrace();
            System.out.println("DB 연결 실패");
        }
        return conn;
    }
    
    // insert
 	public static void close(Statement stmt, Connection conn) {
 		try {
 			stmt.close();
 			if (conn != null) conn.close();
 			System.out.println("DB 연결 해제");
 		} catch (SQLException e) {
 			e.printStackTrace();
 		}
 	}
 	
 	// select용
 	public static void close(ResultSet rs, Statement stmt, Connection conn) {
         try {
         	rs.close();
         	stmt.close();
         	if (conn != null) conn.close();
 			System.out.println("DB 연결 해제");
         } catch (SQLException e) {
             e.printStackTrace();
         }
 	}
}
