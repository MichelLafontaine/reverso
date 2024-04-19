<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: CDA04
  Date: 10/04/2024
  Time: 09:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%--    <link href="css/output.css" rel="stylesheet">--%>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        reversoLight: "#DFD4B6",
                        reversoDark: "#948A9D"
                    }
                },
            },
        }
    </script>
    <title>${param.choix} un ${param.societe}</title>
</head>
<body class="bg-reversoLight flex flex-col justify-between h-screen">
    <header>
        <jsp:include page="header.jsp" />
    </header>
    <input type="hidden" id="societe" name="societe" value="${param.societe}" />
    <input type="hidden" id="choix" name="choix" value="${param.choix}" />
    <main class="flex mt-3 flex-grow justify-center">
        <div class="flex flex-col">
            <p class="text-reversoDark font-bold md:text-4xl items-center"> Quel ${param.societe} voulez-vous ${param.choix} ?</p>
            <button id="societe-button" data-dropdown-toggle="societe-dropdown"
                    class="flex items-center justify-between w-full py-2 px-3 mt-5 font-medium text-reversoLight
                    bg-reversoDark rounded-2xl
                    hover:ring-2 hover:ring-reversoDark hover:bg-reversoLight hover:text-reversoDark">Liste des Sociètés
                <svg class="w-2.5 h-2.5 ms-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"></path>
                </svg>
            </button>
            <div id="societe-dropdown" class="absolute hidden z-10 grid w-auto text-sm bg-reversoDark
                            border border-gray-100 rounded-lg shadow-md">
                <div class="p-4 pb-0 md:pb-4">
                    <ul class="space-y-4" aria-labelledby="societe-dropdown-button">
                        <c:choose>
                            <c:when test="${societe.equals('client')}">
                                <c:forEach items="${clients}" var="client">
                                    <li>
                                        <button onclick="changeSocieteValue('${client.raisonSociale}')"
                                           class="text-reversoLight hover:bg-reversoLight hover:text-reversoDark">
                                                ${client.raisonSociale} </button>
                                    </li>
                                </c:forEach>
                            </c:when>
                            <c:when test="${societe.equals('prospect')}">
                                <c:forEach items="${prospects}" var="prospect">
                                    <li>
                                        <button onclick="changeSocieteValue('${prospect.raisonSociale}')"
                                           class="text-reversoLight hover:bg-reversoLight hover:text-reversoDark">
                                                ${prospect.raisonSociale} </button>
                                    </li>
                                </c:forEach>
                            </c:when>
                        </c:choose>
                    </ul>
                </div>
            </div>
            <button onclick="validerChoix()" id="valider"
                    class="bg-reversoDark text-reversoLight rounded-2xl mt-5 py-2 px-3 w-full md:w-1/2 self-center
                    hover:ring-2 hover:ring-reversoDark hover:bg-reversoLight hover:text-reversoDark overflow-auto">
                Valider
            </button>
        </div>
    </main>
    <footer>
        <jsp:include page="footer.jsp" />
    </footer>
<script src="./js/infoSociete.js"></script>
<script src="./js/accueil.js"></script>
</body>
</html>
