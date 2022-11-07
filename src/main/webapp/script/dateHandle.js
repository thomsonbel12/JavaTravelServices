import { dateFormat, countDays } from "./countDays.js";

const checkin_date = document.getElementsByClassName("checkin_date");
const checkout_date = document.getElementsByClassName("checkout_date");


function dateSwap() {
    for (let i = 0; i < checkin_date.length; i++) {
        let checkin = new Date(dateFormat(checkin_date[i].value)).getTime();
        let checkout = new Date(dateFormat(checkout_date[i].value)).getTime();
        let temp;

        if (checkin > checkout) {
            temp = checkin_date[i].value;
            checkin_date[i].value = checkout_date[i].value;
            checkout_date[i].value = temp;
        }
    }
}
for (let i = 0; i < checkin_date.length; i++) {
    checkin_date[i].addEventListener('change', function (e) {
        dateSwap();
    });

    checkout_date[i].addEventListener('change', function (e) {
        dateSwap();
    });
}

export { dateSwap };