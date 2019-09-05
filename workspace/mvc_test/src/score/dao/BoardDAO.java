package score.dao;

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

import scorebean.BoardBean;

public class BoardDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	DataSource ds;

	public BoardDAO() {

		try {

			Context context = new InitialContext();

			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
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
	
	public int insertBoard(BoardBean bean) {
		int su = 0;
		String sql = "insert into score2 values(?, ?, ?, ?, ?, ?, 0, 0)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bean.getHak());
            pstmt.setString(2, bean.getName());
            pstmt.setInt(3, bean.getKor());
            pstmt.setInt(4, bean.getEng());
            pstmt.setInt(5, bean.getMat());
            pstmt.setInt(6, bean.getHis());
            //pstmt.setInt(7, bean.getKor() + bean.getEng() + bean.getTot());
            //pstmt.setDouble(8, (double)bean.getTot()/3);
			su = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close();
		}

		return su;
	} 
	
	

	public List<BoardBean> boardList(int startNum, int endNum) {
		List<BoardBean> list = new ArrayList<BoardBean>();
		String sql =   "select * from"   
				     + " (select rownum rn, tt. *from"        
				     + "	(select * from score2 order by hak asc) tt)"
					 + "	where rn>=? and rn<=?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setHak(rs.getInt("hak"));
				bean.setName(rs.getString("name"));
				bean.setKor(rs.getInt("kor"));
				bean.setEng(rs.getInt("eng"));
				bean.setMat(rs.getInt("mat"));
				bean.setTot(rs.getInt("tot"));
				bean.setAvg(rs.getDouble("avg"));
				
				list.add(bean);
			}
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public int selectListCount() {
		int listcount = 0;
		String sql = "select count(*) from score2";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				listcount = rs.getInt(1); // 첫번째 데이터를 얻어옴
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close();
		}
		return listcount;
	}
	
	
}
