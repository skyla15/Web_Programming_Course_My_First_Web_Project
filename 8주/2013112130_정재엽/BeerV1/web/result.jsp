<%@ page import = "java.util.*" %>

<body>
	<h1 align="center">Beer Recommendation JSP</h1>
	<p>
		<%
		List styles = (List)request.getAtrribute("styles"); // 컨트롤에서 받아온 리퀘스트의 결과값을 받아오고
		Iterator it = styles.ierator(); //출력해줍니다.  
		while(it.hasNext()){
			out.print("<br>try: " + it.next());
		} //출력해주는 것이 뷰의 끝이고 이 결과값은 컨테이너를 통해 HTTPrequest를 통해 사용자에게 보여질것입니다.
                 
		%>
	</p>
</body>