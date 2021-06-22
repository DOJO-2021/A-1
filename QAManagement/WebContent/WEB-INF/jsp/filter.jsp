<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.balloon {
  position   : relative;                /* 指定した分だけ相対的に移動 */
  padding: 10px;                        /* テキストの前後の余白 */
  background-color: rgba(0, 0, 0, 0.20);       /* 背景色（透明度） */
  width:500px;
  top: 50px;                        /* 吹き出し全体の幅 */
  left : 50%;                           /* 表示位置 */
  transform: translate(-150%);           /* 表示位置の調整 */
}

</style>
</head>
<body>
<form method="POST" action="/QAManagement/SearchServlet" ID="filter">
  <c:forEach var="e" items="${filterList}">
      <table align="center" class="balloon">
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
    <input type="submit" class="" name="id_search" value="個人検索" form = "filter"></input>
</body>
</html>