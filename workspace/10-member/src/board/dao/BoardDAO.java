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

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	DataSource ds;

	public BoardDAO() {
		
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
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
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
		} finally {
			close();
		}

		return su;
	}

	public List<BoardDTO> viewBoard(int startNum, int endNum) {
		BoardDTO boardDTO = null;
		List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
		String sql = "select * from	(select rownum rn, tt.* from (select *FROM board order by seq desc) tt) where rn>=? and rn<=?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
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
		}finally {
			close();
		}

		return boardlist;
	}

	
	public BoardDTO boardView(int seq) {
		BoardDTO boardDTO = null;
		String sql = "select * from board where seq = ?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();
			if (rs.next()) {
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
		} finally {
			close();
		}
		return boardDTO;
	}

	public int totalCnt() {
		int su = 0;
		String sql = "select COUNT(*) as count from board";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				su = rs.getInt("count");
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close();
		}

		return su;
	}

	public void updatehit(int seq) {
		
	  String sql = "update board set hit = hit+1 where seq = ?";
	   try {
		conn = ds.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, seq);
		pstmt.executeUpdate();
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
		
	}
	
	public int deleteboard(int seq) {
		int su = 0;
		String sql ="delete board where seq=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return su;
	}
	
	
	
}
