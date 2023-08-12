"use strict";

$(function () {

    $("form .close").click(function () {
        $(this).next().removeClass("d-none")
        $(this).addClass("d-none")
        $('form .passwordd').attr('type', 'text');
    })

    $("form .open").click(function () {
        $(this).prev().removeClass("d-none")
        $(this).addClass("d-none")
        $('form .passwordd').attr('type', 'password');
    })

    $("form .closed").click(function () {
        $(this).next().removeClass("d-none")
        $(this).addClass("d-none")
        $('form .confirm').attr('type', 'text');
    })

    $("form .opend").click(function () {
        $(this).prev().removeClass("d-none")
        $(this).addClass("d-none")
        $('form .confirm').attr('type', 'password');
    })
})