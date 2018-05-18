<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ page import = "com.example.db.BoardDataBean" %>
<%@ page import = "com.example.db.BoardDBBean" %>
<%@ page import = "java.text.*" %>


<%@ page import="java.sql.*" %>
<html>
  <head><title> 게시판 </title></head>
  <body> 
     <center><h2> 게시글 내용 </h2></center>
     <center>

<form>
    <table border="0" width="500">
      <tr height="30">
        <td width="100"><img src="image/ball.gif"> 글 쓴 이 : </td>
	   	<td>${name}</td>
      </tr>
      <tr height="30">
	      <td><img src="image/ball.gif"> 메일주소 : </td>
	      <td>${e_mail}</td>
      </tr>      
      <tr>
	      <td><img src="image/ball.gif"> 글 제 목 : </td>
	      <td>${title}</td>
      </tr>
      <tr height="30">
	      <td><img src="image/ball.gif"> 글 내 용 : </td>
	      <td>${content}</td>
      </tr>
</table>
</form>

 
	
	<div align = right>
    <img src="image/green_tree.gif">
    <a href="board-list.jsp"> 게시글 목록 보기 </a>
    </div>

  </body>
</html>