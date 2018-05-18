<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "post.PostDBBean" %>
<%@ page import = "post.PostDataBean" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:include page="/ch12/sessionMain.jsp"></jsp:include>


<%    
	request.setCharacterEncoding("UTF-8");
    //로그인 체크
    if(session.getAttribute("id")==null){
%>
	<script>
		alert("로그인을 해주세요.")
		location.href="/Cookie_Session/ch12/login_logout/sessionLoginForm.jsp";
	</script>
<%
    }	
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="/Cookie_Session/post/post_Insert_Pro.jsp">
	<center>
		<table class="type10">
			<thead>
				<tr>
					<th scope="cols" >Title</th>
					<th scope="cols"><input type="text" name = "title" width="100"></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">Category</th>
					<td><input type="text" name = "category" width ="100"></td>
				</tr>
				<tr>
					<th scope="row">Content</th>
					<td><textarea placeholder ="필요한 정보를 입력하세요." name = "content" rows="10" cols="20"></textarea></td>
				</tr>
			</tbody>
		</table>
		<input type="hidden" value="<%=session.getAttribute("id") %>" name="id">
		<input type="submit" value="작성"> <input type="reset" value="다시 작성">
		<input type="button" onclick="location.href='/Cookie_Session/post/post_List.jsp'" value="돌아가기">
	</center>
	</form>
 
</body>
</html>