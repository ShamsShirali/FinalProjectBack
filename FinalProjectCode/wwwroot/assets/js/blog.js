"use strict";

$('.two .filt .aparts li').each(function () {
    $(this).click(function () {
        if ($(this).attr("data-id") == 1) {
            $(this).next().css("color", "#666");
            $(this).next().next().css("color", "#666");
            $(this).next().next().next().css("color", "#666");
            $(this).next().next().next().next().css("color", "#666");
            $(this).next().next().next().next().next().css("color", "#666");
            $(this).css("color", "#bd9855");
        }
        if ($(this).attr("data-id") == 2) {
            $(this).prev().css("color", "#666");
            $(this).next().css("color", "#666");
            $(this).next().next().css("color", "#666");
            $(this).next().next().next().css("color", "#666");
            $(this).next().next().next().next().css("color", "#666");
            $(this).css("color", "#bd9855");
        }
        if ($(this).attr("data-id") == 3) {
            $(this).prev().css("color", "#666");
            $(this).prev().prev().css("color", "#666");
            $(this).next().css("color", "#666");
            $(this).next().next().css("color", "#666");
            $(this).next().next().next().css("color", "#666");
            $(this).css("color", "#bd9855");
        }
        if ($(this).attr("data-id") == 4) {
            $(this).prev().css("color", "#666");
            $(this).prev().prev().css("color", "#666");
            $(this).prev().prev().prev().css("color", "#666");
            $(this).next().css("color", "#666");
            $(this).next().next().css("color", "#666");
            $(this).css("color", "#bd9855");
        }
        if ($(this).attr("data-id") == 5) {
            $(this).prev().css("color", "#666");
            $(this).prev().prev().css("color", "#666");
            $(this).prev().prev().prev().css("color", "#666");
            $(this).prev().prev().prev().prev().css("color", "#666");
            $(this).next().css("color", "#666");
            $(this).css("color", "#bd9855");
        }
        if ($(this).attr("data-id") == 6) {
            $(this).prev().css("color", "#666");
            $(this).prev().prev().css("color", "#666");
            $(this).prev().prev().prev().css("color", "#666");
            $(this).prev().prev().prev().prev().css("color", "#666");
            $(this).prev().prev().prev().prev().prev().css("color", "#666");
            $(this).css("color", "#bd9855");
        }
    })
})

let apart = document.querySelectorAll('.but');
let change = document.querySelectorAll('.blg');
let blog = document.querySelectorAll('.inblg');

apart.forEach(index => {
    index.addEventListener('click', () => {
        document.querySelector('.active').classList.add('d-none');
        document.querySelector('.active').classList.remove('active');

        change.forEach((element) => {
            element.classList.remove('active');
            element.classList.add('d-none');
            if (element.getAttribute('data-id') == index.getAttribute('data-id')) {
                element.classList.remove('d-none');
                element.classList.add('active');
            }
        })

        blog.forEach(qamma => {
            if (qamma.getAttribute('data-id') == index.getAttribute('data-id')) {
                qamma.classList.remove('d-none');
                qamma.classList.add('active');
            }
        })
    })
});

$('.two .filt .tags li').each(function () {
    $(this).click(function () {
        if ($(this).attr("data-id") == 1) {
            $(this).css("color", "white");
            $(this).css("background-color", "#bd9855");
            $(this).next().css("color", "#666");
            $(this).next().css("background-color", "white");
        }
        if ($(this).attr("data-id") == 2) {
            $(this).css("color", "white");
            $(this).css("background-color", "#bd9855");
            $(this).prev().css("color", "#666");
            $(this).prev().css("background-color", "white");
        }
    })
})

let tag = document.querySelectorAll('.tg');

tag.forEach(index => {
    index.addEventListener('click', () => {
        document.querySelector('.active').classList.add('d-none');
        document.querySelector('.active').classList.remove('active');

        change.forEach(element => {
            if (element.getAttribute('data-id') == index.getAttribute('data-id')) {
                element.classList.remove('d-none');
                element.classList.add('active');
            }
        })

        blog.forEach(qamma => {
            if (qamma.getAttribute('data-id') == index.getAttribute('data-id')) {
                qamma.classList.remove('d-none');
                qamma.classList.add('active');
            }
        })
    })
});