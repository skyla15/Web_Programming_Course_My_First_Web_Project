<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "post.PostDBBean" %>
<%@ page import = "post.PostDataBean" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:include page="/ch12/sessionMain.jsp"></jsp:include>

<%
	String id = (String)session.getAttribute("id");
	int num = Integer.parseInt(request.getParameter("num"));
	PostDBBean dbPro = PostDBBean.getInstance();
	PostDataBean article = new PostDataBean();
	article = dbPro.getArticleInfo(num); //DataBean에 포스트의 정보를 넣었다.
%>


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
<!-- ****눈에 보이는 영역은 타이틀, 컨텐트 영역이고 넘겨야하는 값은 id 및 num  -->
	<form method="post" action="/Cookie_Session/post/post_Modify_Pro.jsp">
			<input type = "hidden" value="<%=article.getId() %>" name = "id">
			<input type = "hidden" value="<%=article.getNum() %>" name = "num">
			<center>
				<table class="type10">
					<thead>
						<tr>
							<th>Title</th>
							<th><input type = "text"  value="<%=article.getContent()%>" name="title" width="100"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">Category</th>
							<td><input type="text"  value="<%=article.getCategory() %>" name ="category" width ="100"></td>
						</tr>
						<tr>
							<th scope="row">Content</th>
							<td><textarea placeholder ="필요한 정보를 입력하세요." name = "content" rows="10" cols="20" "><%=article.getContent()%></textarea></td>
						</tr>
					</tbody>
				</table>
					<input type="submit" value="수정하기">
					<input type="button" value="돌아가기" onclick="history.go(-1)">
			</center>
	</form>