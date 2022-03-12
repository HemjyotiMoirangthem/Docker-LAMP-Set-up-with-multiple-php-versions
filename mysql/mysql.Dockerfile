FROM mysql:8.0.19

RUN chown mysql:mysql /etc/mysql/my.cnf
RUN chmod 600 /etc/mysql/my.cnf
COPY ./conf/my.cnf /etc/mysql/my.cnf

