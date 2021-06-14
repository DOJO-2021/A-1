<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.searchform {
	position:fixed
	left:50px;
	top:150px;
	z-index: 100;
}

.list {
    margin: 0;
    position: absolute;
    top: 20%;
    left: 30%;
    margin-right: -30%;
    transform: translate(-30%, -30%)
  width:500px;
}

.line{
    position: relative;
    background: #fff0cd;
    box-shadow: 0px 0px 0px 5px #fff0cd;
    border: dashed 2px white;
    padding: 0.2em 0.5em;
    color: #454545;
}
.line:after{
    position: absolute;
    content: '';
    right: -7px;
    top: -7px;
    border-width: 0 15px 15px 0;
    border-style: solid;
    border-color: #ffdb88 #fff #ffdb88;
    box-shadow: -1px 1px 1px rgba(0, 0, 0, 0.15);
}

table{
    width: 800px;
}

</style>
</head>
<body>
	<h1>質問一覧</h1>
<div class = "qwrap">
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
								<option value="初期値">質問相手を選択</option>
								<option value="講師">講師</option>
								<option value="事務局">事務局</option>
						</select><br></td>
					</tr>
					<tr>
						<td><select name="class">
								<option value="初期値">クラスを選択</option>
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
								<option value="初期値">カテゴリーを選択</option>
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
		<c:forEach var="e" items="${questionlist}">
			<form method="GET" action="/QAManagement/SearchServlet">
				<table class="line">
					<tr>
						<td><strong>クラス</strong><input type="hidden" name="" value=""><br></td>

						<td><strong>相手</strong><input type="hidden" name="" value=""><br></td>

						<td><strong>名前</strong><input type="hidden" name="" value=""><br></td>

						<td><strong>カテゴリー</strong><input type="hidden" name=""
							value=""><br></td>

						<td><strong>優先度</strong><input type="hidden" name=""
							value="$"><br></td>
						<td><input type="checkbox" name="syousai">詳細</td>

						<td><input type="submit" name="answer" value="回答"></td>
					</tr>
				</table>
			</form>

			<div class="hidden">
				<table class="line">
					<tr>
						<td><strong>質問内容</strong><input type="hidden" name=""
							value="$"><br></td>
							<td class = "delete"><input type="submit" name="q_delete_button" value="質問削除"></td>
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
							</tr>
							<tr>
								<td><strong>ここに画像（回答）</strong><input type="hidden" name=""
									value=""><br></td>
							</tr>
						</table>
					</form>
					<hr>
				</c:forEach>
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