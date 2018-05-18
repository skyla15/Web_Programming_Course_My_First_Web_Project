<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
  
<jsp:include page="/ch12/sessionMain.jsp"></jsp:include>
<input type="button" onclick="location.href='/Cookie_Session/post/post_Insert_Form.jsp'" value="포스트 작성하기">
<br><br>
<jsp:include page="cat_View.jsp"></jsp:include>

<form method = "post" action="/Cookie_Session/post/cat_Search_Pro.jsp">
	<p>
		검색어 : <input type="text" name="category" placeholder="ex)홍길동">
			   <input type="submit" value="검색">
	</p>
</form>


