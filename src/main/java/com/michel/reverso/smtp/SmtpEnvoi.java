package com.michel.reverso.smtp;

import jakarta.mail.MessagingException;
import jakarta.mail.Session;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class SmtpEnvoi {

    private static final String MON_EMAIL = "test.reverso.Afpa@gmail.com";
    private String emailRecipient;
    private String emailSujet;
    private String emailContenu;

    public SmtpEnvoi(String emailRecipient, String emailSujet, String emailContenu) {
        this.emailRecipient = emailRecipient;
        this.emailSujet = emailSujet;
        this.emailContenu = emailContenu;
    }

    public String getEmailRecipient() {
        return emailRecipient;
    }

    public void setEmailRecipient(String emailRecipient) {
        this.emailRecipient = emailRecipient;
    }

    public String getEmailSujet() {
        return emailSujet;
    }

    public void setEmailSujet(String emailSujet) {
        this.emailSujet = emailSujet;
    }

    public String getEmailContenu() {
        return emailContenu;
    }

    public void setEmailContenu(String emailContenu) {
        this.emailContenu = emailContenu;
    }

    public void demandeNouveauMDP() throws MessagingException {
        SmtpConnection smtpConnection = SmtpConnection.getInstance();
        Session session = smtpConnection.getSession();
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(MON_EMAIL));
        message.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(emailRecipient));
        message.setSubject(emailSujet);
        message.setText(emailContenu);

        smtpConnection.sendMessage(message);
    }
}
