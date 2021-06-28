<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.enclosure {
	border-top: solid 3px #f39700;
	border-right　: solid 3px #f39700;
	border-bottom　: solid 3px #f39700;
	border-left　: solid 3px #f39700;
}

.list {
	margin: 0;
	position: absolute;
	top: 20%;
	left: 20%;
	margin-right: -20%;
	transform: translate(-20%, -20%) width:500px;
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
<jsp:include page="header.jsp" />
<body>
	<h1>質問者マイページ</h1>
	<div class="enclosure">
		<div class="qlist">
			<p>対応中</p>
			<c:forEach var="e" items="${q_idNowList}">
				<form method="POST" action="/QAManagement/SearchServlet">
					<table class="line">
						<tr>
							<td><input type="hidden" name="q_id" value="${e.q_id}"></td>
							<td><strong>${e.user_class}</strong><input type="hidden"
								name="user_class" value="${e.user_class}"><br></td>

							<td><strong>${e.people}</strong><input type="hidden"
								name="people" value="${e.people}"><br></td>
							<c:if test="${sessionScope.user.position != '受講生'}">
								<td><strong>${e.name}</strong><input type="hidden"
									name="name" value="${e.name}"><br></td>
							</c:if>
							<td><strong>${e.category}</strong><input type="hidden"
								name="category" value="{e.category}"><br></td>

							<td><strong>${e.first}</strong><input type="hidden"
								name="first" value="${e.first}"><br></td>
							<td><input type="checkbox" name="syousai">詳細</td>

							<td><input type="submit" name="answer" value="回答"></td>
						</tr>
					</table>
				</form>

				<div class="hidden">
					<table class="line">
						<tr>
							<td><strong>${e.q_content}</strong><input type="hidden"
								name="q_content" value="${e.q_content}"><br></td>
								<td>
							<form method="POST" action="/QAManagement/DeleteServlet">
								<input type="hidden" name="q_id" value="${e.q_id}"><br>
								<input type="submit" name="q_delete_button" value="質問削除">
							</form>
							</td>
						</tr>
						<c:if test="${e.q_image != null }">
							<tr>
								<td><strong>${e.q_image}</strong><input type="hidden"
									name="" value=""><br></td>
							</tr>
						</c:if>
					</table>
					<c:forEach var="f" items="${answerList}">

						<form>
							<c:if test="${e.q_id == f.q_id }">

								<table class="line">
									<tr>
										<c:if test="${requestScope.user.position != 受講生}">
											<td></td>
										</c:if>
										<td><strong>${f.a_content}</strong><input type="hidden"
											name="" value="${f.a_content}"><br></td>
									</tr>
									<tr>
										<td><strong>${f.a_image}</strong><input type="hidden"
											name="" value="${f.a_image}"><br></td>
									</tr>
								</table>

							</c:if>

						</form>

					</c:forEach>
					<hr>
				</div>
			</c:forEach>

		</div>



		<div class="qlist">
			<p>未対応</p>
			<c:forEach var="g" items="${q_idYetList}">
				<form method="POST" action="/QAManagement/SearchServlet">
					<table class="line">
						<tr>
							<td><input type="hidden" name="q_id" value="${g.q_id}"></td>
							<td><strong>${g.user_class}</strong><input type="hidden"
								name="user_class" value="${g.user_class}"><br></td>

							<td><strong>${g.people}</strong><input type="hidden"
								name="people" value="${g.people}"><br></td>
							<c:if test="${sessionScope.user.position != '受講生'}">
								<td><strong>${g.name}</strong><input type="hidden"
									name="name" value="${g.name}"><br></td>
							</c:if>
							<td><strong>${g.category}</strong><input type="hidden"
								name="category" value="${g.category}"><br></td>

							<td><strong>${g.first}</strong><input type="hidden"
								name="first" value="${g.first}"><br></td>
							<td><input type="checkbox" name="syousai">詳細</td>

							<td><input type="submit" name="answer" value="回答"></td>
						</tr>
					</table>
				</form>

				<div class="hidden">
					<table class="line">
						<tr>
							<td><strong>${g.q_content}</strong><input type="hidden"
								name="q_content" value="${g.q_content}"><br></td>
														<td>
							<form method="POST" action="/QAManagement/DeleteServlet">
								<input type="hidden" name="q_id" value="${g.q_id}"><br>
								<input type="submit" name="q_delete_button" value="質問削除">
							</form>
							</td>
						</tr>
						<c:if test="items = ${g.q_image != null }">
							<tr>
								<td><strong>${g.q_image}</strong><input type="hidden"
									name="q_image" value="${g.q_image}"><br></td>
							</tr>
						</c:if>
					</table>
					<c:forEach var="f" items="${answerList}">

						<form>
							<c:if test="${g.q_id == f.q_id }">

								<table class="line">
									<tr>
										<c:if test="${requestScope.user.position != 受講生}">
											<td></td>
										</c:if>
										<td><strong>${f.a_content}</strong><input type="hidden"
											name="" value="${f.a_content}"><br></td>
									</tr>
									<tr>
										<td><strong>${f.a_image}</strong><input type="hidden"
											name="" value="${f.a_image}"><br></td>
									</tr>
								</table>

							</c:if>

						</form>

					</c:forEach>
					<hr>
				</div>
			</c:forEach>
		</div>

		<div class="qlist">
			<p>対応完了</p>
			<c:forEach var="i" items="${q_idEndList}">

				<form method="POST" action="/QAManagement/SearchServlet">
					<table class="line">
						<tr>
							<td><input type="hidden" name="q_id" value="${i.q_id}"></td>
							<td><strong>${i.user_class}</strong><input type="hidden"
								name="user_class" value="${i.user_class}"><br></td>

							<td><strong>${i.people}</strong><input type="hidden"
								name="people" value="${i.people}"><br></td>
							<c:if test="${sessionScope.user.position != '受講生'}">
								<td><strong>${i.name}</strong><input type="hidden"
									name="name" value="${i.name}"><br></td>
							</c:if>
							<td><strong>${i.category}</strong><input type="hidden"
								name="category" value="${i.category}"><br></td>

							<td><strong>${i.first}</strong><input type="hidden"
								name="first" value="${i.first}"><br></td>
							<td><input type="checkbox" name="syousai">詳細</td>

							<td><input type="submit" name="answer" value="回答"></td>
						</tr>
					</table>
				</form>


				<div class="hidden">
					<table class="line">
						<tr>
							<td><strong>${i.q_content}</strong><input type="hidden"
								name="q_content" value="${i.q_content}"><br></td>
								<td>
							<form method="POST" action="/QAManagement/DeleteServlet">
								<input type="hidden" name="q_id" value="${i.q_id}"><br>
								<input type="submit" name="q_delete_button" value="質問削除">
							</form>
							</td>
						</tr>
						<c:if test="${g.q_image != null }">
							<tr>
								<td><strong>${i.q_image}</strong><input type="hidden"
									name="" value="${i.q_image}"><br></td>
							</tr>
						</c:if>
					</table>
					<c:forEach var="f" items="${answerList}">

						<form>
							<c:if test="${i.q_id == f.q_id }">

								<table class="line">
									<tr>
										<c:if test="${requestScope.user.position != 受講生}">
											<td></td>
										</c:if>
										<td><strong>${f.a_content}</strong><input type="hidden"
											name="" value="${f.a_content}"><br></td>
									</tr>
									<tr>
										<td><strong>${f.a_image}</strong><input type="hidden"
											name="" value="${f.a_image}"><br></td>
									</tr>
								</table>

							</c:if>

						</form>

					</c:forEach>
					<hr>
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
<jsp:include page="footer.jsp" />
</html>