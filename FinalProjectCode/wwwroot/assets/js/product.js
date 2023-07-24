"use strict";

let datas = 1;
document.querySelector('#counting').innerText = datas;

function increment() {
  if (datas > 1) {
    datas = datas - 1;
    document.querySelector('#counting').innerText = datas;
  }
}

function decrement() {
  datas = datas + 1;
  document.querySelector('#counting').innerText = datas;
}


$('.two .picture .otherpic img').each(function(){
  let imgPath = $(this).attr('src');
  
  
  $(this).click(function () {
    if ($(this).attr("data-id") == 4) {
      $(this).prev().css("opacity",0.3);
      $(this).prev().prev().css("opacity",0.3);
      $(this).prev().prev().prev().css("opacity",0.3);
      $(this).css("opacity",1);
      $('.here img').attr('src',imgPath);
    }

    if ($(this).attr("data-id") == 3) {
      $(this).prev().css("opacity",0.3);
      $(this).prev().prev().css("opacity",0.3);
      $(this).next().css("opacity",0.3);
      $(this).css("opacity",1);
      $('.here img').attr('src',imgPath);
    }

    if ($(this).attr("data-id") == 2) {
      $(this).prev().css("opacity",0.3);
      $(this).next().css("opacity",0.3);
      $(this).next().next().css("opacity",0.3);
      $(this).css("opacity",1);
      $('.here img').attr('src',imgPath);
    }

    if ($(this).attr("data-id") == 1) {
      $(this).next().css("opacity",0.3);
      $(this).next().next().css("opacity",0.3);
      $(this).next().next().next().css("opacity",0.3);
      $(this).css("opacity",1);
      $('.here img').attr('src',imgPath);
    }
  })
})

$('.three .select ul li').each(function () {
    $(this).click(function () {
      if ($(this).attr("data-id") == 4) {
        $(this).prev().css("background-color", "white");
        $(this).prev().css("color", "grey");
        $(this).prev().prev().css("background-color", "white");
        $(this).prev().prev().css("color", "grey");
        $(this).prev().prev().prev().css("background-color", "white");
        $(this).prev().prev().prev().css("color", "grey");
        $(this).css("background-color", "white");
        $(this).css("color", "black");
        $('.three .slick-dots').children().eq(3).children().eq(0).click();
        if ($('.three .select .line .underline').css('transform', 'translateX(0px)')) {
          $('.three .select .line .underline').css('transform', 'translateX(465px)')
          $('.three .select .line .underline').css("width", "95px")
        }
        else {
          $('.three .select .line .underline').css('transform', 'translateX(300px)')
          $('.three .select .line .underline').css("width", "95px")
        }
      }
      if ($(this).attr("data-id") == 3) {
        $(this).prev().css("background-color", "white");
        $(this).prev().css("color", "grey");
        $(this).prev().prev().css("background-color", "white");
        $(this).prev().prev().css("color", "grey");
        $(this).next().css("background-color", "white");
        $(this).next().css("color", "grey");
        $(this).css("background-color", "white");
        $(this).css("color", "black");
        $('.three .slick-dots').children().eq(2).children().eq(0).click();
        if ($('.three .select .line .underline').css('transform', 'translateX(0px)')) {
          $('.three .select .line .underline').css('transform', 'translateX(320px)')
          $('.three .select .line .underline').css("width", "110px")
        }
        else {
          $('.three .select .line .underline').css('transform', 'translateX(200px)')
          $('.three .select .line .underline').css("width", "110px")
        }
      }
      if ($(this).attr("data-id") == 2) {
        $(this).prev().css("background-color", "white");
        $(this).prev().css("color", "grey");
        $(this).next().css("background-color", "white");
        $(this).next().css("color", "grey");
        $(this).next().next().css("background-color", "white");
        $(this).next().next().css("color", "grey");
        $(this).css("background-color", "white");
        $(this).css("color", "black");
        $('.three .slick-dots').children().eq(1).children().eq(0).click();
        if ($('.three .select .line .underline').css('transform', 'translateX(0px)')) {
          $('.three .select .line .underline').css('transform', 'translateX(190px)')
          $('.three .select .line .underline').css("width", "90px")
        }
        else {
          $('.three .select .line .underline').css('transform', 'translateX(-180px)')
          $('.three .select .line .underline').css("width", "90px")
        }
      }
      if ($(this).attr("data-id") == 1) {
        $(this).next().css("background-color", "white");
        $(this).next().css("color", "grey");
        $(this).next().next().css("background-color", "white");
        $(this).next().next().css("color", "grey");
        $(this).next().next().next().css("background-color", "white");
        $(this).next().next().next().css("color", "grey");
        $(this).css("background-color", "white");
        $(this).css("color", "black");
        $('.three .slick-dots').children().eq(0).children().eq(0).click();
        $('.three .select .line .underline').css('transform', 'translateX(0px');
        $('.three .select .line .underline').css("width", "155px")
      }
    })
  })
  
let apart = document.querySelectorAll('.but');
let change = document.querySelectorAll('.change');

