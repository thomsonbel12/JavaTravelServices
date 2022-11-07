const app = document.querySelector('.app__header-user-display');
const menuClick = document.querySelector('.app__header-user-menu');
function user_menu_click() {
    // hideUserMenu();
    // hideShowAddForm();
    // hideShowSearchForm();
    menuClick.classList.toggle("show");
}

app.addEventListener('click', user_menu_click);
menuClick.addEventListener('click', function (event) {
    event.stopPropagation();
});
app.addEventListener('click', function (event) {
    event.stopPropagation();
});
