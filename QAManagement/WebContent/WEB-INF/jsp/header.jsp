<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel ="stylesheet" href="css/header.css">
<div class="header">
	<!-- ロゴ -->
	<a href="/QAManagement/SearchServlet?FLG=閲覧ページへ"> <img
		src="image/logo_ske.png" alt="QA Management" class="image"></a>

	<!-- リスト -->
	<section id=head>
		<ul class="nav">
			<li><a href="/QAManagement/LogOutServlet">ログアウト</a></li>
			<li><a href="/QAManagement/ChangePageServlet?FLG=会員情報変更">会員情報変更</a></li>
			<c:if test="${sessionScope.user.position == '受講生'}">
			<li><a href="/QAManagement/SearchServlet?MYFLG=マイページ">マイページ</a></li>
			</c:if>
			<c:if test="${sessionScope.user.position == '講師・事務局'}">
			<li><a href="/QAManagement/SearchServlet?MYFLG=マイページ">マイページ</a></li>
			</c:if>
			<li><a href="/QAManagement/SearchServlet">閲覧</a>

			<!-- ↓回答者側では隠れる↓ -->
			<c:if test="${sessionScope.user.position == '受講生'}">
			<li><a href="/QAManagement/ChangePageServlet?FLG=質問">質問</a></li>
			</c:if>


		</ul>
	</section>
</div>
</head>
</html>