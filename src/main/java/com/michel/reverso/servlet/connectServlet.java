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

@WebServlet(name = "connectServlet", value = "/connectServlet")
public class connectServlet extends HttpServlet {

    public static final String ATT_SESSION_USER = "sessionUser";
    public static final String ATT_SESSION_NAME = "sessionName";
    public static  final String ATT_SESSION_FORNAME = "sessionForname";

    @Override
    public void init() {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String hash = null;
        String salt = null;

        boolean isAuthenticated = false;

        /* Récupération de la session depuis la requête */
        HttpSession session = request.getSession();

        try {
            Login login = DaoLogin.findLogin(email);
            String nom = login.getNom();
            String prenom = login.getPrenom();
            String mdp = login.getMdp();
            salt = login.getSalt();
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
                this.getServletContext().getRequestDispatcher("/connectionReussie.jsp").forward(request, response);
            } else {
                // Authentification échouée
                request.setAttribute("errorMessage", "Connection non reconnue");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
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