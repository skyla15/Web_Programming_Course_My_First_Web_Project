<%@ page import = "java.util.*" %>

<body>
	<h1 align="center">Book Recommendation JSP</h1>
	<p>
		<%
		List styles = (List)request.getAtrribute("styles");
		Iterator it = styles.ierator();
		while(it.hasNext()){
			out.print("<br>try:" + it.next());
		}
		%>
	</p>
</body>