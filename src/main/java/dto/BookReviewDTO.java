package dto;

import java.sql.Date;

public class BookReviewDTO {
    private int review_id;
    private int book_id;
    private String mem_id;
    private String content;
    private int rating;
    private Date reg_date;

    // 기본 생성자
    public BookReviewDTO() {}

    // 전체 필드 생성자
    public BookReviewDTO(int review_id, int book_id, String mem_id, String content, int rating, Date reg_date) {
        this.review_id = review_id;
        this.book_id = book_id;
        this.mem_id = mem_id;
        this.content = content;
        this.rating = rating;
        this.reg_date = reg_date;
    }

    // Getter & Setter
    public int getReview_id() {
        return review_id;
    }
    public void setReview_id(int review_id) {
        this.review_id = review_id;
    }

    public int getBook_id() {
        return book_id;
    }
    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public String getMem_id() {
        return mem_id;
    }
    public void setMem_id(String mem_id) {
        this.mem_id = mem_id;
    }

    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }

    public int getRating() {
        return rating;
    }
    public void setRating(int rating) {
        this.rating = rating;
    }

    public Date getReg_date() {
        return reg_date;
    }
    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    @Override
    public String toString() {
        return "BookReviewDTO [review_id=" + review_id + ", book_id=" + book_id + ", mem_id=" + mem_id
                + ", content=" + content + ", rating=" + rating + ", reg_date=" + reg_date + "]";
    }
}
