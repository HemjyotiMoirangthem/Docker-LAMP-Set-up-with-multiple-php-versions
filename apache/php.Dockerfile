FROM httpd:2.4
COPY ./conf/my-httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./conf/vhosts.conf /usr/local/apache2/conf/extra/httpd-vhosts.conf

RUN apt-get update
RUN apt-get install nano -y 

