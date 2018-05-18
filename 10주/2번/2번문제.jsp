<%@ page contentType="text/html;charset=utf-8"%>
<% request.setCharacterEncoding("euc-kr"); %>

<html>
<head>
<head>

<body>
<%
	String scr_str = request.getParameter("score");
	int scr = Integer.parseInt(scr_str);
	String starnum_str = request.getParameter("star_num");
	int starnum = Integer.parseInt(starnum_str);
	int i=0;
	if( scr > 90) out.println("당신의 성적은 A입니다."+"<br>");
	else if( scr<=90 && scr > 80) out.println("당신의 성적은 B입니다."+"<br><br><br>");
	else if( scr<=80 && scr > 70) out.println("당신의 성적은 C입니다."+"<br><br><br>");
	else if( scr<=70 && scr > 60) out.println("당신의 성적은 D입니다."+"<br><br><br>");
	else out.println("당신의 성적은 F입니다."+"<br><br><br>");



	for( i=1 ; i <= starnum ; i++ )
		{
			for(int j = 1 ; j <= i ; j++){
				out.println("*");
			}
			out.println("<br>");
		}
				
	
%>
</body>
</html>
