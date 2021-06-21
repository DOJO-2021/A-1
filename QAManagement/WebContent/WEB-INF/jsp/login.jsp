<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/QAManagement/css/style.css">

<style>
.userwrap {
	margin: 0 auto 0 auto;
	max-width: 960px;
}
/*  */
.box {
	width: 250px;
	height: 50px;
}
</style>

</head>
<body>
	<main>

		<form method="POST" action="/QAManagement/LoginServlet" id="form">
			<table class="userwrap">
				<tr>
					<th>ID</th>
					<td><input type="text" name="id_input" class="box"><br></td>
				</tr>

				<tr>
					<th>PW</th>
					<td><input type="password" name="pw_input" class="box"><br>
						<!-- 空欄だった時のエラーメッセージ -->
						<!-- IDまたはPWが違います -->
						<p>${requestScope.loginErr}</p>
						<!-- 内容をすべて入力してください -->
						<p id="l_error"></p></td>
				</tr>

				<tr>
					<td><input type="submit" class="login" name="login"
						value="ログイン"></td>
				</tr>
			</table>
		</form>

	</main>

	<footer class="footer">
		<jsp:include page="/footer.jsp" />
		<!-- footerインクルード -->
	</footer>



	<script>
		'use strict';
		//ログインボタン押されたとき必須項目の記入がないと必須項目を入力するよう警告
		document.getElementById('form').onsubmit = function(event) {
			const id_input = document.getElementById('form').id_input.value;
			const pw_input = document.getElementById('form').pw_input.value;

			if (id_input === "" || pw_input === "") {
				event.preventDefault();
				document.getElementById('l_error').textContent = 'IDまたはPWが違います';
			}
		};
	</script>

</body>
</html>