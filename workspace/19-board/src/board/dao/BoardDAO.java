package board.dao;

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

import com.sun.xml.internal.messaging.saaj.packaging.mime.util.BEncoderStream;

import board.bean.BoardBean;

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
		String sql = "INSERT INTO BOARD2 VALUES(seq_num.nextval,?, ?, ?, ?, ?, seq_num.currval, 0, 0, 0, sysdate)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getBoard_name());
			pstmt.setString(2, bean.getBoard_pass());
			pstmt.setString(3, bean.getBoard_subject());
			pstmt.setString(4, bean.getBoard_content());
			pstmt.setString(5, bean.getBoard_file());

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
		String sql = "select * from " + "(select rownum rn, tt.* from "
				+ "(select *from board2 order by board_re_ref desc, board_re_seq asc)tt)" + " where   rn>=? and rn<=?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setBoard_num(rs.getInt("board_num"));
				bean.setBoard_subject(rs.getString("board_subject"));
				bean.setBoard_name(rs.getString("board_name"));
				bean.setBoard_readcount(rs.getInt("board_readcount"));
				bean.setBoard_content(rs.getString("board_content"));
				bean.setBoard_pass(rs.getString("board_pass"));
				bean.setBoard_file(rs.getString("board_file"));
				bean.setBoard_re_ref(rs.getInt("board_re_ref"));
				bean.setBoard_re_lev(rs.getInt("board_re_lev"));
				bean.setBoard_re_seq(rs.getInt("board_re_seq"));
				bean.setBoard_date(rs.getString("board_date"));
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
		String sql = "select count(*) from board2";
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

	public BoardBean viewBoard(int num) {
		BoardBean bean = new BoardBean();
		String sql = "select * from board2 where board_num = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				bean.setBoard_num(rs.getInt("board_num"));
				bean.setBoard_pass(rs.getString("board_pass"));
				bean.setBoard_subject(rs.getString("board_subject"));
				bean.setBoard_name(rs.getString("board_name"));
				bean.setBoard_date(rs.getString("board_date"));
				bean.setBoard_readcount(rs.getInt("board_readcount"));
				bean.setBoard_file(rs.getString("board_file"));
				bean.setBoard_content(rs.getString("board_content"));
				bean.setBoard_re_lev(rs.getInt("board_re_lev"));
				bean.setBoard_re_ref(rs.getInt("board_re_ref"));
				bean.setBoard_re_seq(rs.getInt("board_re_seq"));
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close();
		}
		return bean;
	}

	// 조회수 증가
	public int updateReadCount(int num) {
		int su = 0;
		String sql = "update board2 set board_readcount= board_readcount +1 where board_num=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return su;
	}

	// 삭제함수
	public int boardDelete(int num) {
		int su = 0;
		String sql = "delete board2 where board_num =?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return su;
	}

	// 글쓴 사람이 누군지 확인하는 함수
	public boolean chkPass(int num, String board_pass) {
		BoardBean bean = new BoardBean();
		boolean chkPass = false;
		String sql = "select * from board2 where board_num = ? and board_pass = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, board_pass);
			rs = pstmt.executeQuery();
			if (rs.next()) {
//					if(rs.getString("board_pass").equals(board_pass)) {
//						chkPass = true;
//					}
				chkPass = true;

			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close();
		}

		return chkPass;
	}

	public int chkPass2(int num, String board_pass) {
		BoardBean bean = new BoardBean();
		int chkPass = 0;
		String sql = "select count(*) from board2 where board_num = ? and board_pass = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, board_pass);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				chkPass = rs.getInt(1);
				bean.setBoard_pass(rs.getString("board_pass"));
				if (board_pass == rs.getString("board_pass")) {

				}

			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close();
		}

		return chkPass;
	}

	public int modiBoard(BoardBean bean) {
		int chkModi = 0;
		String sql = "";

		if (bean.getBoard_file() == null) {
			sql = "update board2 set board_name =?, board_pass=?, "
					+ " board_subject =?, board_content  = ? where board_num =? ";
		} else {
			sql = "update board2 set board_name = ?, board_pass= ?, "
					+ " board_subject =?, board_content  = ?, board_file = ? where board_num = ?";
		}

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getBoard_name());
			pstmt.setString(2, bean.getBoard_pass());
			pstmt.setString(3, bean.getBoard_subject());
			pstmt.setString(4, bean.getBoard_content());
			if (bean.getBoard_file() == null) {
				pstmt.setInt(5, bean.getBoard_num());
			} else {
				pstmt.setString(5, bean.getBoard_file());
				pstmt.setInt(6, bean.getBoard_num());
			}
			chkModi = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close();
		}

		return chkModi;
	}

	// 답글 저장
	public int insertReplyArticle(BoardBean boardBean) {

		int insertCount = 0;
		String sql = "update board2 set board_re_seq = board_re_seq + 1 "
				+ " where board_re_ref = ? and board_re_seq >?";
		String sql2 = "insert into board2 values (seq_num.nextval,?,?,?,?,?, ?, ?, ?, 0,sysdate)";

		// 원글에 대한 값
		int re_ref = boardBean.getBoard_re_ref();
		int re_lev = boardBean.getBoard_re_lev();
		int re_seq = boardBean.getBoard_re_seq();

		try {
			conn = ds.getConnection();
			// 기존 답글의 등록순서를 재정리
			// => 원글 re_seq보다 큰 답글 re_seq를 1씩 증가
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, re_ref);
			pstmt.setInt(2, re_seq);
			pstmt.executeUpdate();
			// 답글 저장
			// 추가된 답글의 re_seq는 원글 re_seq 에 1증가한 값을 가진다
			// 또한, 추가된 답글의 re_lev는 원글 re_lev에 1증가한 값을 가진다.
			pstmt = conn.prepareStatement(sql2);
			re_seq = re_seq + 1;
			re_lev = re_lev + 1;
			pstmt.setString(1, boardBean.getBoard_name());
			pstmt.setString(2, boardBean.getBoard_pass());
			pstmt.setString(3, boardBean.getBoard_subject());
			pstmt.setString(4, boardBean.getBoard_content());
			pstmt.setString(5, "  "); // 답글에는 파일을 업로드하지 x
			pstmt.setInt(6, re_ref);
			pstmt.setInt(7, re_lev);
			pstmt.setInt(8, re_seq);
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close();
		}

		return insertCount;
	}

}
