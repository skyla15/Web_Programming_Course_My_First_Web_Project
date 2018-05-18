<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "ch12.LogonDBBean" %>
<%@ page import = "ch12.LogonDataBean" %>


<% 
	request.setCharacterEncoding("utf-8"); 
	String id = request.getParameter("id");
	String nickname = request.getParameter("nickname");
%>

<jsp:useBean id="member" class="ch12.LogonDataBean">
	<jsp:setProperty name="member" property="*"/>
</jsp:useBean> 

<%
	LogonDBBean dbPro = LogonDBBean.getInstance();
	if(dbPro.checkId(id) == 1){
%>

<script>
	alert("이미 등록된 아이디입니다.")
	history.go(-1);
</script>

<%
	}
	else if(dbPro.checkNickname(nickname) == 1){
%>

<script>
	alert("이미 등록된 닉네임입니다.");
	history.go(-1);
</script>
	
<%	
	}else{	
	dbPro.insertMember(member);
%>
<!-- <jsp:getProperty name="member" property="id"/> -->
 
<script>
	alert("가입이 완료되었습니다.");
	location.href="/Cookie_Session/ch12/sessionMain.jsp";
</script>
<%
	}
%>


