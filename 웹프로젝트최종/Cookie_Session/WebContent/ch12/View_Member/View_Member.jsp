<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ch12.LogonDataBean" %>
<%@ page import = "ch12.LogonDBBean" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:include page="/ch12/sessionMain.jsp"></jsp:include>
    
<%    
	request.setCharacterEncoding("UTF-8");
    //로그인 체크
    if(session.getAttribute("id")==null){
%>
	<jsp:forward page="/ch12/login_logout/sessionLoginForm.jsp" />
<%
    }	
%>

<input type="button" value="수정하기" onclick="location.href='Modify_Member_Form.jsp'">
<input type="button" value="탈퇴하기" onclick="location.href='unregisterMemberForm.jsp'">

<%
	LogonDataBean profile = new LogonDataBean();
	String logged_in_id = (String)session.getAttribute("id");
	try{
		LogonDBBean dbPro = LogonDBBean.getInstance(); //LogonDBBean을 사용할 수 있도록 객체를 가져옴
		profile = (LogonDataBean)dbPro.viewMember(logged_in_id); //현재 세션에 저장된 id에 대한 정보를 db처리빈에서 databean에 저장합니다.\
		String id = profile.getId();
		String name = profile.getName();
		String nickname = profile.getNickname();
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로필 보기</title>
</head>
<body>

<table>
	<tr height="20">
		<td><h4>회원정보<h4></td>
	</tr>
	<tr height="20">
		<td width="300"> ID : <%=profile.getId() %></td>
	</tr>
	<br>
	<tr height="20">	
		<!-- <td align="center" width="125"> Passwd : <%=profile.getPasswd() %></td> 패스워드 숨깁니다.  -->
		<td width="300"> 이름 : <%=profile.getName() %></td>
	</tr>
	<br>
	<tr height="20">	
		<td width="300"> 닉네임 : <%=profile.getNickname() %></td>
	</tr>
</table>
<%
	}catch(Exception e)
	{
		e.printStackTrace();
	}finally{}
%>




</body>
</html>