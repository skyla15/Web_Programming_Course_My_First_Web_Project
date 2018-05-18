package com.example.controller;

import java.awt.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import com.example.db.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class read_action extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
		BoardDataBean article = new BoardDataBean();
		int id = Integer.parseInt(request.getParameter("id")); //list에서 앵커태그로 id파라미터를 받음 
		String name = "";
		String e_mail = "";
		String title = "";
		String content = "";
		try{
			BoardDBBean dbPro = BoardDBBean.getInstance();
			dbPro.readArticle(id);
		}catch(Exception e){}
		
		request.setAttribute("article", article);
        RequestDispatcher view = request.getRequestDispatcher("/board-read.jsp");
        view.forward(request, response);
	}
}
