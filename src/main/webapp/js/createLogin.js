document.addEventListener('DOMContentLoaded', ()=>{

    let valider = document.getElementById("boutonValider");
    let password = document.getElementById("password");
    let verifyPassword = document.getElementById("verifyPassword");
    let form = document.getElementById("createLogin");

    valider.addEventListener('click', (event)=>{
        event.preventDefault();
        if (!password.value.trim() || password.value.length < 5){
            alert('le password doit contenir au moins 5 caractères');
        } else if (password.value === verifyPassword.value){
            form.submit();
        } else {
            alert('les 2 passwords sont différents');
        }
    })
})