apart.forEach(index => {
  index.addEventListener('click', () => {
    document.querySelector('.active').classList.add('d-none');
    document.querySelector('.active').classList.remove('active');

    change.forEach(element=>{
      if(element.getAttribute('data-id')==index.getAttribute('data-id')){
        element.classList.remove('d-none');
        element.classList.add('active');
      }
    })
    })
});

$(document).ready(function () {
let starList = document.querySelectorAll(".three .generalcart .card .firfloor .stars1 .st");

  starList.forEach(item => {
    item.addEventListener("click", function () {
      let num = item.getAttribute("id");
      for (let i = 0; i < starList.length; i++) {
        if (starList[i].getAttribute("id") <= num) {
          starList[i].classList.add("fa-solid")
          starList[i].classList.remove("fa-regular")
        }
        else {
          if (starList[i].classList.contains("fa-solid")) {
            starList[i].classList.remove("fa-solid")
            starList[i].classList.add("fa-regular")
          }
          else {
            starList[i].classList.add("fa-regular")
          }
        }
      }
    })
  });

  let starListfr = document.querySelectorAll(".three .firfloor .stars1 .st");

  starListfr.forEach(item => {
    item.addEventListener("click", function () {
      let num = item.getAttribute("id");
      for (let i = 0; i < starListfr.length; i++) {
        if (starListfr[i].getAttribute("id") <= num) {
          starListfr[i].classList.add("fa-solid")
          starListfr[i].classList.remove("fa-regular")
        }
        else {
          if (starListfr[i].classList.contains("fa-solid")) {
            starListfr[i].classList.remove("fa-solid")
            starListfr[i].classList.add("fa-regular")
          }
          else {
            starListfr[i].classList.add("fa-regular")
          }
        }
      }
    })
  });

  let starListsc = document.querySelectorAll(".three .firfloor .stars2 .st");

  starListsc.forEach(item => {
    item.addEventListener("click", function () {
      let num = item.getAttribute("id");
      for (let i = 0; i < starListsc.length; i++) {
        if (starListsc[i].getAttribute("id") <= num) {
          starListsc[i].classList.add("fa-solid")
          starListsc[i].classList.remove("fa-regular")
        }
        else {
          if (starListsc[i].classList.contains("fa-solid")) {
            starListsc[i].classList.remove("fa-solid")
            starListsc[i].classList.add("fa-regular")
          }
          else {
            starListsc[i].classList.add("fa-regular")
          }
        }
      }
    })
  });

  let starListth = document.querySelectorAll(".three .firfloor .stars3 .st");

  starListth.forEach(item => {
    item.addEventListener("click", function () {
      let num = item.getAttribute("id");
      for (let i = 0; i < starListth.length; i++) {
        if (starListth[i].getAttribute("id") <= num) {
          starListth[i].classList.add("fa-solid")
          starListth[i].classList.remove("fa-regular")
        }
        else {
          if (starListth[i].classList.contains("fa-solid")) {
            starListth[i].classList.remove("fa-solid")
            starListth[i].classList.add("fa-regular")
          }
          else {
            starListth[i].classList.add("fa-regular")
          }
        }
      }
    })
  });

  let starListfo = document.querySelectorAll(".three .firfloor .stars4 .st");

  starListfo.forEach(item => {
    item.addEventListener("click", function () {
      let num = item.getAttribute("id");
      for (let i = 0; i < starListfo.length; i++) {
        if (starListfo[i].getAttribute("id") <= num) {
          starListfo[i].classList.add("fa-solid")
          starListfo[i].classList.remove("fa-regular")
        }
        else {
          if (starListfo[i].classList.contains("fa-solid")) {
            starListfo[i].classList.remove("fa-solid")
            starListfo[i].classList.add("fa-regular")
          }
          else {
            starListfo[i].classList.add("fa-regular")
          }
        }
      }
    })
  });

  let starListfi = document.querySelectorAll(".three .firfloor .stars5 .st");

  starListfi.forEach(item => {
    item.addEventListener("click", function () {
      let num = item.getAttribute("id");
      for (let i = 0; i < starListfi.length; i++) {
        if (starListfi[i].getAttribute("id") <= num) {
          starListfi[i].classList.add("fa-solid")
          starListfi[i].classList.remove("fa-regular")
        }
        else {
          if (starListfi[i].classList.contains("fa-solid")) {
            starListfi[i].classList.remove("fa-solid")
            starListfi[i].classList.add("fa-regular")
          }
          else {
            starListfi[i].classList.add("fa-regular")
          }
        }
      }
    })
  });

  let starListsi = document.querySelectorAll(".three .firfloor .stars6 .st");

  starListsi.forEach(item => {
    item.addEventListener("click", function () {
      let num = item.getAttribute("id");
      for (let i = 0; i < starListsi.length; i++) {
        if (starListsi[i].getAttribute("id") <= num) {
          starListsi[i].classList.add("fa-solid")
          starListsi[i].classList.remove("fa-regular")
        }
        else {
          if (starListsi[i].classList.contains("fa-solid")) {
            starListsi[i].classList.remove("fa-solid")
            starListsi[i].classList.add("fa-regular")
          }
          else {
            starListsi[i].classList.add("fa-regular")
          }
        }
      }
    })
  });
})

$('.three .subsection .sectwo button').click(function () {
  $('.three .subsection .sectwo .getin').toggleClass('d-none');
})