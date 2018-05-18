<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "post.PostDBBean" %>
<%@ page import = "post.PostDataBean" %>
<%@ page import = "java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:include page="/ch12/sessionMain.jsp"></jsp:include>




<!--  ***** 로그인 체크 ***** -->
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
<!--  ***** 로그인 체크 ***** -->

<input type="button" onclick="location.href='/Cookie_Session/post/post_Insert_Form.jsp'" value="포스트 작성하기"> 

<%
	if(request.getParameter("category") != "")
	{out.println("<center><h2>"+request.getParameter("category")+"에 대한 검색결과입니다."+"</h2></center>");}
	else if(request.getParameter("category") == ""){
%>
	<script>
		alert("입력된 값이 없습니다.")
		history.go(-1);
	</script>
<%
	}
	String id = (String)session.getAttribute("id");	
	String category = request.getParameter("category");
	
	List<PostDataBean> articleList = null;
	PostDBBean dbPro = PostDBBean.getInstance();
	
	int count = dbPro.getCategoryCount(category);
	if(count > 0){ 
		articleList = dbPro.getCategories(count, category);
	//현재 articleList에 게시물의 정보들이 저장되어있음. num, title, content.
	}else if(count == 0){
%>
	
		저장된 카테고리가없습니다.
<%
	}

	if(count !=0 ){

		for(int i = 0 ; i< articleList.size() ; i++){
			PostDataBean article = articleList.get(i);
%>


<center>
<table class="type10">
	<thead>
	<tr>
		<th>Title</th>
		<th><%=article.getTitle() %></th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<th scope="row">Id</th>
		<td><%=article.getId() %></td>
	</tr>
	<tr>
		<th scope="row" class="even">Content</th>
		<td class="even"><%=article.getContent() %></td>
	</tr>
	<tr>
		<th scope="row">Category</th>
		<td><%=article.getCategory() %></td>
	</tr>
	</tbody>
</table>
</center>
	
	<input type = "hidden" value=<%=article.getNum()%> name="num"/>
	<input type = "hidden" value=<%=article.getId()%> name="id"/>
	<input type = "hidden" value=<%=article.getTitle()%> name="title"/>
	<input type = "hidden" value=<%=article.getContent()%> name="content"/>
	<input type = "hidden" value=<%=article.getCategory()%> name="category"/>
	<!-- ** 각 포스트마다 form을 정해주고 각 포스트의 속성을 hidden을 통해 값을 넘겨줄 수 있게 설정
		 ** 이렇게 modify_form으로 넘겨준 뒤에 modify에서 Pro를 통해 내용을 수정할 수 있도록 한다. -->
<%
		}
	}
%>		
		

	
	


