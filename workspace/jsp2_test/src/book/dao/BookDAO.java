package book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import book.bean.BookDTO;

public class BookDAO {
   
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	// 커넥션풀 담당 클래스
	DataSource ds;
	
	public BookDAO() {
		try {
			Context context = new InitialContext();
		    ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			
			e.printStackTrace();
		}finally {
			close();
		}
		
	}
		
	
	public void close() {
		try {
			if(rs != null)rs.close();
			if(pstmt != null)pstmt.close();
			if(conn != null)conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
    public int insertBook(BookDTO bookDTO) {
    	int su = 0;
    	String sql = "insert into book values(?, ?, ?, ?, ?)";
    			
    	try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookDTO.getCode());
			pstmt.setString(2, bookDTO.getTitle());
			pstmt.setString(3, bookDTO.getAuthor());
			pstmt.setString(4, bookDTO.getPublisher());
			pstmt.setInt(5, bookDTO.getPrice());
			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close();
		}
    	
    	
    	return su;
    }
	
    public List<BookDTO> ViewBookList(int startNum, int endNum){
    	List<BookDTO> bookList = new ArrayList<BookDTO>();
    	String sql ="select * from (select rownum rn, tt. *from" + 
    			" (select * from book order by code desc) tt)" + 
    			" where rn>=? and rn<=?";
    	try {
			conn =ds.getConnection();
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setInt(1, startNum);
		    pstmt.setInt(2, endNum);
		    rs = pstmt.executeQuery();
		    while(rs.next()) {
		    	BookDTO bookDTO = new BookDTO();
		    	bookDTO.setCode(rs.getString("code"));
		    	bookDTO.setTitle(rs.getString("title"));
		    	bookDTO.setAuthor(rs.getString("author"));
		    	bookDTO.setPublisher(rs.getString("publisher"));
		    	bookDTO.setPrice(rs.getInt("price"));
		    	bookList.add(bookDTO);
		    }
    	} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close();
		}
    	
    	return bookList;
    	
    }
    
    public int countBook() {
    	int sum = 0 ;
    	String sql = "select count(*) as count from book";
    	try {
			conn =ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs =pstmt.executeQuery();
			if(rs.next()) {
				sum = rs.getInt("count");
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close();
		}
    	return sum;
    }
}


