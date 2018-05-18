<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "ch12.LogonDBBean" %>
<%@ page import = "ch12.LogonDataBean" %>
<% request.setCharacterEncoding("UTF-8"); %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보수정페이지</title>
</head>
<body>

<% 
	String id = (String)session.getAttribute("id");
	try{
		LogonDBBean dbPro = LogonDBBean.getInstance();
		LogonDataBean member = new LogonDataBean();
		member = dbPro.viewMember(id); // LogonDataBean에 현재 아이디의 정보를 세팅합니다.
%>

<form method="post" action="Modify_Member_Pro.jsp">
		<input type = "hidden" name="id" value="<%=member.getId()%>"/>
	<table>
		<tr height="30">
			<td width="130"> 이름 :</td>
			<td><input type="text" name="name" value="<%=member.getName()%>"></td>
		</tr>
		<tr height="30">
			<td width="130"> 비밀번호 :</td>
			<td><input type="password" name="passwd" value="<%=member.getPasswd()%>"></td>
		</tr>
		<tr>
			<td width="130"> 닉네임 :</td> 
			<td><input type="text" name="nickname" value="<%=member.getNickname()%>"></td>
		</tr>

	</table>
	<input type = "submit" value = "확인">
	<input type ="button" value = "취소" onCLick ="location.href='/Cookie_Session/ch12/View_Member/View_Member.jsp'">
</form>

<%
	}catch(Exception e){	}
%>

</body>
</html>