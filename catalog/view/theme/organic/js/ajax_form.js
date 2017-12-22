$(document).ready(function () {
    $("#form_footer").submit(function () {
        // Получение ID формы
        var formID = $(this).attr('id');
        // Добавление решётки к имени ID
        var formNm = $('#' + formID);
        $.ajax({
            type: "POST",
            url: 'mail.php',
            data: formNm.serialize(),
            success: function (data) {
                // Вывод текста результата отправки
                $( ".mfp-bg, .mfp-wrap" ).addClass( "mfp-removing" );
                alert( "Ваша заявка отправлена !" );
                setTimeout(function() {window.location.reload();}, 800);
            },
            error: function (jqXHR, text, error) {
                // Вывод текста ошибки отправки
                $(formNm).html(error);         
            }
        });
        return false;
    });
});