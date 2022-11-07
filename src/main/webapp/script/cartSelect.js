import { numberWithCommas, removeCommas } from "../script/numbeWithComma.js";
import { countDays, dateFormat } from "./countDays.js";


const checkAll_box = document.getElementById('checkbox-selectAll');
const checkAll_box1 = document.getElementById('checkbox-selectAll1');

const checkbox = document.getElementsByClassName('checkbox-select');


const right_content_footer = document.getElementById("right-content-footer");
const no_cart_list = document.getElementById("no-cart-list");


const submit_cart_checkout = document.getElementById("submit-cart-checkout");
const cart_selected_num = document.getElementById("cart-selected-num");


if (checkbox.length > 0) {
    right_content_footer.style.display = "flex";

    no_cart_list.style.display = "none";
} else {
    right_content_footer.style.display = "none";

    no_cart_list.style.display = "flex";
}

import { dateSwap } from "./dateHandle.js";

const checkin_date = document.getElementsByClassName("checkin_date");
const checkout_date = document.getElementsByClassName("checkout_date");
const total_days = document.getElementsByClassName("total_days");

let validDate = 0;
for(let i = 0 ;i < total_days.length ;i++){
    
    if(new Date(checkin_date[i].value).getTime() != null){
        checkin_date[i].value = dateFormat(checkin_date[i].value)
        checkout_date[i].value = dateFormat(checkout_date[i].value)
    }

}
dateSwap();

function getDays() {
    for (let i = 0; i < total_days.length; i++) {
        total_days[i].innerHTML =
            countDays(checkin_date[i].value,
                checkout_date[i].value);
    }
}
getDays();


function calcValidDate() {
    validDate = 0;
    for (let i = 0; i < total_days.length; i++) {
        if (total_days[i].innerHTML !== "0") {
            validDate = validDate + 1;
        }
    }
}
calcValidDate();

const cart_room_wrap = document.getElementsByClassName("cart-room-wrap");
for (let i = 0; i < cart_room_wrap.length; i++) {
    if (total_days[i].innerHTML === "0") {
        cart_room_wrap[i].style.outline = "4px solid rgb(207, 32, 97)";
        cart_room_wrap[i].style.border = "unset";
    }
}
function changeCart_wrap(i) {
    if (total_days[i].innerHTML !== "0") {
        cart_room_wrap[i].style.outline = "unset";
        cart_room_wrap[i].style.border = "2px solid #5392fa";
    }
}

submit_cart_checkout.setAttribute("disabled", 'disabled');
submit_cart_checkout.style.opacity = "0.5";

const moneys_1_day = document.getElementsByClassName('money-1-day');
const room_total_money = document.querySelectorAll('.room-total-money-text');

const MoneyShow = document.getElementById('footer-all-money-text');

let checkNum = 0;
let MoneyNum = parseInt(MoneyShow.innerText);


function room_total_moneyCal() {
    for (let i = 0; i < moneys_1_day.length; i++) {
        room_total_money[i].innerHTML = numberWithCommas(parseInt(removeCommas(moneys_1_day[i].innerHTML)) * parseInt(total_days[i].innerHTML));
        moneys_1_day[i].innerHTML = numberWithCommas(moneys_1_day[i].innerHTML);
    }
}
room_total_moneyCal();


function selectAll_totalMoney() {
    let money = 0;
    for (let i = 0; i < room_total_money.length; i++) {
        money = money + (parseInt(removeCommas(moneys_1_day[i].innerHTML)) * parseInt(total_days[i].innerHTML));
    }
    MoneyShow.innerHTML = numberWithCommas(money);
    return money;
}


function checkAll() {

    if (checkAll_box.checked === true) {
        for (let i = 0; i < checkbox.length; i++) {
            if (checkbox[i].checked === false) {
                checkbox[i].checked = true;
                checkNum = checkbox.length;
            }
        }
        MoneyNum = selectAll_totalMoney();
        calcValidDate();
        if (validDate === checkNum) {
            submit_cart_checkout.removeAttribute("disabled");
            submit_cart_checkout.style.opacity = "1";
        }
        else {
            submit_cart_checkout.setAttribute("disabled", "disabled");
            submit_cart_checkout.style.opacity = "0.5";
        }
        checkAll_box1.checked = true;

    }
    else {
        for (let i = 0; i < checkbox.length; i++) {
            checkbox[i].checked = false;
            checkNum = 0;

        }
        MoneyNum = 0;
        submit_cart_checkout.setAttribute("disabled", "disabled");
        submit_cart_checkout.style.opacity = "0.5";
        checkAll_box1.checked = false;
    }

    MoneyShow.innerHTML = numberWithCommas(MoneyNum);

    cart_selected_num.innerHTML = checkNum;
}

function checkAll1() {
    if (checkAll_box1.checked === true) {
        for (let i = 0; i < checkbox.length; i++) {
            if (checkbox[i].checked === false) {
                checkbox[i].checked = true;
                checkNum = checkbox.length;
            }
        }
        MoneyNum = selectAll_totalMoney();
        calcValidDate();
        if (validDate === checkNum) {
            submit_cart_checkout.removeAttribute("disabled");
            submit_cart_checkout.style.opacity = "1";
        }
        else {
            submit_cart_checkout.setAttribute("disabled", "disabled");
            submit_cart_checkout.style.opacity = "0.5";
        }
        checkAll_box.checked = true;

    }
    else {
        for (let i = 0; i < checkbox.length; i++) {
            checkbox[i].checked = false;
            checkNum = 0;

        }
        MoneyNum = 0;
        submit_cart_checkout.setAttribute("disabled", "disabled");
        submit_cart_checkout.style.opacity = "0.5";
        checkAll_box.checked = false;
    }
    MoneyShow.innerHTML = numberWithCommas(MoneyNum);

    cart_selected_num.innerHTML = checkNum;
}


