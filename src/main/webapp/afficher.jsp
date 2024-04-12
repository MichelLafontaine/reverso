<%--
  Created by IntelliJ IDEA.
  User: miche
  Date: 12/04/2024
  Time: 09:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <main>
        <table>
            <tr>
                <th>Raison Sociale</th>
                <th>Numéro de rue</th>
                <th>Nom de rue</th>
                <th>Code Postal</th>
                <th>Ville</th>
                <th>email</th>
                <th>telephone</th>
                <th>Chiffre d'affaire</th>
                <th>nbre d'employé</th>
                <th>commentaire</th>
            </tr>
            <!-- Parcours de la liste des clients et affichage des données -->
            <c:forEach items="${clients}" var="client">
                <tr>
                    <td>${client.raisonSociale}</td>
                    <td>${client.adresse.numero}</td>
                    <td>${client.adresse.nomRue}</td>
                    <td>${client.adresse.codePostal}</td>
                    <td>${client.adresse.ville}</td>
                    <td>${client.email}</td>
                    <td>${client.telephone}</td>
                    <td>${client.chiffreAffaire}</td>
                    <td>${client.nbreEmploye}</td>
                    <td>${client.commentaire}</td>
                </tr>
            </c:forEach>
        </table>
    </main>
    <footer>
        <jsp:include page="footer.jsp"/>
    </footer>
    <script src="js/afficher.js"></script>
    <script src="js/accueil.js"></script>
</body>
</html>
