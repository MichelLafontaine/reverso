<%--
  Created by IntelliJ IDEA.
  User: CDA04
  Date: 23/04/2024
  Time: 10:16
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
    <jsp:include page="../template/header.jsp" />
</header>
<main>
    <div class="min-h-screen flex items-center justify-center w-full text-reversoLight text-center">
        <div class="bg-reversoDark shadow-md rounded-lg px-8 py-6 max-w-md">
            <p>Vous n'avez pas les droits pour la création, la modification et la suppression de Client ou de Prospect.</p>
            <p>Merci de vous connecter avant de faire des modifications</p>
            <div>
                <button type="button" id="boutonLogin" value="boutonValider"
                        class="bg-reversoLight font-bold w-full flex justify-center py-2 px-4 border border-transparent mt-10
                        rounded-md shadow-sm text-sm text-reversoDark hover:bg-reversoDark hover:ring-2 hover:text-reversoLight
                        hover:ring-reversoLight focus:outline-none focus:ring-2 focus:ring-offset-2
                        focus:ring-indigo-500">
                    <a href="${pageContext.request.contextPath}/connectServlet">Login</a>
                </button>
                <button type="button" id="boutonCreate" value="boutonValider"
                        class="bg-reversoLight font-bold w-full flex justify-center py-2 px-4 border border-transparent mt-10
                        rounded-md shadow-sm text-sm text-reversoDark hover:bg-reversoDark hover:ring-2 hover:text-reversoLight
                        hover:ring-reversoLight focus:outline-none focus:ring-2 focus:ring-offset-2
                        focus:ring-indigo-500">
                    <a href="${pageContext.request.contextPath}/createLoginServlet">Créer votre compte</a>
                </button>
            </div>

        </div>
    </div>
</main>
<footer>
    <jsp:include page="../template/footer.jsp" />
</footer>
<script src="js/accueil.js"></script>
</body>
</html>