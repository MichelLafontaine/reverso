<%--
  Created by IntelliJ IDEA.
  User: miche
  Date: 12/04/2024
  Time: 09:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>footer</title>
</head>
<body>
<footer class="fixed bottom-0 left-0 z-20 w-full p-4 bg-reversoDark shadow md:flex md:items-center
    md:justify-between md:p-6">
        <span class="text-sm text-reversoLight sm:text-center">© 2024
            <a href="accueil.jsp" class="hover:underline">Reverso™</a>. All Rights Reserved.
        </span>
    <ul class="flex flex-wrap items-center mt-3 text-sm font-medium text-reversoLight">
        <li>
            <a href="${pageContext.request.contextPath}/aboutServlet" class="hover:underline me-4 md:me-6">About</a>
        </li>
        <li>
            <a href="#" class="hover:underline">Contact</a>
        </li>
    </ul>
</footer>
</body>
</html>
