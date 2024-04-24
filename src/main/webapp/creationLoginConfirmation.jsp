<%--
  Created by IntelliJ IDEA.
  User: CDA04
  Date: 24/04/2024
  Time: 11:16
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
    <title>Accueil Reverso</title>
</head>
<body class="flex flex-col justify-between h-screen bg-reversoLight">
<header>
    <jsp:include page="header.jsp" />
</header>
<main class="flex w-full h-screen bg-contain bg-no-repeat bg-center md:items-start justify-center md:content-center">
    <div class="min-h-screen flex items-center justify-center w-full">
        <p class="">Merci pour la création de votre compte : ${prenomLogin} ${nomLogin}</p>
    </div>
</main>

<footer>
    <jsp:include page="footer.jsp" />
</footer>
<script src="./js/accueil.js"></script>
</body>
</html>
