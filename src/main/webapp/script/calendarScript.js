

// const daysTag_checkin = document.querySelectorAll(".days-checkin"),
//     currentDate_checkin = document.querySelectorAll(".current-date-checkin"),
//     prevNextIcon = document.querySelectorAll(".icons span");

// // getting new date, current year and month
// let date_checkin = new Date(),
//     currYear_checkin = date_checkin.getFullYear(),
//     currMonth_checkin = date_checkin.getMonth();

// // storing full name of all months in array
// const months = ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7",
//     "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"];

// const renderCalendarCheckin = () => {
//     let firstDayofMonth = new Date(currYear_checkin, currMonth_checkin, 1).getDay(), // getting first day of month
//         lastDateofMonth = new Date(currYear_checkin, currMonth_checkin + 1, 0).getDate(), // getting last date of month
//         lastDayofMonth = new Date(currYear_checkin, currMonth_checkin, lastDateofMonth).getDay(), // getting last day of month
//         lastDateofLastMonth = new Date(currYear_checkin, currMonth_checkin, 0).getDate(); // getting last date of previous month
//     let liTag = "";

//     for (let i = firstDayofMonth; i > 0; i--) { // creating li of previous month last days
//         liTag += `<li style="visibility:hidden" class="inactive">${lastDateofLastMonth - i + 1}</li>`;
//     }

//     for (let i = 1; i <= lastDateofMonth; i++) { // creating li of all days of current month
//         // adding active class to li if the current day, month, and year matched
//         if (i < date_checkin.getDate() && currMonth_checkin === new Date().getMonth() && currYear_checkin === new Date().getFullYear()) {
//             liTag += `<li id="in__${i}_${currMonth_checkin + 1}_${currYear_checkin}" class="inactive day_Checkin">${i}</li>`;
//         } else {
//             let isToday = i === date_checkin.getDate() && currMonth_checkin === new Date().getMonth()
//                 && currYear_checkin === new Date().getFullYear() ? "active" : "";
//             liTag += `<li id="in__${i}_${currMonth_checkin + 1}_${currYear_checkin}" class="${isToday} day_Checkin">${i}</li>`;
//         }
//     }

//     for (let i = lastDayofMonth; i < 6; i++) { // creating li of next month first days
//         liTag += `<li style="visibility:hidden" class="inactive">${i - lastDayofMonth + 1}</li>`;
//     }
//     currentDate_checkin.forEach(o => {
//         o.innerHTML = `${date_checkin.getDate()} ${months[currMonth_checkin]} năm ${currYear_checkin}`;
//     });// passing current mon and yr as currentDate_checkin text
//     daysTag_checkin.forEach(o => {
//         o.innerHTML = liTag;
//     });
// };
// renderCalendarCheckin();



// const daysTag_checkout = document.querySelectorAll(".days-checkout"),
//     currentDate_checkout = document.querySelectorAll(".current-date-checkout");
// let date_checkout = new Date(),
//     currYear_checkout = date_checkout.getFullYear(),
//     currMonth_checkout = date_checkout.getMonth() + 1;

// const renderCalendarCheckout = () => {
//     // currMonth = currMonth + 1;
//     let firstDayofMonth = new Date(currYear_checkout, currMonth_checkout, 1).getDay(), // getting first day of month
//         lastDateofMonth = new Date(currYear_checkout, currMonth_checkout + 1, 0).getDate(), // getting last date of month
//         lastDayofMonth = new Date(currYear_checkout, currMonth_checkout, lastDateofMonth).getDay(), // getting last day of month
//         lastDateofLastMonth = new Date(currYear_checkout, currMonth_checkout, 0).getDate(); // getting last date of previous month
//     let liTag = "";

//     for (let i = firstDayofMonth; i > 0; i--) { // creating li of previous month last days
//         liTag += `<li style="visibility:hidden" class="inactive">${lastDateofLastMonth - i + 1}</li>`;
//     }

//     for (let i = 1; i <= lastDateofMonth; i++) { // creating li of all days of current month
//         // adding active class to li if the current day, month, and year matched
//         let isToday = i === date_checkout.getDate() && currMonth_checkout === new Date().getMonth()
//             && currYear_checkout === new Date().getFullYear() ? "active" : "";
//         liTag += `<li id="out__${i}_${currMonth_checkout + 1}_${currYear_checkout}" class="day_Checkout">${i}</li>`;
//     }

//     for (let i = lastDayofMonth; i < 6; i++) { // creating li of next month first days
//         liTag += `<li style="visibility:hidden" class="inactive">${i - lastDayofMonth + 1}</li>`;
//     }
//     // currentDate_checkout.innerText = `${date_checkout.getDate() + 3} ${months[currMonth_checkout]} năm ${currYear_checkout}`; // passing current mon and yr as currentDate_checkin text
//     // daysTag_checkout.innerHTML = liTag;
//     currentDate_checkout.forEach(o => {
//         o.innerHTML =
//             `${date_checkout.getDate() + 3} ${months[currMonth_checkout]} năm ${currYear_checkout}`;
//     });// passing current mon and yr as currentDate_checkin text
//     daysTag_checkout.forEach(o => {
//         o.innerHTML = liTag;
//     });
// };
// renderCalendarCheckout();



