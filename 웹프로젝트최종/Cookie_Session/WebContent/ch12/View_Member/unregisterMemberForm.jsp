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
		response.sendRedirect("login_logout/View_Member.jsp"); //세션정보 없다면 로그인 화면으로 넘어갑니다.
	}	
%>

<form method="post" action="/Cookie_Session/ch12/View_Member/unregisterMemberPro.jsp">
	비밀번호를 한번 더 입력해주십시요 <input type="password" name="passwd"><br>
	<input type="hidden" value=<%=article.getNum() %> name="num"> 
	<input type="submit" value="확인">
	<input type="button" value="돌아가기" onClick = "location.href='/Cookie_Session/ch12/View_Member/View_Member.jsp'">
</form>

</body>
