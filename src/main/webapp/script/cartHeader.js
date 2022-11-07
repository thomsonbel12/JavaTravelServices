import { numberWithCommas, removeCommas } from "../script/numbeWithComma.js";
import { dateFormat } from "./countDays.js";
const cart_item_money = document.getElementsByClassName("cart-item-money");
const total_cart_room = document.getElementsByClassName("total_cart_room");

const day = document.getElementsByClassName("cart-day")
        
        for (let i = 0; i < day.length; i++) {
            day[i].innerHTML = dateFormat(day[i].innerHTML)
        }
for(let i = 0; i < total_cart_room.length ;i++){
    total_cart_room[i].innerHTML = cart_item_money.length
}

for(let i = 0 ;i < cart_item_money.length ;i++){
    cart_item_money[i].innerHTML = numberWithCommas(cart_item_money[i].innerHTML)
}