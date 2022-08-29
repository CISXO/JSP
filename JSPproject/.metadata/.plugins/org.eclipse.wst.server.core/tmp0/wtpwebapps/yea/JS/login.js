let id = $('#id');
let pw = $('#pw');
let button = $('#loginButton');

$(button).on('click', function () {
    if ($(id).val() == "") {
        $(id).next('label').addClass('check');
        setTimeout(function () {
            $('label').removeClass('check');
        }, 3000);
    }
    else if ($(pw).val() == "") {
        $(pw).next('label').addClass('check');
        setTimeout(function () {
            $('label').removeClass('check');
        }, 3000);
    }
});