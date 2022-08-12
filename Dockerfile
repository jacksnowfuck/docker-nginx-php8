FROM alpine
ADD default.conf /etc/nginx/http.d/
ADD run.sh /
RUN apk update && apk add nginx php8 php8-session php8-fpm php8-ctype php8-curl php8-mbstring php8-mysqli php8-mysqlnd php8-sqlite3 && apk del m4 autoconf make gcc g++ linux-headers && sed -i 's/nobody/nginx/g' /etc/php8/php-fpm.d/www.conf

EXPOSE 80
EXPOSE 9000

ENTRYPOINT ["/run.sh"]
