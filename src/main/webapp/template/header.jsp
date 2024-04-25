<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: miche
  Date: 12/04/2024
  Time: 09:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>header</title>
</head>
<body>
<header class="fixed w-full shadow md:flex md:items-center
    md:justify-between md:p-6 bg-reversoDark">
<nav class=" w-full">
    <div class="flex flex-wrap items-center justify-between max-w-full mx-auto">
        <div class="flex items-center space-x-3">
            <img src="img/logo_reverso.png" class="h-8 " alt="reverso Logo" />
            <span class="self-center text-2xl font-semibold whitespace-nowrap text-reversoLight">REVERSO</span>
        </div>



        <div class="flex items-center md:order-2 space-x-1 md:space-x-2 rtl:space-x-reverse">
            <div class="grid grid-rows-2 md:flex md:items-center ">
                <c:choose>
                    <c:when test="${not empty sessionScope.sessionUser}">
                        <p class="text-reversoLight hover:bg-reversoLight focus:ring-4 focus:ring-reversoLight
                                    font-medium rounded-lg text-sm px-4 py-2 md:px-5 md:py-2.5 focus:outline-none
                                    hover:text-reversoDark">${sessionScope.sessionForname} ${sessionScope.sessionName}</p>
                        <a href="${pageContext.request.contextPath}/deconnectionServlet" class="text-reversoLight hover:bg-reversoLight focus:ring-4 focus:ring-reversoLight
                                    font-medium rounded-lg text-sm px-4 py-2 md:px-5 md:py-2.5 focus:outline-none
                                    hover:text-reversoDark">Déconnection</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/connectServlet" class="text-reversoLight hover:bg-reversoLight focus:ring-4 focus:ring-reversoLight
                                    font-medium rounded-lg text-sm px-4 py-2 md:px-5 md:py-2.5 focus:outline-none
                                    hover:text-reversoDark">Login</a>
                        <a href="${pageContext.request.contextPath}/createLoginServlet" class="text-reversoLight hover:bg-reversoLight focus:ring-4 focus:ring-reversoLight
                                    font-medium rounded-lg text-sm px-4 py-2 md:px-5 md:py-2.5 focus:outline-none
                                    hover:text-reversoDark">Sign up</a>
                    </c:otherwise>
                </c:choose>
            </div>
            <button data-collapse-toggle="menu" type="button" class="inline-flex items-center p-2 w-10 h-10
                    justify-center text-sm text-reversoLight rounded-lg md:hidden hover:bg-reversoLight
                    hover:text-reversoDark focus:outline-none focus:ring-2 focus:ring-reversoLight"
                    id="mega-menu" aria-controls="mega-menu" aria-expanded="false">
                <span class="sr-only">Open main menu</span>
                <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 17 14">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 1h15M1 7h15M1 13h15"/>
                </svg>
            </button>
        </div>
        <div id="menu" class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1">
            <ul class="flex flex-col mt-4 font-medium md:flex-row md:mt-0 md:space-x-8">
                <li>
                    <a href="${pageContext.request.contextPath}/accueil.jsp"
                       class="flex items-center justify-between w-full text-reversoLight hover:bg-reversoLight focus:ring-4 focus:ring-reversoLight
                    font-bold rounded-lg text-sm px-4 py-2 md:px-5 md:py-2.5 focus:outline-none
                    hover:text-reversoDark"
                       aria-current="page">Home</a>
                </li>
                <li>
                    <button id="client-button" data-dropdown-toggle="client-dropdown"
                            class="flex items-center justify-between w-full text-reversoLight hover:bg-reversoLight hover:ring-4 hover:ring-reversoLight
                    font-bold rounded-lg text-sm px-4 py-2 md:px-5 md:py-2.5 hover:outline-none
                    hover:text-reversoDark"> Client
                        <svg class="w-2.5 h-2.5 ms-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"/>
                        </svg>
                    </button>
                    <div id="client-dropdown" class="absolute hidden z-10 grid w-auto text-sm bg-reversoDark
                            rounded-lg border border-gray-100 rounded-lg shadow-md">
                        <div class="p-4 pb-0 md:pb-4">
                            <ul class="space-y-4" aria-labelledby="mega-menu-dropdown-button">
                                <li>
                                    <a href="${pageContext.request.contextPath}/afficherServlet?societe=client&choix=afficher"
                                       class="text-reversoLight hover:bg-reversoLight hover:text-reversoDark">
                                        Afficher
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/formulaireServlet?societe=client&choix=creer" class="text-reversoLight hover:bg-reversoLight hover:text-reversoDark">
                                        Créer
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/infoSocieteServlet?societe=client&choix=modifier" class="text-reversoLight hover:bg-reversoLight hover:text-reversoDark">
                                        Modifier
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/infoSocieteServlet?societe=client&choix=supprimer" class="text-reversoLight hover:bg-reversoLight hover:text-reversoDark">
                                        Supprimer
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li>
                    <button id="prospect-button" data-dropdown-toggle="client-dropdown"
                            class="flex items-center justify-between w-full text-reversoLight hover:bg-reversoLight hover:ring-4 hover:ring-reversoLight
                    font-bold rounded-lg text-sm px-4 py-2 md:px-5 md:py-2.5 hover:outline-none
                    hover:text-reversoDark"> Prospect
                        <svg class="w-2.5 h-2.5 ms-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"/>
                        </svg>
                    </button>
                    <div id="prospect-dropdown" class="absolute hidden z-10 grid w-auto text-sm bg-reversoDark
                            border border-gray-100 rounded-lg shadow-md">
                        <div class="p-4 pb-0 md:pb-4">
                            <ul class="space-y-4" aria-labelledby="mega-menu-dropdown-button">
                                <li>
                                    <a href="${pageContext.request.contextPath}/afficherServlet?societe=prospect&choix=afficher" class="text-reversoLight hover:bg-reversoLight hover:text-reversoDark">
                                        Afficher
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/formulaireServlet?societe=prospect&choix=creer" class="text-reversoLight hover:bg-reversoLight hover:text-reversoDark">
                                        Créer
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/infoSocieteServlet?societe=prospect&choix=modifier" class="text-reversoLight hover:bg-reversoLight hover:text-reversoDark">
                                        Modifier
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/infoSocieteServlet?societe=prospect&choix=supprimer" class="text-reversoLight hover:bg-reversoLight hover:text-reversoDark">
                                        Supprimer
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
</header>
</body>
</html>
