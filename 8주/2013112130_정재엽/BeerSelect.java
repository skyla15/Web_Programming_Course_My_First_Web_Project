package com.example.web;

import com.example.model.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class BeerSelect extends HttpServlet { // HttpServlet 을 상속받아옵니다.
	public void doPost(HttpServletRequest request, HttpServeletResponse response)throws IOException, servletException {
		//HttpServletRequest/Response를 객체화 시켜서 받습니다. 
		String c = request.getParameter("color"); //
		BeerEexpert be = new BeerExpert(); //BeerExpert를 객체화시켜 가져옵니다.
		List Result = be.getBrands(c); //모델에서 선택된 값에 대한 결과값을 받아옵니다.

		request.setAttribute("styles", result); //request객체에 결과값을 넣어줍니다. 
		
			RequestDispatcher view =
				request.getRequestDispatcher("result.jsp"); //정보를 보여주기 위한 뷰를 위한 디스패치를 호출합니다.
		
			view.forward(request, response); request와 response에 포워딩하며 리퀘스트의 값은 뷰로 넘어갑니다.
	}
}
