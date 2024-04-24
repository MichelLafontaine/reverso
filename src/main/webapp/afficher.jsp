<%--
  Created by IntelliJ IDEA.
  User: miche
  Date: 12/04/2024
  Time: 09:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html>
<head>
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
    <title>Afficher ${societe}</title>
</head>
<body class="bg-reversoLight flex flex-col justify-between h-screen">
    <header>
        <jsp:include page="header.jsp"/>
    </header>
    <main class="flex justify-center flex-grow mt-3 items-start md:mt-28 mt-16">
        <div class="overflow-auto">
            <table class="border border-reversoDark border-2">
                <tr>
                    <th class="border border-reversoDark text-center p-3">Raison Sociale</th>
                    <th class="border border-reversoDark text-center p-3">Numéro de rue</th>
                    <th class="border border-reversoDark text-center p-3">Nom de rue</th>
                    <th class="border border-reversoDark text-center p-3">Code Postal</th>
                    <th class="border border-reversoDark text-center p-3">Ville</th>
                    <th class="border border-reversoDark text-center p-3">email</th>
                    <th class="border border-reversoDark text-center p-3">telephone</th>
                    <c:choose>
                        <c:when test="${societe.equals('client')}">
                            <th class="border border-reversoDark text-center p-3">Chiffre d'affaire</th>
                            <th class="border border-reversoDark text-center p-3">nbre d'employé</th>
                        </c:when>
                        <c:when test="${societe.equals('prospect')}">
                            <th class="border border-reversoDark text-center p-3">Date Prospect</th>
                            <th class="border border-reversoDark text-center p-3">intérêt</th>
                        </c:when>
                    </c:choose>
                    <th class="border border-reversoDark text-center p-3">commentaire</th>
                </tr>
                <!-- Parcours de la liste des clients et affichage des données -->
                <c:choose>
                    <c:when test="${societe.equals('client')}">
                        <c:forEach items="${clients}" var="client">
                            <tr>
                                <td class="border border-reversoDark text-center p-3">${client.raisonSociale}</td>
                                <td class="border border-reversoDark text-center p-3">${client.adresse.numero}</td>
                                <td class="border border-reversoDark text-center p-3">${client.adresse.nomRue}</td>
                                <td class="border border-reversoDark text-center p-3">${client.adresse.codePostal}</td>
                                <td class="border border-reversoDark text-center p-3">${client.adresse.ville}</td>
                                <td class="border border-reversoDark text-center p-3">${client.email}</td>
                                <td class="border border-reversoDark text-center p-3">${client.telephone}</td>
                                <td class="border border-reversoDark text-center p-3">${client.chiffreAffaire} €</td>
                                <td class="border border-reversoDark text-center p-3">${client.nbreEmploye}</td>
                                <td class="border border-reversoDark text-center p-3">${client.commentaire}</td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:when test="${societe.equals('prospect')}">
                        <c:forEach items="${prospects}" var="prospect">
                            <tr>
                                <td class="border border-reversoDark text-center p-3">${prospect.raisonSociale}</td>
                                <td class="border border-reversoDark text-center p-3">${prospect.adresse.numero}</td>
                                <td class="border border-reversoDark text-center p-3">${prospect.adresse.nomRue}</td>
                                <td class="border border-reversoDark text-center p-3">${prospect.adresse.codePostal}</td>
                                <td class="border border-reversoDark text-center p-3">${prospect.adresse.ville}</td>
                                <td class="border border-reversoDark text-center p-3">${prospect.email}</td>
                                <td class="border border-reversoDark text-center p-3">${prospect.telephone}</td>
                                <td class="border border-reversoDark text-center p-3">
                                    <fmt:parseDate var="date" value="${prospect.dateProspect}" pattern="yyyy-MM-dd"/>
                                    <fmt:formatDate value="${date}" pattern="dd/MM/yyyy"/></td>
                                <td class="border border-reversoDark text-center p-3">
                                    <c:choose>
                                        <c:when test="${prospect.interetProspect == 0}">Non</c:when>
                                        <c:when test="${prospect.interetProspect == 1}">Oui</c:when>
                                    </c:choose>
                                </td>
                                <td class="border border-reversoDark text-center p-3">${prospect.commentaire}</td>
                            </tr>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </table>
        </div>

    </main>
    <footer>
        <jsp:include page="footer.jsp"/>
    </footer>
    <script src="js/afficher.js"></script>
    <script src="js/accueil.js"></script>
</body>
</html>
