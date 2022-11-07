
//a simple date formatting function
function dateFormat(inputDate) {
    var newdate = inputDate.split("-").reverse().join("-");
    return newdate;
}



function countDays(checkin_date, checkout_date){
    // console.log(checkin)
    // console.log(checkout)
    // try{
        let checkin = new Date(dateFormat(checkin_date));
        // console.log(checkin)
        let checkout = new Date(dateFormat(checkout_date));
        let days = checkout.getTime() - checkin.getTime();

        if(isNaN(checkin) || isNaN(checkout)){
            return 0;
        }

        return (Math.ceil(days / (1000 * 3600 * 24))) + 1;

    // }catch{
    //     // console.log(1)
    //     return 0;
    // }


}

export {dateFormat, countDays}
// console.log(countDays("22-1020", "24-0-2022"))