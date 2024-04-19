

document.addEventListener('DOMContentLoaded', function () {
    // Récupération du nom de la JSP depuis l'URL
    var jspFileName = window.location.pathname.split("/").pop().split(".")[0];

    // Modification de l'URL affichée dans la barre d'adresse
    window.history.replaceState({}, '', 'infoSociete.jsp/');


})

const buttonSociete = document.getElementById('societe-button');
const dropdownSociete = document.getElementById('societe-dropdown');

buttonSociete.addEventListener('click', ()=>{
    dropdownSociete.classList.toggle("hidden")
})

function changeSocieteValue(raisonSociale){
    buttonSociete.innerText = raisonSociale;
    dropdownSociete.classList.toggle("hidden")
}

function validerChoix (){
    // choix de la societe
    let selectedCompany = buttonSociete.innerText.trim();
    let societe = document.getElementById("societe").value;
    let choix = document.getElementById('choix').value;

    //vérification que la raisons sociale de la societe est non null, non vide et différents de Liste des Sociétés
    if (selectedCompany && selectedCompany !== "" && selectedCompany !== "Liste des Sociètés"){
        var confirmMessage = 'Confirmez-vous le choix de la société : ' + selectedCompany + ' ?';
        if (confirm(confirmMessage)) {

            // redirection
            window.location.href ="http://localhost:8080/reverso_war_exploded/formulaireServlet?societe=" + societe + "&&choix="+ choix +"&&raisonSociale=" + encodeURIComponent(selectedCompany);
        } else {
            // retour à la page
            window.history.back();
        }
    } else {
        // message erreur
        alert('Veuillez sélectionner une société valide.');
    }
}

