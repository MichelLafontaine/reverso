<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: CDA04
  Date: 16/04/2024
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
    <title>${param.choix} le ${param.societe} : ${param.raisonSociale}</title>
</head>
<body class="bg-reversoLight flex flex-col justify-between h-screen">
<header>
    <jsp:include page="header.jsp" />
</header>
<main class="p-5">
<%--    donnée nécessaire pour le js--%>
    <input type="hidden" id="choix" name="choix" value="${param.choix}">
    <input type="hidden" id="societe" name="societe" value="${param.societe}">
<%--    création du formaulaire--%>
    <p class="text-reversoDark md:text-2xl text-center font-bold">${param.choix} le ${param.societe} : ${param.raisonSociale}</p>
    <form action="formulaireServlet?societe=${param.societe}&&choix=${param.choix}&&raisonSociale=${param.raisonSociale}"
          method="post" id="formulaire" class="grid grid-cols-1 gap-4 md:grid-cols-2">
        <div class="md:col-span-2 ">
            <input type="hidden" id="companyId" name="companyId" value="${infoCompany.identifiant}">
            <label for="rs" class="block md:text-xl font-bold text-reversoDark">Raison Sociale</label>
            <input type="text" id="rs" name="rs"
                   value="${infoCompany.raisonSociale}" required="required"
                   class="mt-1 block w-full px-3 py-2 border border-reversoDark rounded-md shadow-sm focus:outline-none
                   focus:ring-reversoDark focus:border-reversoDark sm:text-sm disabled:opacity-75">
        </div>
        <div class="md:col-span-1 mt-2">
            <label for="numero" class="block md:text-xl font-bold text-reversoDark">n°</label>
            <input type="text" id="numero" name="numero"
                   value="${infoCompany.adresse.numero}" required="required"
                   class="mt-1 block w-full px-3 py-2 border border-reversoDark rounded-md shadow-sm focus:outline-none
                   focus:ring-reversoDark focus:border-reversoDark sm:text-sm disabled:opacity-75">
        </div>
        <div class="md:col-span-1 mt-2">
            <label for="nomRue" class="block md:text-xl font-bold text-reversoDark">nom de la rue</label>
            <input type="text" id="nomRue" name="nomRue"
                   value="${infoCompany.adresse.nomRue}" required="required"
                   class="mt-1 block w-full px-3 py-2 border border-reversoDark rounded-md shadow-sm focus:outline-none
                   focus:ring-reversoDark focus:border-reversoDark sm:text-sm disabled:opacity-75">
        </div>
        <div class="md:col-span-1 mt-2">
            <label for="cp" class="block md:text-xl font-bold text-reversoDark">code Postal</label>
            <input type="text" id="cp" name="cp"
                   value="${infoCompany.adresse.codePostal}" required="required"
                   class="mt-1 block w-full px-3 py-2 border border-reversoDark rounded-md shadow-sm focus:outline-none
                   focus:ring-reversoDark focus:border-reversoDark sm:text-sm disabled:opacity-75">
        </div>
        <div class="md:col-span-1 mt-2">
            <label for="ville" class="block md:text-xl font-bold text-reversoDark">Ville</label>
            <input type="text" id="ville" name="ville"
                   value="${infoCompany.adresse.ville}" required="required"
                   class="mt-1 block w-full px-3 py-2 border border-reversoDark rounded-md shadow-sm focus:outline-none
                   focus:ring-reversoDark focus:border-reversoDark sm:text-sm disabled:opacity-75">
        </div>
        <div class="md:col-span-1 mt-2">
            <label for="email" class="block md:text-xl font-bold text-reversoDark">Email</label>
            <input type="email" id="email" name="email"
                   value="${infoCompany.email}" required="required"
                   class="mt-1 block w-full px-3 py-2 border border-reversoDark rounded-md shadow-sm focus:outline-none
                   focus:ring-reversoDark focus:border-reversoDark sm:text-sm disabled:opacity-75">
        </div>
        <div class="md:col-span-1 mt-2">
            <label for="telephone" class="block md:text-xl font-bold text-reversoDark">Telephone</label>
            <input type="text" id="telephone" name="telephone"
                   value="${infoCompany.telephone}" required="required"
                   class="mt-1 block w-full px-3 py-2 border border-reversoDark rounded-md shadow-sm focus:outline-none
                   focus:ring-reversoDark focus:border-reversoDark sm:text-sm disabled:opacity-75">
        </div>
