<%--
  Created by IntelliJ IDEA.
  User: CDA04
  Date: 24/04/2024
  Time: 15:59
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
    <jsp:include page="../template/header.jsp" />
</header>
<main>
    <div class="min-h-screen flex items-center justify-center w-full">
        <div class="bg-reversoDark shadow-md rounded-lg px-8 py-6 max-w-md">
            <h1 class="text-2xl font-bold text-center mb-4 text-reversoLight">Déconnection</h1>
            <p class="text-reversoLight mb-5">${sessionScope.sessionForname} ${sessionScope.sessionName}, Êtes-vous sûr(e)</p>
            <form id="login" action="<%=request.getContextPath()%>/deconnectionServlet" method="post">

                <button type="submit"
                        class="bg-reversoLight font-bold w-full flex justify-center py-2 px-4 border border-transparent
                        rounded-md shadow-sm text-sm text-reversoDark hover:bg-reversoDark hover:ring-2 hover:text-reversoLight
                        hover:ring-reversoLight focus:outline-none focus:ring-2 focus:ring-offset-2
                        focus:ring-indigo-500">Déconnection</button>
            </form>
        </div>

    </div>
</main>
<footer>
    <jsp:include page="../template/footer.jsp" />
</footer>
<script src="js/accueil.js"></script>
</body>
</html>
