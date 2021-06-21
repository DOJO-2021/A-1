package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.User;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			response.sendRedirect("/QAManagement/LoginServlet");
			return;
		} else {
			this.doPost(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			response.sendRedirect("/QAManagement/LoginServlet");
			return;

		}

		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		User user = (User)session.getAttribute("user");

		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String name = request.getParameter("name");
		String user_class = request.getParameter("user_class");


		UserDAO uDAO = new UserDAO();


		if(uDAO.update(user_id, user_pw, name, user_class)) {
			// 会員情報変更結果をリクエストスコープに格納
			request.setAttribute("message", "会員情報を変更しました。");

		// resultページにフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/u_result.jsp");
		dispatcher.forward(request, response);


	} else {
		// 会員情報変更、失敗結果をリクエストスコープに格納
		request.setAttribute("message", "会員情報の変更に失敗しました。");

		// resultページにフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/u_result.jsp");
		dispatcher.forward(request, response);

	}
	}
}