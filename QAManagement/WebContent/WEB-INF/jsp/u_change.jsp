<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QAManagement</title>
<style>

h2{
	text-align: center;
}

body {
	color: #583822;
}
.userwrap {
	margin: 0 auto;
	margin-top: 50px;
	max-width: 500px;
	background-color: #fffacd;
	padding-bottom: 20px;
	border-style: solid;
  border-color: #f5deb3;

}

.btn-flat-border {
  display: inline-block;
  padding: 0.3em 1em;
  text-decoration: none;
  color: #f8ead1;
  border: solid 2px #e2a654;
  border-radius: 3px;
  transition: .4s;
  background: #e2a654;
  margin-top: 30px;
}

.btn-flat-border:hover {
  background: #ebcaa3;
  color: #644111;
}



table {
	margin-top: 30px;
	margin-left: auto;
	margin-right: auto;
}

#pw_error {
	color: #ff0000;
	text-align: right;
}

#form_error {
	color: #ff0000;
	text-align: right;
}
</style>
</head>
<jsp:include page="header.jsp"/>
<body>
	<h2>会員情報変更</h2>
	<div class="userwrap">
		<form method="POST" action="/QAManagement/UpdateServlet" id="form">
			<table>
				<tr>
					<th>所属クラス</th>
					<td><label> <select name="new_class">
								<option value="A">Aクラス</option>
								<option value="B">Bクラス</option>
								<option value="C">Cクラス</option>
								<option value="D">Dクラス</option>
								<option value="E">Eクラス</option>
								<option value="F">Fクラス</option>
								<option value="G">Gクラス</option>
								<option value="事務局">事務局</option>
						</select>
					</label></td>
				</tr>
				<tr>
					<th>氏名</th>
					<td><input type="text" name="new_name"></td>
				</tr>
				<tr>
					<th>変更後パスワード</th>
					<td><input type="password" name="new_pw"></td>
				</tr>
				<tr>
					<th>変更後パスワード確認</th>
					<td><input type="password" name="con_pw"></td>
				</tr>
				<tr>
				<th colspan="2">
					<input type="submit" value="変更" name="change_button" class="btn-flat-border">
				</th>
				</tr>
			</table>
<input type="hidden" name = "user_id" value = "${sessionScope.user.user_id}" />
		</form>
		<p id="pw_error"></p>
		<p id="form_error"></p>
	</div>
</body>

<!-- footerインクルード -->
<jsp:include page="footer.jsp" />

<script>
	'use strict';
	//変更ボタン押下時エラー
	document.getElementById('form').onsubmit = function(event) {
		const new_name = document.getElementById('form').new_name.value;
		const new_pw = document.getElementById('form').new_pw.value;
		const con_pw = document.getElementById('form').con_pw.value;
		if (new_pw === "" || con_pw === "" || new_name === "") {
			event.preventDefault();
			document.getElementById('form_error').textContent = '※内容をすべて入力してください';
		} else if (new_pw !== con_pw) {
			event.preventDefault();
			document.getElementById('pw_error').textContent = '※パスワードが一致しません';
		}
	};
</script>
</html>
