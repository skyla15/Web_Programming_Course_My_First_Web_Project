<%@ page contentType="text/html;charset=utf-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
<head>

<body>

<%
//아이디와 비밀번호를 문자열 배열로 선언합니다.
String[] users = {"web", "programming"};
String[] passwords = {"1108", "2017"};

//form에서 받아온 id와 pw파라미터를 통해 id pw 스트링에 저장하빈다.
String id = request.getParameter("id");
String pw = request.getParameter("pw");

//만약에 아이디와 비밀번호가 일치하지않을 경우 재전송 페이지를 redirectUrl에 저장합니다.
String redirectUrl="form.jsp";

//for문을 통해 uers와 password에 선언되어있는 값들과 form에서 입력된 id와 pw의 값들과 일치하는 지 확인합니다.
for( int i = 0 ; i < users.length ; i++)
{
    if(users[i].equals(id) && passwords[i].equals(pw))
    {
        //일치할경우 session scope에서 입력되어온 id를 signedUser에 저장합니다
        session.setAttribute("signedUser", id);
        // 일치할 경우 id를 젖아하고 welcom.jsp로 넘어갑니다.
        redirectUrl = "welcome.jsp";
    }
}
    //일치하지 않을 경우 form.jsp로 돌아갑니다.
    response.sendRedirect(redirectUrl);
%>



</body>
</html>
