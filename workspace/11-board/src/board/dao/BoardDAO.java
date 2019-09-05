package board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import board.bean.BoardDTO;
import member.bean.MemberDTO;

public class BoardDAO {
	
    Connection conn =null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    //커넥션풀 담당 클래스
    DataSource ds;
    
    public BoardDAO() {
		// DataSource 초기화
    	try {
    		//javax.naming.Context;
			Context context = new InitialContext();
			//Tomcat인 경우, <Resource>를 읽어올 때, 
			//"java:comp/env/"를 붙여야 한다.
			//context.xml의 Context =>  Resource = > name 까지를 나타낸다. 
			//lookup메소드는 "java:comp/env/jdbc.oracle" 이름을 가지고 
			//DataSource 객체를 얻어온다. 
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle"); 
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
    
    
    public void close() { //없애는게아닌돌려주는것
    	try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
    }
    
    
	public int writeBoard(BoardDTO boardDTO) {
		int su = 0;
		
		String sql = "insert into board values (seq_board.nextval,?,?,?,?,0,sysdate)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardDTO.getId());
			pstmt.setString(2, boardDTO.getName());
			pstmt.setString(3, boardDTO.getSubject());
			pstmt.setString(4, boardDTO.getContent());
			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close();
		}
		
		
		return su;
	}
	
	public List<BoardDTO> viewBoard(){
		BoardDTO boardDTO = null;
		List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
		String sql = "select seq, subject, name, logtime, hit from board order by  seq desc";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
			  boardDTO = new BoardDTO();
			  boardDTO.setSeq(rs.getInt("seq"));
			  boardDTO.setSubject(rs.getString("subject"));
			  boardDTO.setName(rs.getString("name"));
			  boardDTO.setLogtime(rs.getString("logtime"));
			  boardDTO.setHit(rs.getInt("hit"));
			  boardlist.add(boardDTO);
			}
		} catch (SQLException e) {
			boardlist = null;
			e.printStackTrace();
		}
		
		
		return boardlist;
	}
	
	//1줄검색
	public BoardDTO boardView(int seq) {
		BoardDTO boardDTO = null;
		String sql = "select * from board where seq = ?";
		
		try {
			conn =ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				boardDTO = new BoardDTO();
				boardDTO.setSeq(rs.getInt("Seq"));
				boardDTO.setId(rs.getString("id"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setHit(rs.getInt("hit"));
				boardDTO.setLogtime(rs.getString("logtime"));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close();
		}
		return boardDTO;
	}
	
	
	
}
