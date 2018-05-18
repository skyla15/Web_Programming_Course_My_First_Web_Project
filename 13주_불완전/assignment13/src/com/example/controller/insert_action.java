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


public class insert_action extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
		// 데이터빈을 객체화 시킵니다.
		BoardDataBean article = new BoardDataBean();
		// 데이터 처리빈을 객체화 시킵니다.
		BoardDBBean dbPro = new BoardDBBean(); 

		// 데이터 처리빈을 통해 데이터빈 객체를 가져옵니다.
		// 데이터 처리빈을 접근하기 위함입니다.
		dbPro = BoardDBBean.getInstance();
		try {
			// 데이터 처리빈 내의 데이터 입력 메소드를 호출합니다.
			dbPro.insertArticle(article);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 입력된 article을 request객체 넣어 question3/board-insert-success.jsp로 포워딩시킵니다.
		request.setAttribute("article", article);
        RequestDispatcher view = request.getRequestDispatcher("/question3/board-insert-success.jsp");
        view.forward(request, response);
	}

}
