package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AnswerDAO;
import dao.QuestionDAO;
import dao.UserDAO;
import model.AllBeans;
import model.User;	// この先はmodel.UserをUserとよぶ


/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
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


		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		User user = (User)session.getAttribute("user");

		String user_id = request.getParameter("user_id");
		String name = request.getParameter("name");
		String q_content = request.getParameter("q_content");
		String user_class = request.getParameter("user_class");
		String category = request.getParameter("category");
		String people = request.getParameter("people");
		int q_id = Integer.parseInt(request.getParameter("q_id"));


		QuestionDAO qDAO = new QuestionDAO();
		UserDAO uDAO = new UserDAO();
		AnswerDAO aDAO = new AnswerDAO();

		// ログインサーブレットからリダイレクト
		// ログインボタン ヘッダーの閲覧 リザルトページの戻る

		if (request.getParameter("SUBMIT").equals("ログイン") || request.getParameter("FLG").equals("閲覧ページへ")) {


			List<AllBeans> questionNowList = qDAO.defaultNow();
			// 対応中検索結果をリクエストスコープに格納
			request.setAttribute("questionNowList",questionNowList);

			List<AllBeans> questionYetList = qDAO.defaultYet();
			// 未対応検索結果をリクエストスコープに格納
			request.setAttribute("questionYetList",questionYetList);

			List<AllBeans> questionEndList = qDAO.defaultEnd();
			// 対応済み検索結果をリクエストスコープに格納
			request.setAttribute("questionEndList",questionEndList);


			// 閲覧ページにフォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/list.jsp");
			dispatcher.forward(request, response);


		} else if(request.getParameter("SUBMIT").equals("左検索")) {

			// 閲覧ページ左側 検索ボックス

			List<AllBeans> searchNowList = qDAO.searchNow(q_content,user_class,category,people);
			// 対応中検索結果をリクエストスコープに格納
			request.setAttribute("searchNowList",searchNowList);

			List<AllBeans> searchYetList = qDAO.searchYet(q_content,user_class,category,people);
			// 未対応検索結果をリクエストスコープに格納
			request.setAttribute("searchYetList",searchYetList);

			List<AllBeans> searchEndList = qDAO.searchEnd(q_content,user_class,category,people);
			// 対応済み検索結果をリクエストスコープに格納
			request.setAttribute("searchEndList",searchEndList);


			// 閲覧ページにフォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/list.jsp");
			dispatcher.forward(request, response);


		} else if(request.getParameter("SUBMIT").equals("個人検索")) {

			// 個人絞り込み 検索

			List<AllBeans> idNowList = qDAO.idNow(user_id);
			// 対応中検索結果をリクエストスコープに格納
			request.setAttribute("idNowList",idNowList);

			List<AllBeans> idYetList = qDAO.idYet(user_id);
			// 未対応検索結果をリクエストスコープに格納
			request.setAttribute("idYetList",idYetList);

			List<AllBeans> idEndList = qDAO.idEnd(user_id);
			// 対応済み検索結果をリクエストスコープに格納
			request.setAttribute("idEndList",idEndList);


			// 閲覧ページにフォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/list.jsp");
			dispatcher.forward(request, response);


		} else if(request.getParameter("SUBMIT").equals("名前検索")) {

			// 個人絞り込み 名前検索

			List<User> filterList = uDAO.userFilter(name);
			// 検索結果をリクエストスコープに格納
			request.setAttribute("filterList",filterList);

			// 個人絞り込みページにフォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/filter.jsp");
			dispatcher.forward(request, response);


		} else if(request.getParameter("FLG").equals("マイページ")) {

			// ヘッダーからマイページクリック
			// 受講者だったとき

			if(user.getPosition().equals("受講者") ){

				List<AllBeans> q_idNowList = qDAO.idNow(user_id);
				// 対応中検索結果をリクエストスコープに格納
				request.setAttribute("q_idNowList",q_idNowList);

				List<AllBeans> q_idYetList = qDAO.idYet(user_id);
				// 未対応検索結果をリクエストスコープに格納
				request.setAttribute("q_idYetList",q_idYetList);

				List<AllBeans> q_idEndList = qDAO.idEnd(user_id);
				// 対応済み検索結果をリクエストスコープに格納
				request.setAttribute("q_idEndList",q_idEndList);


				// 質問者マイページにフォワード
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/q_mypage.jsp");
				dispatcher.forward(request, response);


			} else {

				// 回答者だったとき

				List<AllBeans> q_answerNowList = qDAO.answerNow(user_class);
				// 対応中検索結果をリクエストスコープに格納
				request.setAttribute("q_answerNowList",q_answerNowList);

				List<AllBeans> q_answerYetList = qDAO.answerYet(user_class);
				// 未対応検索結果をリクエストスコープに格納
				request.setAttribute("q_answerYetList",q_answerYetList);

				List<AllBeans> q_answerEndList = qDAO.answerEnd(user_class);
				// 対応済み検索結果をリクエストスコープに格納
				request.setAttribute("q_answerEndList",q_answerEndList);


				// 回答者マイページにフォワード
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/a_mypage.jsp");
				dispatcher.forward(request, response);

			}
		}else if(request.getParameter("SUBMIT").equals("回答ボタン")) {

			// 回答ページ左側

			List<AllBeans> answerList  = aDAO.answer_left(q_id);
			// 回答する質問内容をリクエストスコープに格納
			request.setAttribute("answerList",answerList);


			// 回答ページにフォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/answer.jsp");
			dispatcher.forward(request, response);
		}


	}
}
