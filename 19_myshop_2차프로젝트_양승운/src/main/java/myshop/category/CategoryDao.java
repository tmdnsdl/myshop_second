package myshop.category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CategoryDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	private static CategoryDao dao=null;
	
	private CategoryDao() throws Exception{
		Context initcontext = new InitialContext();
		Context envcontext = (Context)initcontext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envcontext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
	}

	public static CategoryDao getInstance() {
		if(dao==null) {
			try {
				dao = new CategoryDao();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return dao;
	}
	
	public int insertCategory(CategoryDTO b) {
		String sql = "insert into myshop_category values(cat_seq.nextval,?,?)";
		int cnt=-1;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, b.getCode());
			ps.setString(2, b.getCname());
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
	
	public ArrayList<CategoryDTO> getCategoryList() {
		String sql = "select * from myshop_category";
		CategoryDTO bean = null;
		ArrayList<CategoryDTO> lists = new ArrayList<CategoryDTO>();
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				int cnum = rs.getInt("cnum");
				String code = rs.getString("code");
				String cname = rs.getString("cname");
				
				bean = new CategoryDTO(cnum,code,cname);
				lists.add(bean);
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
		return lists;
	}
	
	public int deleteCategoryByCnum(int cnum) {
		String sql = "delete myshop_category where cnum=?";
		int cnt=-1;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cnum);
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
	
}