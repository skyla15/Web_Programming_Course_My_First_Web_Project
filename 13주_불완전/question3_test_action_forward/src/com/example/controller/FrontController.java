package com.example.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class FrontController
extends javax.servlet.http.HttpServlet
implements javax.servlet.Servlet {
 protected void doProcess(HttpServletRequest request, HttpServletResponse response)
     throws ServletException, IOException {
     String RequestURI=request.getRequestURI();
     String contextPath=request.getContextPath();
     String command=RequestURI.substring(contextPath.length());
     ActionForward forward=null; 
     Action action=null;
     
     if(command.equals("/insert.bo")) {
    	 	forward = new ActionForward();
    	 	action = new BoardAddAction();
    	 	try {
    		 	forward=action.execute(request, response);
    	 	}catch(Exception e) {
    		 	e.printStackTrace();
    	 	}
    	 	//forward.setRedirect(false);
    	 	//forward.setPath("question3/board-insert-success.jsp");
    	 }else if(command.equals("/read.bo")) {
    	 	action = new BoardDetailAction();
    	 	try {
    	 		forward=action.execute(request, response);
    	 	}catch(Exception e) {
    	 		e.printStackTrace();
    	 	}
     }
     
     
 	}
}
