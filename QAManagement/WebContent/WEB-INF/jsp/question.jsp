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
  width: 700px;
  height: 400px;
  background: #a9a9a9;
  margin-left: auto;
  margin-right: auto;
  margin-top: 100px;


}



</style>
</head>
<jsp:include page="header.jsp"/>
<body>

  <header>
  </header>

    <div class="wrapper">
    <form method="POST" action="/QAManagement/RegistServlet" id="form">
      <table align="center">
        <tr>
          <td width="100" height="40">クラス</td>
          <td width="80">${sessionScope.user.user_class}
          </td>
          <td width="80">質問相手</td>
          <td width="80">
            <select name="potion">
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
          <th colspan="3">
            <input type="file" name="q_image" accept="image/jpeg, image/png" onchange="previewImage(this);">
              <br>
              <img id="preview" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" style="max-width:200px;">
          </th>
          <th colspan="2">
              <input type="submit" name="quest_button" value="質問登録"><br>
              <p id=error></p>
          </th>
        </tr>
      </table>

    </form>
  </div>

<script>
'use strict';
function previewImage(obj)
{
	var fileReader = new FileReader();
	fileReader.onload = (function() {
		document.getElementById('preview').src = fileReader.result;
	});
	fileReader.readAsDataURL(obj.files[0]);
}

//質問登録ボタン押されたとき必須項目の記入がないと必須項目を入力するよう警告
document.getElementById('form').onsubmit = function(event){
  const position = document.getElementById('form').position.value;
  const first = document.getElementById('form').first.value;
  const category = document.getElementById('form').category.value;//←NAMEは固有値
  if(position === "" || forst === "" || category === "" ){
  	event.preventDefault();
 	document.getElementById('error').textContent = '※内容を全て入力してください';
  }
};


</script>
</body>
<jsp:include page="footer.jsp"/>
</html>
