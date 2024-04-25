package com.michel.reverso.servlet;

import com.michel.reverso.dao.DaoLogin;
import com.michel.reverso.exceptions.DaoException;
import com.michel.reverso.metiers.Login;
import com.michel.reverso.utilitaires.PasswordUtils;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.UUID;

@WebServlet(name = "connectServlet", value = "/connectServlet")
public class ConnectServlet extends HttpServlet {
    public static final String CSRF_TOKEN_SESSION_ATTR = "csrfToken";
    public static final String ATT_SESSION_USER = "sessionUser";
    public static final String ATT_SESSION_NAME = "sessionName";
    public static  final String ATT_SESSION_FORNAME = "sessionForname";

    @Override
    public void init() {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Générer un jeton CSRF et le stocker dans la session
        String csrfToken = UUID.randomUUID().toString();
        HttpSession session = request.getSession();
        session.setAttribute(CSRF_TOKEN_SESSION_ATTR, csrfToken);

        RequestDispatcher rd = request.getRequestDispatcher("/connection/login.jsp");
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

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        boolean isAuthenticated = false;

        try {
            Login login = DaoLogin.findLogin(email);
            String nom = login.getNom();
            String prenom = login.getPrenom();
            String mdp = login.getMdp();
            String salt = login.getSalt();
            if (login.getMdp() != null || login.getSalt() != null){
                // Utiliser PasswordUtils pour vérifier le mot de passe
                isAuthenticated = PasswordUtils.verifyPassword(password, mdp, salt);
            }
            if (isAuthenticated) {
                // Authentification réussie
                request.getSession().setAttribute("user", email);
                session.setAttribute(ATT_SESSION_USER, email);
                session.setAttribute(ATT_SESSION_NAME, nom);
                session.setAttribute(ATT_SESSION_FORNAME, prenom);
                this.getServletContext().getRequestDispatcher("/connection/connectionReussie.jsp").forward(request, response);

            } else {
                // Authentification échouée
                request.setAttribute("errorMessage", "Connection non reconnue");
                RequestDispatcher rd = request.getRequestDispatcher("/connection/login.jsp");
                rd.forward(request, response);
            }
        } catch (DaoException | SQLException e) {
            throw new RuntimeException(e);
        }







    }

    @Override
    public void destroy() {

    }
}