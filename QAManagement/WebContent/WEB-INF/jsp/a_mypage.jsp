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
	left: 22%;
	margin-right: -22%;
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

.p_search {
border-collapse:collapse;
}
.line {
	width: 800px;
}
</style>
</head>
<jsp:include page="header.jsp" />
<body>
	<h1>回答者マイページ</h1>
	<div class="qwrap">
		<div class="qs">
			<div class="searchform">
				<form method="POST" action="/QAManagement/SearchServlet?FLG=answer">
					<table class = "p_search">
						<tr>
							<td><label><input type="text" name="name"
									placeholder="ああああああ"></label><br></td>
							<td><input type="submit" name="search_name" value="検索">
							</td>
						</tr>
					</table>
				</form>

			</div>
		</div>
	</div>
		<div class="qlist">
			<p>対応中</p>
			<c:forEach var="e" items="${q_answerNowList}" varStatus="status">
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
							<td><input type="checkbox" name="syousai" value="1" onchange="disp('${status.index}')"  id="checkId${status.index}">詳細</td>

							<td><input type="submit" name="answer" value="回答"></td>
						</tr>
					</table>
				</form>

				<div class="del" id="delId${status.index}">
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
					<c:forEach var="f" items="${answerList}" varStatus="status">

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
			<c:forEach var="g" items="${q_answerYetList}" varStatus="status">
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
							<td><input type="checkbox" name="syousai" value="1" onchange="disp('${status.index}')"  id="checkId${status.index}">詳細</td>

							<td><input type="submit" name="answer" value="回答"></td>
						</tr>
					</table>
				</form>

				<div class="del" id="delId${status.index}">
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
					<c:forEach var="f" items="${answerList}" varStatus="status">

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
			<c:forEach var="i" items="${q_answerEndList}" varStatus="status">

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
							<td><input type="checkbox" name="syousai" value="1" onchange="disp('${status.index}')"  id="checkId${status.index}">詳細</td>

							<td><input type="submit" name="answer" value="回答"></td>
						</tr>
					</table>
				</form>


				<div class="del" id="delId${status.index}">
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
					<c:forEach var="f" items="${answerList}" varStatus="status">

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
	function disp(indexNo){
		//ここは隠している項目を表示する部分-------------------
		//チェックボックスの状態を取得
		var ch =document.getElementById('checkId'+indexNo);
		//隠している部分の情報を取得
		var hide =document.getElementById('delId'+indexNo);

		//もし、チェックボックスにチェックがついたら
		if(ch.checked){
			//隠している部分のクラス適用（隠す）を無くす
			hide.setAttribute('class','');
		}else{
			//隠している部分のクラス適用（隠す）をつける
			hide.setAttribute('class','del');
		}


		//ここからは、非活性のボタンを活性化する部分-------------------
		//チェックボックスの状態を取得
		var check =document.getElementById('checkId'+indexNo);
		//ボタンの情報を取得
		var button = document.getElementById('buttonId'+indexNo);
		//チェックを付けたら
		if(check.checked){
			//ボタンを活性化
			button.disabled = false;
		}else{
			//ボタンを非活性
			button.disabled = true;
		}
	}
</script>
</body>
<jsp:include page="footer.jsp" />
</html>