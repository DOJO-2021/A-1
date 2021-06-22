<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>質問管理システム</title>
<style type="text/css">
textarea {
  width: 25em;
  height: 6em;
}

.wrapper {
  width: 500px;
  height: 250px;
  background: #a9a9a9;
  margin-left: auto;
  margin-right: auto;
  margin-top: 100px;


}

.back {
  margin-left: auto;
  margin-right: auto;
}



</style>
</head>
<jsp:include page="header.jsp"/>
<body>

  <header>
  </header>

    <div class="wrapper">
    <p>{message}</p>
    <form method="POST" action="">
      <table align="center">
        <tr>
          <td width="100" height="40">所属クラス</td>
          <td width="80">${sessionScope.user.user_class}
          </td>
          <td width="80">質問相手</td>
          <td width="80">
            ${requestScope.position}
          </td>
        </tr>
        <tr>
          <td width="100" height="40">優先度</td>
          <td>
            ${requestScope.first}
          </td>
          <td width="80">カテゴリー</td>
          <td width="80">
            ${requestScope.category}
          </td>
        </tr>
        <tr>
          <td colspan="2">※5が最も優先度が高い
          </td>
        </tr>
        <tr>
          <td width="100" height="40">内容</td>
          <td colspan="3">
             ${requestScope.q_content}
          </td>

        </tr>

      </table>

        <a href="/QAManagement/SearchServlet?FLG=閲覧ページへ" class="">戻る</a>

    </form>
  </div>

<script>
function previewImage(obj)
{
	var fileReader = new FileReader();
	fileReader.onload = (function() {
		document.getElementById('preview').src = fileReader.result;
	});
	fileReader.readAsDataURL(obj.files[0]);
}


</script>
</body>
<jsp:include page="footer.jsp"/>
</html>
