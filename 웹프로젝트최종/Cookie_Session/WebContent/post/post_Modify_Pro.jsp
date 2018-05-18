<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "post.PostDBBean" %>
<%@ page import = "post.PostDataBean" %>
<% request.setCharacterEncoding("UTF-8"); %>


<!-- 수정하려고 있던 값들을 빈즈를 이용하여 세팅합니다.  -->
<jsp:useBean id="article" class="post.PostDataBean"/>
	<jsp:setProperty name = "article" property="*"/>


<%

		PostDBBean dbPro = PostDBBean.getInstance();
		int check = dbPro.modifyPost(article);
		if(check !=1 ){
%>
	<script>
		alert("에러가 발생했습니다 ");
		history.go(-1)
	</script>
<%
		}else{
%>
	<script>
		location.href="/Cookie_Session/post/post_List.jsp";
	</script>
<%
		}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>