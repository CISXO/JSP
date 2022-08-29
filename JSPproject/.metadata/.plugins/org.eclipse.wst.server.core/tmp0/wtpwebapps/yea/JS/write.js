const title = document.getElementById("title");
const content = document.getElementById("content");
const writeForm = document.getElementById("writeForm");

function checkTitle(input) {
    if (input.value.trim() === "") {
        alert("제목을 입력해주세요.")
        return;
    } else {
        checkContent(content);
    }
}

function checkContent(input) {
    if (input.value.trim() === "") {
        alert("내용을 입력해주세요.")
        return;
    } else {
        if (window.confirm("게시글을 등록합니다.")) {
            writeForm.submit();
        } else {

        }
    }
}

function writeSubmit(event) {
    event.preventDefault();
    checkTitle(title);
}

writeForm.addEventListener("submit", writeSubmit);