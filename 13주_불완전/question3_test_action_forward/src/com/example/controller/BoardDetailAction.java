package com.example.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.example.db.*;


public class BoardDetailAction implements Action {
     public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
        request.setCharacterEncoding("euc-kr");
        
        int num = Integer.parseInt(request.getParameter("num"));
		BoardDBBean boarddao=new BoardDBBean();
        BoardDataBean boarddata=new BoardDataBean();
        ActionForward forward=new ActionForward();
        boolean result = false;
        
         boarddata = boarddao.readArticle(num);
        
        if(boarddata!=null) {
        	request.setAttribute("boarddate", boarddata);
        forward.setRedirect(false);
        forward.setPath("./question3/board-read.jsp");
        }
        
        return forward;
                
     }
}