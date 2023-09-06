# Utiliza la imagen oficial de Apache HTTP Server
FROM httpd:2.4

# Habilita los módulos necesarios de Apache
RUN sed -i '/LoadModule proxy_module/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
    sed -i '/LoadModule proxy_http_module/s/^#//g' /usr/local/apache2/conf/httpd.conf

# Copia el archivo de configuración del proxy reverso
COPY sonar-proxy.conf /usr/local/apache2/conf/extra/sonar-proxy.conf

# Habilita el archivo de configuración del proxy reverso
RUN echo "Include conf/extra/sonar-proxy.conf" >> /usr/local/apache2/conf/httpd.conf
