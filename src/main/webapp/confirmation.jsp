<%--
  Created by IntelliJ IDEA.
  User: CDA04
  Date: 18/04/2024
  Time: 11:26
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
    <title>Confirmation</title>
</head>
<body class="bg-reversoLight flex flex-col justify-between h-screen">
<header>
    <jsp:include page="template/header.jsp" />
</header>
<main class="flex justify-center mt-3 text-reversoDark font-bold md:text-2xl">
    <p>Le ${param.societe} ${param.raisonSociale} a bien été ${param.choix}</p>
</main>
<footer>
    <jsp:include page="template/footer.jsp" />
</footer>
<script src="./js/accueil.js"></script>
</body>
</html>
