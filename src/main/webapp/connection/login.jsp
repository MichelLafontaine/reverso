<%--
  Created by IntelliJ IDEA.
  User: CDA04
  Date: 22/04/2024
  Time: 11:13
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
    <title>Login</title>
</head>
<body class="flex flex-col justify-between h-screen bg-reversoLight">
<header>
    <jsp:include page="../template/header.jsp" />
</header>
<main>
    <div class="min-h-screen flex items-center justify-center w-full">
        <div class="bg-reversoDark shadow-md rounded-lg px-8 py-6 max-w-md">
            <h1 class="text-2xl font-bold text-center mb-4 text-reversoLight">Bienvenue!</h1>
            <form id="login" action="<%=request.getContextPath()%>/connectServlet" method="post">
                <div class="mb-4">
                    <label for="email" class="block text-sm font-medium text-reversoLight mb-2">Email Address</label>
                    <input type="email" id="email" name="email" class="shadow-sm rounded-md w-full px-3 py-2 border border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500" placeholder="your@email.com" required>
                </div>
                <div class="mb-4">
                    <label for="password" class="block text-sm font-medium text-reversoLight mb-2">Password</label>
                    <input type="password" id="password" name="password" class="shadow-sm rounded-md w-full px-3 py-2 border border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500" placeholder="Enter your password" required>
                    <a href="<%=request.getContextPath()%>/oubliMDPServlet"
                       class="text-xs text-gray-600 hover:text-indigo-500 focus:outline-none focus:ring-2
                       focus:ring-offset-2 focus:ring-indigo-500">Forgot Password?</a>
                </div>
                <div class="flex items-center justify-between mb-4">
                    <div class="flex items-center">
                        <input type="checkbox" id="remember" class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500 focus:outline-none" checked>
                        <label for="remember" class="ml-2 block text-sm text-reversoLight">Remember me</label>
                    </div>
                    <a href="<%=request.getContextPath()%>/createLoginServlet"
                       class="text-xs font-bold text-reversoLight hover:text-indigo-700 focus:outline-none
                        focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">Create Account</a>
                </div>
                <input type="hidden" name="csrfToken" value="${sessionScope.csrfToken}">
                <p class="text-red-600 text-xl">${errorMessage}</p>
                <button type="submit"
                        class="bg-reversoLight font-bold w-full flex justify-center py-2 px-4 border border-transparent
                        rounded-md shadow-sm text-sm text-reversoDark hover:bg-reversoDark hover:ring-2 hover:text-reversoLight
                        hover:ring-reversoLight focus:outline-none focus:ring-2 focus:ring-offset-2
                        focus:ring-indigo-500">Login</button>
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
