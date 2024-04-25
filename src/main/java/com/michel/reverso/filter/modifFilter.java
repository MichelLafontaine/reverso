package com.michel.reverso.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(urlPatterns = {"/formulaireServlet", "/infoSocieteServlet"}, description = "Session check Filter") // Ce filtre s'appliquera à formulaire
public class modifFilter implements Filter {


    public static final String NOT_CONNECTION_SERVLET = "/notConnectionServlet";
    public static final String ATT_SESSION_USER = "sessionUser";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        // Logique de traitement des requêtes avant de les transférer à la servlet suivante dans la chaîne
        HttpServletRequest myRequest = (HttpServletRequest) request;
        HttpServletResponse myResponse = (HttpServletResponse) response;

        /* Non-filtrage des ressources statiques */
        String chemin = myRequest.getRequestURI().substring(myRequest.getContextPath().length());
        if (chemin.startsWith("css/")
                || chemin.startsWith("img/")
                || chemin.startsWith("js/")) {
            chain.doFilter(request, response);
            return;
        }

        /* Récupération de la session depuis la requête */
        HttpSession session = myRequest.getSession();

        /*
         * Si l'objet utilisateur n'existe pas dans la session en cours, alors
         * l'utilisateur n'est pas connecté.
         */
        if (session.getAttribute(ATT_SESSION_USER) == null) {
            /* Redirection vers la page de connexion */
            myResponse.sendRedirect( myRequest.getContextPath() + NOT_CONNECTION_SERVLET);
            //myRequest.getRequestDispatcher(ACCES_CONNEXION).forward(myRequest, myResponse);
        } else {
            /* Affichage de la page restreinte */
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
        // Nettoyage du filtre
    }
}