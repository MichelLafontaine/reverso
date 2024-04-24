document.addEventListener('DOMContentLoaded', ()=>{
    // Récupération du nom de la JSP depuis l'URL
    var jspFileName = window.location.pathname.split("/").pop().split(".")[0];

    // Modification de l'URL affichée dans la barre d'adresse
    window.history.replaceState({}, '', 'formulaire.jsp/');

    let choix = document.getElementById('choix').value; // Récupérer la valeur de choix de la servlet
    let societe = document.getElementById('societe').value;//Récupérer l'info client ou prospect
    const boutonValider = document.getElementById('valider');
    const rs = document.getElementById('rs');
    const numero = document.getElementById('numero');
    const nomRue = document.getElementById('nomRue');
    const cp = document.getElementById('cp');
    const ville = document.getElementById('ville');
    const email = document.getElementById('email');
    const telephone = document.getElementById('telephone');
    const commentaire = document.getElementById('commentaire');
    const ca = document.getElementById('chiffreAffaire');
    const nbreEmploye = document.getElementById('nbreEmploye');
    const interet = document.getElementById('interet');
    const jour = document.getElementById('dateProspectDay');
    const mois = document.getElementById('dateProspectMonth');
    const annee = document.getElementById('dateProspectYear');

// Désactiver les inputs si choix est "supprimer"
    if (choix === 'supprimer') {
        rs.disabled = true;
        numero.disabled = true;
        nomRue.disabled = true;
        cp.disabled = true;
        ville.disabled = true;
        email.disabled = true;
        telephone.disabled = true;
        commentaire.disabled = true;
        if (societe === 'client'){
            ca.disabled = true;
            nbreEmploye.disabled = true;
        }
        if (societe === 'prospect'){
            interet.disabled = true;
            annee.disabled = true;
            mois.disabled = true;
            jour.disabled = true;
        }
    }

    boutonValider.addEventListener('click', (event)=>{
        event.preventDefault(); // Empêcher le comportement par défaut du bouton (s'il est dans un formulaire, cela empêche la soumission)
        if (confirm('Vous allez ' + choix + ' le ' + societe + ' : ' + document.getElementById('rs').value)){
            let isValid = true;

            // Vérification si le champ 'raison Sociale' est vide
            if (!rs.value.trim()) {
                rs.classList.add('border', 'border-red-500'); // Ajoute une bordure rouge si le champ est vide
                isValid = false;
            } else {
                rs.classList.remove('border', 'border-red-500'); // Retire la bordure rouge si le champ est rempli
            };

            // Vérification si le champ 'numero' est vide
            if (!numero.value.trim()) {
                numero.classList.add('border', 'border-red-500'); // Ajoute une bordure rouge si le champ est vide
                isValid = false;
            } else {
                numero.classList.remove('border', 'border-red-500'); // Retire la bordure rouge si le champ est rempli
            };

            // Vérification si le champ 'nomRue' est vide
            if (!nomRue.value.trim()) {
                nomRue.classList.add('border', 'border-red-500'); // Ajoute une bordure rouge si le champ est vide
                isValid = false;
            } else {
                nomRue.classList.remove('border', 'border-red-500'); // Retire la bordure rouge si le champ est rempli
            };

            // Vérification si le champ 'cp' est vide
            if (!cp.value.trim()) {
                cp.classList.add('border', 'border-red-500'); // Ajoute une bordure rouge si le champ est vide
                isValid = false;
            } else {
                cp.classList.remove('border', 'border-red-500'); // Retire la bordure rouge si le champ est rempli
            };

            // Vérification si le champ 'ville' est vide
            if (!ville.value.trim()) {
                ville.classList.add('border', 'border-red-500'); // Ajoute une bordure rouge si le champ est vide
                isValid = false;
            } else {
                ville.classList.remove('border', 'border-red-500'); // Retire la bordure rouge si le champ est rempli
            };

            // Vérification si le champ 'email' est vide
            if (!email.value.trim()) {
                email.classList.add('border', 'border-red-500'); // Ajoute une bordure rouge si le champ est vide
                isValid = false;
            } else {
                email.classList.remove('border', 'border-red-500'); // Retire la bordure rouge si le champ est rempli
            };

            // Vérification si le champ 'telephone' est vide
            if (!telephone.value.trim()) {
                telephone.classList.add('border', 'border-red-500'); // Ajoute une bordure rouge si le champ est vide
                isValid = false;
            } else {
                telephone.classList.remove('border', 'border-red-500'); // Retire la bordure rouge si le champ est rempli
            };

            if (societe === 'client'){
                // Vérification si le champ 'ca' est vide
                if (!ca.value.trim()) {
                    ca.classList.add('border', 'border-red-500'); // Ajoute une bordure rouge si le champ est vide
                    isValid = false;
                } else {
                    ca.classList.remove('border', 'border-red-500'); // Retire la bordure rouge si le champ est rempli
                };

                // Vérification si le champ 'nbreEmploye' est vide
                if (!nbreEmploye.value.trim()) {
                    nbreEmploye.classList.add('border', 'border-red-500'); // Ajoute une bordure rouge si le champ est vide
                    isValid = false;
                } else {
                    nbreEmploye.classList.remove('border', 'border-red-500'); // Retire la bordure rouge si le champ est rempli
                };
            }
            if (societe === 'prospect'){
                // Vérification si le champ 'interet' est vide
                if (!interet.value.trim()) {
                    interet.classList.add('border', 'border-red-500'); // Ajoute une bordure rouge si le champ est vide
                    isValid = false;
                } else {
                    interet.classList.remove('border', 'border-red-500'); // Retire la bordure rouge si le champ est rempli
                };

                // Vérification si le champ 'annee' est vide
                if (!annee.value.trim()) {
                    annee.classList.add('border', 'border-red-500'); // Ajoute une bordure rouge si le champ est vide
                    isValid = false;
                } else {
                    annee.classList.remove('border', 'border-red-500'); // Retire la bordure rouge si le champ est rempli
                };

                // Vérification si le champ 'mopis' est vide
                if (!mois.value.trim()) {
                    mois.classList.add('border', 'border-red-500'); // Ajoute une bordure rouge si le champ est vide
                    isValid = false;
                } else {
                    mois.classList.remove('border', 'border-red-500'); // Retire la bordure rouge si le champ est rempli
                };

                // Vérification si le champ 'jour' est vide
                if (!jour.value.trim()) {
                    jour.classList.add('border', 'border-red-500'); // Ajoute une bordure rouge si le champ est vide
                    isValid = false;
                } else {
                    jour.classList.remove('border', 'border-red-500'); // Retire la bordure rouge si le champ est rempli
                };
            }

            if (isValid){
                document.getElementById('formulaire').submit();
            } else {
                alert('Veuillez remplir tous les champs requis');
            }

        }
    })
})

