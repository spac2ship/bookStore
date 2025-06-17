package dto;

public class QnaDTO {
	
	private int num;
	private String writer;
	private String title;
	private String content;
	private String email;
	private String regtime;
	private int hits;
	
	public QnaDTO() {
		// TODO Auto-generated constructor stub
	}

	public QnaDTO(int num, String writer, String title, String content, String email, String regtime, int hits) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.email = email;
		this.regtime = regtime;
		this.hits = hits;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegtime() {
		return regtime;
	}

	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

}
