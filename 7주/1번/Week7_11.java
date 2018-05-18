// 서블릿의 각 라인은 파일 3번에서 주석을 달아놓았습니다.

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/week7_11")
public class Week7_11 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Week7_11() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String name = request.getParameter("name"); //html에서 name, adr, num 파라미터를 가진 값을 불러옵니다.
		String adr = request.getParameter("adr");
		String num = request.getParameter("num");
		response.setContentType("text/html;charset=euc-kr");
		
		PrintWriter out = response.getWriter();
		out.println("NAME "+ name + "<br/>"); // 가지고 온 값들 출력, 그러나 매개변수는 현재 없습니다.
		out.println("PHONE "+ num  + "<br/>");
		out.println("ADDRESS "+ adr + "<br/>");
	}

}
