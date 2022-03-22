FROM mysql:5.7-debian

LABEL company="" \
    maintainer="Andre Abreu" \
    maintainer.email="andre.abreu@gmail.com.br" \ 
    description="Banco de dados (MySQL 5.7)" \  
    version="1.1.0"

COPY config/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

RUN ln -sf /proc/self/fd/1  /var/log/mysql/error.log

RUN apt update && apt -y upgrade 