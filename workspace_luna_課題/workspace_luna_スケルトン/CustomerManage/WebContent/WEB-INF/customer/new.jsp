<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean class="user.UserBean" id="user" scope="session" />
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>顧客管理</title>
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/style.css">
</head>
<body>
    <h1>顧客管理</h1>
    <div class="main">

        <!-- TODO ｢新規登録｣画面 -->
<form action="CustomerServlet" method="post" name="form">
 <table>

        <tr>
            <td colspan="2"><h1>新規登録</h1></td>
        </tr>


        <tr>
            <td><h2>氏名</h2></td>
            <td><input type="text" name="name" maxlength="20"></td>
        </tr>

        <tr>
            <td><h2>郵便番号</h2></td>
            <td><input type="text" name="zip" maxlength="20"></td>
        </tr>

        <tr>
            <td><h2>住所1</h2></td>
            <td><input type="text" name="address1" maxlength="100"></td>
        </tr>

        <tr>
            <td><h2>住所2</h2></td>
            <td><input type="text" name="address2" maxlength="100"></td>
        </tr>

        <tr>
            <td><h2>TEL</h2></td>
            <td><input type="tel" name="tel" maxlength="20"></td>
        </tr>

        <tr>
            <td><h2>FAX</h2></td>
            <td><input type="text" name="fax" maxlength="20"></td>
        </tr>

        <tr>
            <td><h2>E-mail</h2></td>
            <td><input type="email" name="mail" maxlength="100"></td>
        </tr>
</table>

<button name="state" value="new_confirm" id="submit" onclick="return check()">送信</button>
<input type="button" value="戻る" onclick="history.back()">
 </form>



    </div>
</body>
<script type="text/javascript">
    function check() {

        if(form.name.value == ""){
                alert("名前が記入されていません");
                return false;
        }else if(form.name.value.match(/^[a-zA-Z0-9!-/:-@¥[-`{-~]*$/)) {
            alert("全角文字で入力してください。");
            return false;
        }

        if(form.zip.value == ""){
            alert("郵便番号が入力されていません。");
            return false;
        }else if(!form.zip.value.match(/^[0-9]{3}-[0-9]{4}$/)){
            alert("3桁-4桁の半角数字で入力してください。");
            return false;
        }

        if(form.address1.value == ""){
            alert("住所1が入力されていません。");
            return false;
        }

        if(form.tel.value == ""){
            alert("TELが入力されていません。");
            return false;
        }else if(!form.tel.value.match(/^0\d{1,4}-\d{1,4}-\d{3,4}$/)){
            alert("半角ではいふん付きの電話番号を入力してください。");
            return false;
        }

        if(form.mail.value == ""){
            alert("メールアドレスが入力されていません。");
            return false;
        }else if(!form.mail.value.match(/^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/)){
            alert("半角英数字など正しい形式で入力して下さい。");
            return false;
        }

    }
</script>
</html>
