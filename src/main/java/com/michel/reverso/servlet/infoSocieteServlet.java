package com.michel.reverso.servlet;

import com.michel.reverso.dao.DaoClient;
import com.michel.reverso.dao.DaoProspect;
import com.michel.reverso.metiers.Client;
import com.michel.reverso.metiers.Prospect;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "infoSocieteServlet", value = "/infoSocieteServlet")
public class infoSocieteServlet extends HttpServlet {

    @Override
    public void init() {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String societe = request.getParameter("societe");
        String choix = request.getParameter("choix");

        if (societe.equals("client")){
            try {
                List<Client> clients = DaoClient.findAll();
                request.setAttribute("clients", clients);
                RequestDispatcher rd = request.getRequestDispatcher("/infoSociete.jsp");
                rd.forward(request, response);
            } catch (Exception e) {
                RequestDispatcher rd = request.getRequestDispatcher("/erreur.jsp");
                rd.forward(request, response);
            }
        }
        if (societe.equals("prospect")){
            try {
                List<Prospect> prospects = DaoProspect.findAll();
                request.setAttribute("prospects", prospects);
                RequestDispatcher rd = request.getRequestDispatcher("/infoSociete.jsp");
                rd.forward(request, response);
            } catch (Exception e) {
                RequestDispatcher rd = request.getRequestDispatcher("/erreur.jsp");
                rd.forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    public void destroy() {

    }
}