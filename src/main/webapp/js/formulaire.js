document.addEventListener('DOMContentLoaded', ()=>{
    let choix = document.getElementById('choix').value; // Récupérer la valeur de choix de la servlet
    let societe = document.getElementById('societe').value;//Récupérer l'info client ou prospect

// Désactiver les inputs si choix est "supprimer"
    if (choix === 'supprimer') {
        console.log('je suis rentreé');
        document.getElementById('rs').disabled = true;
        document.getElementById('numero').disabled = true;
        document.getElementById('nomRue').disabled = true;
        document.getElementById('cp').disabled = true;
        document.getElementById('ville').disabled = true;
        document.getElementById('email').disabled = true;
        document.getElementById('telephone').disabled = true;
        document.getElementById('commentaire').disabled = true;
        if (societe === 'client'){
            document.getElementById('chiffreAffaire').disabled = true;
            document.getElementById('nbreEmploye').disabled = true;
        }
        if (societe === 'prospect'){
            document.getElementById('interet').disabled = true;
            document.getElementById('dateProspectYear').disabled = true;
            document.getElementById('dateProspectMonth').disabled = true;
            document.getElementById('dateProspectDay').disabled = true;
        }
    }

    document.getElementById('valider').addEventListener('click', ()=>{
        event.preventDefault(); // Empêcher le comportement par défaut du bouton (s'il est dans un formulaire, cela empêche la soumission)
        if (confirm('Vous allez ' + choix + ' le ' + societe + ' : ' + document.getElementById('rs').value)){
            document.getElementById('formulaire').submit();
        }
    })
})

