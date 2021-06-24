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
  height: 400px;
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

.btn-flat-border {
  display: inline-block;
  padding: 0.3em 1em;
  text-decoration: none;
  color: #f8ead1;
  border: solid 2px #e2a654;
  border-radius: 3px;
  transition: .4s;
  background: #e2a654;
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
    <form method="POST" action="/QAManagement/RegistServlet" id="form">
      <table>
        <tr>
          <td width="100" height="40">クラス</td>
          <td width="80"><c:out value="${sessionScope.user.user_class}" />
          </td>
          <td width="80">質問相手</td>
          <td width="80">
            <select name="people" >
              <option value="">相手</option>
              <option value="講師">講師</option>
              <option value="事務局">事務局</option>
            </select>
          </td>
        </tr>
        <tr>
          <td width="100" height="40">優先度</td>
          <td>
            <select name="first">
              <option value="">優先度</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
            </select>
          </td>
          <td width="80">カテゴリー</td>
          <td width="80">
            <select name="category">
              <option value="">質問カテゴリー</option>
              <option value="機材関係">機材関係</option>
              <option value="用語">用語</option>
              <option value="コーディング">コーディング</option>
              <option value="事務局">事務局</option>
              <option value="その他">その他</option>
            </select>
          </td>
        </tr>
        <tr>
          <td colspan="2">※5が最も優先度が高い
          </td>
        </tr>
        <tr>
          <td width="100" height="40">内容</td>
          <td colspan="3">
             <textarea name="q_content">
             </textarea>
          </td>

        </tr>
        <tr>

          <th colspan="4" height="40px">
              <input type="submit" name="quest_button" class="btn-flat-border" value="質問登録" onclick="return checkData()"><br>
              <p id=error></p>
          </th>
        </tr>

      </table>
<input type="hidden" name = "user_id" value = "${sessionScope.user.user_id}" />
    </form>
  </div>

<script>
'use strict';
function previewImage(obj) {
	var fileReader = new FileReader();
	fileReader.onload = (function() {
		document.getElementById('preview').src = fileReader.result;
	});
	fileReader.readAsDataURL(obj.files[0]);
}

//質問登録ボタン押されたとき必須項目の記入がないと必須項目を入力するよう警告
function checkData(){
  const people = document.getElementById('form').people.value;
  const first = document.getElementById('form').first.value;
  const category = document.getElementById('form').category.value;//←NAMEは固有値
  if(people === "" || first === "" || category === "" ){
  	event.preventDefault();
 	  document.getElementById('error').textContent = '※内容を全て入力してください';

    return false;
  }else{
    return true;
  }
};


</script>

</body>
<jsp:include page="footer.jsp"/>
</html>

