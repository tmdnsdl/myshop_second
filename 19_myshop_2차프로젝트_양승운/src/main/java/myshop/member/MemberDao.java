package myshop.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private MemberDao() throws Exception {
		Context initcontext = new InitialContext();
		Context envcontext = (Context)initcontext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envcontext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
	}	
	private static MemberDao dao=null;
	public static MemberDao getInstance() {
		if(dao==null) {
			try {
				dao= new MemberDao();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return dao;
	}
	
	public boolean searchId(String userid) {
		String sql = "select id from myshop_members where id=?";
		boolean b = false;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			while(rs.next()) {
				b=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return b;
	}
	
	public int insertData(MemberDTO b) {
		String sql = "insert into myshop_members values(memseq.nextval,?,?,?,?,?,?,?,?)";
		int cnt=-1;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, b.getName());
			ps.setString(2, b.getId());
			ps.setString(3, b.getPw());
			ps.setString(4, b.getRrn());
			ps.setString(5, b.getEmail());
			ps.setString(6, b.getHp());
			ps.setString(7, b.getAddress());
			ps.setString(8, b.getJoindate());
			cnt = ps.executeUpdate();
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
		return cnt;
	}
	
	public String getMemberByrrn(String name, String rrn) {
		String sql = "select id from myshop_members where name=? and rrn=?";
		String id="";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, rrn);
			rs = ps.executeQuery();
			if(rs.next()) {
				id = rs.getString("id");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return id;
	}
	public String getMemberByIdAndRrn(String id, String rrn) {
		String sql = "select pw from myshop_members where id=? and rrn=?";
		String pw="";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, rrn);
			rs = ps.executeQuery();
			if(rs.next()) {
				pw = rs.getString("pw");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return pw;
	}
	
	public MemberDTO getMemberInfo(String id, String pw) {
		String sql = "select * from myshop_members where id=? and pw=?";
		MemberDTO bean = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);
			rs = ps.executeQuery();
			while(rs.next()) {
				bean = getMemberDTO(rs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return bean;
	}
	
	public int updateMember(MemberDTO b) {
		String sql = "update myshop_members set email=?, hp=?, address=? where id=? and pw=? ";
		int cnt=-1;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, b.getEmail());
			ps.setString(2, b.getHp());
			ps.setString(3, b.getAddress());
			ps.setString(4, b.getId());
			ps.setString(5, b.getPw());
			cnt = ps.executeUpdate();
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
		return cnt;
	}
	
	public MemberDTO getMemberDTO(ResultSet rs) throws SQLException {
		MemberDTO member = null;
		int no = rs.getInt("no");
		String name2 = rs.getString("name");
		String id2 = rs.getString("id");
		String password = rs.getString("pw");
		String rrn2 = rs.getString("rrn");
		String email = rs.getString("email");
		String hp2 = rs.getString("hp");
		String address = rs.getString("address");
		String joindate = rs.getString("joindate");
		
		member = new MemberDTO(no,name2,id2,password,rrn2,email,hp2,address,joindate);
		return member;
	}
}
