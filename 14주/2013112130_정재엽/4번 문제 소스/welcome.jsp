<%@ page contentType="text/html;charset=utf-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
<head>

<body>
//confirm.jsp에서 저장한 signedUser를 출력합니다.
<h1><%= session.getAttribute("signedUser") %>님<small>반갑습니다</small></h1>
//로그아웃 앵커를 클릭하면 logout.jsp로 넘어가 로그아웃합니다.
<a href="logout.jsp">로그아웃</a>
</body>
</html>
