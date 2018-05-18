package ch12;

import java.sql.*;


public class LogonDBBean{
	private static LogonDBBean instance = new LogonDBBean();
	
	public static LogonDBBean getInstance() {
		return instance;
	} // LogonDBBean 객체화
	
	private LogonDBBean() {}

	//멤버 등록 
	public void insertMember(LogonDataBean member)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String jdbcurl = "jdbc:mysql://localhost:3306/jsptest";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcurl,"jspid", "jsppass");
			
			String sql = "insert into MEMBER values(?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getNickname() );
			pstmt.setString(3, member.getPasswd());
			pstmt.setString(4, member.getName());			
			pstmt.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null)try {pstmt.close();}catch(Exception e) {}
			if(conn != null) try {conn.close();}catch(Exception e) {}
		}
		
	}
	
	
	//id중복체크  
	public int checkId(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int is_valid = -1;
		
		try {
			String jdbcurl = "jdbc:mysql://localhost:3306/jsptest";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcurl,"jspid", "jsppass");
			
			
			String sql = "select * from MEMBER where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				is_valid = 1; // 중복아이디 존재 
			}else {
				is_valid = -1; // 중복아이디 없음 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
			if(rs!=null)try {pstmt.close();}catch(SQLException e) {}
		}
		return is_valid;
	}
	
	
	//닉네임 중복체크
	public int checkNickname(String nickname) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int is_valid = -1;
		
		try {
			String jdbcurl = "jdbc:mysql://localhost:3306/jsptest";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcurl,"jspid", "jsppass");
			
			String sql = "select * from MEMBER where nickname = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				is_valid = 1; // 중복닉네임  존재 
			}else {
				is_valid = 0; // 중복닉네임  없음 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
			if(rs!=null)try {pstmt.close();}catch(SQLException e) {}
		}
		return is_valid;
	}
	
	
	// 인증페이지 
	public int userCheck(String id, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		String dbpasswd = "";
		
		try {
			String jdbcurl = "jdbc:mysql://localhost:3306/jsptest";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcurl,"jspid", "jsppass");
			
			String sql = "select passwd from MEMBER where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbpasswd = rs.getString("passwd");
				if(dbpasswd.equals(passwd))
					x = 1; // 인증성공 
				else
					x = 0; // 비밀번호 잘못됨
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();}catch(Exception e) {}
			if(conn != null)try {conn.close();}catch(Exception e) {}
			if(pstmt != null)try {pstmt.close();}catch(Exception e) {}				
		}
		return x;
	}
	
	
	
	
	// 회원 탈퇴 
	public void unregisterMember(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String jdbcurl = "jdbc:mysql://localhost:3306/jsptest";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcurl,"jspid", "jsppass");
			String sql = "delete from MEMBER where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null)try {pstmt.close();}catch(Exception e) {}
			if(pstmt!=null)try {conn.close();}catch(Exception e) {}
		}
	}
	
	
	
	
	//회원정보 보기
	public LogonDataBean viewMember(String id) throws Exception {
		Connection conn = null;
		LogonDataBean member = new LogonDataBean();
		member = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		
		try {
			String jdbcurl = "jdbc:mysql://localhost:3306/jsptest";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcurl,"jspid", "jsppass");
			
			String sql = "select * from MEMBER where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
			member = new LogonDataBean();
			member.setId(rs.getString("id"));
			member.setName(rs.getString("name"));
			member.setNickname(rs.getString("nickname"));
			member.setPasswd(rs.getString("passwd"));
			}
						
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();} catch(SQLException e) {}
			if(conn !=null)try {conn.close();} catch(SQLException e) {}
			if(pstmt !=null)try {pstmt.close();} catch(SQLException e) {}
		}
		return member;
	}
	
	
	//회원정보수정 
	public int memberUpdate(LogonDataBean member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int x = -1;
		
		try {
			String jdbcurl = "jdbc:mysql://localhost:3306/jsptest";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcurl, "jspid", "jsppass");
			
			String sql = "update MEMBER set passwd = ?, nickname = ?, name = ? where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPasswd());
			pstmt.setString(2,  member.getNickname());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getId());
			pstmt.executeUpdate();
			
			x = 1; // 수정 성공 
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
		}		
		return x;
	}
	
	
}