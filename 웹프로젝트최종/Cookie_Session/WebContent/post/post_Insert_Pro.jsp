<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "post.PostDBBean" %>
<%@ page import = "post.PostDataBean" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="article" class="post.PostDataBean"/>
	<jsp:setProperty name="article" property="*"/>
	
<%
	String content = article.getContent();
	String title = article.getTitle();
	String category = article.getCategory();
	PostDBBean dbPro = PostDBBean.getInstance();
	int check = dbPro.insertPost(article);
	
	if(check == 1){
%>
<script>
		location.href="/Cookie_Session/post/post_List.jsp";
</script>

<%
	}else{
%>
<script>
	alert("처리 중 에러가 발생하였습니다.");
	history.go(-1);
</script>
<%
	}
%>
	
