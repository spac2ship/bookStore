package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;


import db.DBConnection;
import dto.BookDTO;
import dto.CartDTO;

public class CartDAO {
	
		CartDTO dto = new CartDTO();
		public ArrayList<CartDTO> memList = new ArrayList<CartDTO>();
		private static CartDAO dao;
		
		public static CartDAO getInstance() {
			if(dao == null) {
				dao = new CartDAO();
			}
			return dao;
		}
		int cart_id;
		String mem_id;
		int book_id;
		int quantity;
		LocalDate add_date;
		String title;
		String author;
		String publisher;
		int price;
		String category;
		String genre;
		String image;
		Date reg_date;
		String sql;
		Connection conn;
		Statement stmt;
		PreparedStatement pstmt;
		ResultSet rs;
		
		public ArrayList<BookDTO> cartSel(String mem_id) {
			ArrayList<BookDTO> dtoList = new ArrayList<BookDTO>();
				try {
					conn = DBConnection.getConnection();
					sql = "SELECT \r\n"
							+ "    b.*\r\n"
							+ "FROM \r\n"
							+ "    cartT01 c\r\n"
							+ "JOIN \r\n"
							+ "    memberT02 m ON c.mem_id = m.mem_id\r\n"
							+ "JOIN \r\n"
							+ "    bookT01 b ON c.book_id = b.book_id\r\n"
							+ "WHERE \r\n"
							+ " m.mem_id = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, mem_id);//로그인 id값 넣기
					rs = pstmt.executeQuery();
					while(rs.next()) {
						book_id = rs.getInt("book_id");
						title = rs.getString("title");
						author = rs.getString("author");
						publisher = rs.getString("publisher");
						price = rs.getInt("price");
						category = rs.getString("category");
						genre = rs.getString("genre");
						image = rs.getString("image");
						reg_date = rs.getDate("reg_date");
						dtoList.add(new BookDTO(book_id, title, author, publisher, price, category, genre, image, reg_date));
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}finally {
					DBConnection.close(rs, pstmt, conn);
				}
				return dtoList;
		}
		int su;
		public int cartDel(CartDTO dto) {
			mem_id = dto.getMem_id();
	        book_id = dto.getBook_id();
	        
	        sql = "Delete from cartt01 "
	        	    + "WHERE mem_id = ? and book_id = ? and ROWNUM = 1";
	        try {
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, mem_id);
				pstmt.setInt(2, book_id);
				su = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				DBConnection.close(pstmt, conn);
			}
		return su;
	}
		public int cartDelId(CartDTO dto) {
			mem_id = dto.getMem_id();
	        
	        sql = "Delete from cartt01 "
	        	    + "WHERE mem_id = ?";
	        try {
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, mem_id);
				su = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				DBConnection.close(pstmt, conn);
			}
		return su;
	}
	public int cartIns(String memId, String bookId) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    int result = 0;
	    
	    try {
	        conn = DBConnection.getConnection();
	        
	        String sql = "INSERT INTO CartT01 (CART_ID, MEM_ID, BOOK_ID, QUANTITY) VALUES ((SELECT NVL(MAX(CART_ID), 2999) + 1 FROM CartT01), ?, ?, 1)";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, memId); 
	        pstmt.setString(2, bookId);
	        
	        result = pstmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	    	DBConnection.close(pstmt, conn);
	    }
	    
	    return result;
	}
	
}
