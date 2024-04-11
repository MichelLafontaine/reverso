package com.michel.reverso.utilitaires;

import java.time.format.DateTimeFormatter;
import java.util.regex.Pattern;

/**
 * classe utilitaires
 */
public class Utilitaires {

    private Utilitaires(){}
    /**
     * pattern mail
     */

    // vérification de l'adresse mail
    public static final Pattern PATTERN_MAIL =
            Pattern.compile ("(\\S.*\\S)(@)(\\S.*\\S)(.\\S[a-z]{2,3})");

    /**
     * pattern telephone
     */
    // Numéro de téléphone français
    public static final Pattern PATTERN_TEL =
            Pattern.compile("(0|\\+33|0033)[1-9]\\d{8}");

    /**
     * pattern code postal
     */
    //Code Postal français doit comporter 5 chiffres
    public static final Pattern PATTERN_CODEPOSTAL =
            Pattern.compile("\\d{5}");

    /**
     * format Date dd/MM/yyyy
     * @return DateTimeFormatter dd/MM/yyyy
     */
    //format date Local
    public static DateTimeFormatter formatDate (){
        return DateTimeFormatter.ofPattern("dd/MM/yyyy");
    }
}
