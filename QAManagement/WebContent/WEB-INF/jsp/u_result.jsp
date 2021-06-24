<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QAManagement</title>
<style>

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

.u_result {
	width: 500px;
	height: 300px;
	background: #FFFACD;
	border-style: solid;
	border-color: #F5DEB3;
	margin: auto;
}

.massage {
	text-align: center;
	padding-top: 120px;
}
</style>
</head>

<body>
	<header>
		<div class="header">
			<!-- ロゴ -->
			<img src="image/logo_ske.png" alt="QA Management" class="image">
			<!-- リスト -->
			<section id=head>
				<ul class="nav">
					<li><a href="/QAManagement/LogOutServlet">ログインページに戻る</a></li>
				</ul>
			</section>
		</div>
	</header>


	<div class="u_result">
		<p class="massage">${requestScope.u_registErr}</p>
		<p>${requestScope.message}</p>
	</div>
</body>
<!-- footerインクルード -->
<jsp:include page="footer.jsp" />
</html>