package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;

import db.DBConnection;
import dto.BookDTO;
import dto.MemberDTO;
import dto.OrderDTO;

public class OrderDAO {
	
	OrderDTO dto = new OrderDTO();
	private static OrderDAO dao;
	
	public static OrderDAO getInstance() {
		if(dao == null) {
			dao = new OrderDAO();
		}
		return dao;
	}
	
	
		public OrderDAO() {
		super();
	}


		int book_id;
		 int order_id;
		 String mem_id;
		 LocalDate order_date;
		 int total_price;
		 String status;
		 String title;
		String author;
		String publisher;
		int price;
		String category;
		String genre;
		String image;
		LocalDate reg_date;
		int quantity;
		String mem_name;
		String sql;
		Connection conn;
		Statement stmt;
		PreparedStatement pstmt;
		ResultSet rs;
		
		public ArrayList<BookDTO> orderSel(String id) {
			ArrayList<BookDTO> dtoList = new ArrayList<BookDTO>();
				try {
					conn = DBConnection.getConnection();
					sql = "SELECT b.book_id, b.title, b.price, b.image, od.quantity\r\n"
							+ "FROM memberT02 m\r\n"
							+ "JOIN orderT01 o ON m.mem_id = o.mem_id\r\n"
							+ "JOIN order_detailT01 od ON o.order_id = od.order_id\r\n"
							+ "JOIN bookT01 b ON od.book_id = b.book_id\r\n"
							+ "where m.MEM_ID = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);//로그인 id값 넣기
					rs = pstmt.executeQuery();
					while(rs.next()) {
						book_id = rs.getInt("book_id");
						title = rs.getString("title");
						price = rs.getInt("price");
						image = rs.getString("image");
						quantity = rs.getInt("quantity");
						dtoList.add(new BookDTO(book_id, title, price, image, quantity));
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}finally {
					DBConnection.close(rs, pstmt, conn);
				}
				return dtoList;
		}
		public ArrayList<MemberDTO> orderSelName(String id) {
			ArrayList<MemberDTO> dtoList = new ArrayList<MemberDTO>();
				try {
					conn = DBConnection.getConnection();
					sql = "SELECT mem_name "
							+ "FROM memberT02 m\r\n"
							+ "where m.MEM_ID = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);//로그인 id값 넣기
					rs = pstmt.executeQuery();
					while(rs.next()) {
						mem_name = rs.getString("mem_name");
						dtoList.add(new MemberDTO(mem_name, id));
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}finally {
					DBConnection.close(rs, pstmt, conn);
				}
				return dtoList;
		}
		
		public int createOrder(String memId, int bookId) {
		    Connection conn = null;
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    int orderId = 0;
		    
		    try {
		        conn = DBConnection.getConnection();
		        
		        // 트랜잭션 시작 - 자동 커밋 비활성화
		        conn.setAutoCommit(false);
		        
		        // 1. 책 가격 조회
		        String sqlPrice = "SELECT price FROM BookT01 WHERE book_id = ?";
		        pstmt = conn.prepareStatement(sqlPrice);
		        pstmt.setInt(1, bookId);
		        rs = pstmt.executeQuery();
		        
		        int price = 0;
		        if (rs.next()) {
		            price = rs.getInt("price");
		        }
		        rs.close();
		        pstmt.close();
		        
		        // 2. 주문 번호 생성
		        String sqlOrderId = "SELECT NVL(MAX(order_id), 4999) + 1 FROM OrderT01";
		        pstmt = conn.prepareStatement(sqlOrderId);
		        rs = pstmt.executeQuery();
		        if (rs.next()) {
		            orderId = rs.getInt(1);
		        }
		        rs.close();
		        pstmt.close();
		        
		        // 3. 주문 생성 (OrderT01에 삽입)
		        String sql = "INSERT INTO OrderT01 (order_id, mem_id, order_date, total_price) VALUES (?, ?, SYSDATE, ?)";
		        pstmt = conn.prepareStatement(sql);
		        pstmt.setInt(1, orderId);
		        pstmt.setString(2, memId);
		        pstmt.setInt(3, price); // 수량 1로 고정이므로
		        
		        int result = pstmt.executeUpdate();
		        
		        if (result <= 0) {
		            conn.rollback(); // 실패 시 롤백
		            return 0;
		        }
		        
		        // 4. 주문 상세 생성 (order_detailT01에 삽입)
		        String detailSql = "INSERT INTO order_detailT01 (detail_id, order_id, book_id, quantity, price) VALUES ((SELECT NVL(MAX(detail_id), 0) + 1 FROM order_detailT01), ?, ?, 1, ?)";
		        pstmt = conn.prepareStatement(detailSql);
		        pstmt.setInt(1, orderId);
		        pstmt.setInt(2, bookId);
		        pstmt.setInt(3, price);
		        
		        result = pstmt.executeUpdate();
		        
		        if (result <= 0) {
		            conn.rollback(); // 실패 시 롤백
		            return 0;
		        }
		        
		        // 모든 작업 성공 시 커밋
		        conn.commit();
		        
		    } catch (Exception e) {
		        // 예외 발생 시 롤백
		        try {
		            if (conn != null) conn.rollback();
		        } catch (SQLException ex) {
		            ex.printStackTrace();
		        }
		        e.printStackTrace();
		        return 0;
		    } finally {
		        // 자동 커밋 모드 복원
		        try {
		            if (conn != null) conn.setAutoCommit(true);
		        } catch (SQLException ex) {
		            ex.printStackTrace();
		        }
		        DBConnection.close(rs, pstmt, conn);
		    }
		    
		    return orderId; // 성공 시 주문번호 리턴
		}
		public boolean deleteOrder(int orderId) {
		    Connection conn = null;
		    PreparedStatement pstmtDetail = null;
		    PreparedStatement pstmtOrder = null;
		    boolean result = false;

		    try {
		        conn = DBConnection.getConnection();
		        conn.setAutoCommit(false); // 트랜잭션 시작

		        // 1. 자식 테이블: 주문 상세 삭제
		        String sqlDetail = "DELETE FROM order_detailT01 WHERE order_id = ?";
		        pstmtDetail = conn.prepareStatement(sqlDetail);
		        pstmtDetail.setInt(1, orderId);
		        pstmtDetail.executeUpdate();

		        // 2. 부모 테이블: 주문 삭제
		        String sqlOrder = "DELETE FROM orderT01 WHERE order_id = ?";
		        pstmtOrder = conn.prepareStatement(sqlOrder);
		        pstmtOrder.setInt(1, orderId);
		        int row = pstmtOrder.executeUpdate();

		        if (row > 0) {
		            conn.commit(); // 성공 시 커밋
		            result = true;
		        } else {
		            conn.rollback(); // 실패 시 롤백
		        }

		    } catch (Exception e) {
		        try {
		            if (conn != null) conn.rollback(); // 예외 시 롤백
		        } catch (SQLException rollbackEx) {
		            rollbackEx.printStackTrace();
		        }
		        e.printStackTrace();
		    } finally {
		        DBConnection.close(pstmtDetail, null);
		        DBConnection.close(pstmtOrder, conn);
		    }

		    return result;
		}
		public ArrayList<OrderDTO> orderSelOrderDTO(String id) {
		    ArrayList<OrderDTO> dtoList = new ArrayList<>();

		    try {
		        conn = DBConnection.getConnection();
		        sql = "SELECT o.order_id, o.mem_id, o.order_date, o.total_price, " +
		              "b.title, b.image, od.quantity " +
		              "FROM memberT02 m " +
		              "JOIN orderT01 o ON m.mem_id = o.mem_id " +
		              "JOIN order_detailT01 od ON o.order_id = od.order_id " +
		              "JOIN bookT01 b ON od.book_id = b.book_id " +
		              "WHERE m.mem_id = ?";
		        pstmt = conn.prepareStatement(sql);
		        pstmt.setString(1, id);
		        rs = pstmt.executeQuery();

		        while (rs.next()) {
		            OrderDTO dto = new OrderDTO();
		            dto.setOrder_id(rs.getInt("order_id"));
		            dto.setMem_id(rs.getString("mem_id"));
		            dto.setOrder_date(rs.getDate("order_date").toLocalDate());
		            dto.setTotal_price(rs.getInt("total_price"));
		            dto.setTitle(rs.getString("title"));
		            dto.setImage(rs.getString("image"));
		            dto.setQty(rs.getInt("quantity"));

		            dtoList.add(dto);
		        }

		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        DBConnection.close(rs, pstmt, conn);
		    }

		    return dtoList;
		}
		public boolean createOrderWithQuantity(String memId, int bookId, int quantity, int totalPrice) {
		    Connection conn = null;
		    PreparedStatement pstmt = null;
		    int price = (int)(totalPrice / 0.9);
		    try {
		        conn = DBConnection.getConnection();
		        conn.setAutoCommit(false);

		        // 주문 번호 생성
		        String getOrderIdSql = "SELECT NVL(MAX(order_id), 4999) + 1 FROM orderT01";
		        pstmt = conn.prepareStatement(getOrderIdSql);
		        ResultSet rs = pstmt.executeQuery();
		        int orderId = 0;
		        if (rs.next()) {
		            orderId = rs.getInt(1);
		        }
		        rs.close();
		        pstmt.close();

		        // 주문 테이블 등록
		        String insertOrderSql = "INSERT INTO orderT01 (order_id, mem_id, order_date, total_price) VALUES (?, ?, SYSDATE, ?)";
		        pstmt = conn.prepareStatement(insertOrderSql);
		        pstmt.setInt(1, orderId);
		        pstmt.setString(2, memId);
		        pstmt.setInt(3, price);
		        int result1 = pstmt.executeUpdate();
		        pstmt.close();

		        // 상세 주문 등록
		        String insertDetailSql = "INSERT INTO order_detailT01 (detail_id, order_id, book_id, quantity, price) VALUES ((SELECT NVL(MAX(detail_id), 0) + 1 FROM order_detailT01), ?, ?, ?, ?)";
		        pstmt = conn.prepareStatement(insertDetailSql);
		        pstmt.setInt(1, orderId);
		        pstmt.setInt(2, bookId);
		        pstmt.setInt(3, quantity);
		        pstmt.setInt(4, price);
		        int result2 = pstmt.executeUpdate();

		        if (result1 > 0 && result2 > 0) {
		            conn.commit();
		            return true;
		        } else {
		            conn.rollback();
		        }

		    } catch (Exception e) {
		        try { if (conn != null) conn.rollback(); } catch (SQLException ex) {}
		        e.printStackTrace();
		    } finally {
		        try { if (conn != null) conn.setAutoCommit(true); } catch (SQLException ex) {}
		        DBConnection.close(pstmt, conn);
		    }

		    return false;
		}
}
