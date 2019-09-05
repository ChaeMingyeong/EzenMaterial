package score.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import score.bean.ScoreDTO;

public class ScoreDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String username = "jspexam";
	String password = "m1234";

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public ScoreDAO() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() {

		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return conn;
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

	public int scoreWrite(ScoreDTO scoreDTO) {
		int result = 0;
		String sql = "insert into score values (?, ?, ?, ?, ?, ?, ?, sysdate)";
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, scoreDTO.getStudNo());
			pstmt.setString(2, scoreDTO.getName());
			pstmt.setInt(3, scoreDTO.getKor());
			pstmt.setInt(4, scoreDTO.getEng());
			pstmt.setInt(5, scoreDTO.getMat());
			pstmt.setInt(6, scoreDTO.getTot());
			pstmt.setDouble(7, scoreDTO.getAvg());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	public int scoreDelete(int studNo) {
		int result = 0;
		String sql = "delete score where studNo =?";
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, studNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	// 전체검색
	public List<ScoreDTO> scoreList() {
		List<ScoreDTO> list = new ArrayList<ScoreDTO>();
		String sql = "select * from score order by studNo";
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);		
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ScoreDTO scoreDTO = new ScoreDTO();
				scoreDTO.setStudNo(rs.getString("studNo"));
				scoreDTO.setName(rs.getString("name"));
				scoreDTO.setKor(rs.getInt("kor"));
				scoreDTO.setEng(rs.getInt("eng"));
				scoreDTO.setMat(rs.getInt("mat"));
				scoreDTO.setTot(rs.getInt("tot"));
				scoreDTO.setAvg(rs.getDouble("avg"));
				scoreDTO.setLogtime(rs.getString("logtime"));
				list.add(scoreDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public int getTotalA() {
		int totalA = 0;
		String sql = "select count(*) as count from score";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalA = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return totalA;
	}
}
