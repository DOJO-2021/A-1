<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/QAManagement/css/style.css">
<style>
.answerform{
	background-color:#ffd700;
}

tr{
	background-color:#ffffe0;
}

</style>
<meta charset="UTF-8">
<title>QAManagement</title>
</head>
<jsp:include page="header.jsp"/>
<body>
<div class="a_resultwrap">
<p><c:out value="${message}"></c:out></p>
<div class ="answerwrap">
<table class ="answerform">
	<tr>
		<td width="100" height="40">返信内容</td>
    <td width="100" height="40"><p><c:out value="${a_content}" /></p></td>
	</tr>
	<tr>
		<td width="100" height="40">状態：</td>
    <td width="100" height="40"><c:out value="${situation}" /></td>
	</tr>
</table>
<a href ="/QAManagement/SearchServlet?FLG=閲覧ページへ">閲覧ページに戻る</a>
</div>
</div>
</body>
<jsp:include page="footer.jsp"/>
</html>
