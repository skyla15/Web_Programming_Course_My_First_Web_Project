<%@ page contentType="text/html;charset=utf-8"%>


<html>
<head>
<center><h4> forward 액션 태그 </h4></center>
</head>

<body>
    <p> 이 파일은 q4_sub.jsp입니다 <br/><hr></p>
    <p> 현재 웹 브라우저에 나타난 웹페이지는<br/>
        <%=request.getParameter("url")%>로부터 이동되었습니다.<hr></p>
<p> <%=request.getParameter("url")%> 에서 넘어온 메세지 : <%=request.getParameter("news")%>  <br/><hr></p>
//q4_main에서 받아온 매개값들을 통하여 값들을 출력합니다.

</body>
</html>
