package com.michel.reverso.smtp;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;

public class EmailSender {

    private static final String HOST = "smtp.gmail.com";
    private static final String PORT = "465"; // Port SMTP pour SSL
    private static final String USERNAME = "test.reverso.afpa@gmail.com"; // Adresse e-mail Orange
    private static final String PASSWORD = "testreversoafpa"; // Mot de passe de l'adresse e-mail

    public static void sendEmail(String to, String subject, String content) throws MessagingException {
        // Configurer les propriétés pour la connexion SMTP
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true"); // Utilisation de SSL pour Orange
        props.put("mail.smtp.host", HOST);
        props.put("mail.smtp.port", PORT);

        // Créer une session SMTP avec authentification
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(USERNAME, PASSWORD);
            }
        });

        // Créer le message e-mail
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(USERNAME));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        message.setSubject(subject);
        message.setText(content);

        // Envoyer le message
        Transport.send(message);
    }
}
