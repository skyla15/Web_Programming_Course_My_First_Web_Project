package com.example.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


import com.example.db.*;

public class BoardAddAction implements Action {
    public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
    		BoardDBBean boarddao=new BoardDBBean();
        BoardDataBean boarddata=new BoardDataBean();
        ActionForward forward=new ActionForward();
        boolean result = false;
        
        boarddata.setName(request.getParameter("name"));
        boarddata.setE_mail(request.getParameter("e_mail"));
        boarddata.setTitle(request.getParameter("title"));
        boarddata.setContent(request.getParameter("content"));
        
        forward.setRedirect(true);
        forward.setPath("./question3/board-insert-success");
        
        return null;
}
    }