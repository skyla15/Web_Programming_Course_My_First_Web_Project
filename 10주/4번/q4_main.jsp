<%@ page contentType="text/html;charset=utf-8"%>
<% request.setCharacterEncoding("euc-kr"); %>

<html>
<head>
<center><h4> 액션 태그 </h4></center>
</head>

<body>
    <p> 이 파일은 q4_main.jsp입니다 <br/>
    어떤 것으로 글이 적힐까요?
    title도 바뀌니까 참고하세요. <hr></p>

    <h3>jsp:forward</h3>
    <q>q4_main일까요? q4_sub일까요?<hr>

<jsp:forward page = "q4_sub.jsp">
<jsp:param name = "url" value = "q4_main.jsp"/>
<jsp:param name = "news" value = "Good Luck with your class assignment"/>

//q4_sub.jsp를 forward하여 url과 news를 매개로하여 각각의 값들을 넘겨줍니다.
//넘겨주면서 페이지의 내용은 q4_sub의 내용으로 바뀝니다. 
//주소는 변경되지않습니다.

</jsp:forward>
</body>
</html>