checkAll_box.addEventListener('click', checkAll);

checkAll_box1.addEventListener('click', checkAll1);

cart_selected_num.innerHTML = checkNum;

function test() {
    let z = 0;
    for (let i = 0; i < total_days.length; i++) {
        if (total_days[i].innerHTML === "0" && checkbox[i].checked === true) {
            submit_cart_checkout.style.opacity = "0.5";
            submit_cart_checkout.setAttribute("disabled", "disabled");
        } else {
            z++;
        }
    }
    console.log(validDate + " " + z);
    if (z === total_days.length) {
        submit_cart_checkout.style.opacity = "1";
        submit_cart_checkout.removeAttribute("disabled");
    }
}

for (let i = 0; i < checkbox.length; i++) {
    checkbox[i].addEventListener('click', function (e) {
        if (checkbox[i].checked === true) {
            checkNum = checkNum + 1;

            cart_selected_num.innerHTML = checkNum;

            MoneyNum = MoneyNum + (parseInt(removeCommas(moneys_1_day[i].innerHTML)) * parseInt(total_days[i].innerHTML));
            MoneyShow.innerHTML = numberWithCommas(MoneyNum);


            if (total_days[i].innerHTML !== "0") {
                submit_cart_checkout.removeAttribute("disabled");
                submit_cart_checkout.style.opacity = "1";
            } else {
                submit_cart_checkout.style.opacity = "0.5";
                submit_cart_checkout.setAttribute("disabled", "disabled");
            }
            test();

        } else {
            checkNum = checkNum - 1;

            cart_selected_num.innerHTML = checkNum;

            MoneyNum = MoneyNum - (parseInt(removeCommas(moneys_1_day[i].innerHTML)) * parseInt(total_days[i].innerHTML));
            MoneyShow.innerHTML = numberWithCommas(MoneyNum);


            if (total_days[i].innerHTML !== "0") {
                submit_cart_checkout.removeAttribute("disabled");
                submit_cart_checkout.style.opacity = "1";
            } else {
                submit_cart_checkout.style.opacity = "0.5";
                submit_cart_checkout.setAttribute("disabled", "disabled");
            }
            test();
            if (checkNum === 0) {
                submit_cart_checkout.style.opacity = "0.5";
                submit_cart_checkout.setAttribute("disabled", "disabled");
            }

        }
        if (checkNum === checkbox.length) {
            checkAll_box.checked = true;
            checkAll_box1.checked = true;

            MoneyNum = selectAll_totalMoney();

            checkAll();
        } else {
            checkAll_box.checked = false;
            checkAll_box1.checked = false;
        }
    });
}

function final_Func() {
    getDays();
    room_total_moneyCal();
    if (checkAll_box.checked === true) {
        MoneyNum = selectAll_totalMoney();
    } else {
        MoneyNum = 0;
        for (let i = 0; i < checkbox.length; i++) {
            if (checkbox[i].checked === true) {
                MoneyNum = MoneyNum + (parseInt(removeCommas(moneys_1_day[i].innerHTML)) * parseInt(total_days[i].innerHTML));
            }
        }
        MoneyShow.innerHTML = numberWithCommas(MoneyNum);
    }
}
for (let i = 0; i < checkin_date.length; i++) {
    checkin_date[i].addEventListener('change', function (e) {
        final_Func();
        calcValidDate();

        if (checkbox[i].checked === true) {
            test();
        }
        changeCart_wrap(i);
    });

    checkout_date[i].addEventListener('change', function (e) {
        final_Func();
        calcValidDate();

        if (checkbox[i].checked === true) {
            test();
        }

        changeCart_wrap(i);
    });
}

const error_message = document.getElementById('footer-btn-error');
const btn_wrap = document.getElementsByClassName("footer-btn");
btn_wrap[0].addEventListener('mouseenter', function () {
    let noRoomText = `Vui lòng chọn ít nhất <span  style="text-decoration: underline;" class="fontWeight-700">1 phòng </span> để tiếp tục thanh toán`;
    let invalidDateText = `Vui lòng chọn 
                            <span style="text-decoration: underline;" class="fontWeight-700">Ngày Nhận Phòng </span> 
                            và <span style="text-decoration: underline;" class="fontWeight-700">Ngày Trả Phòng</span>  
                            để tiếp tục thanh toán`
    if (checkNum === 0) {
        error_message.style.display = "block";
        error_message.innerHTML = noRoomText;
    } else if (checkNum !== 0 && submit_cart_checkout.disabled) {
        error_message.style.display = "block";
        error_message.innerHTML = invalidDateText;
    }
});
btn_wrap[0].addEventListener('mouseleave', function () {
    error_message.style.display = "none";
});




window.addEventListener('load', function () {
    checkAll_box.checked = false;
    checkAll_box1.checked = false;
    checkNum = 0;
    MoneyNum = 0;

    for (let i = 0; i < checkbox.length; i++) {
        checkbox[i].checked = false;
    }
});



