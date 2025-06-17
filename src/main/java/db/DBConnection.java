package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

// 참고 : https://velog.io/@jobmania/JDBC-DBCP-JNDI-%EC%A0%95%EB%A6%AC
public class DBConnection {
    // DB 연결
    public static Connection getConnection() {
        // DB 접속
        Connection conn = null;
        try {
        	// 외부에서 서버 xml 데이터 읽기
            Context initctx = new InitialContext();
            // 톰캣 서버에 정보를 담아 놓은 곳으로 이동
            Context envctx = (Context) initctx.lookup("java:comp/env");
            // 데이터 소스 객체 선언
            DataSource ds = (DataSource) envctx.lookup("jdbc/OracleDB");
            // 데이터 소스 기준으로 커넥션 연결
            conn = ds.getConnection();
            System.out.println("JNDI로 DB 연결 성공");
        } catch (SQLException | NamingException e) {
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
