<%@ page contentType="text/html; Charset=EUC-KR" pageEncoding="EUC-KR" %> 
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>

<html>
  <head><title> 게시판 </title></head>
  <body>
     <center><h2> 게시글 목록 보기 </h2></center>
    
     <table border="1" align="center" width="603">
      <tr>
	  <td align="center" bgcolor="silver" width="100"> 글번호 </td>
	  <td align="center" bgcolor="silver" width="150"> 글쓴이 </td>
	  <td align="center" bgcolor="silver" width="275"> 글제목 </td>
	  <td align="center" bgcolor="silver" width="200"> 전자우편 </td>
      </tr>

<%		
		request.setCharacterEncoding("UTF-8");
      	Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = null;
        ResultSet rs = null;

	try {		//db커넥션을 연결해줍니다.
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcurl = "jdbc:mysql://localhost:3306/jsptest";
		conn = DriverManager.getConnection(jdbcurl, "jspid", "jsppass");
              	
		//리스트에 보여질 데이터 행을 선택하는 쿼리입니다.
		sql = "select * from board_tbl";
		pstmt = conn.prepareStatement(sql);
     	rs=pstmt.executeQuery();
     	//쿼리를 실행합니다.
		
  	 while(rs.next())
  		 //만약 데이터가 있다면 커서를 내리면 데이터들을 읽어오고 화면에 표시합니다.
	 {	
  		 int id = rs.getInt("id");
  		 String name = rs.getString("name");
  		 String e_mail = rs.getString("e_mail");
  		 String title = rs.getString("title");
  		 String content = rs.getString("content");
%>

      <tr>
         <td align="center"> <%=id%></td>
         <td align="left"> <%=name %></td>
         <td align="left"><a href=board-read.jsp?id=<%=id%> width="250"/><%=title%></td>
         <!-- 게시글을 클릭할 경우 상세보기 기능을 넣어줍니다. --> -->
         <td align="center"><%=content%></td>
      </tr>
<% }
	}catch(Exception e){
	e.printStackTrace();
	}finally{
		if(rs!=null)try{rs.close();}catch(SQLException sqle){}
		if(rs!=null)try{rs.close();}catch(SQLException sqle){}
		if(rs!=null)try{rs.close();}catch(SQLException sqle){}
		//자원해제시킵니다.
	}
%>
	
      	
      	 
  </table>
  <center>
	<img src="image/green_tree.gif"> 
    	  	<a href="board-insert.jsp">게시글쓰기</a>
	</center>
  </body>
</html>