<%@ page contentType="text/html;charset=utf-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
<head>

<body>
<!-- "웹프짱" string을 web 값에 넣어줍니다 -->
<% request.setAttribute("web", "웹프짱"); %> <br>
<!-- 추가된 값을 출력합니다 -->
request.setAttribute = "${web}" 추가

<hr><br>
<!-- 내장객체를 이용하여 요청 URI를 출력합니다 -->
요청 URI : ${pageContext.request.requestURI}
<hr><br>
<!-- request의 name 속성을 출력합니다. -->
request의 name속성 = ${web}
<hr><br>
<!-- 파라미터를 통해 입력된 아이디값을 가져옵니다 -->
아이디:${param.name_val}
<br>
<!-- 파라미터를 통해 hobby를 배열로 가져옵니다. 선택된 것은 값이 출력됩니다 -->
선택한 운동 :
${paramValues.hobby[0]}
${paramValues.hobby[1]}
${paramValues.hobby[2]}
${paramValues.hobby[3]}
${paramValues.hobby[5]}

<br>

</body>
</html>
