<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="post.PostDBBean" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:include page="/ch12/sessionMain.jsp"></jsp:include>

<jsp:useBean id="article" class="post.PostDataBean"/>
	<jsp:setProperty name="article" property="*"/>
<head></head>


<% 
	if(session.getAttribute("id")==null){
		response.sendRedirect("login_logout/sessionLoginForm.jsp"); //세션정보 없다면 로그인 화면으로 넘어갑니다.
	}	
%>

<form method="post" action="/Cookie_Session/post/post_Delete_Pro.jsp">
	비밀번호를 한번 더 입력해주십시요 <input type="password" name="passwd"><br>
	<input type="hidden" value=<%=article.getNum() %> name="num"> 
	<input type="submit" value="확인">
</form>

</body>
