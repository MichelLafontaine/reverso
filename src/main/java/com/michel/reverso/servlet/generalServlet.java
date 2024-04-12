package com.michel.reverso.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "generalServlet", value = "/generalServlet")
public class generalServlet extends HttpServlet {

    @Override
    public void init() {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Récupération des données paramètres
        String societe = request.getParameter("societe");
        String choix = request.getParameter("choix");

        //Stockage des données dans l'objet request
        request.setAttribute("societe", societe);
        request.setAttribute("choix", choix);

        if (choix.equals("afficher")){
            RequestDispatcher rd = request.getRequestDispatcher("afficherServlet");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    public void destroy() {

    }
}