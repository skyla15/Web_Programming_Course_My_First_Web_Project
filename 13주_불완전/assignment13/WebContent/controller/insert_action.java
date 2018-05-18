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


public class insert_action extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
		BoardDataBean article = new BoardDataBean();
		BoardDBBean dbPro = new BoardDBBean(); 

		
		dbPro = BoardDBBean.getInstance();
		try {
			dbPro.insertArticle(article);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("article", article);
        RequestDispatcher view = request.getRequestDispatcher("/board-insert-success.jsp");
        view.forward(request, response);
	}

}
