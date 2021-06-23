<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/QAManagement/css/style.css">

<style>
/*
html{
	background-color: #FFFFE0;
}
/* テーブル */
table{
	margin: 50px auto auto auto;
}

.userwrap {
   /* border:8px solid #ffa500;" */
	margin: 50px auto 0 auto;
	max-width: 960px;
	sline-height: 0;
    background: #FFFACD;
    border-style: solid;
    border-color: #F5DEB3;
    border-collapse: separate;
    border-spacing: 5px 20px;
    font-size: 25px;
}
.userwrap td{
	text-align: center;
}
/* テキストボックス */
.box {
	width: 250px;
	height: 50px;
    font-size: 20px;

}


.header {
	padding: 15px;
	border-top: 20px solid #fffacd;		/* 外枠 */
	/* border-bottom: 20px solid #fffacd;		/* 外枠 */
	background: #ffffe0;
	font-family: sans-serif;
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
			<li><a href = "/QAManagement/ChangePageServlet?FLG=会員登録">会員登録</a></li>
		</ul>
	</section>
</div>
</header>
	<main>
		<form method="POST" action="/QAManagement/LoginServlet" id="form">
			<table class="userwrap" >
				<tr>

					<td>ID</td>
					<td>
						<input type="text" name="id_input" class="box" placeholder="IDを入力してください">
						<input type="hidden" name="FLG" value="aaa">
					</td>
				</tr>

				<tr>

					<td>PW</td>
					<td>
						<input type="password" name="pw_input" class="box" placeholder="PWを入力してください">
						<!-- 空欄だった時のエラーメッセージ -->
						<!-- IDまたはPWが違います -->
						<br>${requestScope.loginErr}
						<!-- 内容をすべて入力してください -->
						<span id="l_error"></span>
					</td>
				</tr>

				<tr>
					<td colspan="2">
						<input type="submit" name="login"
						value="ログイン" class="btn-flat-border">
					</td>
				</tr>
			</table>
		</form>

	</main>



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
        <!-- footerインクルード -->
		<jsp:include page="footer.jsp" />

</html>