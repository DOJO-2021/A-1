package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AnswerDAO;
import dao.QuestionDAO;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
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
		}
		this.doPost(request, response);
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
		// 削除処理
		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");

		int a_id = Integer.parseInt(request.getParameter("a_id"));
		int q_id = Integer.parseInt(request.getParameter("q_id"));
		AnswerDAO aDAO = new AnswerDAO();



		QuestionDAO qDAO = new QuestionDAO();

		// 回答削除
		// 回答者マイページ
		if (request.getParameter("a_delete_button").equals("回答削除")) {

			if(aDAO.delete(a_id))  {
				// 削除の結果をリクエストスコープに格納
				request.setAttribute("message", "削除しました。");

				// resultページにフォワード
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/message.jsp");
				dispatcher.forward(request, response);


			} else {
				// 削除の失敗結果をリクエストスコープに格納
				request.setAttribute("message", "削除に失敗しました。");

				// resultページにフォワード
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/message.jsp");
				dispatcher.forward(request, response);


			}

			// 質問削除
			// 質問者マイページ
		} else if (request.getParameter("q_delete_button").equals("質問削除")) {

				if(qDAO.delete(q_id))  {
					// 削除の結果をリクエストスコープに格納
					request.setAttribute("message", "削除しました。");

					// resultページにフォワード
					RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/message.jsp");
					dispatcher.forward(request, response);


				} else {
					// 削除の失敗結果をリクエストスコープに格納
					request.setAttribute("message", "削除に失敗しました。");

					// resultページにフォワード
					RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/message.jsp");
					dispatcher.forward(request, response);
				}
		}
	}
}

