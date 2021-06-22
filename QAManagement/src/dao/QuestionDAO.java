package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.AllBeans;

public class QuestionDAO {


	// 質問登録
	public boolean insert(String people, String category, int first, String q_image, String q_content, String user_id) {
		Connection conn = null;
		boolean result = false;		//成功したらtrueに書き換える

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/A-1/QAManagement/QADB", "sa", "momoka");

			// SQL文を準備する

			String sql = "insert into Question values (null,'未対応',?, ?, ?, ?, ?, ?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる

				pStmt.setString(1, q_content);		//1つ目の?(=NAME)に入力値をいれる

				pStmt.setString(2, people);

				pStmt.setString(3, category);

				pStmt.setInt(4, first);

				pStmt.setString(5, q_image);

				pStmt.setString(6, user_id);


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


	//閲覧ページ対応中質問絞り込み
	public List<AllBeans> defaultNow() {

		List<AllBeans> questionList = new ArrayList<AllBeans>();  //User型の要素をしまうListを作る

		Connection conn = null;			//初期値を空っぽに

		try {
			// JDBCドライバを読み込む h2を使う
			Class.forName("org.h2.Driver");

			// データベースに接続する	connに値が入れられる＝接続されている状態
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/A-1/QAManagement/QADB", "sa", "momoka");

			// SELECT文を準備する		ユーザーが入れてくる情報を?にしておく
			// 絞り込み検索用SQL
			String sql = "select DISTINCT * from User JOIN Question ON User.user_id=Question.user_id LEFT JOIN Answer ON Qusetion.q_id=Answer.q_id WHERE Question.situation='対応中' ORDER BY Question.first desc";
			PreparedStatement pStmt = conn.prepareStatement(sql);		// PreparedStatementが無害化して↓


			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();


					// 次のデータ、次のデータ・・順に
			while (rs.next()) {
				AllBeans allBeans = new AllBeans();		// JavaBeansをインスタンス化してデータを入れる箱として利用
				allBeans.setUser_id(rs.getString("user_id"));
				allBeans.setName(rs.getString("name"));
				allBeans.setUser_class(rs.getString("user_class"));
				allBeans.setPosition(rs.getString("position"));
				allBeans.setR_date(rs.getTimestamp("r_date"));
				allBeans.setQ_id(rs.getInt("q_id"));
				allBeans.setSituation(rs.getString("situation"));
				allBeans.setQ_content(rs.getString("q_content"));
				allBeans.setPeople(rs.getString("people"));
				allBeans.setCategory(rs.getString("category"));
				allBeans.setFirst(rs.getInt("first"));
				allBeans.setQ_image(rs.getString("q_image"));
				allBeans.setA_id(rs.getInt("a_id"));
				allBeans.setA_content(rs.getString("a_content"));
				allBeans.setA_image(rs.getString("a_image"));

				questionList.add(allBeans);		// ArrayListに入れなおす（みんな知ってるから）
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
		return questionList;   //
	}

	//閲覧ページ未対応質問絞り込み
	public List<AllBeans> defaultYet() {

		List<AllBeans> questionList = new ArrayList<AllBeans>();  //User型の要素をしまうListを作る

		Connection conn = null;			//初期値を空っぽに

		try {
			// JDBCドライバを読み込む h2を使う
			Class.forName("org.h2.Driver");

			// データベースに接続する	connに値が入れられる＝接続されている状態
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/A-1/QAManagement/QADB", "sa", "momoka");

			// SELECT文を準備する		ユーザーが入れてくる情報を?にしておく
			// 絞り込み検索用SQL
			String sql = "select DISTINCT * from User JOIN Question ON User.user_id=Question.user_id LEFT JOIN Answer ON Qusetion.q_id=Answer.q_id WHERE Question.situation='未対応' ORDER BY Question.first desc";
			PreparedStatement pStmt = conn.prepareStatement(sql);		// PreparedStatementが無害化して↓


			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();


					// 次のデータ、次のデータ・・順に
			while (rs.next()) {
				AllBeans allBeans = new AllBeans();		// JavaBeansをインスタンス化してデータを入れる箱として利用
				allBeans.setUser_id(rs.getString("user_id"));
				allBeans.setName(rs.getString("name"));
				allBeans.setUser_class(rs.getString("user_class"));
				allBeans.setPosition(rs.getString("position"));
				allBeans.setR_date(rs.getTimestamp("r_date"));
				allBeans.setQ_id(rs.getInt("q_id"));
				allBeans.setSituation(rs.getString("situation"));
				allBeans.setQ_content(rs.getString("q_content"));
				allBeans.setPeople(rs.getString("people"));
				allBeans.setCategory(rs.getString("category"));
				allBeans.setFirst(rs.getInt("first"));
				allBeans.setQ_image(rs.getString("q_image"));
				allBeans.setA_id(rs.getInt("a_id"));
				allBeans.setA_content(rs.getString("a_content"));
				allBeans.setA_image(rs.getString("a_image"));

				questionList.add(allBeans);		// ArrayListに入れなおす（みんな知ってるから）
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
		return questionList;   //
	}

	//閲覧ページ対応済み質問絞り込み
	public List<AllBeans> defaultEnd() {

		List<AllBeans> questionList = new ArrayList<AllBeans>();  //User型の要素をしまうListを作る

		Connection conn = null;			//初期値を空っぽに

		try {
			// JDBCドライバを読み込む h2を使う
			Class.forName("org.h2.Driver");

			// データベースに接続する	connに値が入れられる＝接続されている状態
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/A-1/QAManagement/QADB", "sa", "momoka");

			// SELECT文を準備する		ユーザーが入れてくる情報を?にしておく
			// 絞り込み検索用SQL
			String sql = "select DISTINCT * from User JOIN Question ON User.user_id=Question.user_id LEFT JOIN Answer ON Qusetion.q_id=Answer.q_id WHERE Question.situation='対応済み' ORDER BY Question.first desc";
			PreparedStatement pStmt = conn.prepareStatement(sql);		// PreparedStatementが無害化して↓

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();


					// 次のデータ、次のデータ・・順に
			while (rs.next()) {
				AllBeans allBeans = new AllBeans();		// JavaBeansをインスタンス化してデータを入れる箱として利用
				allBeans.setUser_id(rs.getString("user_id"));
				allBeans.setName(rs.getString("name"));
				allBeans.setUser_class(rs.getString("user_class"));
				allBeans.setPosition(rs.getString("position"));
				allBeans.setR_date(rs.getTimestamp("r_date"));
				allBeans.setQ_id(rs.getInt("q_id"));
				allBeans.setSituation(rs.getString("situation"));
				allBeans.setQ_content(rs.getString("q_content"));
				allBeans.setPeople(rs.getString("people"));
				allBeans.setCategory(rs.getString("category"));
				allBeans.setFirst(rs.getInt("first"));
				allBeans.setQ_image(rs.getString("q_image"));
				allBeans.setA_id(rs.getInt("a_id"));
				allBeans.setA_content(rs.getString("a_content"));
				allBeans.setA_image(rs.getString("a_image"));

				questionList.add(allBeans);		// ArrayListに入れなおす（みんな知ってるから）
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
		return questionList;   //
	}

	//閲覧ページ検索結果 対応中質問絞り込み
	public List<AllBeans> searchNow(String q_content, String user_class, String category, String people) {

		List<AllBeans> questionList = new ArrayList<AllBeans>();  //User型の要素をしまうListを作る

		Connection conn = null;			//初期値を空っぽに

		try {
			// JDBCドライバを読み込む h2を使う
			Class.forName("org.h2.Driver");

			// データベースに接続する	connに値が入れられる＝接続されている状態
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/A-1/QAManagement/QADB", "sa", "momoka");

			// SELECT文を準備する		ユーザーが入れてくる情報を?にしておく
			// 絞り込み検索用SQL
			String sql = "select DISTINCT * from User JOIN Question ON User.user_id=Question.user_id LEFT JOIN Answer ON Qusetion.q_id=Answer.q_id WHERE Question.q_content LIKE ? AND User.user_class LIKE ? AND Question.people LIKE ? AND Question.category LIKE ? AND Question.situation='対応中' ORDER BY Question.first desc";
			PreparedStatement pStmt = conn.prepareStatement(sql);		// PreparedStatementが無害化して↓

			// SQL文を完成させる
			pStmt.setString(1, "%" +q_content +"%" );  //空検索で情報を全部取得
			pStmt.setString(2, "%" +user_class +"%" );
			pStmt.setString(3, "%" +people +"%" );
			pStmt.setString(4, "%" +category +"%" );

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();


					// 次のデータ、次のデータ・・順に
			while (rs.next()) {
				AllBeans allBeans = new AllBeans();		// JavaBeansをインスタンス化してデータを入れる箱として利用
				allBeans.setUser_id(rs.getString("user_id"));
				allBeans.setName(rs.getString("name"));
				allBeans.setUser_class(rs.getString("user_class"));
				allBeans.setPosition(rs.getString("position"));
				allBeans.setR_date(rs.getTimestamp("r_date"));
				allBeans.setQ_id(rs.getInt("q_id"));
				allBeans.setSituation(rs.getString("situation"));
				allBeans.setQ_content(rs.getString("q_content"));
				allBeans.setPeople(rs.getString("people"));
				allBeans.setCategory(rs.getString("category"));
				allBeans.setFirst(rs.getInt("first"));
				allBeans.setQ_image(rs.getString("q_image"));
				allBeans.setA_id(rs.getInt("a_id"));
				allBeans.setA_content(rs.getString("a_content"));
				allBeans.setA_image(rs.getString("a_image"));

				questionList.add(allBeans);		// ArrayListに入れなおす（みんな知ってるから）
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
		return questionList;   //
	}

	//閲覧ページ検索結果 未対応質問絞り込み
	public List<AllBeans> searchYet(String q_content, String user_class, String category, String people) {

		List<AllBeans> questionList = new ArrayList<AllBeans>();  //User型の要素をしまうListを作る

		Connection conn = null;			//初期値を空っぽに

		try {
			// JDBCドライバを読み込む h2を使う
			Class.forName("org.h2.Driver");

			// データベースに接続する	connに値が入れられる＝接続されている状態
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/A-1/QAManagement/QADB", "sa", "momoka");

			// SELECT文を準備する		ユーザーが入れてくる情報を?にしておく
			// 絞り込み検索用SQL
			String sql = "select DISTINCT * from User JOIN Question ON User.user_id=Question.user_id LEFT JOIN Answer ON Qusetion.q_id=Answer.q_id WHERE Question.q_content LIKE ? AND User.user_class LIKE ? AND Question.people LIKE ? AND Question.category LIKE ? AND Question.situation='対応中' ORDER BY Question.first desc";
			PreparedStatement pStmt = conn.prepareStatement(sql);		// PreparedStatementが無害化して↓

			// SQL文を完成させる
			pStmt.setString(1, "%" +q_content +"%" );  //空検索で情報を全部取得
			pStmt.setString(2, "%" +user_class +"%" );
			pStmt.setString(3, "%" +people +"%" );
			pStmt.setString(4, "%" +category +"%" );

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();


					// 次のデータ、次のデータ・・順に
			while (rs.next()) {
				AllBeans allBeans = new AllBeans();		// JavaBeansをインスタンス化してデータを入れる箱として利用
				allBeans.setUser_id(rs.getString("user_id"));
				allBeans.setName(rs.getString("name"));
				allBeans.setUser_class(rs.getString("user_class"));
				allBeans.setPosition(rs.getString("position"));
				allBeans.setR_date(rs.getTimestamp("r_date"));
				allBeans.setQ_id(rs.getInt("q_id"));
				allBeans.setSituation(rs.getString("situation"));
				allBeans.setQ_content(rs.getString("q_content"));
				allBeans.setPeople(rs.getString("people"));
				allBeans.setCategory(rs.getString("category"));
				allBeans.setFirst(rs.getInt("first"));
				allBeans.setQ_image(rs.getString("q_image"));
				allBeans.setA_id(rs.getInt("a_id"));
				allBeans.setA_content(rs.getString("a_content"));
				allBeans.setA_image(rs.getString("a_image"));

				questionList.add(allBeans);		// ArrayListに入れなおす（みんな知ってるから）
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
		return questionList;   //
	}


	//閲覧ページ検索結果 対応済み質問絞り込み
	public List<AllBeans> searchEnd(String q_content, String user_class, String category, String people) {

		List<AllBeans> questionList = new ArrayList<AllBeans>();  //User型の要素をしまうListを作る

		Connection conn = null;			//初期値を空っぽに

		try {
			// JDBCドライバを読み込む h2を使う
			Class.forName("org.h2.Driver");

			// データベースに接続する	connに値が入れられる＝接続されている状態
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/A-1/QAManagement/QADB", "sa", "momoka");

			// SELECT文を準備する		ユーザーが入れてくる情報を?にしておく
			// 絞り込み検索用SQL
			String sql = "select DISTINCT * from User JOIN Question ON User.user_id=Question.user_id LEFT JOIN Answer ON Qusetion.q_id=Answer.q_id WHERE Question.q_content LIKE ? AND User.user_class LIKE ? AND Question.people LIKE ? AND Question.category LIKE ? AND Question.situation='対応中' ORDER BY Question.first desc";
			PreparedStatement pStmt = conn.prepareStatement(sql);		// PreparedStatementが無害化して↓

			// SQL文を完成させる
			pStmt.setString(1, "%" +q_content +"%" );  //空検索で情報を全部取得
			pStmt.setString(2, "%" +user_class +"%" );
			pStmt.setString(3, "%" +people +"%" );
			pStmt.setString(4, "%" +category +"%" );

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();


					// 次のデータ、次のデータ・・順に
			while (rs.next()) {
				AllBeans allBeans = new AllBeans();		// JavaBeansをインスタンス化してデータを入れる箱として利用
				allBeans.setUser_id(rs.getString("user_id"));
				allBeans.setName(rs.getString("name"));
				allBeans.setUser_class(rs.getString("user_class"));
				allBeans.setPosition(rs.getString("position"));
				allBeans.setR_date(rs.getTimestamp("r_date"));
				allBeans.setQ_id(rs.getInt("q_id"));
				allBeans.setSituation(rs.getString("situation"));
				allBeans.setQ_content(rs.getString("q_content"));
				allBeans.setPeople(rs.getString("people"));
				allBeans.setCategory(rs.getString("category"));
				allBeans.setFirst(rs.getInt("first"));
				allBeans.setQ_image(rs.getString("q_image"));
				allBeans.setA_id(rs.getInt("a_id"));
				allBeans.setA_content(rs.getString("a_content"));
				allBeans.setA_image(rs.getString("a_image"));

				questionList.add(allBeans);		// ArrayListに入れなおす（みんな知ってるから）
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
		return questionList;   //
	}


	//質問者マイページ 対応中質問絞り込み
	public List<AllBeans> idNow(String user_id) {

		List<AllBeans> questionList = new ArrayList<AllBeans>();  //User型の要素をしまうListを作る

		Connection conn = null;			//初期値を空っぽに

		try {
			// JDBCドライバを読み込む h2を使う
			Class.forName("org.h2.Driver");

			// データベースに接続する	connに値が入れられる＝接続されている状態
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/A-1/QAManagement/QADB", "sa", "momoka");

			// SELECT文を準備する		ユーザーが入れてくる情報を?にしておく
			// 絞り込み検索用SQL
			String sql = "select DISTINCT * from User JOIN Question ON User.user_id=Question.user_id LEFT JOIN Answer ON Qusetion.q_id=Answer.q_id WHERE User.user_id=? AND Question.situation='対応中' ORDER BY Question.first desc";
			PreparedStatement pStmt = conn.prepareStatement(sql);		// PreparedStatementが無害化して↓

			// SQL文を完成させる
			pStmt.setString(1, user_id);  //空検索で情報を全部取得

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();


					// 次のデータ、次のデータ・・順に
			while (rs.next()) {
				AllBeans allBeans = new AllBeans();		// JavaBeansをインスタンス化してデータを入れる箱として利用
				allBeans.setUser_id(rs.getString("user_id"));
				allBeans.setName(rs.getString("name"));
				allBeans.setUser_class(rs.getString("user_class"));
				allBeans.setPosition(rs.getString("position"));
				allBeans.setR_date(rs.getTimestamp("r_date"));
				allBeans.setQ_id(rs.getInt("q_id"));
				allBeans.setSituation(rs.getString("situation"));
				allBeans.setQ_content(rs.getString("q_content"));
				allBeans.setPeople(rs.getString("people"));
				allBeans.setCategory(rs.getString("category"));
				allBeans.setFirst(rs.getInt("first"));
				allBeans.setQ_image(rs.getString("q_image"));
				allBeans.setA_id(rs.getInt("a_id"));
				allBeans.setA_content(rs.getString("a_content"));
				allBeans.setA_image(rs.getString("a_image"));

				questionList.add(allBeans);		// ArrayListに入れなおす（みんな知ってるから）
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
		return questionList;   //
	}

	//質問者マイページ 未対応質問絞り込み
	public List<AllBeans> idYet(String user_id) {

		List<AllBeans> questionList = new ArrayList<AllBeans>();  //User型の要素をしまうListを作る

		Connection conn = null;			//初期値を空っぽに

		try {
			// JDBCドライバを読み込む h2を使う
			Class.forName("org.h2.Driver");

			// データベースに接続する	connに値が入れられる＝接続されている状態
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/A-1/QAManagement/QADB", "sa", "momoka");

			// SELECT文を準備する		ユーザーが入れてくる情報を?にしておく
			// 絞り込み検索用SQL
			String sql = "select DISTINCT * from User JOIN Question ON User.user_id=Question.user_id LEFT JOIN Answer ON Qusetion.q_id=Answer.q_id WHERE User.user_id=? AND Question.situation='未対応' ORDER BY Question.first desc";
			PreparedStatement pStmt = conn.prepareStatement(sql);		// PreparedStatementが無害化して↓

			// SQL文を完成させる
			pStmt.setString(1, user_id);  //空検索で情報を全部取得

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();


					// 次のデータ、次のデータ・・順に
			while (rs.next()) {
				AllBeans allBeans = new AllBeans();		// JavaBeansをインスタンス化してデータを入れる箱として利用
				allBeans.setUser_id(rs.getString("user_id"));
				allBeans.setName(rs.getString("name"));
				allBeans.setUser_class(rs.getString("user_class"));
				allBeans.setPosition(rs.getString("position"));
				allBeans.setR_date(rs.getTimestamp("r_date"));
				allBeans.setQ_id(rs.getInt("q_id"));
				allBeans.setSituation(rs.getString("situation"));
				allBeans.setQ_content(rs.getString("q_content"));
				allBeans.setPeople(rs.getString("people"));
				allBeans.setCategory(rs.getString("category"));
				allBeans.setFirst(rs.getInt("first"));
				allBeans.setQ_image(rs.getString("q_image"));
				allBeans.setA_id(rs.getInt("a_id"));
				allBeans.setA_content(rs.getString("a_content"));
				allBeans.setA_image(rs.getString("a_image"));

				questionList.add(allBeans);		// ArrayListに入れなおす（みんな知ってるから）
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
		return questionList;   //
	}

	//質問者マイページ 対応済み質問絞り込み
	public List<AllBeans> idEnd(String user_id) {

		List<AllBeans> questionList = new ArrayList<AllBeans>();  //User型の要素をしまうListを作る

		Connection conn = null;			//初期値を空っぽに

		try {
			// JDBCドライバを読み込む h2を使う
			Class.forName("org.h2.Driver");

			// データベースに接続する	connに値が入れられる＝接続されている状態
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/A-1/QAManagement/QADB", "sa", "momoka");

			// SELECT文を準備する		ユーザーが入れてくる情報を?にしておく
			// 絞り込み検索用SQL
			String sql = "select DISTINCT * from User JOIN Question ON User.user_id=Question.user_id LEFT JOIN Answer ON Qusetion.q_id=Answer.q_id WHERE User.user_id=? AND Question.situation='対応済み' ORDER BY Question.first desc";
			PreparedStatement pStmt = conn.prepareStatement(sql);		// PreparedStatementが無害化して↓

			// SQL文を完成させる
			pStmt.setString(1, user_id);  //空検索で情報を全部取得

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();


					// 次のデータ、次のデータ・・順に
			while (rs.next()) {
				AllBeans allBeans = new AllBeans();		// JavaBeansをインスタンス化してデータを入れる箱として利用
				allBeans.setUser_id(rs.getString("user_id"));
				allBeans.setName(rs.getString("name"));
				allBeans.setUser_class(rs.getString("user_class"));
				allBeans.setPosition(rs.getString("position"));
				allBeans.setR_date(rs.getTimestamp("r_date"));
				allBeans.setQ_id(rs.getInt("q_id"));
				allBeans.setSituation(rs.getString("situation"));
				allBeans.setQ_content(rs.getString("q_content"));
				allBeans.setPeople(rs.getString("people"));
				allBeans.setCategory(rs.getString("category"));
				allBeans.setFirst(rs.getInt("first"));
				allBeans.setQ_image(rs.getString("q_image"));
				allBeans.setA_id(rs.getInt("a_id"));
				allBeans.setA_content(rs.getString("a_content"));
				allBeans.setA_image(rs.getString("a_image"));

				questionList.add(allBeans);		// ArrayListに入れなおす（みんな知ってるから）
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
		return questionList;   //
	}

	//回答者マイページ 対応中質問絞り込み
	public List<AllBeans> answerNow(String user_class) {

		List<AllBeans> questionList = new ArrayList<AllBeans>();  //User型の要素をしまうListを作る

		Connection conn = null;			//初期値を空っぽに

		try {
			// JDBCドライバを読み込む h2を使う
			Class.forName("org.h2.Driver");

			// データベースに接続する	connに値が入れられる＝接続されている状態
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/A-1/QAManagement/QADB", "sa", "momoka");

			// SELECT文を準備する		ユーザーが入れてくる情報を?にしておく
			// 絞り込み検索用SQL
			String sql = "select DISTINCT * from User JOIN Question ON User.user_id=Question.user_id LEFT JOIN Answer ON Qusetion.q_id=Answer.q_id WHERE User.user_class=? AND Question.situation='対応中' ORDER BY Question.first desc";
			PreparedStatement pStmt = conn.prepareStatement(sql);		// PreparedStatementが無害化して↓

			// SQL文を完成させる
			pStmt.setString(1, user_class);  //空検索で情報を全部取得

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();


					// 次のデータ、次のデータ・・順に
			while (rs.next()) {
				AllBeans allBeans = new AllBeans();		// JavaBeansをインスタンス化してデータを入れる箱として利用
				allBeans.setUser_id(rs.getString("user_id"));
				allBeans.setName(rs.getString("name"));
				allBeans.setUser_class(rs.getString("user_class"));
				allBeans.setPosition(rs.getString("position"));
				allBeans.setR_date(rs.getTimestamp("r_date"));
				allBeans.setQ_id(rs.getInt("q_id"));
				allBeans.setSituation(rs.getString("situation"));
				allBeans.setQ_content(rs.getString("q_content"));
				allBeans.setPeople(rs.getString("people"));
				allBeans.setCategory(rs.getString("category"));
				allBeans.setFirst(rs.getInt("first"));
				allBeans.setQ_image(rs.getString("q_image"));
				allBeans.setA_id(rs.getInt("a_id"));
				allBeans.setA_content(rs.getString("a_content"));
				allBeans.setA_image(rs.getString("a_image"));

				questionList.add(allBeans);		// ArrayListに入れなおす（みんな知ってるから）
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
		return questionList;   //
	}

	//回答者マイページ 対応中質問絞り込み
	public List<AllBeans> answerYet(String user_class) {

		List<AllBeans> questionList = new ArrayList<AllBeans>();  //User型の要素をしまうListを作る

		Connection conn = null;			//初期値を空っぽに

		try {
			// JDBCドライバを読み込む h2を使う
			Class.forName("org.h2.Driver");

			// データベースに接続する	connに値が入れられる＝接続されている状態
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/A-1/QAManagement/QADB", "sa", "momoka");

			// SELECT文を準備する		ユーザーが入れてくる情報を?にしておく
			// 絞り込み検索用SQL
			String sql = "select DISTINCT * from User JOIN Question ON User.user_id=Question.user_id LEFT JOIN Answer ON Qusetion.q_id=Answer.q_id WHERE User.user_class=? AND Question.situation='未対応' ORDER BY Question.first desc";
			PreparedStatement pStmt = conn.prepareStatement(sql);		// PreparedStatementが無害化して↓

			// SQL文を完成させる
			pStmt.setString(1, user_class);  //空検索で情報を全部取得

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();


					// 次のデータ、次のデータ・・順に
			while (rs.next()) {
				AllBeans allBeans = new AllBeans();		// JavaBeansをインスタンス化してデータを入れる箱として利用
				allBeans.setUser_id(rs.getString("user_id"));
				allBeans.setName(rs.getString("name"));
				allBeans.setUser_class(rs.getString("user_class"));
				allBeans.setPosition(rs.getString("position"));
				allBeans.setR_date(rs.getTimestamp("r_date"));
				allBeans.setQ_id(rs.getInt("q_id"));
				allBeans.setSituation(rs.getString("situation"));
				allBeans.setQ_content(rs.getString("q_content"));
				allBeans.setPeople(rs.getString("people"));
				allBeans.setCategory(rs.getString("category"));
				allBeans.setFirst(rs.getInt("first"));
				allBeans.setQ_image(rs.getString("q_image"));
				allBeans.setA_id(rs.getInt("a_id"));
				allBeans.setA_content(rs.getString("a_content"));
				allBeans.setA_image(rs.getString("a_image"));

				questionList.add(allBeans);		// ArrayListに入れなおす（みんな知ってるから）
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
		return questionList;   //
	}


	//回答者マイページ 対応済み質問絞り込み
	public List<AllBeans> answerEnd(String user_class) {

		List<AllBeans> questionList = new ArrayList<AllBeans>();  //User型の要素をしまうListを作る

		Connection conn = null;			//初期値を空っぽに

		try {
			// JDBCドライバを読み込む h2を使う
			Class.forName("org.h2.Driver");

			// データベースに接続する	connに値が入れられる＝接続されている状態
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/A-1/QAManagement/QADB", "sa", "momoka");

			// SELECT文を準備する		ユーザーが入れてくる情報を?にしておく
			// 絞り込み検索用SQL
			String sql = "select DISTINCT * from User JOIN Question ON User.user_id=Question.user_id LEFT JOIN Answer ON Qusetion.q_id=Answer.q_id WHERE User.user_class=? AND Question.situation='対応済み' ORDER BY Question.first desc";
			PreparedStatement pStmt = conn.prepareStatement(sql);		// PreparedStatementが無害化して↓

			// SQL文を完成させる
			pStmt.setString(1, user_class);  //空検索で情報を全部取得

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();


					// 次のデータ、次のデータ・・順に
			while (rs.next()) {
				AllBeans allBeans = new AllBeans();		// JavaBeansをインスタンス化してデータを入れる箱として利用
				allBeans.setUser_id(rs.getString("user_id"));
				allBeans.setName(rs.getString("name"));
				allBeans.setUser_class(rs.getString("user_class"));
				allBeans.setPosition(rs.getString("position"));
				allBeans.setR_date(rs.getTimestamp("r_date"));
				allBeans.setQ_id(rs.getInt("q_id"));
				allBeans.setSituation(rs.getString("situation"));
				allBeans.setQ_content(rs.getString("q_content"));
				allBeans.setPeople(rs.getString("people"));
				allBeans.setCategory(rs.getString("category"));
				allBeans.setFirst(rs.getInt("first"));
				allBeans.setQ_image(rs.getString("q_image"));
				allBeans.setA_id(rs.getInt("a_id"));
				allBeans.setA_content(rs.getString("a_content"));
				allBeans.setA_image(rs.getString("a_image"));

				questionList.add(allBeans);		// ArrayListに入れなおす（みんな知ってるから）
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
		return questionList;   //
	}


	// ！更新（変更）！
	// 対応状況を変更
	// 引数cardで指定されたレコードを更新し、成功したらtrueを返す
	public boolean update(String situation, int q_id) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/simpleBC", "sa", "");

			// SQL文を準備する			NUMBERは同じものはないから↓
			// setの中にID以外全項目入れる
			// IDが一致したデータのID以外を全て更新する仕組み
			String sql = "update Question set situation=? where q_id=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);


			// SQL文を完成させる

			pStmt.setString(1, situation);		//1つ目の?(=NAME)に入力値をいれる

			pStmt.setInt(2, q_id);

			// SQL文を実行する
			if (pStmt.executeUpdate() == 1) {		//同じNUMBERはないから1件だったらOK
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





	// ！質問を削除！
	// 引数idで指定されたレコードを削除し、成功したらtrueを返す
	public boolean delete(int id) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/A-1/QAManagement/QADB", "sa", "momoka");

			// SQL文を準備する
			String sql = "delete from Question where q_id=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, id);

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

}
