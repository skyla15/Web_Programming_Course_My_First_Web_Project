<%@ page contentType="text/html;charset=utf-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
<head>

<body>
<%
//session 에 저장된 값을 삭제합니다
session.invalidate();
//form.jsp 로 로그아웃하여 돌아갑니다.
response.sendRedirect("form.jsp");
%>


</body>
</html>
