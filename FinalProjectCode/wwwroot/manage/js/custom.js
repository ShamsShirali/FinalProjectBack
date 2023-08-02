$(document).ready(function () {
    let check = $(this).is(':checked');

    if (check) {
        $('.parent').addClass('d-none');
        $('.file').removeClass('d-none');
    }
    else {
        $('.parent').removeClass('d-none');
        $('.file').addClass('d-none');
    }

    $('#IsMain').click(function () {
        let check = $(this).is(':checked');

        if (check) {
            $('.parent').addClass('d-none');
            $('.file').removeClass('d-none');
        }
        else {
            $('.parent').removeClass('d-none');
            $('.file').addClass('d-none');
        }
    })
})