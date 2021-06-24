<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <p id="pp">${message}</p>
    <table>
      <tr>
        <td width="100" height="40">クラス：</td>
        <td width="80"><c:out value="${sessionScope.user.user_class}" />
        <td width="80">質問相手:</td>
        <td width="80">
         ${requestScope.people}
        </td>
      </tr>
      <tr>
        <td width="80" height="40">優先度：</td>
        <td>
          <c:out value="${requestScope.first}" />
        </td>
        <td width="130">質問カテゴリー：</td>
        <td width="80">
           <c:out value="${requestScope.category}" />
        </td>
      </tr>
      <tr>
        <td colspan="2">※5が最も優先度が高い
        </td>
      </tr>
      <tr>
        <td width="100" height="40">質問内容：</td>
        <td colspan="3">
           <c:out value="${requestScope.q_content}" />
        </td>

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
