<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ tag import = "java.util.Calendar" %>

<% Calendar c = Calendar.getInstance(); %>

<%=c.get(Calendar.YEAR)%> 년 <%=c.get(Calendar.MONTH) %> 월 <%=c.get(Calendar.DATE)%>일<br><hr>


