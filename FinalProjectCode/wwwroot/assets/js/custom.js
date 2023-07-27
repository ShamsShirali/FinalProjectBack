$(document).ready(function () {
    let page = window.location.pathname.split('/')[1];

    console.log(page.length)

    if (page.length == 0) {
        $('.Home').addClass('active');
    }
    else {
        $('.' + page).addClass('active');
    }

    $('.searchBtn').click(function (e) {
        e.preventDefault();

        let search = $('.searchInput').val();

        if (search.length >= 3) {
            fetch('product/search/?search' + search)
                .then(res => {
                    return res.text();
                    //return res.json();
                })
                .then(data => {
                    //let liıtem = "";

                    //for (var i = 0; i < data.length; i++) {
                    //    let li =`  <li>
                    //<a href="#" class="d-flex justify-content-between align-items-center">
                    //    <img style="width:100px;" src="~/images/product/@product.MainImage" />
                    //    <p>@product.Title</p>
                    //    <p class="price-old">£${data[i].price}</p>
                    //</a>
                    //                </li > `;
                    //
                    //    liıtem += li;
                    // }

                    $('.searchList').html(data);
                    //$('.searchList').html(liItem);
                })
        }

        console.log(search);
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
})