/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */
document.addEventListener('DOMContentLoaded', function() {
    const buttonClient = document.getElementById('client-button');
    const dropdownClient = document.getElementById('client-dropdown');
    const buttonProspect = document.getElementById('prospect-button');
    const dropdownProspect = document.getElementById('prospect-dropdown');
    const buttonBurger = document.getElementById('mega-menu');
    const dropdownMenu = document.getElementById('menu');

    buttonClient.addEventListener('click', function() {
        dropdownClient.classList.toggle('hidden');
    });
    buttonProspect.addEventListener('click', function() {
        dropdownProspect.classList.toggle('hidden');
    });
    buttonBurger.addEventListener('click', function (){
        dropdownMenu.classList.toggle('hidden');
    })
});