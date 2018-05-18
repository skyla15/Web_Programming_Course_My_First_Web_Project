<%@ page contentType="text/html; Charset=EUC-KR" pageEncoding="EUC-KR" %> 
<%@ page import="java.sql.*" %>
<%@ page import = "java.util.*" %>

<%@ page import = "question2.BoardDataBean" %>
<%@ page import = "question2.BoardDBBean" %>

<% request.setCharacterEncoding("EUC-KR"); %>


<!--  모델1, 자바코드 등이 들어가있어 보기가 불편하고 관리하기가 힘들다. -->

<%
	List<BoardDataBean> articleList = null;
	BoardDBBean dbPro = BoardDBBean.getInstance();
	int count = dbPro.getArticleCount(); // 생성된 데이터의 row갯수
	
	if(count>0){ //생성된 데이터가 있으면 article List에 삽입
	articleList = dbPro.getArticles(count); 
	}
%>

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
	for ( int i = 0 ; i < articleList.size() ; i++){
		BoardDataBean article = articleList.get(i);
%>
      <tr>
         <td align="center"> <%=article.getId()%></td>
         <td align="left"> <%=article.getName() %></td>
         <td align="left"><a href=board-read.jsp?id=<%=article.getId()%> width="250"><%=article.getTitle()%></td>
         <td align="center"><%=article.getContent()%></td>
      </tr>      
<%
	}
%>      	
      	 
  </table>
  <center>
	<img src="image/green_tree.gif"> 
    	  	<a href="board-insert.jsp">게시글쓰기</a>
	</center>
  </body>
</html>