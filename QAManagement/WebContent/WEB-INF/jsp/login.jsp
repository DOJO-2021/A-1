<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/QAManagement/css/style.css">
</head>
<body>
<main>

  <form method="POST" action="/QAManagement/LoginServlet" id="form">
 <table>
  <tr>
  <th>ID</th>
  <td> <input type="text" name="id_input" style="width : 250px; height : 50px;"><br>
  </td>
  </tr>

  <tr>
  <th>PW</th>
  <td> <input type="password" name="pw_input" style="width : 250px; height : 50px;"><br>

    <!-- 空欄だった時のエラーメッセージ -->
  <p id="l_error"></p>
  </td>
  </tr>

  <tr>
  <td><input type="submit" class="login" name="login" value="ログイン">
  </td>
  </tr>
 </table>
  </form>

</main>

<footer class="footer">
</footer>



</body>
</html>