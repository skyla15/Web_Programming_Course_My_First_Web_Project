

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class week7_3
 */
@WebServlet("/week7_3") //서블릿 멥핑
public class week7_3 extends HttpServlet {  //week7_3 class 선언후 HttpServlet 상속
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public week7_3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//클라이언에게 get 요청을 받아 doGet메소드를 오버라이드합니다. 
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String str1 = request.getParameter("num1"); //num1을 변수로 해서 숫자를 str형태로 받아옵니다.
		String str2 = request.getParameter("num2");
		int num1 = Integer.parseInt(str1); //parseInt(string)을 통해 string을 int형으로 변환합니다.
		int num2 = Integer.parseInt(str2); //형변환 예외처리가 계속 나와서 parameter의 인자로 넣지 않았습니다.
						   //코드에는 문제가 없어보인데 3번 중에 2번은 정상값이 나오고 1번은 500오류가 납니다.. 

		response.setContentType("text/html;charset=euc-kr"); 
		
		int AddRst = num1 + num2; // 사칙연산
		int SubRst = num1 - num2;
		int MulRst = num1 * num2;
		int DivRst = 0;		  // num1 / num2에서 num2 = 0인경우 오류가 나기때문에 
					  // 나눗셈 연산의 결과 인수를 초기화시킵니다.
		
		
		
		
		PrintWriter out = response.getWriter(); 
		out.println("ADD :"+ AddRst + "<br/>"); //각 사칙연산의 결과를 출력합니다.
		out.println("SUB :"+ SubRst + "<br/>");
		out.println("MUL :"+ MulRst + "<br/>");
		if(num2 != 0)	// num2가 0이 아닌경우 연산을 실행하고 0일 경우 메세지를 출력합니다.
		{
			DivRst = num1 / num2;
			out.println("DIV :"+ DivRst + "<br/>");
		}
		else
			out.println("잘못된 값을 입력하셨습니다.");

	}

}
