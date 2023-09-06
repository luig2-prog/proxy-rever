# Utiliza una imagen base de Ubuntu o la imagen que prefieras
FROM ubuntu:latest

# Actualiza el sistema y instala Apache
RUN apt-get update -y && apt-get install -y apache2

# Habilita los módulos necesarios de Apache
RUN a2enmod proxy proxy_http

# Copia el archivo de configuración del proxy reverso
COPY sonar-proxy.conf /etc/apache2/sites-available/sonar-proxy.conf

# Habilita el sitio del proxy reverso
RUN a2ensite sonar-proxy.conf

# Limpia la lista de sitios predeterminados
RUN a2dissite 000-default.conf

# Reinicia Apache al arrancar el contenedor
CMD ["apachectl", "-D", "FOREGROUND"]
