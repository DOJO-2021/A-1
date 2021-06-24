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
  width: 700px;
  height: 300px;
  background: #fffacd;
  margin-left: auto;
  margin-right: auto;
  margin-top: 100px;
  border-style: solid;
  border-color: #f5deb3;



}
table{
  margin:50px auto auto auto ;

}

.back {
  margin-left: auto;
  margin-right: auto;
}

#pp {
  text-align: center;
}

.aaa {
  text-align: center;
  width: 700px;
  height: 300px;
  margin:auto;
}

.btn-flat-border {
  display: inline-block;
  padding: 0.3em 1em;
  text-decoration: none;
  color: #f8ead1;
  border: solid 2px #e2a654;
  border-radius: 3px;
  transition: .4s;
  background: #e2a654;
  margin-top: 30px;
}

.btn-flat-border:hover {
  background: #ebcaa3;
  color: #644111;
}

</style>
</head>
<jsp:include page="header.jsp"/>
<body>

  <header>
  </header>

  <div class="wrapper">
    <p id=pp><c:out value="${message}"></c:out>message</p>
    <table>
      <tr>
    		<td width="100" height="40">返信内容</td>
        <td width="100" height="40"><p><c:out value="${a_content}" />返信内容</p></td>
    	</tr>
    	<tr>
    		<td width="100" height="40">状態：</td>
        <td width="100" height="40"><c:out value="${situation}" /></td>
    	</tr>

    </table>

  </form>
</div>
<div class="aaa">
<a class="btn-flat-border" href="/QAManagement/SearchServlet?FLG=閲覧ページへ">戻る</a>
</div>
</body>
<jsp:include page="footer.jsp"/>
</html>
