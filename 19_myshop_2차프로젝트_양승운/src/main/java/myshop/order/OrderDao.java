package myshop.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import myshop.product.ProductDTO;

public class OrderDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	private static OrderDao dao;
	
	private OrderDao() throws NamingException, SQLException {
		Context initcontext = new InitialContext();
		Context envcontext = (Context)initcontext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envcontext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
	}
	
	public static OrderDao getInstance() {
		if(dao==null) {
			try {
				dao = new OrderDao();
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return dao;
	}
	
	public int insertOrder(ArrayList<ProductDTO> cartlist, int memno, String ordername, String orderhp, String orderaddr) {
		int cnt =-1;
		String sql="insert into myshop_orders values(order_seq.nextval,?,?,?,?,?,?,?)";
		try {
			for(ProductDTO b :cartlist) {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, memno);
			ps.setInt(2, b.getPnum());	
			ps.setInt(3, b.getPqty());	
			ps.setInt(4, b.getTotalPrice());
			ps.setString(5, ordername);
			ps.setString(6, orderhp);
			ps.setString(7, orderaddr);
			cnt += ps.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				}
			}
		if(cnt!=-1) {
			cnt++;
		}
		return cnt;
	}
	
	public ArrayList<OrderDTO> getMemberOrders(String memid){
		String sql = "select m.id,p.pname,o.oqty,o.oprice,o.ordername,o.orderhp,o.orderaddr from myshop_members m, myshop_orders o, myshop_product p where m.no = o.memno and o.pnum=p.pnum and m.id=?";
		ArrayList<OrderDTO> orderlist = new ArrayList<OrderDTO>();
		OrderDTO bean =null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, memid);
			rs = ps.executeQuery();
			while(rs.next()) {
				String mid = rs.getString("id");
				String pname = rs.getString("pname");
				int oqty = rs.getInt("oqty");
				int oprice = rs.getInt("oprice");
				String ordername = rs.getString("ordername");
				String orderhp = rs.getString("orderhp");
				String orderaddr = rs.getString("orderaddr");
				bean = new OrderDTO(mid,pname,oqty,oprice,ordername,orderhp,orderaddr);
				orderlist.add(bean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				}
			}
		return orderlist;
	}
	
	public ArrayList<OrderDTO> getMemberOrders(){
		String sql = "select m.id,p.pname,o.oqty,o.oprice,o.ordername,o.orderhp,o.orderaddr from myshop_members m, myshop_orders o, myshop_product p where m.no = o.memno and o.pnum=p.pnum";
		ArrayList<OrderDTO> orderlist = new ArrayList<OrderDTO>();
		OrderDTO bean =null;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				String mid = rs.getString("id");
				String pname = rs.getString("pname");
				int oqty = rs.getInt("oqty");
				int oprice = rs.getInt("oprice");
				String ordername = rs.getString("ordername");
				String orderhp = rs.getString("orderhp");
				String orderaddr = rs.getString("orderaddr");
				bean = new OrderDTO(mid,pname,oqty,oprice,ordername,orderhp,orderaddr);
				orderlist.add(bean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				}
			}
		return orderlist;
	}
	
}
