package com.example.controller;

import java.awt.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import question2.BoardDataBean;
import question2.BoardDBBean;


public class read_action extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		BoardDataBean article = new BoardDataBean();
		int id = Integer.parseInt(request.getParameter("id")); //list에서 앵커태그로 id파라미터를 받음 
		try{
			// 데이터 처리빈을 객체화하여 가져옵니다.
			BoardDBBean dbPro = BoardDBBean.getInstance();
			// 데이터 처리빈 내의 메소드를 통해 데이터를 읽어오는 메소드를 실행시킵니다.
			// id = 현재 작성된 글의 갯수를 의미합니다.
			dbPro.readArticle(id);
		}catch(Exception e){}
		
		// 읽어들인 데이터를 board-read.jsp로 포워딩시킵니다.
		request.setAttribute("article", article);
        RequestDispatcher view = request.getRequestDispatcher("/question3/board-read.jsp");
        view.forward(request, response);
	}
}
