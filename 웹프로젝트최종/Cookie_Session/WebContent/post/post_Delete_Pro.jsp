<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch12.LogonDBBean"%>
<%@ page import="post.PostDBBean" %>
<%request.setCharacterEncoding("utf-8");%>


<!-- 로그인 인증 및 세션 정보 업데이트 및 빈에 현재 정보 입력 -->
<!-- 세션에 저장된 정보 = id, nickname, passwd -->

<%
	String id = (String)session.getAttribute("id");
	String passwd = request.getParameter("passwd");
	int num = Integer.parseInt(request.getParameter("num"));
	
	PostDBBean dbPro = PostDBBean.getInstance();
	LogonDBBean logon = LogonDBBean.getInstance();
	int check = logon.userCheck(id,passwd); //본인인증, id= session에 저장되있는 것
						                    //passwd 는 post_Delete_Form에서 받아옵니다.
	
	if(check == 1){ // 인증에 성공하면 삭제
		dbPro.deletePost(num);
%>
	<script>
		alert("게시물이 삭제되었습니다..");
		location.href="/Cookie_Session/post/post_List.jsp";
	</script>
<%
	}else if(check ==0 ){
%>	
	<script>
		alert("비밀번호 오류"); //비밀번호가 안맞았을 경우, 후에 보안을 위하여 alert메시지를 아이디 및 비밀번호가 잘못되었습니다로 바꿔준다.
		history.go(-1); // 전페이지로
	</script>
<%		
	}
%>
