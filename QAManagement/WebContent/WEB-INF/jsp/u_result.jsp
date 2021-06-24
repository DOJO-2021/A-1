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
<!-- headerインクルード -->
<jsp:include page="header.jsp"/>
<body>
<a href = "/QAManagement/LoginServlet">ログイン画面へ</a>
	<div class="u_result">
		<p class="massage">${requestScope.u_registErr}</p>
		<p>${requestScope.message}</p>
	</div>
</body>
<!-- footerインクルード -->
<jsp:include page="footer.jsp" />
</html>