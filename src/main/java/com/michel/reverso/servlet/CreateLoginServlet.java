package com.michel.reverso.servlet;

import com.michel.reverso.dao.DaoLogin;
import com.michel.reverso.metiers.Login;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "createLoginServlet", value = "/createLoginServlet")
public class CreateLoginServlet extends HttpServlet {

    @Override
    public void init() {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/connection/createLogin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String mail = request.getParameter("email");
        String password = request.getParameter("password");



        try {
            Login login = new Login(mail, nom, prenom, password);
            DaoLogin.createLogin(login);
            String nomLogin = login.getNom();
            String prenomLogin = login.getPrenom();
            request.setAttribute("nomLogin", nomLogin);
            request.setAttribute("prenomLogin", prenomLogin);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        RequestDispatcher rd = request.getRequestDispatcher("/connection/creationLoginConfirmation.jsp");
        rd.forward(request, response);
    }

    @Override
    public void destroy() {

    }
}