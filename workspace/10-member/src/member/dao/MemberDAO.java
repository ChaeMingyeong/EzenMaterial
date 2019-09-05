package member.dao;
/* JDBC 작업단계
 *  1. Driver Loading 
 *  2. Connection
 *  3. SQL 작업처리
 *  4. 반환값 처리
 *  5. 접속 종료
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
       String driver ="oracle.jdbc.driver.OracleDriver";
       String url ="jdbc:oracle:thin:@localhost:1521:xe";
       String username ="jspexam";
       String password ="m1234";
       
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       
       /** 1. Driver Loading*/
       public MemberDAO() { 
		 try {
			Class.forName(driver); //driver 란 클래스를 만들고 없앰 
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}  
	}
       /** 2. Connection*/
       public Connection getConnection() {
    	   try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	   return conn;
       }
       /** 5. 접속종료*/
       public void close() {
    	  try {
    		  if(rs!=null) rs.close();
    		  if(pstmt!=null)pstmt.close();
    		  if(conn!=null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
       }
       
       /** 3. SQL 작업처리*
        *  4. 반환값 처리 */
       
       //데이터 저장
       public int write(MemberDTO memberDTO) {  
    	   int su = 0;
    	   String sql ="insert into member values(?,?,?,?,?,?,?,?,?,?,sysdate)";
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
			su = pstmt.executeUpdate(); //요청 + 응답처리
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close();
		}
    	   return su;
       }
       // 로그인 검사
       public String login(String id, String pwd) {
    	   String name = null;
    	   String sql = "select * from member where id = ? and pwd = ?";
    	   conn = getConnection();
    	   try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if(rs.next()) { //ResultSet에 저장된 데이터 꺼내기 , 성공했으면 true, 실패하면 false
				name = rs.getString("name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
    	   return name;
       }
       
       
       //ID 데이터 검색  : 존재 확인
       public boolean isExistId(String id) {
    	   boolean exist = false;
    	   String sql = "select * from member where id = ?";
    	   conn = getConnection();
    	   try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); //요청 + 응답
			if(rs.next()) {
				exist = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
    	   
    	   return exist;
       }
      
      
       //ID 데이터 검색  : 1명의 데이터 
       public MemberDTO selectOne(String id){
    	   MemberDTO memberDTO = null;
    	   conn = getConnection();
    	  String sql = "select * from member where id = ?";
    	  conn = getConnection();
    	  try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberDTO = new MemberDTO(); //읽을 데이터가 있을 때부터 DTO생성해서 데이터저장
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
		}finally {
			close();
		}
    		return memberDTO;
       }
 
       
       //데이터 수정
       public int modify(MemberDTO memberDTO) {
    	   //memberDTO = selectOne(id);
    	   int su = 0;
    	   String sql = "update member set pwd = ?, gender = ?, email1= ?, email2= ?, "
    			   +"tel1= ? , tel2= ? ,tel3= ?, addr=  ? "
    			   +" where id =?";
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
		}   
    	   return su;
       }

       public int delete(String id) {
    	   int su = 0;
    	   String sql ="delete member where id = ?";
    	   conn = getConnection();
    	   try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
    	      
    	   return su;
       }
       
       public List<MemberDTO> selectList(){
    	   List<MemberDTO> list = new ArrayList<MemberDTO>();
    	   MemberDTO memberDTO = null;
    	   String sql = "select * from member order by name";
    	   conn = getConnection();
    	   try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				memberDTO = new MemberDTO();
				memberDTO.setName(rs.getString("name"));
				memberDTO.setId(rs.getString("id"));
				memberDTO.setGender(rs.getString("gender"));
				memberDTO.setEmail1(rs.getString("email1"));
				memberDTO.setEmail2(rs.getString("email2"));
				memberDTO.setTel1(rs.getString("tel1"));
				memberDTO.setTel2(rs.getString("tel2"));
				memberDTO.setTel3(rs.getString("tel3"));
				list.add(memberDTO);	
			}
			
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}finally {
			close();
		}
    	  return list; 
       }
       
    
       //id 일치 데이터 검색 
       
}

