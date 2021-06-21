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

<body>


	<!-- header -->
	<header style="padding: padding 20px;">

		<imag src="" alt="QAManagement"> <a href="ログインページ" style="text-align:right">ログイン画面に戻る</a>
	</header>
	<h1>会員登録</h1>
	<form method="POST" action="/QAManagement">


		<div>
			<table class="userwrap">
				<tr>
					<select name="people" style="background-color: #FFEFD8">
						<option value="立場選択">立場選択</option>
						<option value="受講生">受講生</option>
						<option value="講師・事務局">講師・事務局</option>
					</select>
				</tr>
			</table>
		</div>


		<div>
			<table class="userwrap">
				<tr>
					<select name="class" style="background-color: #FFEFD8">
						<option value="クラス選択">クラス選択</option>
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
					<th>確認用PW<input type="password" name=""
						placeholder="もう一度PWを入力してください
" style="background-color: #DEEFF9">
					</th>
				</tr>
			</table>

			<table class="userwrap">
				<tr>
					<th>回答者用PW<input type="password" name=""
						placeholder="事前に配布したPWを入力してください
"
						style="background-color: #DEEFF9">
					</th>
				</tr>
			</table>


			<input type="submit" name="REGIST" value="登録" class="userwrap">
		</div>
	</form>

	<p id="error_msg"></p>
	<script>
		'use strict';

		/* sumitボタンが押されたら「クリックされました」というメッセージを表示 */
		document.getElementById('form').onsubmit = function(event) {
			/* もしも、IDかPWが未入力なら、デフォルト動作を行わず、
			空であることの比較の例 data ==""
			警告ダイアログに「IDとPWを入力してください」と表示する */
			const id = document.getElementById('form').ID.value;
			const pw = document.getElementById('form').PW.value;
			if (id === "" || pw === "") {
				event.preventDefault();
				/* 「IDとPWを入力してください！」をWebページ上に表示する */
				//window.alert('IDとPWを入力してください！')
				document.getElementById('error_msg').textContent = `IDとPWを入力してください！`;
			}
		};
	</script>

</body>
</html>