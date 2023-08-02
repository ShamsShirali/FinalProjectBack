$(document).ready(function () {
    let page = window.location.pathname.split('/')[1];

    console.log(page.length)

    if (page.length == 0) {
        $('.Home').addClass('active');
    }
    else {
        $('.' + page).addClass('active');
    }

    $('#search').keydown(function () {

        let search = $('#search').val();

        console.log(search)
        let data = { search: search }

        $.ajax({
            url: "/Product/Search",
            type: "Get",
            data: data,
            success: function (res) {

                $(".searchList").html(res)
            }
        })
    })

    $('.searchInput').keyup(function () {
        let search = $(this).val();

        if (search.length < 3) {
            $('.searchList').html("");
        }
    })

    $(document).on('click', '.add', function (e) {
        e.preventDefault();

        let url = $(this).attr('href');

        fetch(url)
            .then(res => res.text())
            .then(data => {
                $('.main-navigation').html(data)
            })
    })

 
    $(document).on("change", "#sort-product", function (ev) {

        ev.preventDefault();

        let filter = $(this).val();
        let data = { filter: filter }


        $.ajax({
            url: "/Shop/Sort",
            type: "Get",
            data: data,
            success: function (res) {
                $(".partial-sort-datas").html(res)
            }
        })


    })


    $(document).on("change", "#sort-product", function (ev) {

        ev.preventDefault();

        let brand = $(this).val();
        let data = { brand: brand }


        $.ajax({
            url: "/Shop/SortByBrand",
            type: "Get",
            data: data,
            success: function (res) {
                $(".partial-sort-datas").html(res)
            }
        })


    })
})