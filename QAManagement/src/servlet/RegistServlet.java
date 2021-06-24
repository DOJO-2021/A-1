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
import dao.UserDAO;
import model.User;


/**
 * Servlet implementation class RegistServlet
 */
@WebServlet("/RegistServlet")
public class RegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
				HttpSession session = request.getSession();
				if (session.getAttribute("user") == null && !(request.getParameter("regist_button").equals("会員登録"))) {
					response.sendRedirect("/QAManagement/LoginServlet");
					return;
				}
				this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
			HttpSession session = request.getSession();
				if (session.getAttribute("user") == null && !(request.getParameter("regist_button").equals("会員登録"))) {
					response.sendRedirect("/QAManagement/LoginServlet");
					return;
				}

				request.setCharacterEncoding("UTF-8");
				User user = (User)session.getAttribute("user");
/*				String user_id =null;
			if(request.getParameter(user_id)==null) {
					user_id =(String)session.getAttribute(user.getUser_id());
				}else {
					user_id =request.getParameter(user_id);
				}*/

				String user_id = request.getParameter("user_id");
				String name = request.getParameter("name");
				String q_content = request.getParameter("q_content");
				String user_class = request.getParameter("user_class");
				String category = request.getParameter("category");
				String user_pw = request.getParameter("user_pw");
				String position = request.getParameter("position");
				String people = request.getParameter("people");

				String q_image = request.getParameter("q_image");

				String a_content = request.getParameter("a_content");
				String a_image = request.getParameter("a_image");

				String situation = request.getParameter("situation");

				String path = "";

				QuestionDAO qDAO = new QuestionDAO();
				UserDAO uDAO = new UserDAO();
				AnswerDAO aDAO = new AnswerDAO();

				//会員登録
				if(request.getParameter("regist_button") != null) {
					if(uDAO.insert(user_id, user_pw, name, user_class, position)) {
						request.setAttribute("u_registErr", "会員登録が完了しました");

						//会員登録変更結果ページにフォワード
						path = "/WEB-INF/jsp/u_result.jsp";

					} else {
						request.setAttribute("u_registErr", "会員登録ができませんでした");

						path = "/WEB-INF/jsp/u_result.jsp";
					}

					//質問登録
				}else if(request.getParameter("quest_button") != null) {
					int first = Integer.parseInt(request.getParameter("first"));
					if(qDAO.insert(people, category, first, q_image, q_content, user_id)) {
						request.setAttribute("message", "質問登録が完了しました");
						request.setAttribute("people", people);
						request.setAttribute("category", category);
						request.setAttribute("first", first);
						request.setAttribute("q_image", q_image);
						request.setAttribute("q_content", q_content);
						request.setAttribute("user_id", user_id);


						//resultページにフォワード
						path = "/WEB-INF/jsp/q_result.jsp";
					} else {
						request.setAttribute("message", "質問登録が失敗しました");
						System.out.println(people);
						System.out.println(category);
						System.out.println(first);
						System.out.println(q_content);
						System.out.println(user_id);

						//resultページにフォワード
						path ="/WEB-INF/jsp/message.jsp";

					}
					//回答登録
				} else if(request.getParameter("rp_button") != null) {
					int q_id = Integer.parseInt(request.getParameter("q_id"));
					if(aDAO.insert(a_content, a_image, q_id, user_id)) {
						request.setAttribute("a_content", a_content);
						request.setAttribute("a_image", a_image);
						if(qDAO.update(situation, q_id)) {
							request.setAttribute("situation", situation);
							//a_resultページにフォワード
							path = "/WEB-INF/jsp/a_result.jsp";

						} else {
							request.setAttribute("message", "対応中・対応完了変更が失敗しました");
							//resultページにフォワード
							path = "/WEB-INF/jsp/message.jsp";
						}
					} else {
						request.setAttribute("message", "回答登録が失敗しました");
						//resultページにフォワード
						path = "/WEB-INF/jsp/message.jsp";
					}
				}
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);
	}
}
