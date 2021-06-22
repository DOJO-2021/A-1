<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/QAManagement/css/header.css">


<div class="header">
	<!-- ロゴ -->
	<a href="/QAManagement/SearchServlet?FLG=閲覧ページへ"> <img
		src="image/logo_1_small_ske.png" alt="QA Management"></a>

	<!-- リスト -->
	<section id=head>
		<ul class="nav">
			<li><a href="/QAManagement/SearchServlet">閲覧</a> <!-- ↓回答者側では隠れる↓ -->
				<c:when test="${sessionScope.position = '受講者'} ">
					<li><a href="/QAManagement/question.jsp">質問</a></li>
				</c:when>
			<li><a href="/QAManagement/SearchServlet?FLG=マイページ">マイページ</a></li>
			<li><a href="/QAManagement/u_change.jsp">会員情報変更</a></li>
			<li><a href="/QAManagement/LogOutServlet">ログアウト</a></li>

		</ul>
	</section>
</div>