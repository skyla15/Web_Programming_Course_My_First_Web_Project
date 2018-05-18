<%@ page contentType="text/html; Charset=EUC-KR" pageEncoding="EUC-KR" %> 
<%@ page import="java.sql.*" %>
<%@ page import = "question2.BoardDBBean" %>
<% request.setCharacterEncoding("EUC-KR"); %>

<jsp:useBean id="article" scope="page" class="question2.BoardDataBean">
	<jsp:setProperty name = "article" property = "*"/>
</jsp:useBean>


<%
	// 1번 문제에서 하였던 로직을 빈에서 구현하고 빈을 객체화 시켜서 안에있는 메소드들을 사용합니다.
	BoardDBBean dbPro = BoardDBBean.getInstance();
	// 데이터빈을 insert해줍니다
	dbPro.insertArticle(article);
%>
		<jsp:forward page="board-insert-success.jsp"></jsp:forward>

