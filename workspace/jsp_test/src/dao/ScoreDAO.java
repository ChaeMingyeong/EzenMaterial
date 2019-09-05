package dao;

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

import bean.ScoreDTO;

public class ScoreDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	DataSource ds;
	
	public ScoreDAO() {
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
	
	public int ScoreWrite(ScoreDTO scoreDTO) {
		int su = 0;
		String sql ="insert into score values(?, ?, ?,?,?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, scoreDTO.getHak());
			pstmt.setString(2, scoreDTO.getName());
			pstmt.setInt(3, scoreDTO.getKor());
			pstmt.setInt(4, scoreDTO.getEng());
			pstmt.setInt(5, scoreDTO.getMat());
			pstmt.setInt(6, scoreDTO.getTot());
			pstmt.setDouble(7, scoreDTO.getAvg());
			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close();
		}
		
		return su;
	}
	
	public List<ScoreDTO> viewList(int startnum, int endnum){   //인자값은 목록임 
		List<ScoreDTO> scoreList = new ArrayList<ScoreDTO>();
		String sql = "select * from (select rownum rn, pp. *from (select * from score order by hak asc) pp) where rn>=? and rn<=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startnum);
			pstmt.setInt(2, endnum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ScoreDTO scoreDTO = new ScoreDTO();
				scoreDTO.setHak(rs.getInt("hak"));
				scoreDTO.setName(rs.getString("name"));
				scoreDTO.setKor(rs.getInt("kor"));
				scoreDTO.setEng(rs.getInt("eng"));
				scoreDTO.setMat(rs.getInt("mat"));
				scoreDTO.setTot(rs.getInt("tot"));
				scoreDTO.setAvg(rs.getDouble("avg"));
				scoreList.add(scoreDTO);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close();
		}
		
		
		return scoreList;
		
	}
	
	public int getTotalStu() {
		int totalStudent = 0;
		String sql = "select count(*) as count from score";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalStudent = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return totalStudent;
	}
	
}
