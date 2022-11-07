const roomMinus = document.getElementsByClassName("minusRoom");
const roomAdd = document.getElementsByClassName("addRoom");
const roomValue = document.getElementsByClassName('rooms');

const nguoiLonMinus = document.getElementsByClassName("minusAdult");
const nguoiLonAdd = document.getElementsByClassName("addAdult");
const nguoilonValue = document.getElementsByClassName('adults');

const treEmMinus = document.getElementsByClassName("minusChild");
const treEmAdd = document.getElementsByClassName("addChild");
const treEmValue = document.getElementsByClassName('children');


const room_Num = document.getElementsByClassName("roomNum")
const adult_dNum = document.getElementsByClassName("adultNum")
const child_Num = document.getElementsByClassName("childNum")

const max_room = document.getElementsByClassName("max_available_num")
const max_adult_num = document.getElementsByClassName("max_adult_num")
const max_child_num = document.getElementsByClassName("max_child_num")


let phongValue;
let adultValue;
let childValue;

function addRoom(e ,i) {
    let btnWrap = e.target;
    while (!btnWrap.classList.contains("input-add-btn")) {
        btnWrap = btnWrap.parentElement;
    }
    phongValue = btnWrap.children[1].innerHTML;
    
    phongValue = btnWrap.children[1].innerHTML;

    let textPeopleWrap = e.target;
    while (!textPeopleWrap.classList.contains("input-add-room-people")) {
        textPeopleWrap = textPeopleWrap.parentElement;
    }
    while (!textPeopleWrap.classList.contains("input-people-room-text")) {
        textPeopleWrap = textPeopleWrap.previousElementSibling;
    }
    textPeopleWrap = textPeopleWrap.children[1].children[1];
    let roomNum = textPeopleWrap.children[0];
    
    if(max_room != null){
        console.log(phongValue)
        if(parseInt(phongValue) < parseInt(max_room[i].innerHTML)){
            phongValue = max_room[i].innerHTML
            // console.log(phongValue)
            btnWrap.children[1].innerHTML = parseInt(btnWrap.children[1].innerHTML) + 1;
        }
    }
    roomNum.innerHTML = btnWrap.children[1].innerHTML;
}
function minusRoom(e , i) {
    let btnWrap = e.target;
    while (!btnWrap.classList.contains("input-add-btn")) {
        btnWrap = btnWrap.parentElement;
    }

    phongValue = btnWrap.children[1].innerHTML;
    if (phongValue <= 1) {
        phongValue = 1;
    }
    else {
        btnWrap.children[1].innerHTML = parseInt(btnWrap.children[1].innerHTML) - 1;
        phongValue = btnWrap.children[1].innerHTML;
    }

    let textPeopleWrap = e.target;
    while (!textPeopleWrap.classList.contains("input-add-room-people")) {
        textPeopleWrap = textPeopleWrap.parentElement;
    }
    while (!textPeopleWrap.classList.contains("input-people-room-text")) {
        textPeopleWrap = textPeopleWrap.previousElementSibling;
    }
    let test = textPeopleWrap.children[1].children[1];
    let roomNum = test.children[0];
    roomNum.innerHTML = phongValue;

    if(max_room != null){
        console.log(btnWrap.parentElement.parentElement)
        // if(parseInt(adultValue) < parseInt(max_adult_num[i].innerHTML) * parseInt(room_Num[i].innerHTML)  ){
        //     adultValue = max_adult_num[i].innerHTML
        //     // console.log(phongValue)
        //     btnWrap.children[1].innerHTML = parseInt(btnWrap.children[1].innerHTML) + 1;
        // }
        textPeopleWrap.children[1].children[0].children[0].innerHTML = 1
        textPeopleWrap.children[1].children[0].children[1].innerHTML = 0   
        
        btnWrap.parentElement.parentElement.children[1].children[1].children[1].innerHTML = 1
        btnWrap.parentElement.parentElement.children[2].children[1].children[1].innerHTML = 0
    }
}



