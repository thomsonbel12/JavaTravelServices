const edit_btn = document.getElementsByClassName("edit_btn")
const edit_item = document.getElementsByClassName("edit_item")
const btn_huy = document.getElementsByClassName("btn_huy")
const input_text = document.getElementsByClassName("app__body-input-text")

for(const item of edit_item){
    item.style.display = "none"
}

function deleteText(){
    for(let i = 0 ;i < btn_huy.length; i++){
        input_text[i].value = "";
    }
}

function edit_btn_click(e){
    let edit_click = e.target;
    let user_inf_item = edit_click;

    for(let i = 0 ; i < edit_item.length ;i++){
        edit_item[i].style.display = "none";
        edit_btn[i].style.display = "block"
    }

    while(!user_inf_item.classList.contains("user_inf_item")){
        user_inf_item = user_inf_item.parentElement;
    }

    let edit_show = user_inf_item.nextElementSibling;

    
    deleteText();

    edit_show.style.display = "block"
    edit_click.style.display = "none"
    // console.log(edit_click)
}


function btn_huy_click(e){
    let btn_huy = e.target;
    let user_info_item = btn_huy;
    let edit_click
    let edit_item

    deleteText();

    while(!user_info_item.classList.contains("edit_item")){
        user_info_item = user_info_item.parentElement;
    }
    edit_item = user_info_item

    user_info_item = user_info_item.previousElementSibling;
    edit_click = user_info_item.children[1].children[0]
    edit_click.style.display = "block";
    edit_item.style.display = "none"
    // console.log(edit_item)
}


for(let i = 0; i < edit_btn.length ;i++){
    edit_btn[i].addEventListener('click', edit_btn_click)
}

for(let i = 0 ;i < btn_huy.length;i++){
    btn_huy[i].addEventListener('click', btn_huy_click)
}









const show_pass_icon = document.getElementsByClassName("show_pass_icon")
const hide_pass_icon = document.getElementsByClassName("hide_pass_icon")


function hide_show_pass(e){
    let icon_click = e.target
    let input_pass = e.target.parentElement.children[0] 
    let icon_show = e.target.parentElement.children[1]
    let icon_hide = e.target.parentElement.children[2]
    // console.log(icon_show)
    if(icon_click.classList.contains("show_pass_icon")){
        // console.log("hien")
        icon_show.style.display = "none"
        icon_hide.style.display = "block"

        input_pass.type = "text"
    }else{
        icon_show.style.display = "block"
        icon_hide.style.display = "none"

        input_pass.type = "password"
    }

}

for(let i = 0; i < show_pass_icon.length ;i++){
    show_pass_icon[i].addEventListener('click', hide_show_pass)
    hide_pass_icon[i].addEventListener('click', hide_show_pass)
}