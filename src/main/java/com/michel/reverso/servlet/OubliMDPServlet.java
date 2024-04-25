package com.michel.reverso.servlet;

import com.michel.reverso.smtp.EmailSender;
import com.michel.reverso.smtp.SmtpEnvoi;
import jakarta.mail.MessagingException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "oubliMDPServlet", value = "/oubliMDPServlet")
public class OubliMDPServlet extends HttpServlet {

    @Override
    public void init() {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/connection/oubliMDP.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = "michel_lafontaine@orange.fr";
        String sujet = "test";
        String contenu = "j'ai réussi avec brio";
//        SmtpEnvoi smtpEnvoi = new SmtpEnvoi(email, sujet, contenu);
        try {
//            smtpEnvoi.demandeNouveauMDP();
            EmailSender.sendEmail(email, sujet, contenu);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
        RequestDispatcher rd = request.getRequestDispatcher("/connection/confirmationEnvoiLienMDP.jsp");
        rd.forward(request, response);
    }

    @Override
    public void destroy() {

    }
}