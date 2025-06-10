package dto;

import java.time.LocalDate;

public class OrderDTO {

		private int order_id;
		private String mem_id;
		private LocalDate order_date;
		private int total_price;
		private String status;
		private int book_id;
		private int qty;
		private String title; 
		private String image; 

		public String getTitle() {
		    return title;
		}

		public void setTitle(String title) {
		    this.title = title;
		}

		public String getImage() {
		    return image;
		}

		public void setImage(String image) {
		    this.image = image;
		}

		
		public int getBook_id() {
			return book_id;
		}

		public void setBook_id(int book_id) {
			this.book_id = book_id;
		}

		public int getQty() {
			return qty;
		}

		public void setQty(int qty) {
			this.qty = qty;
		}

		public OrderDTO() {
			super();
		}
		
		public OrderDTO(String mem_id, int qty) {
			super();
			this.mem_id = mem_id;
			this.qty = qty;
		}

		public OrderDTO(int total_price, int book_id, int qty) {
			super();
			this.total_price = total_price;
			this.book_id = book_id;
			this.qty = qty;
		}

		public OrderDTO(int order_id, String mem_id, LocalDate order_date, int total_price, String status) {
			super();
			this.order_id = order_id;
			this.mem_id = mem_id;
			this.order_date = order_date;
			this.total_price = total_price;
			this.status = status;
		}
		public OrderDTO(int order_id, String mem_id, LocalDate order_date, int total_price) {
			super();
			this.order_id = order_id;
			this.mem_id = mem_id;
			this.order_date = order_date;
			this.total_price = total_price;
		}
		public int getOrder_id() {
			return order_id;
		}
		public void setOrder_id(int order_id) {
			this.order_id = order_id;
		}
		public String getMem_id() {
			return mem_id;
		}
		public void setMem_id(String mem_id) {
			this.mem_id = mem_id;
		}
		public LocalDate getOrder_date() {
			return order_date;
		}
		public void setOrder_date(LocalDate order_date) {
			this.order_date = order_date;
		}
		public int getTotal_price() {
			return total_price;
		}
		public void setTotal_price(int total_price) {
			this.total_price = total_price;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		
		

}
