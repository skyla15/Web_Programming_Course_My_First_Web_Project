<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch12.LogonDBBean"%>
<%request.setCharacterEncoding("utf-8");%>


<!-- 로그인 인증 및 세션 정보 업데이트 및 빈에 현재 정보 입력 -->
<!-- 세션에 저장된 정보 = id, nickname, passwd -->

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String nickname = request.getParameter("nickname");
	
	LogonDBBean logon = LogonDBBean.getInstance();
	int check = logon.userCheck(id,passwd); // 인증 DAO
	
	if(check == 1){
		//데이터베이스에 로그인 id,passwd가 있다면 세션에 로그인정보(id, nick) 등록 후 메인페이지로 이동
		//session에 아이디, 닉네임, 패스워드 전부 저장후 업데이트 시 정보로 사용한다.
		session.setAttribute("id",id);
		session.setAttribute("nickname", nickname);
		session.setAttribute("passwd", passwd);
		response.sendRedirect("/Cookie_Session/ch12/sessionMain.jsp");
	}else if(check ==0 ){
%>
	
	<script>
		alert("비밀번호 오류"); //비밀번호가 안맞았을 경우, 후에 보안을 위하여 alert메시지를 아이디 및 비밀번호가 잘못되었습니다로 바꿔준다.
		history.go(-1); // 전페이지로
	</script>
<%		
	}else{
%>
	<script>
		alert("아이디가 없습니다");
		history.go(-1);
	</script>

<% }
%>

