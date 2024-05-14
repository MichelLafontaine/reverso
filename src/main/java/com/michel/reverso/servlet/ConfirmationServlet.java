package com.michel.reverso.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "confirmationServlet", value = "/confirmationServlet")
public class ConfirmationServlet extends HttpServlet {

    @Override
    public void init() {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String societe = request.getParameter("societe");
        String raisonSociale = request.getParameter("raisonSociale");
        String choix = request.getParameter("choix");

        //Stockage des données dans l'objet request
        request.setAttribute("societe", societe);
        request.setAttribute("raisonSociale", raisonSociale);
        request.setAttribute("choix", choix);

        RequestDispatcher rd = request.getRequestDispatcher("/confirmation.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    public void destroy() {

    }
}