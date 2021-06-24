package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ChangePageServlet
 */
@WebServlet("/ChangePageServlet")
public class ChangePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null && !(request.getParameter("regist_button").equals("会員登録"))) {
			response.sendRedirect("/QAManagement/LoginServlet");
			return;
		}
		if(request.getParameter("FLG").equals("会員登録")) {
			//会員登録ページにフォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/u_regist.jsp");
			dispatcher.forward(request, response);
		}else if(request.getParameter("FLG").equals("質問")) {
			//会員登録ページにフォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/question.jsp");
			dispatcher.forward(request, response);
		}else if(request.getParameter("FLG").equals("会員情報変更")) {
			//会員登録ページにフォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/u_change.jsp");
			dispatcher.forward(request, response);
		}
	}
}
