# Utilisation de l'image Tomcat officielle en tant que base
FROM library/tomcat

# Copie de votre fichier WAR (application web Maven) dans le répertoire webapps de Tomcat
COPY ./app/deploy/reverso.war /usr/local/tomcat/webapps/

# Exposition du port 8080 (port par défaut de Tomcat)
EXPOSE 8080
