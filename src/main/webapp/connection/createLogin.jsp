<%--
  Created by IntelliJ IDEA.
  User: CDA04
  Date: 24/04/2024
  Time: 10:11
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
    <div class="min-h-screen flex items-center justify-center w-full">
        <div class="bg-reversoDark shadow-md rounded-lg px-8 py-6 max-w-md">
            <h1 class="text-2xl font-bold text-center mb-4 text-reversoLight">Créer un nouveau compte</h1>
            <form id="createLogin" action="<%=request.getContextPath()%>/createLoginServlet" method="post">
                <div class="mb-4">
                    <label for="nom" class="block text-sm font-medium text-reversoLight mb-2">NOM</label>
                    <input type="text" id="nom" name="nom"
                           class="shadow-sm rounded-md w-full px-3 py-2 border border-gray-300 focus:outline-none
                           focus:ring-indigo-500 focus:border-indigo-500" placeholder="VOTRE NOM" required>
                </div>
                <div class="mb-4">
                <label for="prenom" class="block text-sm font-medium text-reversoLight mb-2">Prénom</label>
                <input type="text" id="prenom" name="prenom"
                       class="shadow-sm rounded-md w-full px-3 py-2 border border-gray-300 focus:outline-none
                       focus:ring-indigo-500 focus:border-indigo-500" placeholder="Votre Prénom" required>
                </div>
                <div class="mb-4">
                    <label for="email" class="block text-sm font-medium text-reversoLight mb-2">Email Address</label>
                    <input type="email" id="email" name="email" class="shadow-sm rounded-md w-full px-3 py-2 border border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500" placeholder="your@email.com" required>
                </div>
                <div class="mb-4">
                    <label for="password" class="block text-sm font-medium text-reversoLight mb-2">Password</label>
                    <input type="password" id="password" name="password" class="shadow-sm rounded-md w-full px-3 py-2 border border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500" placeholder="Enter your password" required>
                </div>
                <div class="mb-4">
                    <label for="verifyPassword" class="block text-sm font-medium text-reversoLight mb-2">Vérification Password</label>
                    <input type="password" id="verifyPassword" name="verifyPassword" class="shadow-sm rounded-md w-full px-3 py-2 border border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500" placeholder="Enter your password" required>
                </div>
                <button type="submit" id="boutonValider" value="boutonValider"
                        class="bg-reversoLight font-bold w-full flex justify-center py-2 px-4 border border-transparent mt-10
                        rounded-md shadow-sm text-sm text-reversoDark hover:bg-reversoDark hover:ring-2 hover:text-reversoLight
                        hover:ring-reversoLight focus:outline-none focus:ring-2 focus:ring-offset-2
                        focus:ring-indigo-500">Login
                </button>
            </form>
        </div>

    </div>
</main>
<footer>
    <jsp:include page="../template/footer.jsp" />
</footer>
<script src="js/createLogin.js"></script>
<script src="js/accueil.js"></script>
</body>
</html>
