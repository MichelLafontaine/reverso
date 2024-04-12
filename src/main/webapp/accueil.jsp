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
<body class="bg-reversoLight flex flex-col justify-between h-screen">
    <header>
        <jsp:include page="header.jsp" />
    </header>
    <footer>
        <jsp:include page="footer.jsp" />
    </footer>
<script src="./js/accueil.js"></script>
</body>
</html>
