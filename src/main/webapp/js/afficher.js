document.addEventListener('DOMContentLoaded', function (){
    // Récupération du nom de la JSP depuis l'URL
    var jspFileName = window.location.pathname.split("/").pop().split(".")[0];

    // Modification de l'URL affichée dans la barre d'adresse
    window.history.replaceState({}, '', 'afficher.jsp/');
})