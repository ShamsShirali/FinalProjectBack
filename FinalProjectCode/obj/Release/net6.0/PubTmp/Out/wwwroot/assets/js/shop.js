"use strict";

$('.two .filt .aparts li').each(function () {
    $(this).click(function () {
        if ($(this).attr("data-id") == 1) {
            $(this).next().css("color", "#666");
            $(this).next().next().css("color", "#666");
            $(this).next().next().next().css("color", "#666");
            $(this).next().next().next().next().css("color", "#666");
            $(this).css("color", "#bd9855");
        }
        if ($(this).attr("data-id") == 2) {
            $(this).prev().css("color", "#666");
            $(this).next().css("color", "#666");
            $(this).next().next().css("color", "#666");
            $(this).next().next().next().css("color", "#666");
            $(this).css("color", "#bd9855");
        }
        if ($(this).attr("data-id") == 3) {
            $(this).prev().css("color", "#666");
            $(this).prev().prev().css("color", "#666");
            $(this).next().css("color", "#666");
            $(this).next().next().css("color", "#666");
            $(this).css("color", "#bd9855");
        }
        if ($(this).attr("data-id") == 4) {
            $(this).prev().css("color", "#666");
            $(this).prev().prev().css("color", "#666");
            $(this).prev().prev().prev().css("color", "#666");
            $(this).next().css("color", "#666");
            $(this).css("color", "#bd9855");
        }
        if ($(this).attr("data-id") == 5) {
            $(this).prev().css("color", "#666");
            $(this).prev().prev().css("color", "#666");
            $(this).prev().prev().prev().css("color", "#666");
            $(this).prev().prev().prev().prev().css("color", "#666");
            $(this).css("color", "#bd9855");
        }
    })
})

let apart = document.querySelectorAll('.but');
let change = document.querySelectorAll('.all');

apart.forEach(index => {
    index.addEventListener('click', () => {
        document.querySelector('.active').classList.add('d-none');
        document.querySelector('.active').classList.remove('active');

        change.forEach(element => {
            if (element.getAttribute('data-id') == index.getAttribute('data-id')) {
                element.classList.remove('d-none');
                element.classList.add('active');
            }
        })
    })
});

// $('.two .filt .title').click(function () {
//     $(".two .filt .title .select").addClass(".show");
//     $(".two .filt .aparts").removeClass(".show");
// })

const rangeInput = document.querySelectorAll(".range-input input"),
  priceInput = document.querySelectorAll(".price-input input"),
  range = document.querySelector(".slider .progress");
let priceGap = 1000;

priceInput.forEach((input) => {
  input.addEventListener("input", (e) => {
    let minPrice = parseInt(priceInput[0].value),
      maxPrice = parseInt(priceInput[1].value);

    if (maxPrice - minPrice >= priceGap && maxPrice <= rangeInput[1].max) {
      if (e.target.className === "input-min") {
        rangeInput[0].value = minPrice;
        range.style.left = (minPrice / rangeInput[0].max) * 100 + "%";
      } else {
        rangeInput[1].value = maxPrice;
        range.style.right = 100 - (maxPrice / rangeInput[1].max) * 100 + "%";
      }
    }
  });
});

rangeInput.forEach((input) => {
  input.addEventListener("input", (e) => {
    let minVal = parseInt(rangeInput[0].value),
      maxVal = parseInt(rangeInput[1].value);

    if (maxVal - minVal < priceGap) {
      if (e.target.className === "range-min") {
        rangeInput[0].value = maxVal - priceGap;
      } else {
        rangeInput[1].value = minVal + priceGap;
      }
    } else {
      priceInput[0].value = minVal;
      priceInput[1].value = maxVal;
      range.style.left = (minVal / rangeInput[0].max) * 100 + "%";
      range.style.right = 100 - (maxVal / rangeInput[1].max) * 100 + "%";
    }
  });
});