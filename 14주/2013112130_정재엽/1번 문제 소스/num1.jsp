<%@ page contentType="text/html;charset=utf-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
<head>

<body>
<%
    out.println("<h2>"+"request로 넘어온 값 받기"+"<h2>");
	String name = request.getParameter("name_val"); //입력된 이름값을 받아옵니다
    String hobby[] = request.getParameterValues("hobby"); //hobby에 선택된 값들을 배열로 받아옵니다

    out.println("hobby : ");
    for(int i = 0 ; i < hobby.length ; i++){
        out.println( hobby[i] );
    } // 배열로 들어온 hobby의 값들을 출력합니다	
%>
</body>
</html>
