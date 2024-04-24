package com.michel.reverso.exceptions;

/**
 * en cas d'erreur dans le package Controller
 */
public class LoginException extends Exception{
    /**
     * constructeur sans attribut
     */
    public LoginException(){

    }

    /**
     * constructeur avec message
     * @param message String message pour l'utilisateur
     */
    public LoginException(String message){
        super(message);
    }
}
