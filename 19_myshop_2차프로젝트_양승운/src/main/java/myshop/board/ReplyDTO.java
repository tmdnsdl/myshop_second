package myshop.board;

public class ReplyDTO {
	private int num;
	private String type;
	private String id;
	private String email;
	private String subject;
	private String reg_date;
	private int renum;
	private String content;
	
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
	public int getRenum() {
		return renum;
	}
	public void setRenum(int renum) {
		this.renum = renum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public ReplyDTO() {
		super();
	}
	public ReplyDTO(int num, String type, String id, String email, String subject, String reg_date, int renum,
			String content) {
		super();
		this.num = num;
		this.type = type;
		this.id = id;
		this.email = email;
		this.subject = subject;
		this.reg_date = reg_date;
		this.renum = renum;
		this.content = content;
	}
	
	
}
