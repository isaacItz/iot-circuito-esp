FROM nginx:latest

RUN apt-get update && \
apt-get install -y php-fpm && \
rm -rf /var/lib/apt/lists/*

COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www/html

COPY . .

EXPOSE 80

CMD service php7.4-fpm start && nginx -g 'daemon off;'
#CMD ["nginx", "-g", "daemon off;"]
