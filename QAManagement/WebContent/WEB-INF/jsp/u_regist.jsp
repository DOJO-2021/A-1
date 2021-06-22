<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員登録ページ</title>
<link rel="stylesheet" href="/QAManagement/css/style.css">
<style>
.userwrap {
	margin: 0 auto 0 auto;
	max-width: 960px;
}
</style>
</head>
<jsp:include page="footer.jsp">
	<body>


		<!-- header -->
		<header style="padding: padding 20px;">

			<imag src="" alt="QAManagement"> <a
				href="/QAManagement/login.jsp/" style="text-align: right">ログイン画面に戻る</a>
		</header>
		<h1>会員登録</h1>
		<form id="form" method="POST" action="/QAManagement">


			<div>
				<table class="userwrap">
					<tr>
						<select name="people" style="background-color: #FFEFD8">
							<option>立場選択</option>
							<option value="受講生">受講生</option>
							<option value="講師・事務局">講師・事務局</option>
						</select>
					</tr>
				</table>
			</div>


			<div>
				<table class="userwrap">
					<tr>
						<select name="user_class" style="background-color: #FFEFD8">
							<option>クラス選択</option>
							<option value="Aクラス">Aクラス</option>
							<option value="Bクラス">Bクラス</option>
							<option value="Cクラス">Cクラス</option>
							<option value="Dクラス">Dクラス</option>
							<option value="Eクラス">Eクラス</option>
							<option value="Fクラス">Fクラス</option>
							<option value="Gクラス">Gクラス</option>
							<option value="事務局">事務局</option>
						</select>
					</tr>
				</table>
			</div>


			<div>
				<table class="userwrap">
					<tr>
						<th>氏名<input type="text" name="name" placeholder="氏名"
							style="background-color: #DEEFF9">
						</th>
					</tr>
				</table>

				<table class="userwrap">
					<tr>
						<th>ID<input type="text" name="ID" placeholder="ID"
							style="background-color: #DEEFF9">
						</th>
					</tr>
				</table>

				<table class="userwrap">
					<tr>
						<th>PW<input type="password" name="PW" placeholder="PW"
							style="background-color: #DEEFF9">
						</th>
					</tr>
				</table>

				<table class="userwrap">
					<tr>
						<th>確認用PW<input type="password" name="conPW"
							placeholder="もう一度PWを入力してください" style="background-color: #DEEFF9">
						</th>
					</tr>
				</table>

				<table class="userwrap">
					<tr>
						<th>回答者用PW<input type="password" name="a_PW"
							placeholder="事前に配布したPWを入力してください"
							style="background-color: #DEEFF9">
						</th>
					</tr>
				</table>
				<p id="error_msg">
				</p>


				<input type="submit" name="REGIST" value="登録" class="userwrap"
					src="/QAManagement/login.jsp/">
			</div>
		</form>

		<p id="error_msg"></p>
		<script>
			'use strict';
			// sumitボタンが押されたら「クリックされました」というメッセージを表示
			// 登録ボタン押されたとき項目の記入がないと入力するよう警告
			// エラーメッセージ「内容をすべて入力してください」
			document.getElementById('form').onsubmit = function(event) {
				const people = document.getElementById('form').people.value;
				const user_class = document.getElementById('form').user_class.value;
				const name = document.getElementById('form').name.value;
				const ID = document.getElementById('form').ID.value;
				const PW = document.getElementById('form').PW.value;
				const conPW = document.getElementById('form').conPW.value;

				if (people === "" || user_class === "" || name === "" || ID === "" || PW === "" || conPW === "") {
					event.preventDefault();
					document.getElementById('error_msg').textContent = '内容をすべて入力してください';
				}
			};

			'use strict';
			// エラーメッセージ「PWと確認用PWが一致しません」
			document.getElementById('form').onsubmit = function(event) {
				const PW = document.getElementById('form').PW.value;
				const conPW = document.getElementById('form').conPW.value;

				if (PW !== conPW) {
					event.preventDefault();
					document.getElementById('error_msg').textContent = 'PWと確認用PWが一致しません';
				}
			};

			'use strict';
			// エラーメッセージ「回答者用PWが一致しません」
			document.getElementById('form').onsubmit = function(event) {
				const PW = document.getElementById('form').PW.value;
				const conPW = document.getElementById('form').conPW.value;

				if (PW !== conPW) {
					event.preventDefault();
					document.getElementById('error_msg').textContent = 'PWと確認用PWが一致しません';
				}
			};
		</script>


		<jsp:include page="footer.jsp" />
	</body></html>