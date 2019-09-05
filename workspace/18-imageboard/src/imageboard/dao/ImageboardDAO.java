package imageboard.dao;

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

import imageboard.bean.ImageboardDTO;

public class ImageboardDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	DataSource ds;

	// DataSource 얻어오기
	public ImageboardDAO() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (rs != null)
				pstmt.close();
			if (rs != null)
				conn.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	public int imgboardWrite(ImageboardDTO imageboardDTO) {
		int su = 0;
		String sql = "insert into imageboard values " + "(seq_imageboard.nextval, ?, ?, ?, ?, ?, ?, sysdate)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, imageboardDTO.getImagdId());
			pstmt.setString(2, imageboardDTO.getImageName());
			pstmt.setInt(3, imageboardDTO.getImagePrice());
			pstmt.setInt(4, imageboardDTO.getImageQty());
			pstmt.setString(5, imageboardDTO.getImageContent());
			pstmt.setString(6, imageboardDTO.getImage1());
			su = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close();
		}
		return su;
	}

	public List<ImageboardDTO> selectboard(int startNum, int endNum) {

		List<ImageboardDTO> imglist = new ArrayList<ImageboardDTO>();
		String sql = "select * from" + " (select rownum rn, tt. *from"
				+ " (select * from IMAGEBOARD order by seq desc) tt)" + " where rn>=? and rn<=?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ImageboardDTO imageboardDTO = new ImageboardDTO();
				imageboardDTO.setSeq(rs.getInt("seq"));
				imageboardDTO.setImagdId(rs.getString("imagdId"));
				imageboardDTO.setImageName(rs.getString("imageName"));
				imageboardDTO.setImagePrice(rs.getInt("imagePrice"));
				imageboardDTO.setImageQty(rs.getInt("imageQty"));
				imageboardDTO.setImageContent(rs.getString("imageContent"));
				imageboardDTO.setImage1(rs.getString("image1"));
				imageboardDTO.setLogtime(rs.getString("logtime"));
				imglist.add(imageboardDTO);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close();
		}

		return imglist;
	}

	// 전체데이터 개수 구하기
	public int selectcount() {
		int su = 0;
		String sql = "select  count(*) as count from imageboard";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				su = rs.getInt("count");
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close();
		}

		return su;

	}

	public ImageboardDTO selectboard(int seq) {
		ImageboardDTO imageboardDTO = new ImageboardDTO();
		String sql = "select * from imageboard where seq = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();
			while (rs.next()) {

				imageboardDTO.setImage1(rs.getString("image1"));
				imageboardDTO.setImageName(rs.getString("imageName"));
				imageboardDTO.setImagePrice(rs.getInt("imagePrice"));
				imageboardDTO.setImageQty(rs.getInt("imageQty"));
				imageboardDTO.setImageContent(rs.getString("imageContent"));

			}
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close();
		}

		return imageboardDTO;
	}

	public int deleteBoard(int seq) {
		int su = 0;
		String sql = "delete imageboard where seq = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			su = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close();
		}
		return su;
	}

	public int imageboardModify(ImageboardDTO imageboardDTO) {

		int chkModify = 0;
		String sql = null;
		if (imageboardDTO.getImage1() == null) {
			sql = "update imageboard set imagdId =?, imageName = ? imagePrice = ?, imageQty =?, imageContent = ? "
					+ "where seq = ?";
		} else {
			sql = "update imageboard set imagdId =?, imageName = ?, "
					+ " imagePrice = ?, imageQty =?, imageContent = ?, image1 = ? where seq = ?";
		}
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, imageboardDTO.getImagdId());
			pstmt.setString(2, imageboardDTO.getImageName());
			pstmt.setInt(3, imageboardDTO.getImagePrice());
			pstmt.setInt(4, imageboardDTO.getImageQty());
			pstmt.setString(5, imageboardDTO.getImageContent());

			if (imageboardDTO.getImage1() == null) {				
				pstmt.setInt(6, imageboardDTO.getSeq());
			} else {
				pstmt.setString(6, imageboardDTO.getImage1());
				pstmt.setInt(7, imageboardDTO.getSeq());
			}
			chkModify = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close();
		}

		return chkModify;
	}

}
