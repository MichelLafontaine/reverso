package com.michel.reverso.metiers;

import com.michel.reverso.exceptions.MetierException;
import com.michel.reverso.utilitaires.Utilitaires;

public class Login {

    private String loginEmail;
    private String nom;
    private String prenom;
    private String mdp;
    private String salt;

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getLoginEmail() {
        return loginEmail;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) throws MetierException {
        if (nom == null || nom.trim().isEmpty()){
            throw new MetierException("Le prénom ne doit pas être vide");
        }
        if (nom.length() > 100){
            throw new MetierException("La raison sociale dépasse les 100 caractères");
        }
        this.nom = nom.toUpperCase();
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) throws MetierException {
        if (prenom == null || prenom.trim().isEmpty()){
            throw new MetierException("Le prénom ne doit pas être vide");
        }
        if (prenom.length() > 100){
            throw new MetierException("La raison sociale dépasse les 100 caractères");
        }

        String[] prenomParts = prenom.split("\\s");

        StringBuilder prenomBuilder = new StringBuilder();

        for (String part : prenomParts) {
            if (!part.isEmpty()) {
                if (part.contains("-")) { // Si la partie contient un tiret
                    String[] hyphenParts = part.split("-"); // Diviser la partie par le tiret
                    for (String hyphenPart : hyphenParts) {
                        String firstLetter = hyphenPart.substring(0, 1).toUpperCase();
                        String restOfPart = hyphenPart.substring(1).toLowerCase();
                        prenomBuilder.append(firstLetter).append(restOfPart).append("-");
                    }
                    prenomBuilder.setCharAt(prenomBuilder.length() - 1, ' '); // Remplacer le dernier tiret par un espace
                } else {
                    String firstLetter = part.substring(0, 1).toUpperCase();
                    String restOfPart = part.substring(1).toLowerCase();
                    prenomBuilder.append(firstLetter).append(restOfPart).append(" ");
                }
            }
        }

        this.prenom = prenomBuilder.toString().trim();
    }

    public void setLoginEmail(String loginEmail) throws MetierException {
        if (loginEmail == null || loginEmail.trim().isEmpty() || !Utilitaires.PATTERN_MAIL.matcher(loginEmail).matches()){
            throw new MetierException("l'adresse email ne doit pas être vide");
        }
        if (!Utilitaires.PATTERN_MAIL.matcher(loginEmail).matches()) {
            throw new MetierException("L'email n'est pas au bon format");
        }
        this.loginEmail = loginEmail.toLowerCase();
    }

    public String getMdp() {
        return mdp;
    }

    public void setMdp(String mdp) throws MetierException {
        if (mdp == null || mdp.trim().isEmpty() || mdp.length() < 5){
            throw new MetierException("Le mot de passe doit comporter au moins 5 caractères");
        }
        if (mdp.length() > 100){
            throw new MetierException("Le mot de passe dépasse les 100 caractères");
        }
        this.mdp = mdp;
    }

    public Login() {
    }

    public Login(String loginEmail, String nom, String prenom, String mdp) throws Exception {
        setNom(nom);
        setMdp(mdp);
        setPrenom(prenom);
        setLoginEmail(loginEmail);
    }

    public Login(String loginEmail, String nom, String prenom, String mdp, String salt) throws MetierException {
        setLoginEmail(loginEmail);
        setNom(nom);
        setPrenom(prenom);
        setMdp(mdp);
        setSalt(salt);
    }
}
