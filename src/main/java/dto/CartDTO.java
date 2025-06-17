package dto;

import java.time.LocalDate;

public class CartDTO {
	private int cart_id;
	private String mem_id;
	private int book_id;
	private int quantity;
	private LocalDate add_date;
	
	public CartDTO() {
		super();
	}
	
	public CartDTO(String mem_id) {
		super();
		this.mem_id = mem_id;
	}

	public CartDTO(String mem_id, int book_id) {
		super();
		this.mem_id = mem_id;
		this.book_id = book_id;
	}

	public CartDTO(int cart_id, String mem_id, int book_id, int quantity) {
		super();
		this.cart_id = cart_id;
		this.mem_id = mem_id;
		this.book_id = book_id;
		this.quantity = quantity;
	}

	public CartDTO(int cart_id, String mem_id, int book_id, int quantity, LocalDate add_date) {
		super();
		this.cart_id = cart_id;
		this.mem_id = mem_id;
		this.book_id = book_id;
		this.quantity = quantity;
		this.add_date = add_date;
	}

	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getBook_id() {
		return book_id;
	}

	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public LocalDate getAdd_date() {
		return add_date;
	}

	public void setAdd_date(LocalDate add_date) {
		this.add_date = add_date;
	}

	
}
