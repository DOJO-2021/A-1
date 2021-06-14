<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QAManagement</title>
<style>
body{
	background-color:#e6e6fa;
}
h2{
	padding-left:50px;
	padding-top:50px;
}
table{
	max-width:500px;
}
.mt{
	padding:15px;
}
label{
	margin-right:20px;
}
input[name=rp_reply]{
	width:300px;
	height:300px;
}
.answerform{
	position:fixed;
	right:50px;
	top:150px;
	z-index: 100;
	background-color:#ffd700;
}
.qatable{
	margin:50px 50px;
	background-color:#ffd700;
}
.qatable tr{
	background-color:#ffffe0;
}
.situation{
	padding:3px;
	background-color:#ffffe0;
	border:solid 1px #999999;
}
</style>
</head>
<body>
<h2>回答ページ</h2>
<table class="qatable">
	<tr>
		<td class ="mt">クラス：<label>A</label>相手：<label>事務局</label>名前：<label>近藤隆矢</label></td>
	</tr>
	<tr>
		<td class ="mt">優先度：<label>3</label>カテゴリー：<label>機材</label></td>
	</tr>
	<tr>
		<td class ="mt">質問内容<div class = "qcontent"><p>ｐｃトラブルで講義が受けられません。どの様に対処すればよいですか</p></div></td>
	</tr>
	<tr>
		<td class ="mt">回答内容<div class = "qcontent"><p>承知しました。新しいＰＣを配送しますああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ</p></div></td>
	</tr>
	<!--
	<tr>
		<td class ="mt">クラス：<label><c:out value="${question.classes}" /></label>相手：<label>相手<c:out value="${question.people}" /></label>名前：<label>名前<c:out value="${question.name}" /></label</td>
	</tr>
	<tr>
		<td class ="mt">優先度：<label><c:out value="${question.first}" /></label>カテゴリー：<label><c:out value="${question.category}" /></label></td>
	</tr>
	<tr>
		<td class ="mt">質問内容<div class = "qcontent"><p><c:out value="${question.q_content}" /></p></div></td>
	</tr>
	<c:forEach var = "e" items = "${answerList}">
	<tr>
		<td class ="mt">回答内容<div class = "qcontent"><p><c:out value="${answer.a_content}" /></p></div></td>
	</tr>
	</c:forEach>
-->
</table>
<div class ="answerwrap">
<form method="POST" action="/QAManagement/RegistServlet">
<table class ="answerform">
	<tr>
		<td>返信内容<br><textarea name="rp_reply" rows="10" cols="100">返信内容</textarea></td>
	</tr>
	<tr>
		<td>
		<p>
			<label class ="situation"><input type="radio" name="situation" value="rp_now"> 対応中</label>
			<label class ="situation"><input type="radio" name="situation" value="rp_complete"> 対応完了</label>
		</p>
		</td>
	</tr>
	<tr>
		<td><input type="submit" name="rp_button" value="返信する"></td>
	</tr>
</table>
</form>
</div>
</body>
</html>