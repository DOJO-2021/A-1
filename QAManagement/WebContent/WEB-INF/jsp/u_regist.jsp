<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員登録ページ</title>
<link rel="stylesheet" href="/QAManagement/css/style.css">
<style>
@import url('https://fonts.googleapis.com/css?family=M+PLUS+Rounded+1c');

/* テーブル */
.userwrap {
	margin: 30px auto 30px auto;
	max-width: 960px;
	sline-height: 0;
  background: #FFFACD;
  border-style: solid;
  border-color: #F5DEB3;
  border-collapse: collapse;
  border-spacing: 5px 20px;

}

td, th {
padding: 10px 20px;
}
.userwrap th{
	text-align: right;
}
.userwrap td{
	text-align: left;
}

/* ヘッダー */
.header {
	padding: 15px;
	border-top: 20px solid #fffacd;		/* 外枠 */
	background: #ffffe0;
	font-family: 'M PLUS Rounded 1c', sans-serif;;
}

#head ul {
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}
#head ul li{
	margin: 40px 30px 10px 0;
	padding: 10px 0;
	float: right;
	text-align: right;
	font-size: 17px;
	color: #556B2F;
}
.nav a:link {
	color: #8D4F42;
	text-decoration: none;
	font-size: 17px;
}
.nav a:hover {
	color: #D2691E;
	text-decoration: none;
	font-size: 17px;
}
.image {
	width: 125px;
	float: left;
	padding-left: 20px;
}

main{
	color: #583822;
	text-align: center;
}


/* ボタン */
.btn-flat-border {
  display: inline-block;
  padding: 0.3em 1em;
  text-decoration: none;
  color: #F8EAD1;
  border: solid 2px #E2A654;
  border-radius: 3px;
  transition: .4s;
  background: #E2A654;
}
.btn-flat-border:hover {
  background: #EBCAA3;
  color: #644111;
}

