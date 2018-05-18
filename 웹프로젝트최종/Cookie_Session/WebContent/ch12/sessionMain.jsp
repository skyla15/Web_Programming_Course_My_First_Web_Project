<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link href="/Cookie_Session/asset/css_main.css" rel="stylesheet" type="text/css">


    
<%
	String id ="";
	try{
	id = (String)session.getAttribute("id");
	if(id==null || id.equals("")){
	response.sendRedirect("login_logout/sessionLoginForm.jsp"); //로그인 인증페이지로 넘김.  
	}
	else{ //session에 id가 저장되있을 경우 = 로그인상태 
 %>
 
 <img src="/Cookie_Session/asset/cookie.png" height="50" width=50>
 <%=id%>님, 환영합니다.
 <input type="button" value="회원 정보 보기" onclick="location.href='/Cookie_Session/ch12/View_Member/View_Member.jsp'">
 <input type="button" value="로그아웃" onclick="location.href='/Cookie_Session/ch12/login_logout/sessionLogout.jsp'">
 <hr>
 
 

<div class="main-menu-background">	
	<center>
		<input  class="main-menu-bar" type="button" value="개인 포스트 보기" onclick="location.href='/Cookie_Session/post/post_List.jsp'"> 
		<input  class="main-menu-bar" type="button" value="전체 포스트 보기" onclick="location.href='/Cookie_Session/post/post_List_All.jsp'" >
		<input  class="main-menu-bar" type="button" value="카테고리 검색" onclick="location.href='/Cookie_Session/post/cat_Search_Form.jsp'" >
	</center>
</div>	
 
	
	


<%
	}
	}catch(Exception e){
			e.printStackTrace();
	}
%>


