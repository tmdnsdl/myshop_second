package myshop.order;

public class OrderDTO {
	private String memid;
	private String pname;
	private int oqty;
	private int oprice;
	private String ordername;
	private String orderhp;
	private String orderaddr;
	
	public OrderDTO() {
		super();
	}
	public OrderDTO(String memid, String pname, int oqty, int oprice, String ordername, String orderhp,
			String orderaddr) {
		super();
		this.memid = memid;
		this.pname = pname;
		this.oqty = oqty;
		this.oprice = oprice;
		this.ordername = ordername;
		this.orderhp = orderhp;
		this.orderaddr = orderaddr;
	}
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getOqty() {
		return oqty;
	}
	public void setOqty(int oqty) {
		this.oqty = oqty;
	}
	public int getOprice() {
		return oprice;
	}
	public void setOprice(int oprice) {
		this.oprice = oprice;
	}
	public String getOrdername() {
		return ordername;
	}
	public void setOrdername(String ordername) {
		this.ordername = ordername;
	}
	public String getOrderhp() {
		return orderhp;
	}
	public void setOrderhp(String orderhp) {
		this.orderhp = orderhp;
	}
	public String getOrderaddr() {
		return orderaddr;
	}
	public void setOrderaddr(String orderaddr) {
		this.orderaddr = orderaddr;
	}
	
}