<%--        données en fonction du client ou du prospect--%>
        <c:choose>
            <c:when test="${param.societe.equals('client')}">
                <div class="md:col-span-1 mt-2">
                    <label for="chiffreAffaire" class="block md:text-xl font-bold text-reversoDark">Chiffre d'affaire</label>
                    <div class="relative">
                        <input type="text" id="chiffreAffaire" name="chiffreAffaire"
                               value="${infoCompany.chiffreAffaire}" required="required"
                               class="mt-1 block w-full px-3 py-2 border border-reversoDark rounded-md shadow-sm focus:outline-none
                               focus:ring-reversoDark focus:border-reversoDark sm:text-sm disabled:opacity-75" >
                        <span class="absolute text-xl font-bold inset-y-0 right-0 flex items-center pr-3 text-reversoDark"> €</span>
                    </div>

                </div>
                <div class="md:col-span-1 mt-2">
                    <label for="nbreEmploye" class="block md:text-xl font-bold text-reversoDark">Nombres d'employés</label>
                    <input type="text" id="nbreEmploye" name="nbreEmploye"
                           value="${infoCompany.nbreEmploye}" required="required"
                           class="mt-1 block w-full px-3 py-2 border border-reversoDark rounded-md shadow-sm focus:outline-none
                   focus:ring-reversoDark focus:border-reversoDark sm:text-sm disabled:opacity-75">
                </div>
            </c:when>
            <c:when test="${param.societe.equals('prospect')}">
                <div class="md:col-span-1 mt-2">
                    <label for="dateProspectDay" class="block md:text-xl font-bold text-reversoDark">Date Prospection</label>
                    <div class="flex space-x-2">
                        <!-- Jour -->
                        <select id="dateProspectDay" name="dateProspectDay" class="mt-1 block w-full px-3 py-2 border
                        border-reversoDark rounded-md shadow-sm focus:outline-none focus:ring-reversoDark
                        focus:border-reversoDark sm:text-sm disabled:opacity-75" required="required">
                            <option value="">Jour</option>
                            <c:forEach begin="1" end="31" var="day">
                                <option value="${day}" ${day == infoCompany.dateProspect.dayOfMonth ? 'selected' : ''}>${day}</option>
                            </c:forEach>
                        </select>
                        <!-- Mois -->
                        <select id="dateProspectMonth" name="dateProspectMonth" class="mt-1 block w-full px-3 py-2
                        border border-reversoDark rounded-md shadow-sm focus:outline-none focus:ring-reversoDark
                        focus:border-reversoDark sm:text-sm disabled:opacity-75" required="required">
                            <option value="">Mois</option>
                            <c:forEach begin="1" end="12" var="month">
                                <option value="${month}" ${month == infoCompany.dateProspect.monthValue ? 'selected' : ''}>${month}</option>
                            </c:forEach>
                        </select>
                        <!-- Année -->
                        <select id="dateProspectYear" name="dateProspectYear" class="mt-1 block w-full px-3 py-2 border
                        border-reversoDark rounded-md shadow-sm focus:outline-none
                        focus:ring-reversoDark focus:border-reversoDark sm:text-sm disabled:opacity-75" required="required">
                            <option value="">Année</option>
                            <c:forEach begin="1990" end="2024" var="year">
                                <option value="${year}" ${year == infoCompany.dateProspect.year ? 'selected' : ''}>${year}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="md:col-span-1 mt-2">
                    <label for="interet" class="block md:text-xl font-bold text-reversoDark">Intérêt</label>
                    <input type="text" id="interet" name="interet"
                           value="${infoCompany.interetProspect}" required="required"
                           class="mt-1 block w-full px-3 py-2 border border-reversoDark rounded-md shadow-sm focus:outline-none
                   focus:ring-reversoDark focus:border-reversoDark sm:text-sm disabled:opacity-75">
                </div>
            </c:when>
        </c:choose>

        <div class="md:col-span-2 mt-2">
            <label for="commentaire" class="block md:text-xl font-bold text-reversoDark">Commentaire</label>
            <textarea id="commentaire" name="commentaire"
                      class="mt-1 block w-full px-3 py-2 border border-reversoDark rounded-md shadow-sm focus:outline-none
                      focus:ring-reversoDark focus:border-reversoDark sm:text-sm
                      disabled:opacity-75"><c:out value="${infoCompany.commentaire}"/></textarea>
        </div>
        <div class="md:col-span-2 grid grid-cols-1 place-items-center mt-10 w-full my-16">
            <input type="submit" value="Envoyer" id="valider"
                   class="w-full h-16 md:w-1/2 py-2 px-4 border border-transparent text-reversoLight shadow-sm
                   md:text-xl font-bold rounded-md bg-reversoDark hover:text-reversoDark hover:bg-reversoLight
                   hover:ring-2 hover:ring-reversoDark">
        </div>
    </form>
</main>

<footer>
    <jsp:include page="footer.jsp" />
</footer>
<script src="./js/accueil.js"></script>
<script src="./js/formulaire.js"></script>
</body>
</html>
