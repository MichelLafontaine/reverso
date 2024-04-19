package com.michel.reverso.servlet;

import com.michel.reverso.dao.DaoClient;
import com.michel.reverso.dao.DaoProspect;
import com.michel.reverso.exceptions.DaoException;
import com.michel.reverso.exceptions.MetierException;
import com.michel.reverso.metiers.Adresse;
import com.michel.reverso.metiers.Client;
import com.michel.reverso.metiers.Prospect;
import com.michel.reverso.metiers.Societe;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.time.LocalDate;

@WebServlet(name = "formulaireServlet", value = "/formulaireServlet")
public class formulaireServlet extends HttpServlet {

    @Override
    public void init() {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String societe = request.getParameter("societe");
        String choix = request.getParameter("choix");
        String raisonSociale = request.getParameter("raisonSociale");

        if (choix.equals("modifier") || choix.equals("supprimer")){
            try {
                if (societe.equals("client")){
                    Client client = DaoClient.findByName(raisonSociale);
                    request.setAttribute("infoCompany", client);
                } else if (societe.equals("prospect")) {
                    Prospect prospect = DaoProspect.findByName(raisonSociale);
                    request.setAttribute("infoCompany", prospect);
                }
            } catch (DaoException e) {
                throw new RuntimeException(e);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }


        RequestDispatcher rd = request.getRequestDispatcher("/formulaire.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String societe = request.getParameter("societe");
        String choix = request.getParameter("choix");
        String responseRaisonSociale = request.getParameter("raisonSociale");
        int identifiant = Integer.parseInt(request.getParameter("companyId"));
        String raisonSociale = request.getParameter("rs");
        String numero = request.getParameter("numero");
        String nomRue = request.getParameter("nomRue");
        String cp = request.getParameter("cp");
        String ville = request.getParameter("ville");
        String email = request.getParameter("email");
        String telephone = request.getParameter("telephone");
        String commentaire = request.getParameter("commentaire");
        try {
            if (choix.equals("supprimer")){
                if (societe.equals("client")){
                    DaoClient.deleteClient(identifiant);
                }else if (societe.equals("prospect")){
                    DaoProspect.delete(identifiant);
                }
            } else {
                Adresse adresse = new Adresse(numero, nomRue, ville, cp);
                if (societe.equals("client")) {
                    Double chiffreAffaire = Double.valueOf(request.getParameter("chiffreAffaire"));
                    int nbreEmploye = Integer.parseInt(request.getParameter("nbreEmploye"));
                    Client client = new Client(identifiant, raisonSociale, email, telephone, commentaire, adresse, chiffreAffaire, nbreEmploye);
                    DaoClient.update(client);

                } else if (societe.equals("prospect")) {
                    int interet = Integer.parseInt(request.getParameter("interet"));
                    // Date de prospection peut nécessiter une construction spécifique si les valeurs sont séparées
                    int day = Integer.parseInt(request.getParameter("dateProspectDay"));
                    int month = Integer.parseInt(request.getParameter("dateProspectMonth"));
                    int year = Integer.parseInt(request.getParameter("dateProspectYear"));
                    LocalDate dateProspection = LocalDate.of(year, month, day);
                    Prospect prospect = new Prospect(identifiant, raisonSociale, email, telephone, commentaire, adresse, dateProspection, interet);
                    DaoProspect.update(prospect);
                }
            }
        } catch (MetierException | DaoException | SQLException e) {
            throw new RuntimeException(e);
        }

        // Redirection ou réponse en fonction du résultat
        response.sendRedirect(String.format("confirmationServlet?societe=%s&&choix=%s&&raisonSociale=%s", societe, choix, responseRaisonSociale));
    }

    @Override
    public void destroy() {

    }
}