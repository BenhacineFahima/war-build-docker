FROM tomcat:9.0

# Installer curl
USER root
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Copier le fichier .war dans le conteneur
COPY target/hello-world-war-1.0.0.war /usr/local/tomcat/webapps/ROOT.war

# Copier éventuellement les fichiers de l'application (si besoin)
COPY target/hello-world-war-1.0.0/ /usr/local/tomcat/webapps/ROOT

# Exposer le port
EXPOSE 8080

# Revenir à l'utilisateur tomcat
USER tomcat
