<%@ page contentType="text/html;charset=utf-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
<head>

<body>
<%
pageContext.setAttribute("A", "봄비"); //각 값에 속성을 설정
request.setAttribute("B", "장마");
session.setAttribute("C", "가을바람");
application.setAttribute("D", "겨울눈");
%>


<h3>각 개체에 setAttribute 속성으로 값 설정 후 jsp 기본 표현 방식과 el방식의 비교 출력</h3>
page 영역 : <%= pageContext.getAttribute("A")%> <!-- 각 스코프에서 getAttirubute를 통해 값을 가져옵니다 -->
<br>
page 영역(EL) : ${A} <!-- EL을 이용하여 값만 가져옵니다. -->
<br>
request 영역 : <%= request.getAttribute("B")%>
<br>
request 영역(EL) : ${B}
<br>
session 영역 : <%= session.getAttribute("C")%>
<br>
session 영역(EL) : ${C}
<br>
apllication 영역 : <%= application.getAttribute("D")%>
<br>
application 영역(EL) : ${D}
<hr><hr>


<h3>EL PageContext 예제</h3> <!-- 내장객체를 이용하여 Method와 URI값을 가져옵니다 -->
Method : ${pageContext.request.method}<br>
URI : ${pageContext.request.requestURI}<br>
<hr><hr>

<h3>표현 언어의 사용예제2 - 파라미터 값 처리</h3>

<form action=num2_2.jsp method="post">
이름 : <input type="text" name="name_val"></input> <!--이름을 입력받습니다, 값은 name_val을 같습니다. -->
      <input type="submit" value="확인"></input><br>
이름은 (request.getParameter): <%= request.getParameter("name_val")%> 입니다<br>
이름은 (EL) : ${name_val}입니다.
</form>


</body>
</html>
