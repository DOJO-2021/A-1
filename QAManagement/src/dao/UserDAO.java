package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;			// ※ArrayListはListを継承している
import java.util.List;

import model.User;	// この先はmodel.UserをUserとよぶ

public class UserDAO {
	// ログインできるならtrueを返す

    // ログイン
	public User login(String id, String pw) { //サーブレットから引数で渡される
		Connection conn = null;			//初期値を空っぽに
        User user = null;
		try {
			// JDBCドライバを読み込む h2を使う
			Class.forName("org.h2.Driver");

			// データベースに接続する	connに値が入れられる＝接続されている状態
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/A-1/QAManagement/QADB", "sa", "momoka");

			// SELECT文を準備する		ユーザーが入れてくる情報を?にしておく
			// ログイン用SQL
			String sql = "select * from User where user_id = ? and user_pw = ?";		// countが1件ならいい
			PreparedStatement pStmt = conn.prepareStatement(sql);		// PreparedStatementが無害化して↓
			pStmt.setString(1, id);		// 1番目の?マークにユーザーが入れたidを入れる(サーブレットからもらった)
			pStmt.setString(2, pw);		// 2番目の?マークにユーザーが入れたpwを入れる

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// ユーザーIDとパスワードが一致するユーザーがいたかどうかをチェックする
					// 次のデータ、次のデータ・・順に
			if (rs.next()) {	// 1件でもあれば実行される
	           user = new User();
	           user.setUser_id(rs.getString("user_id"));
	           user.setName(rs.getString("name"));
	           user.setUser_class(rs.getString("user_class"));
	           user.setPosition(rs.getString("position"));
	           user.setR_date(rs.getTimestamp("r_date"));
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
		return user;   // 情報を格納したuserをかえす
	}


	// 個人絞り込み検索
	public List<User> userFilter(String name) {

		List<User> userList = new ArrayList<User>();  //User型の要素をしまうListを作る

		Connection conn = null;			//初期値を空っぽに

		try {
			// JDBCドライバを読み込む h2を使う
			Class.forName("org.h2.Driver");

			// データベースに接続する	connに値が入れられる＝接続されている状態
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/A-1/QAManagement/QADB", "sa", "momoka");

			// SELECT文を準備する		ユーザーが入れてくる情報を?にしておく
			// 絞り込み検索用SQL
			String sql = "select * from User where name = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);		// PreparedStatementが無害化して↓
			pStmt.setString(1, "%" + name + "%");		// 1番目の?マークにユーザーが入れたnameを入れる User型

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();


					// 次のデータ、次のデータ・・順に
			while (rs.next()) {
				User user = new User();		// JavaBeansをインスタンス化してデータを入れる箱として利用
		        user.setUser_id(rs.getString("user_id"));
		        user.setName(rs.getString("name"));
		        user.setUser_class(rs.getString("user_class"));
		        user.setPosition(rs.getString("position"));
		        user.setR_date(rs.getTimestamp("r_date"));

				userList.add(user);		// ArrayListに入れなおす（みんな知ってるから）
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
		return userList;   //
	}


	// 登録
	public boolean insert(String user_id, String user_pw, String name, String user_class, String position) {
		Connection conn = null;
		boolean result = false;		//成功したらtrueに書き換える

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/A-1/QAManagement/QADB", "sa", "momoka");

			// SQL文を準備する

			String sql = "insert into User values (?, ?, ?, ?, ?, CURRENT_TIMESTAMP)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる

				pStmt.setString(1, user_id);		//1つ目の?(=NAME)に入力値をいれる

				pStmt.setString(2, user_pw);

				pStmt.setString(3, name);

				pStmt.setString(4, user_class);

				pStmt.setString(5, position);



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


    // 更新
	public boolean update(String user_id, String user_pw, String name, String user_class, String position, Timestamp r_date) {
		Connection conn = null;
		boolean result = false;		//成功したらtrueに書き換える

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/A-1/QAManagement/QADB", "sa", "momoka");

			// SQL文を準備する

			String sql = "update User set user_pw=?, name=?, user_class=? where user_id=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる

				pStmt.setString(1, user_pw);		//1つ目の?(=NAME)に入力値をいれる

				pStmt.setString(2, name);

				pStmt.setString(3, user_class);

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

}

