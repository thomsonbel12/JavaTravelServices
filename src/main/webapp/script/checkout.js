
const direct_payment_check_btn = document.getElementById("direct_payment_check_btn")
const momo_payment_check_btn = document.getElementById("momo_payment_check_btn")

const payment_header = document.getElementsByClassName("payment_header")

const direct_payment_detail = document.getElementById("direct_payment_detail")
const momo_payment_detail = document.getElementById("momo_payment_detail")

const submit_checkout = document.getElementById("submit_checkout")
let checkNum = 0;
function disable() {
	submit_checkout.setAttribute("disabled", "disabled");
	submit_checkout.style.opacity = '0.5'
}
// disable()
function enable() {
	submit_checkout.removeAttribute("disabled");
	submit_checkout.style.opacity = '1'
}
direct_payment_check_btn.checked = true;
function directPay() {
	if (direct_payment_check_btn.checked === true) {
		// console.log(1)
		direct_payment_detail.style.display = "block"

		momo_payment_detail.style.display = "none"
		momo_payment_check_btn.checked = false

		payment_header[0].style.backgroundColor = "#5392fa"
		payment_header[0].style.color = "#fff"

		payment_header[1].style.backgroundColor = "#dde9fd"
		payment_header[1].style.color = "#5392fa"
		// checkNum = checkNum + 1;
	} else {
		// checkNum = checkNum - 1;
		momo_payment_check_btn.checked = true
		direct_payment_detail.style.display = "none"

		momo_payment_detail.style.display = "block"
		direct_payment_check_btn.checked = false


		payment_header[0].style.backgroundColor = "#dde9fd"
		payment_header[0].style.color = "#5392fa"

		payment_header[1].style.backgroundColor = "#5392fa"
		payment_header[1].style.color = "#fff"
	}
	enable();
}
directPay()
function momoPay() {
	if (momo_payment_check_btn.checked === true) {
		// console.log(1)
		direct_payment_detail.style.display = "none"

		momo_payment_detail.style.display = "block"
		direct_payment_check_btn.checked = false

		payment_header[1].style.backgroundColor = "#5392fa"
		payment_header[1].style.color = "#fff"

		payment_header[0].style.backgroundColor = "#dde9fd"
		payment_header[0].style.color = "#5392fa"
	} else {
		direct_payment_check_btn.checked = true

		direct_payment_detail.style.display = "block"

		momo_payment_detail.style.display = "none"
		momo_payment_check_btn.checked = false

		payment_header[0].style.backgroundColor = "#5392fa"
		payment_header[0].style.color = "#fff"

		payment_header[1].style.backgroundColor = "#dde9fd"
		payment_header[1].style.color = "#5392fa"
	}
	enable();
}

direct_payment_check_btn.addEventListener('click', directPay)

momo_payment_check_btn.addEventListener('click', momoPay)


import { numberWithCommas, removeCommas } from "../script/numbeWithComma.js";

const total_money = document.getElementById("total_money")
const total_rooms = document.getElementsByClassName("room-content")

const rooms_total_show = document.getElementsByClassName("rooms_total_show")
const total_rooms_money = document.getElementsByClassName("total_rooms_money")

// console.log(total_money.innerText)

for (let i = 0; i < rooms_total_show.length; i++) {
	rooms_total_show[i].innerHTML = total_rooms.length
	total_rooms_money[i].innerHTML = total_money.innerHTML
	console.log("dmm")
}



const total_money_pass = document.getElementById("total_money_pass")
/*  */
total_money_pass.value = removeCommas(total_money.innerHTML)
console.log(total_rooms_money[0].innerHTML)

