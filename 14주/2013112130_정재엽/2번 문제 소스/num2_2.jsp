<%@ page contentType="text/html;charset=utf-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
<head>

<body>
<h3>표현 언어의 사용예제2 - 파라미터 값 처리</h3>

<form method="post" action="num2_2.jsp"> <!-- 이곳의 확인도 값을 넘길 수 있게 form태그로 묶어주었습니다 -->
이름 : <input type="text" name="name_val"></input> <!-- 재입력이 될 경우를 위해 name을 붙여줍니다. -->
      <input type="submit" value="확인"></input><br><br>

이름은 (request.getParameter): <%= request.getParameter("name_val")%> 입니다<br>
<!-- getParameter를 통해 이름값을 num2.jsp에서 받아옵니다 -->
이름은 (EL) : ${param.name_val}입니다.
<!-- parameter값을 통해 이름값을 받아옵니다 -->
</form>


</body>
</html>
