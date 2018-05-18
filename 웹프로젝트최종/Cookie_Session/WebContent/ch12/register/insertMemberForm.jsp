<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form method = "post" action = "insertMemberPro.jsp" >
	<h3> 회 원 가 입 </h3>
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" maxlength="50"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd" maxlength="16"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" maxlength="50"></td><br>
			</tr>	
			<tr>
				<td>닉네임</td>
				<td><input type="text" name="nickname" maxlength="50"></td>
			</tr>			
		</table>
	 
		<input type = "submit" vlaue="회원가입" class="register-button">
		<input type="reset" value="다시입력" class="register-button">
		<input type ="button" value = "돌아가기" onCLick ="location.href='/Cookie_Session/ch12/sessionMain.jsp'">
	</form>
</body>
</html>