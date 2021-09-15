package myshop.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	private static BoardDao instance;
	
	private BoardDao() throws NamingException, SQLException {
		Context initcontext = new InitialContext();
		Context envcontext = (Context)initcontext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envcontext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
	}//
	
	public static BoardDao getInstance() {
		if(instance==null) {
			try {
				instance = new BoardDao();
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return instance;
	}
	
	public int getArticleCount(){
		String sql = "select count(*) c from myshop_board";
		int count=0;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				count = rs.getInt("c");
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
		
		return count;
	}
	
	public ArrayList<BoardDTO> getArticles(int start, int end){
		String sql = "select num, type, id, email, subject, reg_date, readcount, re_count, content \r\n"
				+ "from (select rownum as rank, num, type, id, email, subject, reg_date, readcount, re_count, content \r\n"
				+ "from myshop_board order by num desc) where rank between ? and ?";
		ArrayList<BoardDTO> lists = new ArrayList<BoardDTO>();
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardDTO bean = getBoardDTO(rs);
				lists.add(bean);
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
		return lists;
	}
	
	public ReplyDTO getReply(int renum){
		String sql = "select * from myshop_reply where renum=?";
		ReplyDTO bean = null;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, renum);
			rs = ps.executeQuery();
			while(rs.next()) {
				bean = getReplyDTO(rs);
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
		return bean;
	}
	
	public int insertArticle(BoardDTO b) {
		String sql = "insert into myshop_board values(board_seq.nextval,?,?,?,?,sysdate,0,0,?)";
		int cnt=0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, b.getType());
			ps.setString(2, b.getId());
			ps.setString(3, b.getEmail());
			ps.setString(4, b.getSubject());
			ps.setString(5, b.getContent());
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
	
	public BoardDTO getArticle(int num) {
		String sqlUpdate = "update myshop_board set readcount=readcount+1 where num=?";
		String sql = "select * from myshop_board where num=?";
		BoardDTO bean = null;
		try {
			ps = conn.prepareStatement(sqlUpdate);
			ps.setInt(1, num);
			ps.executeUpdate();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			while(rs.next()) {
				bean = getBoardDTO(rs);
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
		
		return bean;
	}
	
	public BoardDTO updateArticle(int num) {
		String sql = "select * from myshop_board where num=?";
		BoardDTO bean = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			while(rs.next()) {
				bean = getBoardDTO(rs);
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
		return bean;
	}
	
	public int updateArticle(BoardDTO b) {
		String sqlSelect = "select id from myshop_board where num=?";
		String sql = "update myshop_board set type=?, subject=?, reg_date=sysdate, content=? where num=?";
		int cnt=0;
		try {
			ps= conn.prepareStatement(sqlSelect);
			ps.setInt(1, b.getNum());
			rs = ps.executeQuery();
			if(rs.next()) {
				String dbid = rs.getString("id");
				if(dbid.equals(b.getId())) {
					ps = conn.prepareStatement(sql);
					ps.setString(1, b.getType());
					ps.setString(2, b.getSubject());
					ps.setString(3, b.getContent());
					ps.setInt(4, b.getNum());
					cnt = ps.executeUpdate();
				}
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
		return cnt;
	}
	
	public int deleteArticle(int num, String id) {
		String sqlSelect = "select id from myshop_board where num=?";
		String sql = "delete myshop_board where num=?";
		int cnt=0;
		try {
			ps= conn.prepareStatement(sqlSelect);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				String dbid = rs.getString("id");
				if(dbid.equals(id)) {
					ps = conn.prepareStatement(sql);
					ps.setInt(1, num);
					cnt = ps.executeUpdate();
				}
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
		return cnt;
	}
	
	public int replyArticle(BoardDTO b) {
		String sqlUpdate = "update myshop_board set re_count=re_count+1 where num=?";
		String sqlInsert = "insert into myshop_reply values(reply_seq.nextval,?,?,?,?,sysdate,?,?)";
		int cnt=-1;
		try {
			ps = conn.prepareStatement(sqlUpdate);
			ps.setInt(1, b.getNum());				
			ps.executeUpdate();
			
			ps = conn.prepareStatement(sqlInsert);
			ps.setString(1, b.getType());
			ps.setString(2, b.getId());
			ps.setString(3, b.getEmail());
			ps.setString(4, b.getSubject());
			ps.setInt(5, b.getNum());
			ps.setString(6, b.getContent());
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
	
	public BoardDTO getBoardDTO(ResultSet rs) throws SQLException{
		BoardDTO bean = null;
		
		int num = rs.getInt("num");
		String type = rs.getString("type");
		String id = rs.getString("id");
		String email = rs.getString("email");
		String subject = rs.getString("subject");
		String reg_date = rs.getString("reg_date");
		int readcount = rs.getInt("readcount");
		int re_count = rs.getInt("re_count");
		String content = rs.getString("content");
		
		bean = new BoardDTO(num,type,id,email,subject,reg_date,readcount,re_count,content);
		return bean;
	}
	
	public ReplyDTO getReplyDTO(ResultSet rs) throws SQLException{
		ReplyDTO bean = null;
		
		int num = rs.getInt("num");
		String type = rs.getString("type");
		String id = rs.getString("id");
		String email = rs.getString("email");
		String subject = rs.getString("subject");
		String reg_date = rs.getString("reg_date");
		int renum = rs.getInt("renum");
		String content = rs.getString("content");
		
		bean = new ReplyDTO(num,type,id,email,subject,reg_date,renum,content);
		return bean;
	}
	
}
