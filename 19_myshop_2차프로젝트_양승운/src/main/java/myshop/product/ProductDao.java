package myshop.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

public class ProductDao {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		private static ProductDao dao=null;
		
		private ProductDao() throws Exception{
			Context initcontext = new InitialContext();
			Context envcontext = (Context)initcontext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envcontext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
		}
		public static ProductDao getInstance() {
			if(dao==null) {
				try {
					dao = new ProductDao();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return dao;
		}
		
		public int insertProduct(MultipartRequest mr) {
			String sql="insert into myshop_product values(prod_seq.nextval,?,?,?,?,?,?,?,?,?,?,sysdate)";
			int cnt=-1;
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, mr.getParameter("pname"));
				String pcategory_ch = mr.getParameter("pcategory_ch");
				String [] pcategory = pcategory_ch.split("/");
				ps.setString(2, pcategory[0]);
				ps.setString(3, pcategory[1]);
				ps.setString(4, mr.getParameter("pcompany"));
				ps.setString(5, mr.getFilesystemName("pimage"));
				ps.setInt(6, Integer.parseInt(mr.getParameter("pqty")));
				ps.setInt(7, Integer.parseInt(mr.getParameter("price")));
				ps.setString(8, mr.getParameter("pspec"));
				ps.setString(9, mr.getFilesystemName("pcontents_image"));
				ps.setInt(10, Integer.parseInt(mr.getParameter("point")));
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
		
		public int deleteData(int pnum) {
			String sql="delete myshop_product where pnum=?";
			int cnt=-1;
			try {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, pnum);
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
		
		public ArrayList<ProductDTO> getProductList(){
			ArrayList<ProductDTO> lists = new ArrayList<ProductDTO>();
			String sql = "select * from myshop_product";
			ProductDTO bean = null;
			try {
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				while(rs.next()) {
					bean = getProductDTO(rs);
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
		
		public ArrayList<ProductDTO> selectBySearch(String pname){
			ArrayList<ProductDTO> lists = new ArrayList<ProductDTO>();
			String sql = "select * from myshop_product where pname like ?";
			ProductDTO bean = null;
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, "%"+pname+"%");
				rs = ps.executeQuery();
				while(rs.next()) {
					bean = getProductDTO(rs);
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
		
		public ProductDTO selectByPnum(int pnum) {
			String sql = "select * from myshop_product where pnum=?";
			ProductDTO bean = null;
			try {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, pnum);;
				rs = ps.executeQuery();
				while(rs.next()) {
					bean = getProductDTO(rs);
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
		
		public int updateProduct(MultipartRequest mr) {
			String sql="update myshop_product set pname=?, pcode=?, pcategory=?, pcompany=?,pimage=?,pqty=?,price=?,pspec=?,pcontents_image=?,point=? where pnum=?";
			int cnt=-1;
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, mr.getParameter("pname")); 
				String pcategory_ch = mr.getParameter("pcategory_ch");
				String [] pcategory = pcategory_ch.split("/");
				ps.setString(2, pcategory[0]);
				ps.setString(3, pcategory[1]);
				ps.setString(4, mr.getParameter("pcompany"));
				  if(mr.getFilesystemName("pimage")==null) { 
					  ps.setString(5, mr.getParameter("pimage_old")); 				  
				  }
				  else {
					  ps.setString(5, mr.getFilesystemName("pimage"));				  
				  }
				ps.setInt(6, Integer.parseInt(mr.getParameter("pqty")));
				ps.setInt(7, Integer.parseInt(mr.getParameter("price")));
				ps.setString(8, mr.getParameter("pspec"));
				  if(mr.getFilesystemName("pcontents_image")==null) { 
					  ps.setString(9, mr.getParameter("pcontents_image_old")); 				  
				  }
				  else {
					  ps.setString(9, mr.getFilesystemName("pcontents_image"));				  
				  }
				ps.setInt(10, Integer.parseInt(mr.getParameter("point")));
				ps.setInt(11, Integer.parseInt(mr.getParameter("pnum")));
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
		
		public ArrayList<ProductDTO> selectByPspec(String pspec) {
			ArrayList<ProductDTO> lists = new ArrayList<ProductDTO>();
			String sql = "select * from myshop_product where pspec=?";
			ProductDTO bean = null;
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, pspec);;
				rs = ps.executeQuery();
				while(rs.next()) {
					bean = getProductDTO(rs);
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
		
		public ArrayList<ProductDTO> getProductByCategory(String code) {
			ArrayList<ProductDTO> lists = new ArrayList<ProductDTO>();
			String sql = "select * from myshop_product where pcategory=?";
			ProductDTO bean = null;
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, code);;
				rs = ps.executeQuery();
				while(rs.next()) {
					bean = getProductDTO(rs);
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
			
		public ProductDTO getProductDTO(ResultSet rs) throws SQLException {
			ProductDTO bean = null;
			int pnum = rs.getInt("pnum");
			String pname = rs.getString("pname");
			String pcode = rs.getString("pcode");
			String pcategory = rs.getString("pcategory");
			String pcompany = rs.getString("pcompany");
			String pimage = rs.getString("pimage");
			int pqty = rs.getInt("pqty");
			int price = rs.getInt("price");
			String pspec = rs.getString("pspec");
			String pcontents_image = rs.getString("pcontents_image");
			int point = rs.getInt("point");
			String pinputdate = rs.getString("pinputdate");
			
			bean = new ProductDTO(pnum,pname,pcode,pcategory,pcompany,pimage,pqty,price,pspec,pcontents_image,point,pinputdate);
			return bean;
		}
	
}
