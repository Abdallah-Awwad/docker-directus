let domainURL = "http://localhost:8055/";
let inventoryRequest = "items/inventory?fields=*,medicine_id.*,medicine_id.manufacturer.name&filter[quantity][_gt]=0";

if (window.localStorage.getItem("token")) {
    $("#log").attr({'href': '#', 'onclick': 'logout();'}).text('Logout');
}

$(document).ready(function() {
    $('.category-button').click(function() {
        $('.category-button').removeClass('btn-outline-success button active-category');
        $(this).addClass('btn-outline-success button active-category');
        let category = $(this).data('category');
        if (category === 'all') {
            $('#card-grid .col').show();
        } else {
            $('#card-grid .filter').each(function() {
                let cardCategory = $(this).data('category');
                $(this).toggle(cardCategory === category);
            });
        }
    });
});

$(document).scroll(function () {
    let $nav = $("nav.fixed-top");
    $nav.toggleClass('scrolled', $(this).scrollTop() > $nav.height());
});

async function logout() {
    let body = {
        "refresh_token": window.localStorage.getItem("refreshToken")
    }
    await ajaxRequest(body, "auth/logout", "POST");
    window.localStorage.removeItem("token");
    window.localStorage.removeItem("refreshToken");
    window.location.href = "index.html";
}

function addToCart(button) {
    button = $(button).parent().parent();
    let items = {};
    if (localStorage.getItem("items") !== null) {
        items = JSON.parse(localStorage.getItem("items"));
    }
    let itemID = button.find(".product-details").attr("data-id");
    if (!items[itemID]) {
        items[itemID] = {
            name: button.find(".product-name").text(),
            price: parseInt(button.find(".product-price span").text()),
            image: button.find("img").attr("src"),
            availableQuantity: parseInt(button.find(".product-details").attr("data-available-quantity")),
            quantity: 1
        };
    } else {
        if (items[itemID]["quantity"] + 1 <= items[itemID]["availableQuantity"]) {
            items[itemID]["quantity"] += 1;
        } else {
            return showAlert(`<i class="fa-solid fa-cart-flatbed"></i> Sorry, the maximum quantity available for this product is ${items[itemID]["availableQuantity"]}`, "warning");
        }
    }
    localStorage.setItem("items", JSON.stringify(items));
    showAlert('<i class="fa-regular fa-circle-check"></i> Item added successfully', "success");
}

function showAlert(message, type) {
    let alert = $("<div></div>").addClass("custom-alert container alert alert-" + type + " fixed-top text-center w-75 mt-1 py-2").attr("role", "alert").html(message);
    $("body").append(alert);
    setTimeout(function() {
        alert.addClass("show");
    }, 0);
    setTimeout(function() {
        alert.removeClass("show");
        setTimeout(function() {
            alert.remove();
        }, 3000);
    }, 3000);
}

async function ajaxRequest(body, url, operation = "POST", token = "") {
    const response = await $.ajax({
        url:  domainURL + url,
        type: operation,
        headers: {"Authorization": 'Bearer ' + token, "Content-Type": "application/json; charset=UTF-8"},
        data: JSON.stringify(body)
    });
    return response;
}