</style>
</head>
	<body>
	<header>
		<div class="header">
			<!-- ロゴ -->
			<img src="logo_ske.png" alt="QA Management" class="image">
			<!-- リスト -->
			<section id=head>
				<ul class="nav">
					<li><a href="/QAManagement/LogOutServlet">ログインページに戻る</a></li>
				</ul>
			</section>
		</div>
	</header>
		<h1>会員登録</h1>
		<form method="POST" action="/QAManagement/RegistServlet" id="form">
			<div>
				<table class="userwrap">
				<tr>
					<th> </th>
					<td><select name="position" style="background-color: #FFEFD8; width : 180px;">
							<option>立場選択</option>
							<option value="受講生">受講生</option>
							<option value="講師・事務局">講師・事務局</option>
					</select></td>
				</tr>

				<tr>
					<th> </th>
					<td><select name="user_class"
						style="background-color: #FFEFD8; width : 180px;">
							<option>クラス選択</option>
							<option value="Aクラス">Aクラス</option>
							<option value="Bクラス">Bクラス</option>
							<option value="Cクラス">Cクラス</option>
							<option value="Dクラス">Dクラス</option>
							<option value="Eクラス">Eクラス</option>
							<option value="Fクラス">Fクラス</option>
							<option value="Gクラス">Gクラス</option>
							<option value="事務局">事務局</option>
					</select></td>
				</tr>
					<tr>
					<th>氏名</th>
						<td><input type="text" name="name" placeholder="氏名"
						style="width : 240px; background-color: #DEEFF9;"></td>

				</tr>

				<tr>
					<th>ID</th>
						<td><input type="text" name="user_id" placeholder="ID"
						style="width : 240px; background-color: #DEEFF9;"> </td>

				</tr>

				<tr>

					<th>PW</th>
						<td><input type="password" name="user_pw" placeholder="PW"
						style="width : 240px; background-color: #DEEFF9;"> </td>

				</tr>

				<tr>

					<th>確認用PW</th>
						<td><input type="password" name="conPW"
						placeholder="もう一度PWを入力してください" style="width : 240px; background-color: #DEEFF9;"></td>

				</tr>

				<tr>
					<th>回答者用PW</th>
						<td><input type="password" name="a_PW"
						placeholder="事前に配布したPWを入力してください" disabled
						style="width : 240px; background-color: #DEEFF9; "></td>

				</tr>

					<tr>
						<th>確認用PW<input type="password" name="conPW"
							placeholder="もう一度PWを入力してください" style="background-color: #DEEFF9">
						</th>
					</tr>

					<tr>
						<th>回答者用PW<input type="password" name="a_PW"
							placeholder="事前に配布したPWを入力してください"
							disabled
							style="background-color: #DEEFF9">
						</th>
					</tr>
				</table>

				<input type ="submit" id ="button" class="btn-flat-border" name ="regist_button" value ="会員登録" onclick="return checkUser()" >
				<p id="error_msg">
				<p id="error_msg1">
				<p id="error_msg2">
				</p>

			</div>
		</form>
		<p id="error_msg"></p>
		<script>
		// sumitボタンが押されたら「クリックされました」というメッセージを表示
		// 登録ボタン押されたとき項目の記入がないと入力するよう警告
		    // エラーメッセージ「内容をすべて入力してください」
	//		document.getElementById('form').onsubmit=function(event) {
			function checkUser(){
				const position = document.getElementById('form').position.value;
				const user_class = document.getElementById('form').user_class.value;
				const name = document.getElementById('form').name.value;
				const user_id = document.getElementById('form').user_id.value;
				const user_pw = document.getElementById('form').user_pw.value;
				const conPW = document.getElementById('form').conPW.value;
				const a_PW = document.getElementById('form').a_PW.value;
				let count = 0;
				if (position === "" || user_class === "" || name === "" || user_id === "" || user_pw === "" || conPW === ""){
					event.preventDefault();
					document.getElementById('error_msg').textContent = `内容をすべて入力してください`;
					count += 1;
				}
				if(user_pw.trim() !== ""){
					if (user_pw !== conPW) {
						event.preventDefault();
						document.getElementById('error_msg1').textContent = `PWと確認用PWが一致しません`;
						count += 1;
					}
				}
				if(position === '講師・事務局'){
					if (a_PW !== 'password') {
						event.preventDefault();
						document.getElementById('error_msg2').textContent = `回答者用パスワードが一致しません`;
						a_PW.disabled = false;
						count += 1;
					}
				}
				if(count===0){
					return true;
				}else{
					return false;
				}
			}
			document.getElementById('form').onchange = function(event){
				const position = document.getElementById('form').position.value;
				const a_PW = document.getElementById('form').a_PW;
				if(position === '講師・事務局'){
					a_PW.disabled = false;
				}else{
					a_PW.disabled = true;
				}
			}
			/*
			// エラーメッセージ「PWと確認用PWが一致しません」
			document.getElementById('form').onsubmit = function(event) {
				const user_pw = document.getElementById('form').user_pw.value;
				const conPW = document.getElementById('form').conPW.value;
				if (user_pw !== conPW) {
					event.preventDefault();
					document.getElementById('error_msg').textContent = `PWと確認用PWが一致しません`;
				}
			}
			//回答者用パスワードがあっているか確認
			document.getElementById('form').onsubmit = function(event) {
				const a_PW = document.getElementById('form').a_PW.value;
				const position = document.getElementById('form').position.value;
				if(position === '講師・事務局'){
					if (a_PW !== 'password') {
						event.preventDefault();
						document.getElementById('error_msg').textContent = `回答者用パスワードが一致しません`;
					}
				}
			}
			document.getElementById('form').onchange = function(event){
				const position = document.getElementById('form').position.value;
				const a_PW = document.getElementById('form').a_PW;
				if(position === '講師・事務局'){
					a_PW.disabled = false;
				}else{
					a_PW.disabled = true;
				}
			}
			*/
		</script>
</body>
</html>