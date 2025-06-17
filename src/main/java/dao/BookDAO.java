package dao;

import java.sql.*;
import dto.BookDTO;
import db.DBConnection;

public class BookDAO {

    private static BookDAO instance = new BookDAO();
    private BookDAO() {}
    public static BookDAO getInstance() {
        return instance;
    }

    public BookDTO getBookById(String bookId) throws SQLException {
        String sql = "SELECT book_id, title, author, publisher, price, category, genre, image, "
                   + "TO_CHAR(reg_date, 'YYYY-MM-DD') AS reg_date, book_int "
                   + "FROM bookT01 WHERE book_id = ?";
        BookDTO book = null;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, bookId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    book = new BookDTO(
                        rs.getInt("book_id"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getString("publisher"),
                        rs.getInt("price"),
                        rs.getString("category"),
                        rs.getString("genre"),
                        rs.getString("image"),
                        rs.getDate("reg_date"),
                        rs.getString("book_int")
                    );
                }
            }
        }
        return book;
    }
}