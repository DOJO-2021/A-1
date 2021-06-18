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
<body>

  <header>
  </header>

    <div class="wrapper">
    <form method="POST" action="">
      <table align="center">
        <tr>
          <td width="100" height="40">所属クラス</td>
          <td width="80">aaaa
          </td>
          <td width="80">質問相手</td>
          <td width="80">
            <select name="q_potion">
              <option value="positon"></option>
              <option value="teacher">講師</option>
              <option value="dojo">事務局</option>
            </select>
          </td>
        </tr>
        <tr>
          <td width="100" height="40">優先度</td>
          <td>
            <select name="q_primary">
              <option value=""></option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
            </select>
          </td>
          <td width="80">カテゴリー</td>
          <td width="80">
            <select name="q_category">
              <option value=""></option>
              <option value="kizai">機材関係</option>
              <option value="vocaburaly">用語</option>
              <option value="cordhing">コーディング</option>
              <option value="jimu">事務局</option>
              <option value="other">その他</option>
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
             <textarea name="q_question">
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
              <input type="submit" name="quest_button" value="質問する"><br>
          </th>
        </tr>
      </table>

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
</html>
