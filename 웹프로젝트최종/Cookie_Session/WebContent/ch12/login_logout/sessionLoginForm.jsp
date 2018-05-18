<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/ch12/sessionMain.jsp"></jsp:include>
    
<html>
<head>

</head>
<body>


	<form class=login smethod="post" action = "/Cookie_Session/ch12/login_logout/sessionLoginPro.jsp">
		<input type="text" placeholder="Username" name="id" maxlength="50" class="logon-form"><br>
  		<input type="password" placeholder="password" name="passwd" maxlength="16" class="logon-form">
		<input type="submit" value="로그인" class="logon-button">
		<input type="button" value="회원가입" onclick="location.href='/Cookie_Session/ch12/register/insertMemberForm.jsp'" class="register-button" >
	</form>

</body>
</html>