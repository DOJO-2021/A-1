<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QAManagement</title>
<style>
.u_result {
	width: 500px;
	height: 300px;
	background-color: #ffffe0;
	margin: auto;
}

p {
	text-align: center;
}
</style>
</head>
<body>
<a href = "/QAManagement/LoginServlet">ログイン画面へ</a>
	<div class="u_result">
		<p>${requestScope.u_registErr}</p>
	</div>
</body>
<!-- footerインクルード -->
<jsp:include page="footer.jsp" />
</html>