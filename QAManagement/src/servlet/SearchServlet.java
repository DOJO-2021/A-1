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
		int q_id;



		QuestionDAO qDAO = new QuestionDAO();
		UserDAO uDAO = new UserDAO();
		AnswerDAO aDAO = new AnswerDAO();



		if(request.getParameter("search")!=null) {


			 System.out.println("左検索");
			// 閲覧ページ左側 検索ボックス

			List<AllBeans> questionNowList = qDAO.searchNow(q_content,user_class,category,people);
			// 対応中検索結果をリクエストスコープに格納
			request.setAttribute("questionNowList",questionNowList);

			List<AllBeans> questionYetList = qDAO.searchYet(q_content,user_class,category,people);
			// 未対応検索結果をリクエストスコープに格納
			request.setAttribute("questionYetList",questionYetList);

			List<AllBeans> questionEndList = qDAO.searchEnd(q_content,user_class,category,people);
			// 対応済み検索結果をリクエストスコープに格納
			request.setAttribute("questionEndList",questionEndList);

			List<AllBeans> answerList = aDAO.list_answer();
			//返信をリクエストスコープに格納
			request.setAttribute("answerList",answerList);
			System.out.println(q_content);
			System.out.println(user_class);
			System.out.println(category);
			System.out.println(people);


			System.out.println(questionYetList.size());
			System.out.println(questionNowList.size());
			System.out.println(questionEndList.size());


			// 閲覧ページにフォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/list.jsp");
			dispatcher.forward(request, response);


		} else if(request.getParameter("id_search")!=null) {
			 q_id = Integer.parseInt(request.getParameter("q_id"));


			// 個人絞り込み 検索

			List<AllBeans> questionNowList = qDAO.idNow(user_id);
			// 対応中検索結果をリクエストスコープに格納
			request.setAttribute("questionNowList",questionNowList);

			List<AllBeans> questionYetList = qDAO.idYet(user_id);
			// 未対応検索結果をリクエストスコープに格納
			request.setAttribute("questionYetList",questionYetList);

			List<AllBeans> questionEndList = qDAO.idEnd(user_id);
			// 対応済み検索結果をリクエストスコープに格納
			request.setAttribute("questionEndList",questionEndList);

			List<AllBeans> answerList = aDAO.list_answer();
			//返信をリクエストスコープに格納
			request.setAttribute("answerList",answerList);


			// 閲覧ページにフォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/list.jsp");
			dispatcher.forward(request, response);


		} else if(request.getParameter("search_name")!=null) {
			 q_id = Integer.parseInt(request.getParameter("q_id"));

			// 個人絞り込み 名前検索

			List<User> filterList = uDAO.userFilter(name);
			// 検索結果をリクエストスコープに格納
			request.setAttribute("filterList",filterList);

			// 個人絞り込みページにフォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/filter.jsp");
			dispatcher.forward(request, response);


		} else if(request.getParameter("MYFLG") != null) {

			// ヘッダーからマイページクリック
			// 受講者だったとき

			if(user.getPosition().equals("受講生") ){
				 user_id = user.getUser_id();


				List<AllBeans> q_idNowList = qDAO.idNow(user_id);
				// 対応中検索結果をリクエストスコープに格納
				request.setAttribute("q_idNowList",q_idNowList);

				List<AllBeans> q_idYetList = qDAO.idYet(user_id);
				// 未対応検索結果をリクエストスコープに格納
				request.setAttribute("q_idYetList",q_idYetList);

				List<AllBeans> q_idEndList = qDAO.idEnd(user_id);
				// 対応済み検索結果をリクエストスコープに格納
				request.setAttribute("q_idEndList",q_idEndList);

				List<AllBeans> answerList = aDAO.list_answer();

				//返信をリクエストスコープに格納
				request.setAttribute("answerList",answerList);

				System.out.println();
				System.out.println();
				System.out.println();


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


				List<AllBeans> answerList = aDAO.list_answer();
				//返信をリクエストスコープに格納
				request.setAttribute("answerList",answerList);


				// 回答者マイページにフォワード
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/a_mypage.jsp");
				dispatcher.forward(request, response);

			}
		}else if (request.getParameter("answer")!=null) {
			 q_id = Integer.parseInt(request.getParameter("q_id"));
			 System.out.println(q_id);
			List<AllBeans> answerList = aDAO.answer_left(q_id);
			// 対応中検索結果をリクエストスコープに格納
			request.setAttribute("answerList",answerList);

			// 閲覧ページにフォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/answer.jsp");
			dispatcher.forward(request, response);
		}
		// ログインサーブレットからリダイレクト
		// ログインボタン ヘッダーの閲覧 リザルトページの戻る

		else if(request.getParameter("login")==null && request.getParameter("FLG")==null){
			List<AllBeans> questionNowList = qDAO.defaultNow();
			// 対応中検索結果をリクエストスコープに格納
			request.setAttribute("questionNowList",questionNowList);
			System.out.println(questionNowList.size() + "cccccccccc");
			List<AllBeans> questionYetList = qDAO.defaultYet();
			// 未対応検索結果をリクエストスコープに格納
			request.setAttribute("questionYetList",questionYetList);
			System.out.println(questionYetList.size() + "ddddddddddd");

			List<AllBeans> questionEndList = qDAO.defaultEnd();
			// 対応済み検索結果をリクエストスコープに格納
			request.setAttribute("questionEndList",questionEndList);

			List<AllBeans> answerList = aDAO.list_answer();
			System.out.println(answerList.size()+"aaaaaaaaaa");
			//返信をリクエストスコープに格納
			request.setAttribute("answerList",answerList);

			// 閲覧ページにフォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/list.jsp");
			dispatcher.forward(request, response);
		}else if (request.getParameter("login")!=null || request.getParameter("FLG").equals("閲覧ページへ")) {


			List<AllBeans> questionNowList = qDAO.defaultNow();
			System.out.println(questionNowList.size());

			// 対応中検索結果をリクエストスコープに格納
			request.setAttribute("questionNowList",questionNowList);

			List<AllBeans> questionYetList = qDAO.defaultYet();
			// 未対応検索結果をリクエストスコープに格納
			request.setAttribute("questionYetList",questionYetList);

			List<AllBeans> questionEndList = qDAO.defaultEnd();
			// 対応済み検索結果をリクエストスコープに格納
			request.setAttribute("questionEndList",questionEndList);

			List<AllBeans> answerList = aDAO.list_answer();
			//返信をリクエストスコープに格納
			request.setAttribute("answerList",answerList);

			// 閲覧ページにフォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/list.jsp");
			dispatcher.forward(request, response);

	}
}
}