// const dayInWeek = ["Chủ nhật", "Thứ 2", "Thứ 3", "Thứ 4", "Thứ 5", "Thứ 6", "Thứ 7"];
// let daysIn = document.querySelectorAll(".day_Checkin");
// let daysOut = document.querySelectorAll(".day_Checkout");
// let daysInUp = document.querySelectorAll(".input-date-checkin-day");
// let daysOutUp = document.querySelectorAll(".input-date-checkout-day");
// prevNextIcon.forEach(icon => { // getting prev and next icons
//     icon.addEventListener("click", () => { // adding click event on both icons
//         // if clicked icon is previous icon then decrement current month by 1 else increment it by 1

//         currMonth_checkin = (icon.id === "prev") ? (currMonth_checkin - 1) : currMonth_checkin + 1;
//         currMonth_checkout = (icon.id === "prev") ? (currMonth_checkout - 1) : currMonth_checkout + 1;
//         // if(currMonth_checkin < new Date().getMonth()){
//         //     currMonth_checkin = new Date().getMonth()+1;
//         // }
//         // if(currMonth_checkout < new Date().getMonth()){
//         //     currMonth_checkout = new Date().getMonth()+1;
//         // }
//         if (currMonth_checkin < 0 || currMonth_checkin > 11) { // if current month is less than 0 or greater than 11
//             // creating a new date of current year & month and pass it as date value
//             date_checkin = new Date(currYear_checkin, currMonth_checkin);

//             currYear_checkin = date_checkin.getFullYear(); // updating current year with new date year
//             currMonth_checkin = date_checkin.getMonth(); // updating current month with new date month
//         } else {
//             date_checkin = new Date(); // pass the current date as date value
//         }
//         if (currMonth_checkout < 0 || currMonth_checkout > 11) { // if current month is less than 0 or greater than 11
//             // creatoutg a new date of current year & month and pass it as date value
//             date_checkout = new Date(currYear_checkout, currMonth_checkout);

//             currYear_checkout = date_checkout.getFullYear(); // updatoutg current year with new date year
//             currMonth_checkout = date_checkout.getMonth(); // updatoutg current month with new date month
//         } else {
//             date_checkout = new Date(); // pass the current date as date value
//         }
//         renderCalendarCheckin(); // calling renderCalendar function
//         renderCalendarCheckout();
//         // console.log("month" + currMonth_checkin);
//         daysIn = document.querySelectorAll(".day_Checkin");
//         daysOut = document.querySelectorAll(".day_Checkout");

//         daysIn.forEach(o => {

//             o.addEventListener("click", function () {
//                 // console.log(o.innerHTML);
//                 // if (o.innerHTML >= date_checkin.getDate() && currMonth_checkin === new Date().getMonth() && currYear_checkin === new Date().getFullYear())
//                 // currentDate_checkin.innerText = `${o.innerHTML} ${months[currMonth_checkin]} năm ${currYear_checkin}`; // passing current mon and yr as currentDate_checkin text
//                 currentDate_checkin.forEach(a => {
//                     a.innerHTML = `${o.innerHTML} ${months[currMonth_checkin]} năm ${currYear_checkin}`;
//                 }); // passing current mon and yr as currentDate_checkin text

//                 // o.classList.toggle('selected');    
//                 daysInUp.forEach(o => {
//                     o.innerHTML = currentDate_checkin[0].innerHTML;
//                 });
//             });
//             o.addEventListener("click", function () {
//                 o.classList.toggle('selected');
//             });
//         });

//         daysOut.forEach(o => {

//             o.addEventListener("click", function () {
//                 // console.log(o.innerHTML);
//                 currentDate_checkout.forEach(a => {
//                     a.innerHTML = `${o.innerHTML} ${months[currMonth_checkout]} năm ${currYear_checkout}`; // passing current mon and yr as currentDate_checkin text

//                 });

//                 daysOutUp.forEach(o => {
//                     o.innerHTML = currentDate_checkout[0].innerHTML;
//                 });
//             });
//             o.addEventListener("click", function () {
//                 o.classList.toggle('selected');
//             });
//         });
//     });
// });

// daysIn.forEach(o => {

//     o.addEventListener("click", function () {
//         // console.log(o.innerHTML);
//         if (o.innerHTML >= date_checkin.getDate() && currMonth_checkin === new Date().getMonth() && currYear_checkin === new Date().getFullYear())
//             currentDate_checkin.forEach(a => {
//                 a.innerHTML = `${o.innerHTML} ${months[currMonth_checkin]} năm ${currYear_checkin}`;
//             }); // passing current mon and yr as currentDate_checkin text

//         // o.classList.toggle('selected');    
//         daysInUp.forEach(o => {
//             o.innerHTML = currentDate_checkin[0].innerHTML;
//         });
//     });
//     o.addEventListener("click", function () {
//         o.classList.toggle('selected');
//     });
// });

// daysOut.forEach(o => {

//     o.addEventListener("click", function () {
//         // console.log(o.innerHTML);
//         // currentDate_checkout.innerText = `${o.innerHTML} ${months[currMonth_checkout]} năm ${currYear_checkout}`; // passing current mon and yr as currentDate_checkin text
//         currentDate_checkout.forEach(a => {
//             a.innerHTML = `${o.innerHTML} ${months[currMonth_checkout]} năm ${currYear_checkout}`; // passing current mon and yr as currentDate_checkin text

//         });

//         daysOutUp.forEach(o => {
//             o.innerHTML = currentDate_checkout[0].innerHTML;
//         });
//     });
//     o.addEventListener("click", function () {
//         o.classList.toggle('selected');
//     });
// });
// // renderCalendarCheckin();
// // renderCalendarCheckout();






