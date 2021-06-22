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
<jsp:include page="header.jsp"/>
<body>
<h2>回答ページ</h2>
<table class="qatable">
	<tr>
		<td class ="mt">クラス：<label><c:out value="${answerList[0].user_class}" /></label>相手：<label>相手<c:out value="${answerList[0].people}" /></label>名前：<label>名前<c:out value="${answerList[0].name}" /></label></td>
	</tr>
	<tr>
		<td class ="mt">優先度：<label><c:out value="${answerList[0].first}" /></label>カテゴリー：<label><c:out value="${answerList.[0]category}" /></label></td>
	</tr>
	<tr>
		<td class ="mt">質問内容<div class = "qcontent"><p><c:out value="${answerList[0].q_content}" /></p></div></td>
	</tr>
	<c:forEach var = "e" items = "${answerList}">
	<tr>
		<td class ="mt">回答内容<div class = "qcontent"><p><c:out value="${e.a_content}" /></p></div></td>
	</tr>
	</c:forEach>
</table>
<div class ="answerwrap">
<form id="a_form" method="POST" action="/QAManagement/RegistServlet">
<table class ="answerform">
	<tr>
		<td>返信内容<br><textarea name="rp_reply" rows="10" cols="100">返信内容</textarea></td>
	</tr>
	<tr>
		<td>
		<p>
			<label class ="situation"><input type="radio" name="situation" value="対応中"> 対応中</label>
			<label class ="situation"><input type="radio" name="situation" value="対応完了"> 対応完了</label>
		</p>
		</td>
	</tr>
	<tr>
		<td><input type="submit" name="rp_button" value="回答登録"></td>
	</tr>
	<tr>
		<td><p id="form_error"></p></td>
	</tr>
</table>
</form>
</div>
</body>
<jsp:include page="footer.jsp"/>
<script>
'use strict';
//変更ボタン押下時エラー
document.getElementById('a_form').onsubmit = function(event){
  const rp_reply = document.getElementById('a_form').rp_reply.value;
  if(rp_reply === ""){
  	event.preventDefault();
 	document.getElementById('form_error').textContent = '※回答内容を入力してください';
  }
};

</script>
</html>