<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/QAManagement/css/style.css">
</head>

	<div style=" padding: 15px; border:1px solid">
	  <!-- ロゴ -->
	  <a href="/QAManagement/SearchServlet"><img src="image/logo_1_small_ske.png" alt="QA Management"></a>

	<!-- リスト -->
		<ul class="nav">
		  <li><a href="/QAManagement/SearchServlet">閲覧</a>
		  <!-- ↓回答者側では隠れる↓ -->
		  <li><a href="/QAManagement/question.jsp" class="hidden">質問</a></li>

		  <li><a href="/QAManagement/SearchServlet">マイページ</a></li>
		  <li><a href="/QAManagement/u_change.jsp">会員情報変更</a></li>
		  <li><a href="/QAManagement/LogOutServlet">ログアウト</a></li>

		</ul>
	</div>
</html>
