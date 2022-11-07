function numberWithCommas(num) {
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}


function removeCommas(num){
    return num.toString().replaceAll(",", "")
}


export {numberWithCommas, removeCommas}


