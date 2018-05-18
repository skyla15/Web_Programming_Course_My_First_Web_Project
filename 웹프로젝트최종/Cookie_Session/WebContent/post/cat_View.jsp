<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "post.PostDBBean" %>
<%@ page import = "post.PostDataBean" %>
<%@ page import = "java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>




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


<% 
	String id = (String) session.getAttribute("id");
	List<PostDataBean> articleList = null;
	PostDBBean dbPro = PostDBBean.getInstance();
	
	int count = dbPro.getTotalArticleCount(); //현재 로그인 된 아이디로 작성된 글의 갯수를 가져옵니다.
	if(count > 0){ //게시물이 존재할 경우 데이타빈 리스트의 정보들을 가져온다.
		articleList = dbPro.getTotalArticles(count);
	//현재 articleList에 게시물의 정보들이 저장되어있음. num, title, content.
	}else if(count == 0){
%>
	저장된 포스트가 없습니다.
<%
	}
	out.println("등록된 카테고리 : " );
	if(count !=0 ){
		for(int i = 0 ; i< articleList.size() ; i++){
			PostDataBean article = articleList.get(i);
%>
			
		<%=article.getCategory() %> &nbsp
				
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
		


	
	


