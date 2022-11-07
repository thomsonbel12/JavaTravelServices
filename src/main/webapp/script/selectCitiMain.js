const select_city = document.getElementsByClassName("city_select")
// console.log(select_city[0])
function city_click(e){
    let ct = e.target;
    for(let i = 0 ;i < select_city.length ;i++){
        select_city[i].style.borderBottom = "1px solid #aaa"
    }
    // console.log(ct)
    ct.style.borderBottom = "2px solid #5392fa"
}
for(let i = 0 ;i < select_city.length ;i++){
    // console.log(select_city[i])
    select_city[i].addEventListener('click', city_click)
}