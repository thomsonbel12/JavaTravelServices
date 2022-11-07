document.addEventListener('DOMContentLoaded', () => {
    const selectDrop = document.getElementById('country');

    fetch('https://restcountries.com/v3.1/all').then(res => {
        return res.json();
    }).then(data => {
        let opt = "";
        data.forEach(country => {
            opt += `<option id=${country.cca2} value="${country.cca2}">${country.name.common}</option>`;
            // console.log(country.cca2);
        });

        selectDrop.innerHTML = opt;


        const vn = document.getElementById('VN');
        if (vn.id === "VN") {
            vn.setAttribute("selected", "selected");
        }
        // console.log(vn)
        // selectDrop.selectedIndex = index
    }).catch(e => {
        console.log(e);
    });
});