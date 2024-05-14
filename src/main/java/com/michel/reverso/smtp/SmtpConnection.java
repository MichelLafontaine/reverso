package com.michel.reverso.smtp;

import jakarta.mail.MessagingException;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;

public class SmtpConnection {

    private static SmtpConnection instance;
    private Session session;

    private SmtpConnection() {
        // Initialiser la session SMTP
        this.session = createSession();
    }

    public static synchronized SmtpConnection getInstance() {
        if (instance == null) {
            instance = new SmtpConnection();
        }
        return instance;
    }

    public Session getSession() {
        return session;
    }

    public void sendMessage(MimeMessage message) throws MessagingException {
        // Récupérer le transport SMTP depuis la session
        Transport transport = session.getTransport("smtp");

        try {
            // Se connecter au serveur SMTP
            transport.connect();

            // Envoyer le message
            transport.sendMessage(message, message.getAllRecipients());
        } finally {
            // Fermer la connexion
            transport.close();
        }
    }

    private Session createSession() {
        // Configuration des propriétés SMTP
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.ssl.enable", "true"); // Utilisation de SSL
        props.put("mail.smtp.auth", "true"); // Authentification requise

        // Création de la session SMTP avec authentification

        return Session.getInstance(props, new jakarta.mail.Authenticator() {
            protected jakarta.mail.PasswordAuthentication getPasswordAuthentication() {
                return new jakarta.mail.PasswordAuthentication("test.reverso.afpa@gmail.com", "testreversoafpa");
            }
        });
    }
}
