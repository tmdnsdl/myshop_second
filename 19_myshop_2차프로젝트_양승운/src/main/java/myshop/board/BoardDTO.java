package myshop.board;

public class BoardDTO {
	private int num;
	private String type;
	private String id;
	private String email;
	private String subject;
	private String reg_date;
	private int readcount;
	private int re_count;
	private String content;
	
	public BoardDTO() {
		super();
	}

	public BoardDTO(int num, String type, String id, String email, String subject, String reg_date, int readcount,
			int re_count, String content) {
		super();
		this.num = num;
		this.type = type;
		this.id = id;
		this.email = email;
		this.subject = subject;
		this.reg_date = reg_date;
		this.readcount = readcount;
		this.re_count = re_count;
		this.content = content;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getRe_count() {
		return re_count;
	}

	public void setRe_count(int re_count) {
		this.re_count = re_count;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}
