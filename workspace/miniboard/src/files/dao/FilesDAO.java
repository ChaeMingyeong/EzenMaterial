package files.dao;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import files.bean.FilesDTO;

public class FilesDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String username = "jspexam";
	String password = "m1234";

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public FilesDAO() {
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
	//Community 테이블의 마지막 저장된 seq 값 얻어오기
	public int getCommunityFirstSeq() {
	    String sql ="select seq from"
	    		  + " (select rownum rn, tt.* from"
	    		  + " (select * from community order by seq desc) tt)" 
	    		  + " where rn=1";	
	    int seq =0;
	    conn= getConnection();
	    try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				seq = rs.getInt("seq");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
	    return seq;
	}
	
	public int filesWrite(FilesDTO filesDTO) {
		int result = 0;
		String sql = "insert into files"
				   + " values (seq_files.nextval, ?, ?, ?, ?, ?, ?, sysdate)";
		conn =getConnection();
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, filesDTO.getCommunity_seq());
			pstmt.setString(2, filesDTO.getDir());
			pstmt.setString(3, filesDTO.getFilename());
			pstmt.setString(4, filesDTO.getOrginname());
			pstmt.setInt(5, filesDTO.getFilesize());
			pstmt.setString(6, filesDTO.getFiletype());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	
	//파일(사진데이터)이 있는지 검사
		public String checkFiles(int community_seq) {
			String filename = null;
			String sql ="select * from files where community_seq =?";
			conn = getConnection();
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, community_seq);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					filename = rs.getString("filename"); //저장된파일이름
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return filename;
		}
	
	//파일삭제
		public int filesDelete(int community_seq, String filePath) {
			int result =0;
			String sql ="delete from files where community_seq =?";
			File file = new File(filePath);
			//파일삭제 
			file.delete();
			conn =getConnection();
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, community_seq);
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}finally {
				close();
			}
			return result;
		}
}
