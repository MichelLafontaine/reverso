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
    <link href="css/output.css" rel="stylesheet">
    <title>Accueil Reverso</title>
</head>
<body class="bg-reversoLight">
    <header>
        <nav class="bg-reversoDark">
            <div class="flex flex-wrap items-center justify-between max-w-screen-xl mx-auto p-4">
                <div class="flex items-center space-x-3">
                    <img src="./img/logo_reverso.png" class="h-8 " alt="Flowbite Logo" />
                    <span class="self-center text-2xl font-semibold whitespace-nowrap text-reversoLight">REVERSO</span>
                </div>
                <div class="flex items-center md:order-2 space-x-1 md:space-x-2 rtl:space-x-reverse">
                    <a href="#" class="text-reversoLight hover:bg-reversoLight focus:ring-4 focus:ring-reversoLight
                    font-medium rounded-lg text-sm px-4 py-2 md:px-5 md:py-2.5 focus:outline-none
                    hover:text-reversoDark">Login</a>
                    <a href="#" class="text-reversoLight hover:bg-reversoLight focus:ring-4 focus:ring-reversoLight
                    font-medium rounded-lg text-sm px-4 py-2 md:px-5 md:py-2.5 focus:outline-none
                    hover:text-reversoDark">Sign up</a>
                    <button data-collapse-toggle="menu" type="button" class="inline-flex items-center p-2 w-10 h-10
                    justify-center text-sm text-reversoLight rounded-lg md:hidden hover:bg-reversoLight
                    hover:text-reversoDark focus:outline-none focus:ring-2 focus:ring-reversoLight"
                            id="mega-menu" aria-controls="mega-menu" aria-expanded="false">
                        <span class="sr-only">Open main menu</span>
                        <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 17 14">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 1h15M1 7h15M1 13h15"/>
                        </svg>
                    </button>
                </div>
                <div id="menu" class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1">
                    <ul class="flex flex-col mt-4 font-medium md:flex-row md:mt-0 md:space-x-8">
                        <li>
                            <a href="#" class="block py-2 px-3 text-reversoLight border-b border-gray-100 md:p-0"
                               aria-current="page">Home</a>
                        </li>
                        <li>
                            <button id="client-button" data-dropdown-toggle="client-dropdown"
                                    class="flex items-center justify-between w-full py-2 px-3 font-medium text-reversoLight
                                    border-b border-gray-100 md:w-auto hover:bg-gray-50 md:hover:bg-transparent
                                    md:border-0 md:hover:text-black md:p-0"> Client
                                <svg class="w-2.5 h-2.5 ms-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"/>
                                </svg>
                            </button>
                            <div id="client-dropdown" class="absolute hidden z-10 grid w-auto text-sm bg-white border border-gray-100 rounded-lg shadow-md dark:border-gray-700 dark:bg-gray-700">
                                <div class="p-4 pb-0 text-gray-900 md:pb-4 dark:text-white">
                                    <ul class="space-y-4" aria-labelledby="mega-menu-dropdown-button">
                                        <li>
                                            <a href="#" class="text-reversoLight hover:text-reversoDark">
                                                Afficher
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" class="text-reversoLight hover:text-reversoDark">
                                                Créer
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" class="text-reversoLight hover:text-reversoDark">
                                                Modifier
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" class="text-reversoLight hover:text-reversoDark">
                                                Supprimer
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li>
                            <button id="prospect-button" data-dropdown-toggle="client-dropdown"
                                    class="flex items-center justify-between w-full py-2 px-3 font-medium text-reversoLight
                                    border-b border-gray-100 md:w-auto hover:bg-gray-50 md:hover:bg-transparent
                                    md:border-0 md:hover:text-black md:p-0"> Prospect
                                <svg class="w-2.5 h-2.5 ms-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"/>
                                </svg>
                            </button>
                            <div id="prospect-dropdown" class="absolute hidden z-10 grid w-auto text-sm bg-white border border-gray-100 rounded-lg shadow-md dark:border-gray-700 dark:bg-gray-700">
                                <div class="p-4 pb-0 text-gray-900 md:pb-4 dark:text-white">
                                    <ul class="space-y-4" aria-labelledby="mega-menu-dropdown-button">
                                        <li>
                                            <a href="#" class="text-reversoLight hover:text-reversoDark">
                                                Afficher
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" class="text-reversoLight hover:text-reversoDark">
                                                Créer
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" class="text-reversoLight hover:text-reversoDark">
                                                Modifier
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" class="text-reversoLight hover:text-reversoDark">
                                                Supprimer
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
<script src="./js/accueil.js"></script>
</body>
</html>
