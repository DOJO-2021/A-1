package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;			// ※ArrayListはListを継承している
import java.util.List;

import model.AllBeans;
public class AnswerDAO {

	public List<AllBeans> answer_left(int q_id) {

		List<AllBeans> answerList = new ArrayList<AllBeans>();

		Connection conn = null;			//初期値を空っぽに

		try {
			// JDBCドライバを読み込む h2を使う
			Class.forName("org.h2.Driver");

			// データベースに接続する	connに値が入れられる＝接続されている状態
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/A-1/QAManagement/QADB", "sa", "momoka");

			// SELECT文を準備する		ユーザーが入れてくる情報を?にしておく
			// 絞り込み検索用SQL
			String sql = "select * from answer left outer join question on answer.q_id = question.q_id left outer join user on answer.user_id = user.user_id where q_id = ?;";
			PreparedStatement pStmt = conn.prepareStatement(sql);		// PreparedStatementが無害化して↓
			pStmt.setInt(1, q_id);		// 1番目の?マークにユーザーが入れたidを入れる paramはUser型

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();


			// 次のデータ、次のデータ・・順に
			while (rs.next()) {
				AllBeans allBeans = new AllBeans();		// JavaBeansをインスタンス化してデータを入れる箱として利用
				allBeans.setUser_class(rs.getString("user_class"));
				allBeans.setPeople(rs.getString("people"));
				allBeans.setName(rs.getString("name"));
				allBeans.setFirst(rs.getInt("first"));
				allBeans.setCategory(rs.getString("category"));
				allBeans.setQ_content(rs.getString("q_content"));
				allBeans.setA_content(rs.getString("a_content"));
				allBeans.setPosition(rs.getString("position"));

				answerList.add(allBeans);		// ArrayListに入れなおす（みんな知ってるから）
			}

		}
		catch (SQLException e) {
			e.printStackTrace();

		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();

		}
		finally {
			// データベースを切断
			if (conn != null) {			// conn がnullでない＝データベースに接続されている
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();

				}
			}
		}

		// 結果を返す
		return answerList;   //
	}

	public boolean insert(String a_content,String a_image, int q_id, String user_id) {
		Connection conn = null;
		boolean result = false;		//成功したらtrueに書き換える

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/A-1/QAManagement/QADB", "sa", "momoka");

			// SQL文を準備する

			String sql = "insert into User values (null, ?, ?, ?, ?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる

			pStmt.setString(1, a_content);		//1つ目の?(=NAME)に入力値をいれる

			pStmt.setString(2, a_image);

			pStmt.setInt(3, q_id);

			pStmt.setString(4, user_id);



			// SQL文を実行する
			// ここは変えなくていい
			if (pStmt.executeUpdate() == 1) {		//executeUpdate()処理されたレコード件数が返る 1件登録だから1がでればOK
				result = true;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		// 結果を返す
		return result;
	}


	// 引数numberで指定されたレコードを削除し、成功したらtrueを返す
	public boolean delete(int a_id) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/simpleBC", "sa", "");

			// SQL文を準備する
			String sql = "delete from answer where a_id=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1,a_id);

			// SQL文を実行する
			if (pStmt.executeUpdate() == 1) {
				result = true;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		// 結果を返す
		return result;
	}


	public List<AllBeans> list_answer() {

		List<AllBeans> answerList = new ArrayList<AllBeans>();

		Connection conn = null;			//初期値を空っぽに

		try {
			// JDBCドライバを読み込む h2を使う
			Class.forName("org.h2.Driver");

			// データベースに接続する	connに値が入れられる＝接続されている状態
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/A-1/QAManagement/QADB", "sa", "momoka");

			// SELECT文を準備する		ユーザーが入れてくる情報を?にしておく
			// 絞り込み検索用SQL
			String sql = "select * from answer left outer join question on answer.q_id = question.q_id left outer join user on answer.user_id = user.user_id order by answer.a_id asc;";
			PreparedStatement pStmt = conn.prepareStatement(sql);		// PreparedStatementが無害化して↓


			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();


			// 次のデータ、次のデータ・・順に
			while (rs.next()) {
				AllBeans allBeans = new AllBeans();		// JavaBeansをインスタンス化してデータを入れる箱として利用
				allBeans.setName(rs.getString("name"));
				allBeans.setA_content(rs.getString("a_content"));
				allBeans.setPosition(rs.getString("position"));
				allBeans.setA_id(rs.getInt("a_id"));
				allBeans.setA_image(rs.getString("a_image"));
				allBeans.setQ_id(rs.getInt("q_id"));

				answerList.add(allBeans);		// ArrayListに入れなおす（みんな知ってるから）
			}

		}
		catch (SQLException e) {
			e.printStackTrace();

		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();

		}
		finally {
			// データベースを切断
			if (conn != null) {			// conn がnullでない＝データベースに接続されている
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();

				}
			}
		}

		// 結果を返す
		return answerList;   //
	}
}