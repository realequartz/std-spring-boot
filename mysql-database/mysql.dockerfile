FROM mysql:5.7
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=mudi
COPY ./mysql-database/mudi.sql /docker-entrypoint-initdb.d
EXPOSE 3306