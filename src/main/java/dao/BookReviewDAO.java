package dao;

import dto.BookReviewDTO;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import db.DBConnection;

public class BookReviewDAO {
    private static BookReviewDAO instance = new BookReviewDAO();
    public static BookReviewDAO getInstance() { return instance; }

    private BookReviewDAO() {}

    // 리뷰 목록 조회
    public List<BookReviewDTO> getReviewsByBookId(int book_id) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BookReviewDTO> list = new ArrayList<>();
        
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT review_id, book_id, mem_id, content, rating, reg_date " +
                         "FROM book_review WHERE book_id = ? ORDER BY review_id DESC";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, book_id);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                BookReviewDTO dto = new BookReviewDTO();
                dto.setReview_id(rs.getInt("review_id"));
                dto.setBook_id(rs.getInt("book_id"));
                dto.setMem_id(rs.getString("mem_id"));
                dto.setContent(rs.getString("content"));
                dto.setRating(rs.getInt("rating"));
                dto.setReg_date(rs.getDate("reg_date"));
                list.add(dto);
            }
        } finally {
            if (rs != null) {
                DBConnection.close(rs, pstmt, conn);
            } else {
                DBConnection.close(pstmt, conn);
            }
        }
        return list;
    }

    // 리뷰 등록
    public int insertReview(BookReviewDTO dto) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int newReviewId = 1;
        
        try {
            conn = DBConnection.getConnection();
            
            // review_id 생성
            String maxSql = "SELECT NVL(MAX(review_id), 0) + 1 FROM book_review";
            try (Statement stmt = conn.createStatement();
                 ResultSet maxRs = stmt.executeQuery(maxSql)) {
                if (maxRs.next()) {
                    newReviewId = maxRs.getInt(1);
                }
            }

            // INSERT 실행
            String sql = "INSERT INTO book_review (review_id, book_id, mem_id, content, rating, reg_date) " +
                         "VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, newReviewId);
            pstmt.setInt(2, dto.getBook_id());
            pstmt.setString(3, dto.getMem_id());
            pstmt.setString(4, dto.getContent());
            pstmt.setInt(5, dto.getRating());
            pstmt.setDate(6, dto.getReg_date());
            return pstmt.executeUpdate();
        } finally {
            DBConnection.close(rs, pstmt, conn);
        }
    }
 // 리뷰 삭제
    public int deleteReview(int review_id) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBConnection.getConnection();
            String sql = "DELETE FROM book_review WHERE review_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, review_id);
            return pstmt.executeUpdate();
        } finally {
            DBConnection.close(pstmt,conn);
        }
    }
//리뷰 수정
    public int updateReview(BookReviewDTO dto) throws SQLException {
        String sql = "UPDATE book_review SET content = ?, rating = ? WHERE review_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, dto.getContent()); // CLOB도 setString으로 가능
            pstmt.setInt(2, dto.getRating());
            pstmt.setInt(3, dto.getReview_id());
            return pstmt.executeUpdate();
        }
    }
// 리뷰조회   
    public BookReviewDTO getReviewById(int review_id) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BookReviewDTO dto = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT review_id, book_id, mem_id, content, rating, reg_date FROM book_review WHERE review_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, review_id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto = new BookReviewDTO();
                dto.setReview_id(rs.getInt("review_id"));
                dto.setBook_id(rs.getInt("book_id"));
                dto.setMem_id(rs.getString("mem_id"));
                dto.setContent(rs.getString("content"));
                dto.setRating(rs.getInt("rating"));
                dto.setReg_date(rs.getDate("reg_date"));
            }
        } finally {
            if (rs != null) {
                DBConnection.close(rs, pstmt, conn);
            } else {
                DBConnection.close(pstmt, conn);
            }
        }
        return dto;
    }
    //------조회 + 페이지 네이션
 // 1. 해당 도서의 총 리뷰 개수 조회
    public int getReviewCountByBookId(int book_id) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int count = 0;
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT COUNT(*) FROM book_review WHERE book_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, book_id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } finally {
            if (rs != null) {
                DBConnection.close(rs, pstmt, conn);
            } else {
                DBConnection.close(pstmt, conn);
            }
        }
        return count;
    }

    // 2. Oracle 페이징 쿼리로 리뷰 목록 조회 (startRow, endRow는 1부터 시작하는 행번호)
    public List<BookReviewDTO> getReviewsByBookIdWithPaging(int book_id, int startRow, int endRow) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BookReviewDTO> list = new ArrayList<>();
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT * FROM ( " +
                         "  SELECT review_id, book_id, mem_id, content, rating, reg_date, " +
                         "         ROW_NUMBER() OVER (ORDER BY review_id DESC) rn " +
                         "  FROM book_review WHERE book_id = ? " +
                         ") WHERE rn BETWEEN ? AND ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, book_id);
            pstmt.setInt(2, startRow);
            pstmt.setInt(3, endRow);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                BookReviewDTO dto = new BookReviewDTO();
                dto.setReview_id(rs.getInt("review_id"));
                dto.setBook_id(rs.getInt("book_id"));
                dto.setMem_id(rs.getString("mem_id"));
                dto.setContent(rs.getString("content"));
                dto.setRating(rs.getInt("rating"));
                dto.setReg_date(rs.getDate("reg_date"));
                list.add(dto);
            }
        } finally {
            if (rs != null) {
                DBConnection.close(rs, pstmt, conn);
            } else {
                DBConnection.close(pstmt, conn);
            }
        }
        return list;
    }

}
