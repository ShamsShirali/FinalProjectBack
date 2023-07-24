"use strict";

$('.header .secondh .selec li a').each(function () {
  $('.header .secondh .selec li').click(function () {
    if ($('.header .secondh .selec li a').attr("data-id") == 1) {
      $(this).next().css("color", "#0c1d32");
      $(this).next().next().css("color", "#0c1d32");
      $(this).next().next().next().css("color", "#0c1d32");
      $(this).css("color", "#bd9855");
    }
    if ($('.header .secondh .selec li a').attr("data-id") == 2) {
      $(this).prev().css("color", "#0c1d32");
      $(this).next().css("color", "#0c1d32");
      $(this).next().next().css("color", "#0c1d32");
      $(this).css("color", "#bd9855");
    }
    if ($('.header .secondh .selec li a').attr("data-id") == 3) {
      $(this).prev().css("color", "#0c1d32");
      $(this).prev().prev().css("color", "#0c1d32");
      $(this).next().css("color", "#0c1d32");
      $(this).css("color", "#bd9855");
    }
    if ($('.header .secondh .selec li a').attr("data-id") == 4) {
      $(this).prev().css("color", "#0c1d32");
      $(this).prev().prev().css("color", "#0c1d32");
      $(this).prev().prev().prev().css("color", "#0c1d32");
      $(this).css("color", "#bd9855");
    }
  })
})

$(function () {

  $('.slider').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    dots: true,
    autoplay: true,
    autoplaySpeed: 3000,
    prevArrow: `<div class="licons"><i class="fa-solid fa-arrow-left-long"></i></div>`,
    nextArrow: `<div class="ricons"><i class="fa-solid fa-arrow-right-long"></i></div>`
  });

  $('.three .generalcart').slick({
    slidesToShow: 5,
    slidesToScroll: 1,
    dots: true,
    autoplay: true,
    autoplaySpeed: 3000,
    prevArrow: `<div data-aos="fade-right" class="licons"><i class="fa-solid fa-arrow-left-long"></i></div>`,
    nextArrow: `<div data-aos="fade-left" class="ricons"><i class="fa-solid fa-arrow-right-long"></i></div>`
  });

  $('.five .testimonials').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    dots: true,
    autoplay: false,
    prevArrow: `<div data-aos="fade-right" class="licons"><i class="fa-solid fa-arrow-left-long"></i></div>`,
    nextArrow: `<div data-aos="fade-left" class="ricons"><i class="fa-solid fa-arrow-right-long"></i></div>`
  });
})

//geri sayim
$(document).ready(function () {
  var countDownDate = new Date("Oct 10, 2023 00:23:59").getTime();
  var x = setInterval(function () {
    var now = new Date().getTime();
    var distance = countDownDate - now;
    var days = Math.floor(distance / (300 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    $(".days").html(days);
    $(".hours").html(hours);
    $(".minutes").html(minutes);
    $(".seconds").html(seconds);
    if (distance < 0) {
      clearInterval(x);
      $('.timer').addClass('d-none')
    }
  }, 1000);

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

  let starListfr = document.querySelectorAll(".three .generalcart .card .firfloor .stars1 .st");

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

  let starListsc = document.querySelectorAll(".three .generalcart .card .firfloor .stars2 .st");

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

  let starListth = document.querySelectorAll(".three .generalcart .card .firfloor .stars3 .st");

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

  let starListfo = document.querySelectorAll(".three .generalcart .card .firfloor .stars4 .st");

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

  let starListfi = document.querySelectorAll(".three .generalcart .card .firfloor .stars5 .st");

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

  let starListsi = document.querySelectorAll(".three .generalcart .card .firfloor .stars6 .st");

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

  let mybutton = document.getElementById("myBtn");

  window.onscroll = function () { scrollFunction() };
  function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
      mybutton.style.display = "block";
    } else {
      mybutton.style.display = "none";
    }
  }

  mybutton.addEventListener("click", topFunction);
  function topFunction() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
  }
})

let datas = 1;
document.querySelector('#countings').innerText = datas;

function increment() {
  if (datas > 1) {
    datas = datas - 1;
    document.querySelector('#countings').innerText = datas;
  }
}

function decrement() {
  datas = datas + 1;
  document.querySelector('#countings').innerText = datas;
}

let datatwo = 1;
document.querySelector('#countingtwo').innerText = datatwo;

function increment() {
  if (datatwo > 1) {
    datatwo = datatwo - 1;
    document.querySelector('#countingtwo').innerText = datatwo;
  }
}

function decrement() {
  datatwo = datatwo + 1;
  document.querySelector('#countingtwo').innerText = datatwo;
}

// $(document).ready(function () {
// $(".basket").mousemove(function(){
//   $(".bskm").removeClass("d-none");
// })
// });

let basket = document.querySelector('.basket');
let bskm = document.querySelector('.bskm');

basket.addEventListener('click', () => {
  if (bskm.classList.contains('active-basket')) {
    bskm.classList.remove('active-basket');
  }
  else {
    bskm.classList.add('active-basket');
  }
})

//#region checkBoxChanged
function checkboxChanged() {
  let checkbox = document.querySelector('.form-check');
  const checkOutBtn = document.querySelector('.checkbt');

  if (checkbox.checked) {
    checkOutBtn.classList.add('basketModal-activeBtn');
    checkOutBtn.href = "./checkout.html";
  } else {
    checkOutBtn.classList.remove('basketModal-activeBtn');
    checkOutBtn.href = '';
  }
}
checkboxChanged();
//#endregion

// start modal
  let start = document.getElementById("general-start");

setTimeout(function () {
  start.classList.remove("d-none");
}, 2000);

$(function () {
  $("#general-start .start .over").click(function () {
    $("#general-start").addClass("d-none");
  })
})