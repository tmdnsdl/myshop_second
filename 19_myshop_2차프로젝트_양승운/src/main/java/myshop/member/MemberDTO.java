package myshop.member;

public class MemberDTO {
	private int no;
	private String name;
	private String id;
	private String pw;
	private String rrn;
	private String email;
	private String hp;
	private String address;
	private String joindate;
	public MemberDTO() {
		super();
	}
	public MemberDTO(int no, String name, String id, String pw, String rrn, String email, String hp, String address, String joindate) {
		super();
		this.no = no;
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.rrn = rrn;
		this.email = email;
		this.hp = hp;
		this.address = address;
		this.joindate = joindate;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getRrn() {
		return rrn;
	}
	public void setRrn(String rrn) {
		this.rrn = rrn;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	
	
}
