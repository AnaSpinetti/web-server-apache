FROM debian
RUN apt-get update && apt-get install -y apache && apt-get clean
ENV APACHE_LOCK_DIR="var/lock"
ENV APACHE_PID_FILE="var/run/apache2.pid"
ENV APACHE_RUN_USER="userQueVaiExecutar"
ENV APACHE_RUN_GROUP="grupoQuepertence"
ENV APACHE_LOG_DIR="/var/log/apache2"

ADD site.tar /var/www/html

LABEL description="Apache webserver 1.0"
VOLUME /var/www/html

EXPOSE 80

ENTRYPOINT ["/usr/sbin/apachectl"]

CMD ["-D", "FOREGROUND"]
