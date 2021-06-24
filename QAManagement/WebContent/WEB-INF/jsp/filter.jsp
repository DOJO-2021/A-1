<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.wrapper {
  width: 500px;
  height: 50px;
  background: #fffacd;
  margin-left: auto;
  margin-right: auto;
  margin-top: 100px;
  border-style: solid;
  border-color: #e2a654;
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
  position: relative;
  left: 1200px;
  top: 100px;
}

.btn-flat-border:hover {
  background: #ebcaa3;
  color: #644111;
}
</style>
</head>
<jsp:include page="header.jsp"/>
<body>
<form method="POST" action="/QAManagement/SearchServlet" ID="filter">
  <c:forEach var="e" items="${filterList}">
      <table class=wrapper>
        <tr>
          <td>氏名:${e.name}
          </td>
          <td>登録日:${e.r_date}
          </td>
          <td>クラス:${e.user_class}
          </td>
          <td><input type="radio" name=user_id value = "${e.user_id}">
          </td>
        </tr>
      </table>
    </c:forEach>
    </form>

    <input type="submit" class="btn-flat-border" name="id_search" value="個人検索" form = "filter"></input>
</body>
<jsp:include page="footer.jsp"/>
</html>
