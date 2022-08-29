const username = document.getElementById("name");
const userId = document.getElementById("id");
const password = document.getElementById("pw");
const repassword = document.getElementById("pwCheck");
const signForm = document.getElementById("signForm");


function showError(input, message) {
    const formControl = input.parentElement;
    formControl.className = "formControl error";
    const small = formControl.querySelector("small");
    small.innerText = message;
}

function showSuccess(input) {
    const formControl = input.parentElement;
    formControl.className = "formControl success";
}

function getFieldName(input) {
    return input.id.charAt(0).toUpperCase() + input.id.slice(1);
}

function checkRequired(inputArr) {
    inputArr.forEach(function (input) {
        if (input.value.trim() === "") {
            console.log("hi");
            showError(input, `${getFieldName(input)} is required`);
        } else {
            showSuccess(input);
        }
    });
}

function isValidId(input) {
    // const idValidation = /.*(^[a-z0-9])([\d]).$/;
    const idValidation = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,12}$/;
    if (idValidation.test(input.value.trim())) {
        showSuccess(input);
    } else {
        showError(input, "영문, 숫자를 포함한 6~12글자사이의 아이디를 입력해주세요.");
    }
}

function isValidPw(input) {
    const pwValidation = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[~,!,@,#,$,*,(,),=,+,_,.,|]).*$/;
    if (pwValidation.test(input.value.trim())) {
        showSuccess(input);
    } else {
        showError(input, "영문, 숫자, 특수문자를 포함한 8~16글자의  비밀번호를 입력해주세요.");
    }
}

function checkPasswordsMatch(input1, input2) {
    if (input1.value !== input2.value) {
        showError(input2, "Passwords do not match");
    }
}

function formSubmit() {
    alert("submit합니다");
    signForm.submit();
}

function signUpSubmit(event) {
    event.preventDefault();
    console.log("hi");
    checkRequired([username, userId, password, repassword]);
    // isValidName(username);
    isValidId(userId);
    isValidPw(password);
    checkPasswordsMatch(password, repassword);

    if (($("#nameForm").hasClass("success") === true) && ($("#idForm").hasClass("success") === true) && ($("#pwForm").hasClass("success") === true) && ($("#repwForm").hasClass("success") === true)) {
        setTimeout(() => {
            if (window.confirm("입력한 내용으로 회원가입을 진행합니다.")) {
                signForm.submit();
            } else {

            }
        }, 500);
    } else {

    }
}

signForm.addEventListener("submit", signUpSubmit);

// form.addEventListener("submit", function (e) {
//     e.preventDefault();

//     checkRequired([username, userId, password, repassword]);
//     isValidName(username);
//     isValidId(userId);
//     isValidPw(password);
//     checkPasswordsMatch(password, repassword);
// });