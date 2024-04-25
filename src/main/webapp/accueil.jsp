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
    <title>Accueil Reverso</title>
</head>
<body class="flex flex-col justify-between h-screen bg-reversoLight">
    <header>
        <jsp:include page="template/header.jsp" />
    </header>
    <main class="flex w-screen h-screen bg-contain bg-no-repeat bg-center md:items-start justify-center md:grid md:grid-cols-2 md:content-center" style="background-image: url('https://cdn.pixabay.com/photo/2012/04/13/20/24/laptop-33521_1280.png')">
        <p class="ml-5 text-reversoDark font-bold md:text-6xl text-xl mt-5 align-middle ">Gestion de Clients<br>et des Prospect</p>
    </main>
    <footer>
        <jsp:include page="template/footer.jsp" />
    </footer>
<script src="./js/accueil.js"></script>
</body>
</html>