function addAdult(e, i) {
    let textPeopleWrap = e.target;
    while (!textPeopleWrap.classList.contains("input-add-room-people")) {
        textPeopleWrap = textPeopleWrap.parentElement;
    }
    while (!textPeopleWrap.classList.contains("input-people-room-text")) {
        textPeopleWrap = textPeopleWrap.previousElementSibling;
    }
    textPeopleWrap = textPeopleWrap.children[1].children[0];
    let adultdNum = textPeopleWrap.children[0];

    adultValue = adultdNum.innerHTML

    adultdNum.innerHTML = adultValue;


    let btnWrap = e.target;
    while (!btnWrap.classList.contains("input-add-btn")) {
        btnWrap = btnWrap.parentElement;
    }
    // btnWrap.children[1].innerHTML = parseInt(btnWrap.children[1].innerHTML) + 1;
    adultValue = btnWrap.children[1].innerHTML;

    if(max_room != null){
        console.log(adultValue)
        if(parseInt(adultValue) < parseInt(max_adult_num[i].innerHTML) * parseInt(room_Num[i].innerHTML)  ){
            adultValue = max_adult_num[i].innerHTML
            // console.log(phongValue)
            btnWrap.children[1].innerHTML = parseInt(btnWrap.children[1].innerHTML) + 1;
        }
    }
    adultdNum.innerHTML = btnWrap.children[1].innerHTML;

}
function minusAdult(e) {
    let btnWrap = e.target;
    while (!btnWrap.classList.contains("input-add-btn")) {
        btnWrap = btnWrap.parentElement;
    }

    adultValue = btnWrap.children[1].innerHTML;
    if (adultValue <= 1) {
        adultValue = 1;
    }
    else {
        btnWrap.children[1].innerHTML = parseInt(btnWrap.children[1].innerHTML) - 1;
        adultValue = btnWrap.children[1].innerHTML;
    }

    let textPeopleWrap = e.target;
    while (!textPeopleWrap.classList.contains("input-add-room-people")) {
        textPeopleWrap = textPeopleWrap.parentElement;
    }
    while (!textPeopleWrap.classList.contains("input-people-room-text")) {
        textPeopleWrap = textPeopleWrap.previousElementSibling;
    }
    textPeopleWrap = textPeopleWrap.children[1].children[0];
    let adultdNum = textPeopleWrap.children[0];
    adultdNum.innerHTML = adultValue;
}


function addChild(e, i) {
    let btnWrap = e.target;
    while (!btnWrap.classList.contains("input-add-btn")) {
        btnWrap = btnWrap.parentElement;
    }
    childValue = btnWrap.children[1].innerHTML;
    // btnWrap.children[1].innerHTML = parseInt(btnWrap.children[1].innerHTML) + 1;
    childValue = btnWrap.children[1].innerHTML;

    let textPeopleWrap = e.target;
    while (!textPeopleWrap.classList.contains("input-add-room-people")) {
        textPeopleWrap = textPeopleWrap.parentElement;
    }
    while (!textPeopleWrap.classList.contains("input-people-room-text")) {
        textPeopleWrap = textPeopleWrap.previousElementSibling;
    }
    textPeopleWrap = textPeopleWrap.children[1].children[0];
    let childNum = textPeopleWrap.children[1];
    childNum.innerHTML = childValue;

    if(max_room != null){
        console.log(childValue)
        if(parseInt(childValue) < parseInt(max_child_num[i].innerHTML) * parseInt(room_Num[i].innerHTML)  ){
            childValue = max_child_num[i].innerHTML
            // console.log(phongValue)
            btnWrap.children[1].innerHTML = parseInt(btnWrap.children[1].innerHTML) + 1;
        }
    }
    childNum.innerHTML = btnWrap.children[1].innerHTML;
}
function minusChild(e) {
    let btnWrap = e.target;
    while (!btnWrap.classList.contains("input-add-btn")) {
        btnWrap = btnWrap.parentElement;
    }

    childValue = btnWrap.children[1].innerHTML;
    if (childValue <= 0) {
        childValue = 0;
    }
    else {
        btnWrap.children[1].innerHTML = parseInt(btnWrap.children[1].innerHTML) - 1;
        childValue = btnWrap.children[1].innerHTML;
    }


    let textPeopleWrap = e.target;
    while (!textPeopleWrap.classList.contains("input-add-room-people")) {
        textPeopleWrap = textPeopleWrap.parentElement;
    }
    while (!textPeopleWrap.classList.contains("input-people-room-text")) {
        textPeopleWrap = textPeopleWrap.previousElementSibling;
    }
    textPeopleWrap = textPeopleWrap.children[1].children[0];
    let childNum = textPeopleWrap.children[1];
    childNum.innerHTML = childValue;

}

// tăng giảm Người lớn






for (let i = 0; i < nguoiLonAdd.length; i++) {
    roomAdd[i].addEventListener('click', function(e){
        addRoom(e, i)
    })

    nguoiLonAdd[i].addEventListener('click', function(e){
        addAdult(e, i)
    });
    nguoiLonMinus[i].addEventListener('click', minusAdult);
}
// Tăng giảm trẻ em
for (let i = 0; i < treEmAdd.length; i++) {
    roomMinus[i].addEventListener('click', function(e){
        minusRoom(e, i)
    })

    treEmAdd[i].addEventListener('click', function(e){
        addChild(e, i)
    });
    treEmMinus[i].addEventListener('click', minusChild);
}