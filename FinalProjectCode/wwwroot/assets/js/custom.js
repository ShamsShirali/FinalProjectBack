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

    

    $(document).on("click", ".brands .brand", function (ev) {

        ev.preventDefault();

        let brand = $(this).html();
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



    $(document).on("click", ".categories .but", function (ev) {

        ev.preventDefault();

        let category = $(this).html();
        let data = { category: category }


        $.ajax({
            url: "/Shop/SortByCategory",
            type: "Get",
            data: data,
            success: function (res) {
                $(".partial-sort-datas").html(res)
            }
        })


    })


    $(document).on("click", ".add-to-cart-button", function (ev) {

        ev.preventDefault();




        let dataId = $(this).attr("data-id");

        console.log(dataId)
        console.log($(".user"))
        let data = { id: dataId }

        $.ajax({
            url: `/Home/AddBasket`,
            type: "Post",
            data: data,
            success: function (res) {
                if (res > 0) {
                    $(".cart-count").text(res)
                }
                else {
                    /*$(".user").click();*/
                    alert("Please Login");
                }

            }
        })
    })



    $(document).on("click", ".add-to-cart-button1", function (ev) {

        ev.preventDefault();




        let dataId = $(this).attr("data-id");

        console.log(dataId)
        console.log($(".user"))
        let data = { id: dataId }

        $.ajax({
            url: `/Shop/AddBasket`,
            type: "Post",
            data: data,
            success: function (res) {
                if (res > 0) {
                    $(".cart-count").text(res)
                }
                else {
                    /*$(".user").click();*/
                    alert("Please Login");
                }

            }
        })
    })



    $(document).on("click", ".add-to-cart-button2", function (ev) {

        ev.preventDefault();




        let dataId = $(this).attr("data-id");

        console.log(dataId)

        let count = $(this).prev().children().eq(1).text()
        let data = { id: dataId, count: count }

        $.ajax({
            url: `/Product/AddBasket`,
            type: "Post",
            data: data,
            success: function (res) {
                if (res > 0) {
                    $(".cart-count").text(res)
                }
                else {
                    /*$(".user").click();*/
                    alert("Please Login");
                }
            }
        })
    })




    $(document).on("click", ".add-to-wishlist", function (ev) {

        ev.preventDefault();


        let dataId = $(this).attr("data-id");
        let data = { id: dataId }

        $.ajax({
            url: "/Home/AddWish",
            type: "Post",
            data: data,
            success: function (res) {
                if (res == "Login") {
                    alert("Please Login");
                }
                else {
                    $(".wishlist-count").text(res)
                    $(this).toggleClass("active")
                    $(this).toggleClass("fa-solid")
                    $(this).toggleClass("fa-regular")
                }
            }
        })
    })




    $(document).on("click", ".add-to-wishlist1", function (ev) {

        ev.preventDefault();


        let dataId = $(this).attr("data-id");
        let data = { id: dataId }

        $.ajax({
            url: "/Shop/AddWish",
            type: "Post",
            data: data,
            success: function (res) {
                if (res == "Login") {
                    alert("Please Login");
                }
                else {
                    $(".wishlist-count").text(res)
                    $(this).toggleClass("active")
                    $(this).toggleClass("fa-solid")
                    $(this).toggleClass("fa-regular")
                }
            }
        })
    })




    $(document).on("click", ".add-to-wishlist2", function (ev) {

        ev.preventDefault();


        let dataId = $(this).attr("data-id");
        let data = { id: dataId }

        $.ajax({
            url: "/Product/AddWish",
            type: "Post",
            data: data,
            success: function (res) {
                if (res == "Login") {
                    alert("Please Login");
                }
                else {
                    $(".wishlist-count").text(res)
                    $(this).toggleClass("active")
                    $(this).toggleClass("fa-solid")
                    $(this).toggleClass("fa-regular")
                }
            }
        })
    })

    $(document).on("click", ".stars1 .st", function (ev) {

        ev.preventDefault();

        let dataId = $(this).attr("id")
        $(".firfloor .raiting-input").val(dataId)
        console.log($(".firfloor .raiting-input").val())


       


    })

    $(document).on("click", ".remove-from-wishlist", function (ev) {

        ev.preventDefault();


        let dataId = $(this).attr("data-id");
        console.log("adsfdsfsfsd")
        let data = { id: dataId }

        $.ajax({
            url: "Wishlist/RemoveWish",
            type: "Post",
            data: data,
            success: function (res) {
                $(".wishlist-count").text(res)
            }
        })

       $(this).parent().parent().remove();
    })

    $(document).on("click", ".basket", function (ev) {
        ev.preventDefault();
        $(".bskm").toggleClass("active-basket")
    })




    $(document).on("click", ".plus-btn", function (ev) {

        ev.preventDefault();



        let dataId = $(this).attr("data-id");

        $.ajax({
            url: `basket/IncreaseProductCount?id=${dataId}`,
            type: "Post",
            success: function (res) {
                $(".cart-count").text(res)
            }
        })

        var num = $(this).prev().text()
        var totalCommon = $(".grand-total span").html()
        
        var productTotal = $(this).parent().parent().next().children().eq(0).children().eq(0).text()
        
        var productPrice = $(this).parent().parent().prev().children().eq(1).children().eq(1).children().eq(0).text()
        
        var res = parseFloat(totalCommon) + parseFloat(productPrice)
        ++num;
        $(this).prev().text(num)
        productTotal = parseFloat(productPrice) * num
        $(this).parent().parent().next().children().eq(0).children().eq(0).html(productTotal)
        $(".grand-total span").html(res)
    })

    $(document).on("click", ".minus", function (ev) {

        ev.preventDefault();



        let dataId = $(this).attr("data-id");
        let num = $(this).next().text()
        if (num > 1) { 

        $.ajax({
            url: `basket/DecreaseProductCount?id=${dataId}`,
            type: "Post",
            success: function (res) {
                $(".cart-count").text(res)
            }
        })

      
            var totalCommon = $(".grand-total span").text()
            var productTotal = $(this).parent().parent().next().children().eq(0).children().eq(0).text()
            var productPrice = $(this).parent().parent().prev().children().eq(1).children().eq(1).children().eq(0).text()
            var res = parseFloat(totalCommon) - parseFloat(productPrice)
            --num;
            $(this).next().text(num)
            productTotal = parseFloat(productTotal) - parseFloat(productPrice)
            $(this).parent().parent().next().children().eq(0).children().eq(0).html(productTotal)
            $(".grand-total span").html(res)
        }
    })


    $(document).on("click", ".delete-button", function (ev) {

        ev.preventDefault();



        let dataId = $(this).attr("data-id");

        $.ajax({
            url: `basket/deleteproductfrombasket?id=${dataId}`,
            type: "Post",
            success: function (res) {
                $(".cart-count").text(res)
            }
        })

        var totalCommon = $(".grand-total span").html()
        var productTotal = $(this).parent().next().children().eq(0).children().eq(0).html()
        var res = parseFloat(totalCommon) - parseFloat(productTotal)

        $(".grand-total span").html(res)

        $(this).parent().parent().remove()
    })


    $(document).on("click", ".plus-modal-btn", function (ev) {

        ev.preventDefault();



        let dataId = $(this).attr("data-id");

        $.ajax({
            url: `basket/IncreaseProductCount?id=${dataId}`,
            type: "Post",
            success: function (res) {
                $(".cart-count").text(res)
            }
        })

        var num = $(this).prev().text()
        var totalCommon = $(".grand-modal-total span").html()

        var productPrice = $(this).parent().next().children().eq(0).text()

        var res = parseFloat(totalCommon) + parseFloat(productPrice)
        ++num;
        $(this).prev().text(num)
 
        $(".grand-modal-total span").html(res)
    })


    $(document).on("click", ".minus-modal-btn", function (ev) {

        ev.preventDefault();



        let dataId = $(this).attr("data-id");
        let num = $(this).next().text()
        if (num > 1) {

            $.ajax({
                url: `basket/DecreaseProductCount?id=${dataId}`,
                type: "Post",
                success: function (res) {
                    $(".cart-count").text(res)
                }
            })


            var totalCommon = $(".grand-modal-total span").text()
            var productPrice = $(this).parent().next().children().eq(0).text()
            var res = parseFloat(totalCommon) - parseFloat(productPrice)
            --num;
            $(this).next().text(num)
            $(".grand-modal-total span").html(res)
        }
    })

    $(document).on("click", ".delete-modal-button", function (ev) {

        ev.preventDefault();



        let dataId = $(this).attr("data-id");

        $.ajax({
            url: `basket/deleteproductfrombasket?id=${dataId}`,
            type: "Post",
            success: function (res) {
                $(".cart-count").text(res)
            }
        })
        let num = $(this).prev().children().eq(1).html()
        var totalCommon = $(".grand-modal-total span").html()
        var productPrice = $(this).prev().children().eq(1).children().eq(0).text()
        var productTotal = productPrice * productPrice
        var res = parseFloat(totalCommon) - parseFloat(productTotal)

        $(".grand-modal-total span").html(res)

        $(this).parent().parent().remove()
    })
})