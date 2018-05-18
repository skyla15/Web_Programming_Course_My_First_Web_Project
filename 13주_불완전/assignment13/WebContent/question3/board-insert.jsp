<%@ page contentType="text/html; Charset=EUC-KR" pageEncoding="EUC-KR" %> 
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글쓰</title>
</head>
<body>
<center><h2>게 시 판</h2></center>


<!--  파라미터 :name, e_mail, title, content, --> 
	<form method="post" action="insert.do" > 
	<!--  board-insert-db를 서블릿에 매핑되어있는 insert_action이 처리하도록 합니다. -->
	<table>
		<tr>
			<td width = "130" align="justify">	<img src=image/ball.gif>글 쓴 이 : </td>
			<td width ="330"><input type="text" name="name"><br></td>
		</tr>
		<tr>
			<td width = "130" align="justify"><img src=image/ball.gif>메일주소 : </td>
			<td width="330"><input type="text" name="e_mail" size="40"></td>
		</tr>
		<tr>
			<td width = "130" align="justify">	<img src=image/ball.gif>글 제 목 :</td>
			<td width="330"><input type="text" name="title" size="70"></td>
		</tr>
		<tr>	
			<td width = "130" align="justify"><img src=image/ball.gif>글 내 용 :</td>
			<td width="330"><textarea name="content" rows="10" cols="40"></textarea><br></td>
		</tr>	
		<tr>
			<td colspan=2>
				<input type="submit" value="등록하기"><input type="reset" value="다시쓰기"><br>
			</td>
		</table>
	</form>


		<center>
		<img src="image/green_tree.gif"><a href="board-list.jsp"> 목록보기 </a>
		<img src="image/island.gif" width="95%">
		</center>


</body>
</html>