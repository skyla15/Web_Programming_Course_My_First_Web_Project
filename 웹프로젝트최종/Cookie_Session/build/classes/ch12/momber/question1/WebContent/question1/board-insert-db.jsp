<%@ page contentType="text/html; Charset=EUC-KR" pageEncoding="EUC-KR" %> 
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>

<%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("UTF-8");%>


<%
    // request객체에서 다음 파라미터들을 가져옵니다.
	String name= request.getParameter("name");
	String e_mail = request.getParameter("e_mail");
	String title = request.getParameter("title");
	String content = request.getParameter("content");




	//db연동
	Connection conn = null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	// 게시판의 id처리, 답글기능은 없으므로 ref는 사용안
	String str="";
	
	try {
		//Connection 객체 얻는부분, forName을 통해 drivermanager를 연동시킴.
			String jdbcurl = "jdbc:mysql://localhost:3306/jsptest";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcurl, "jspid", "jsppass");
        		// 실행할 query문      
			// id, name, e_mail, title, content, passwd, ref
			
			String sql = "insert into board_tbl(name,e_mail,title,content) values(?,?,?,?)";
			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1,name);
			pstmt.setString(2,e_mail);
			pstmt.setString(3,title);
			pstmt.setString(4,content);
			pstmt.executeUpdate(); //쿼리 실행!
			//쿼리 실행 후 db에 입력한 다음 board-insert-success.jsp로 포워딩합니다.
%>
		<jsp:forward page="board-insert-success.jsp"></jsp:forward>
<%

	}catch(Exception e){
		e.printStackTrace();
	}finally{
		// 사용된 쿼리, 서버 커넥션 연결 해제
		if(pstmt !=null) try{pstmt.close();} catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}    
	}
	
%>