<%--
  Created by IntelliJ IDEA.
  User: CDA04
  Date: 24/04/2024
  Time: 16:29
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
    <title>Déconnection</title>
</head>
<body class="flex flex-col justify-between h-screen bg-reversoLight">
<header>
    <jsp:include page="header.jsp" />
</header>
<main class="flex w-full h-screen bg-contain bg-no-repeat bg-center md:items-start justify-center md:content-center">
    <div class="min-h-screen flex items-center justify-center w-full text-reversoDark font-bold">
        <p class="self-center">Projet JEE réalisé par Michel LAFONTAINE</p>
        <ul class="m-10">
            <li>Réaliser pendant ma formation à l'AFPA en 2024/2025</li>
            <li>Première approche JEE</li>
            <li>Utilisation Maven, Argon2, JSTL</li>
            <li>relié à une BDD sur MySQL</li>
            <li>Utilisation de Tailwindcss</li>
        </ul>

    </div>
</main>>

<footer>
    <jsp:include page="footer.jsp" />
</footer>
<script src="./js/accueil.js"></script>
</body>
</html>
