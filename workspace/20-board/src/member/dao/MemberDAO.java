package member.dao;
/* JDBC  작업단계 
 * 1. Driver Loading
 * 2. Connection
 * 3. SQL 작업처리
 * 4. 반환값 처리
 * 5. 접속 종료
 * */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import member.bean.MemberDTO;

public class MemberDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String username = "jspexam";
	String password = "m1234";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// 1. Driver Loading
	public MemberDAO() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	// 2. Connection
	public Connection getConnection() {
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	// 5. 접속 종료
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

	/*
	 * 3. SQL 작업처리 4. 반환값 처리
	 */
	// 데이터 저장
	public int write(MemberDTO memberDTO) {
		int su = 0;
		String sql = "insert into member values (?,?,?,?,?,?,?,?,?,?,sysdate)";
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getName());
			pstmt.setString(2, memberDTO.getId());
			pstmt.setString(3, memberDTO.getPwd());
			pstmt.setString(4, memberDTO.getGender());
			pstmt.setString(5, memberDTO.getEmail1());
			pstmt.setString(6, memberDTO.getEmail2());
			pstmt.setString(7, memberDTO.getTel1());
			pstmt.setString(8, memberDTO.getTel2());
			pstmt.setString(9, memberDTO.getTel3());
			pstmt.setString(10, memberDTO.getAddr());
			su = pstmt.executeUpdate(); // 요청 + 응답처리
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return su;
	}

	// 로그인 검사
	public String login(String id, String pwd) {
		String name = null;
		String sql = "select * from member where id = ? and pwd=?";
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery(); // 서버에 sql 처리 요청, 처리결과를 ResultSet에 저장하고 리턴함
			if (rs.next()) { // ResultSet에 저장된 데이터 꺼내기, 성공했으면 true, 실패하면 false
				name = rs.getString("name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return name;
	}

	// ID 데이터 검색 : 존재 확인
	public boolean isExistId(String id) {
		boolean exist = false;
		String sql = "select * from member where id = ?";
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); // 요청 + 응답
			if (rs.next()) {
				exist = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return exist;
	}

	// ID 데이터 검색 : 1명 데이터
	public MemberDTO selectOne(String id) {
		MemberDTO memberDTO = null;
		String sql = "select * from member where id=?";
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				memberDTO = new MemberDTO();
				memberDTO.setName(rs.getString("name"));
				memberDTO.setId(rs.getString("id"));
				memberDTO.setPwd(rs.getString("pwd"));
				memberDTO.setGender(rs.getString("gender"));
				memberDTO.setEmail1(rs.getString("email1"));
				memberDTO.setEmail2(rs.getString("email2"));
				memberDTO.setTel1(rs.getString("tel1"));
				memberDTO.setTel2(rs.getString("tel2"));
				memberDTO.setTel3(rs.getString("tel3"));
				memberDTO.setAddr(rs.getString("addr"));
				memberDTO.setLogtime(rs.getString("logtime"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return memberDTO;
	}

	// 데이터 수정
	public int modify(MemberDTO memberDTO) {
		int su = 0;
		String sql = "update member set pwd=?, gender=?, email1=?, email2=?,"
				+ "tel1=?, tel2=?, tel3=?, addr=? where id=?";
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getPwd());
			pstmt.setString(2, memberDTO.getGender());
			pstmt.setString(3, memberDTO.getEmail1());
			pstmt.setString(4, memberDTO.getEmail2());
			pstmt.setString(5, memberDTO.getTel1());
			pstmt.setString(6, memberDTO.getTel2());
			pstmt.setString(7, memberDTO.getTel3());
			pstmt.setString(8, memberDTO.getAddr());
			pstmt.setString(9, memberDTO.getId());
			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return su;
	}

	// 데이터 삭제
	public int delete(String id) {
		int su = 0;
		String sql = "delete member where id=?";
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return su;
	}

	// 전체 회원 목록 검색
	public List<MemberDTO> selectList(int startNum, int endNum) {
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		String sql = " select * from" + " (select rownum rn, tt. * from "
				+ " (select * from member order by name asc) tt) " + " where rn>=? and rn<=?";
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberDTO memberDTO = new MemberDTO();
				memberDTO.setName(rs.getString("name"));
				memberDTO.setId(rs.getString("id"));
				memberDTO.setPwd(rs.getString("pwd"));
				memberDTO.setGender(rs.getString("gender"));
				memberDTO.setEmail1(rs.getString("email1"));
				memberDTO.setEmail2(rs.getString("email2"));
				memberDTO.setTel1(rs.getString("tel1"));
				memberDTO.setTel2(rs.getString("tel2"));
				memberDTO.setTel3(rs.getString("tel3"));
				memberDTO.setAddr(rs.getString("addr"));
				memberDTO.setLogtime(rs.getString("logtime"));

				list.add(memberDTO);
			}
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// 총회원수 구하기
	public int getTotalMember() {
		int totalMember = 0;
		String sql = "select count(*) as count from member";
		// board와는 달리 커넥션풀이 아닌 getConnection으로부터 얻어옴
	    conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs =pstmt.executeQuery();
			if(rs.next()) {
				totalMember = rs.getInt("count");
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close();
		}
		return totalMember;
	}

}
