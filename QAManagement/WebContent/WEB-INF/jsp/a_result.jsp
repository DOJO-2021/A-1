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
table{
	max-width:500px;
}
tr{
	background-color:#ffffe0;
}
</style>
<meta charset="UTF-8">
<title>QAManagement</title>
</head>
<body>
<div class="a_resultwrap">
<p>以下の内容で回答しました。</p>
<div class ="answerwrap">
<table class ="answerform">
	<tr>
		<td>返信内容<br><p>承知しました。新しいＰＣを配送しますああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ</p></td>
	</tr>
	<tr>
		<td>状態：<label>対応中</label></td>
	</tr>
</table>
<!--
<table class ="answerform">
	<tr>
		<td>返信内容<br><p><c:out value="${answer.a_content}" /></p></td>
	</tr>
	<tr>
		<td>状態：<label><c:out value="${question.situation}" /></label></td>
	</tr>
</table>
-->
<a href ="/QAManagement/SearchServlet">閲覧ページに戻る</a>
</div>
</div>
</body>
</html>