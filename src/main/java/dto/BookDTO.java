package dto;
import java.sql.Date;

public class BookDTO {

		private int book_id;
		private String title;
		private String author;
		private String publisher;
		private int price;
		private String category;
		private String genre;
		private String image;
		private int quantity;
		private Date reg_date;
		private String book_int; 
		

		public BookDTO(int book_id, String title, int price, String image, int quantity) {
			super();
			this.book_id = book_id;
			this.title = title;
			this.price = price;
			this.image = image;
			this.quantity = quantity;
		}

		public BookDTO(int book_id) {
			super();
			this.book_id = book_id;
		}
		
		public BookDTO(int book_id, String title, String author, String publisher, int price, String category,
				String genre, String image, int quantity, Date reg_date) {
			super();
			this.book_id = book_id;
			this.title = title;
			this.author = author;
			this.publisher = publisher;
			this.price = price;
			this.category = category;
			this.genre = genre;
			this.image = image;
			this.quantity = quantity;
			this.reg_date = reg_date;
		}
		
		public BookDTO(int book_id, String title, String author, String publisher, int price, 
	              String category, String genre, String image, Date reg_date, String book_int) {
		    super();
		    this.book_id = book_id;
		    this.title = title;
		    this.author = author;       // ✅ 추가
		    this.publisher = publisher; // ✅ 추가
		    this.price = price;
		    this.category = category;   // ✅ 추가
		    this.genre = genre;         // ✅ 추가
		    this.image = image;
		    this.reg_date = reg_date;
		    this.book_int = book_int;
		}


		public BookDTO(int book_id, String title, String author, String publisher, int price, String category,
				String genre, String image, Date reg_date) {
			super();
			this.book_id = book_id;
			this.title = title;
			this.author = author;
			this.publisher = publisher;
			this.price = price;
			this.category = category;
			this.genre = genre;
			this.image = image;
			this.reg_date = reg_date;
		}
		public int getBook_id() {
			return book_id;
		}
		public void setBook_id(int book_id) {
			this.book_id = book_id;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getAuthor() {
			return author;
		}
		public void setAuthor(String author) {
			this.author = author;
		}
		public String getPublisher() {
			return publisher;
		}
		public void setPublisher(String publisher) {
			this.publisher = publisher;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		public String getCategory() {
			return category;
		}
		public void setCategory(String category) {
			this.category = category;
		}
		public String getGenre() {
			return genre;
		}
		public void setGenre(String genre) {
			this.genre = genre;
		}
		public String getImage() {
			return image;
		}
		public void setImage(String image) {
			this.image = image;
		}
		public Date getReg_date() {
			return reg_date;
		}
		public void setReg_date(Date reg_date) {
			this.reg_date = reg_date;
		}
		public int getQuantity() {
			return quantity;
		}
		
		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}
		public String getBook_int() {
			return book_int;
		}

		public void setBook_int(String book_int) {
			this.book_int = book_int;
		}

}
