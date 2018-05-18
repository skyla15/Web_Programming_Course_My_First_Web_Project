<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "ch12.LogonDBBean" %>
<%@ page import = "ch12.LogonDataBean" %>>
<% request.setCharacterEncoding("UTF-8"); %>



<%
	String id = request.getParameter("id");
	String nickname = request.getParameter("nickname");
	LogonDBBean dbPro = LogonDBBean.getInstance();
	
%>

<jsp:useBean id="member" class="ch12.LogonDataBean">
	<jsp:setProperty name="member" property ="*"/>
</jsp:useBean>

<%
 	if(dbPro.checkNickname(nickname) == 1){
%>

<script>
	alert("the nickname already exists");
	history.go(-1);
</script>

<%
 	}else if(dbPro.checkNickname(nickname) == 0){
 		int check = dbPro.memberUpdate(member);
 		if(check == -1){
%>
<script>
	alert("처리 중 오류 발생");
	history.go(-1);
</script>
<% 			
 		}else{
%>
<script>
	location.href="/Cookie_Session/ch12/View_Member/View_Member.jsp";
</script> 

<% 			
 		}
 	} 		
%>
