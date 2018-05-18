<html>
<%@ page contentType="text/html;charset=utf-8" %>


	<body>

	
	Return string  :       
	<% String str = "web program";
	   out.println("'"+str+"'"+" -> ");	
	   str = str.substring(0,3); 
	//스트링은 기본적으로 배열로 들어감
	//0~3번째 문자를 substring을 통해 뺴줍니다.
	   out.println("'"+str+"'"+"<br>"); 
	%>

	Substitute string  :      
	<% String str2 = "web program"; 
	   out.println("'"+str2+"'"+" -> ");
	   str2 = str2.replace("program", "programming");
	//replace메소드를 이용하여 program을 programming으로 대체합니다.
	   out.println("'"+str2+"'"+"<br>"); 
	%>

	Erasing space  :    
	<% String str3 = "  web program"; 
   	   out.println("'"+str3+"'"+" -> ");
	   str3 = str3.trim(); 
	//trim메소드를 이용하여 문자열의 앞뒤 공백을 지워줍니다.
	   out.println("'"+str3+"'"+"<br>"); 
	%>
	<br><br><br><br><hr>

	
	<% 
		try{
			int i;
		 	int num;
	 		for(i=5;i>=0;i--){
			num = 30/i;
			out.println(num + "<br>");}
		    
		}
		
		catch(Exception e){
			out.println("Exception Error occured" + e.getMessage() + "<br>");
		}
	%>
		//try catch문을 이용하여 0으로 나누었을 때의 예외처리를 출력합니다.
	</body>
</html> 
	 