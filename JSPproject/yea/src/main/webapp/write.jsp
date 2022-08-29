<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="CSS/write.css">

    <title>Write</title>
</head>

<body>
    <div class="writeSection">
        <h1 class="writeTitle">My Story</h1>

        <form id="writeForm" action="write_result.jsp">
            <div id="titleForm" class="titleBox">
                <h2>Title</h2>
                <input id="title" class="title" type="text" name="title" placeholder="제목을 입력하세요." maxlength="15">
            </div>
            <div id="contentForm" class="contentBox">
                <h2>Content</h2>
                <textarea name="content" id="content" class="content" type="text" name="content"></textarea>
            </div>
            <div class="buttonBox">
                <a href="board.jsp" class="linkButton">목록으로</a>
                <button id="submitButton" type="submit">등록하기</button>
            </div>
        </form>
    </div>

    <script src="JS/write.js"></script>
</body>

</html>