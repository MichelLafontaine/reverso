package com.michel.reverso.servlet;

import com.michel.reverso.dao.DaoClient;
import com.michel.reverso.dao.DaoProspect;
import com.michel.reverso.exceptions.DaoException;
import com.michel.reverso.exceptions.MetierException;
import com.michel.reverso.metiers.Adresse;
import com.michel.reverso.metiers.Client;
import com.michel.reverso.metiers.Prospect;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

import static com.michel.reverso.servlet.ConnectServlet.CSRF_TOKEN_SESSION_ATTR;

@WebServlet(name = "formulaireServlet", value = "/formulaireServlet")
public class FormulaireServlet extends HttpServlet {

    @Override
    public void init() {

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String societe = request.getParameter("societe");
        String choix = request.getParameter("choix");
        String raisonSociale = request.getParameter("raisonSociale");

        //Stockage des données dans l'objet request
        request.setAttribute("societe", societe);
        request.setAttribute("choix", choix);

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

        /* Récupération de la session depuis la requête */
        HttpSession session = request.getSession();
        // Vérifier le jeton CSRF soumis avec le formulaire
        String csrfToken = (String) session.getAttribute(CSRF_TOKEN_SESSION_ATTR);
        String submittedToken = request.getParameter("csrfToken");

        if (csrfToken == null || !csrfToken.equals(submittedToken)) {
            // Jeton CSRF invalide, traitement de l'erreur
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "CSRF Token Error");
            return;
        }
        String societe = request.getParameter("societe");
        String choix = request.getParameter("choix");
        String responseRaisonSociale = request.getParameter("raisonSociale");
        String raisonSociale = request.getParameter("rs");
        String numero = request.getParameter("numero");
        String nomRue = request.getParameter("nomRue");
        String cp = request.getParameter("cp");
        String ville = request.getParameter("ville");
        String email = request.getParameter("email");
        String telephone = request.getParameter("telephone");
        String commentaire = request.getParameter("commentaire");

        // Récupérer le jeton CSRF envoyé dans la requête
        String csrfTokenFromRequest = request.getParameter("csrfToken");

        // Récupérer le jeton CSRF stocké dans la session
        String csrfTokenFromSession = (String) session.getAttribute("csrfToken");

        // Vérifier que les jetons CSRF correspondent
        if (csrfTokenFromRequest != null && csrfTokenFromRequest.equals(csrfTokenFromSession)) {
            // Les jetons CSRF correspondent, traiter la requête normalement

            try {
                if (choix.equals("supprimer")){
                    int identifiant = Integer.parseInt(request.getParameter("companyId"));
                    if (societe.equals("client")){
                        DaoClient.deleteClient(identifiant);
                    }else if (societe.equals("prospect")){
                        DaoProspect.delete(identifiant);
                    }
                } else if(choix.equals("modifier")){
                    Adresse adresse = new Adresse(numero, nomRue, ville, cp);
                    int identifiant = Integer.parseInt(request.getParameter("companyId"));
                    if (societe.equals("client")) {
                        Double chiffreAffaire = Double.valueOf(request.getParameter("chiffreAffaire"));
                        int nbreEmploye = Integer.parseInt(request.getParameter("nbreEmploye"));
                        Client client = new Client(identifiant, raisonSociale, email, telephone, commentaire, adresse, chiffreAffaire, nbreEmploye);
                        DaoClient.update(client);

                    } else if (societe.equals("prospect")) {
                        int interet = Integer.parseInt(request.getParameter("interet"));
                        // Date de prospection
                        int day = Integer.parseInt(request.getParameter("dateProspectDay"));
                        int month = Integer.parseInt(request.getParameter("dateProspectMonth"));
                        int year = Integer.parseInt(request.getParameter("dateProspectYear"));
                        LocalDate dateProspection = LocalDate.of(year, month, day);
                        Prospect prospect = new Prospect(identifiant, raisonSociale, email, telephone, commentaire, adresse, dateProspection, interet);
                        DaoProspect.update(prospect);
                    }
                } else if(choix.equals("creer")){
                    Adresse adresse = new Adresse(numero, nomRue, ville, cp);
                    if (societe.equals("client")) {
                        Double chiffreAffaire = Double.valueOf(request.getParameter("chiffreAffaire"));
                        int nbreEmploye = Integer.parseInt(request.getParameter("nbreEmploye"));
                        Client client = new Client(raisonSociale, email, telephone, commentaire, adresse, chiffreAffaire, nbreEmploye);
                        DaoClient.create(client);

                    } else if (societe.equals("prospect")) {
                        int interet = Integer.parseInt(request.getParameter("interet"));
                        // Date de prospection
                        int day = Integer.parseInt(request.getParameter("dateProspectDay"));
                        int month = Integer.parseInt(request.getParameter("dateProspectMonth"));
                        int year = Integer.parseInt(request.getParameter("dateProspectYear"));
                        LocalDate dateProspection = LocalDate.of(year, month, day);
                        Prospect prospect = new Prospect(raisonSociale, email, telephone, commentaire, adresse, dateProspection, interet);
                        DaoProspect.create(prospect);
                    }
                }
            } catch (MetierException | DaoException | SQLException e) {
                throw new RuntimeException(e);
            }

            // Redirection ou réponse en fonction du résultat
            response.sendRedirect(String.format("confirmationServlet?societe=%s&&choix=%s&&raisonSociale=%s", societe, choix, responseRaisonSociale));
        } else {
            // Les jetons CSRF ne correspondent pas, rejeter la requête
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "CSRF token validation failed");
        }
    }

    @Override
    public void destroy() {

    }
}