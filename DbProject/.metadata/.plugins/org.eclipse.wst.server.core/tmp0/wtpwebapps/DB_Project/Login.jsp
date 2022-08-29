<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="CSS/login.css">

    <title>Login</title>

</head>
<body>
    <div class="loginSection">
        <h1 class="loginTitle">Yonsei Train</h1>
        <h4 class="loginGuide">
        연세철도에 오신것을 환영합니다!
        </h4>
        <form class="loginForm" action="login_result.jsp" method = "get">
            <div class="idBox">
                <input id="id" type="text" name="id" autocomplete="off" required>
                <label for="id">ID</label>
            </div>
            <div class="pwBox">
                <input id="pw" type="password" name="pw" autocomplete="off" required>
                <label for="pw">PASSWORD</label>
            </div>
            <div class="loginButtonBox">
                <button id="loginButton" type="submit">LOGIN</button>
            </div>
        </form>
        <div class="subBox">
            <p>기차편을 예약하시겠나요?
                <a href="main.jsp">go to train!</a>
            </p>
        </div>
    </div>
</body>
</html>