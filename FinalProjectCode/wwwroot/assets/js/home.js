// start modal

$(function () {
    let start = document.getElementById("general-start");

    setTimeout(function () {
        start.classList.remove("d-none");
    }, 2000);

    $("#general-start .start .over").click(function () {
        $("#general-start").addClass("d-none");
    })
})