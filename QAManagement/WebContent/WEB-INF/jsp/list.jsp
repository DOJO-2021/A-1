<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.searchform {
	position: fixed left:50px;
	top: 150px;
	z-index: 100;
}

.list {
	margin: 0;
	position: absolute;
	top: 20%;
	left: 30%;
	margin-right: -30%;
	transform: translate(-30%, -30%) width:500px;
}

.line {
	position: relative;
	background: #fff0cd;
	box-shadow: 0px 0px 0px 5px #fff0cd;
	border: dashed 2px white;
	padding: 0.2em 0.5em;
	color: #454545;
}

.line:after {
	position: absolute;
	content: '';
	right: -7px;
	top: -7px;
	border-width: 0 15px 15px 0;
	border-style: solid;
	border-color: #ffdb88 #fff #ffdb88;
	box-shadow: -1px 1px 1px rgba(0, 0, 0, 0.15);
}

table {
	width: 800px;
}
</style>
</head>
<body>
	<h1>質問一覧</h1>
	<div class="qwrap">
		<div class="qs">
			<div class="searchform">
				<form method="POST" action="/Searchservlet">
					<table>
						<tr>
							<td><label><input type="text" name="content"
									placeholder="ああああああ"></label><br></td>
						</tr>
						<tr>
							<td><select name="people">
									<option>質問相手を選択</option>
									<option value="講師">講師</option>
									<option value="事務局">事務局</option>
							</select><br></td>
						</tr>
						<tr>
							<td><select name="class">
									<option>クラスを選択</option>
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
									<option value="F">F</option>
									<option value="G">G</option>
							</select><br></td>
						</tr>
						<tr>
							<td><select name="category">
									<option>カテゴリーを選択</option>
									<option value="機材関係">機材関係</option>
									<option value="用語">用語</option>
									<option value="コーディング">コーディング</option>
									<option value="事務局">事務局</option>
									<option value="その他">その他</option>
							</select><br></td>
						</tr>
						<tr>
							<td><input type="submit" name="search" value="検索ボタン">
							</td>
						</tr>
					</table>
				</form>

			</div>
		</div>
	</div>
	<div class="list">
		<c:forEach var="e" items="${questionNowList}">
			<form method="GET" action="/QAManagement/SearchServlet">
				<table class="line">
					<tr>
						<td><strong>${e.user_class}</strong><input type="hidden" name="user_id" value="${e.user_class}"><br></td>

						<td><strong>${e.people}</strong><input type="hidden" name="people" value="${e.people}"><br></td>
						<c:when test="${sessionScope.user.position != 受講者}">
							<td><strong>${e.name}</strong><input type="hidden" name="name" value="${e.name}"><br></td>
						</c:when>
						<td><strong>${e.category}</strong><input type="hidden" name="category"
							value="{e.category}"><br></td>

						<td><strong>${e.first}</strong><input type="hidden" name="first"
							value="${e.first}"><br></td>
						<td><input type="checkbox" name="syousai">詳細</td>

						<td><input type="submit" name="answer" value="回答"></td>
					</tr>
				</table>
			</form>

			<div class="hidden">
				<table class="line">
					<tr>
						<td><strong>{e.q_content}</strong><input type="hidden" name="q_content"
							value="{e.q_content}"><br></td>
						<td class="delete"><input type="submit"
							name="q_delete_button" value="質問削除"></td>
					</tr>
					<c:if test = "items = ${e.q_image != null }">
					<tr>
						<td><strong>{e.q_image}</strong><input type="hidden" name=""
							value=""><br></td>
					</tr>
					</c:if>
				</table>
				<c:forEach var="f" items="${answerList}">
					<form>
					<c:if test = "items = ${e.q_id == f.q_id }">
						<table class="line">
							<tr>
								<c:when test="${requestScope.user.position != 受講者}">
								<td></td>
								</c:when>
								<td><strong>{f.a_content}</strong><input type="hidden" name=""
									value="{f.a_content}"><br></td>
							</tr>
							<tr>
								<td><strong>{f.a_image}</strong><input type="hidden" name=""
									value="{f.a_image}"><br></td>
							</tr>
						</table>
						</c:if>
					</form>
					<hr>
				</c:forEach>
				</div>
		</c:forEach>
	</div>

		<div class="list">
		<c:forEach var="g" items="${questionYetList}">
			<form method="GET" action="/QAManagement/SearchServlet">
				<table class="line">
					<tr>
						<td><strong>${g.user_class}</strong><input type="hidden" name="user_id" value="${g.user_class}"><br></td>

						<td><strong>${g.people}</strong><input type="hidden" name="people" value="${g.people}"><br></td>
						<c:when test="${sessionScope.user.position != 受講者}">
							<td><strong>${g.name}</strong><input type="hidden" name="name" value="${g.name}"><br></td>
						</c:when>
						<td><strong>${g.category}</strong><input type="hidden" name="category"
							value="{g.category}"><br></td>

						<td><strong>${g.first}</strong><input type="hidden" name="first"
							value="${g.first}"><br></td>
						<td><input type="checkbox" name="syousai">詳細</td>

						<td><input type="submit" name="answer" value="回答"></td>
					</tr>
				</table>
			</form>

			<div class="hidden">
				<table class="line">
					<tr>
						<td><strong>{g.q_content}</strong><input type="hidden" name="q_content"
							value="{g.q_content}"><br></td>
						<td class="delete"><input type="submit"
							name="q_delete_button" value="質問削除"></td>
					</tr>
					<c:if test = "items = ${g.q_image != null }">
					<tr>
						<td><strong>{g.q_image}</strong><input type="hidden" name=""
							value=""><br></td>
					</tr>
					</c:if>
				</table>
				<c:forEach var="h" items="${answerList}">
					<form>
					<c:if test = "items = ${g.q_id == h.q_id }">
						<table class="line">
							<tr>
								<c:when test="${requestScope.user.position != 受講者}">
								<td></td>
								</c:when>
								<td><strong>{h.a_content}</strong><input type="hidden" name=""
									value="{h.a_content}"><br></td>
							</tr>
							<tr>
								<td><strong>{h.a_content}</strong><input type="hidden" name=""
									value="{h.a_image}"><br></td>
							</tr>
						</table>
						</c:if>
					</form>
					<hr>
				</c:forEach>
				</div>
		</c:forEach>
	</div>

			<div class="list">
		<c:forEach var="i" items="${questionEndList}">
			<form method="GET" action="/QAManagement/SearchServlet">
				<table class="line">
					<tr>
						<td><strong>${i.user_class}</strong><input type="hidden" name="user_id" value="${i.user_class}"><br></td>

						<td><strong>${i.people}</strong><input type="hidden" name="people" value="${i.people}"><br></td>
						<c:when test="${sessionScope.user.position != 受講者}">
							<td><strong>${i.name}</strong><input type="hidden" name="name" value="${i.name}"><br></td>
						</c:when>
						<td><strong>${i.category}</strong><input type="hidden" name="category"
							value="{i.category}"><br></td>

						<td><strong>${i.first}</strong><input type="hidden" name="first"
							value="${i.first}"><br></td>
						<td><input type="checkbox" name="syousai">詳細</td>

						<td><input type="submit" name="answer" value="回答"></td>
					</tr>
				</table>
			</form>

			<div class="hidden">
				<table class="line">
					<tr>
						<td><strong>{i.q_content}</strong><input type="hidden" name="q_content"
							value="{i.q_content}"><br></td>
						<td class="delete"><input type="submit"
							name="q_delete_button" value="質問削除"></td>
					</tr>
					<c:if test = "items = ${g.q_image != null }">
					<tr>
						<td><strong>{i.q_image}</strong><input type="hidden" name=""
							value=""><br></td>
					</tr>
					</c:if>
				</table>
				<c:forEach var="j" items="${answerList}">
					<form>
					<c:if test = "items = ${i.q_id == j.q_id }">
						<table class="line">
							<tr>
								<c:when test="${requestScope.user.position != 受講者}">
								<td></td>
								</c:when>
								<td><strong>{j.a_content}</strong><input type="hidden" name=""
									value="{j.a_content}"><br></td>
							</tr>
							<tr>
								<td><strong>{j.a_image}</strong><input type="hidden" name=""
									value="{j.a_image}"><br></td>
							</tr>
						</table>
						</c:if>
					</form>
					<hr>
				</c:forEach>
				</div>
		</c:forEach>
	</div>
	<script>
$(document).ready(function() {
	$('.more').on('click', function() {
		$(this).next().toggleClass('hidden');
	});
});
</script>
</body>
</html>