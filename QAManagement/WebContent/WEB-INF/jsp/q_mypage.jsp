<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<body>
	<h1>質問者マイページ</h1>
	<div class="enclosure">
		<div class="list">
			<c:forEach var="e" items="${questionlist}">
				<form method="GET" action="/QAManagement/SearchServlet">
					<table class="line">
						<tr>
							<td><strong>クラス</strong><input type="hidden" name=""
								value=""><br></td>

							<td><strong>相手</strong><input type="hidden" name="" value=""><br></td>

							<td><strong>名前</strong><input type="hidden" name="" value=""><br></td>

							<td><strong>カテゴリー</strong><input type="hidden" name=""
								value=""><br></td>

							<td><strong>優先度</strong><input type="hidden" name=""
								value="$"><br></td>
							<td><input type="checkbox" name="syousai">詳細</td>

							<td><input type="submit" name="answer" value="返信"></td>
						</tr>
					</table>
				</form>

				<div class="hidden">
					<table class="line">
						<tr>
							<td><strong>質問内容</strong><input type="hidden" name=""
								value="$"><br></td>
							<td class="delete"><input type="submit"
								name="q_delete_button" value="質問削除"></td>
						</tr>
						<tr>
							<td><strong>ここに画像（質問）</strong><input type="hidden" name=""
								value=""><br></td>
						</tr>
					</table>
					<c:forEach var="e" items="${answerlist}">
						<form>
							<table class="line">
								<tr>
									<td><strong>回答内容</strong><input type="hidden" name=""
										value=""><br></td>
									<td class="r_delete"><input type="submit"
										name="r_delete_button" value="返信削除"></td>
								</tr>
								<tr>
									<td><strong>ここに画像（回答）</strong><input type="hidden" name=""
										value=""><br></td>
								</tr>
							</table>
						</form>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
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