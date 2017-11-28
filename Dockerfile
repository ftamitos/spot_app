FROM nginx:alpine

RUN ./get_secret.sh

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY html/ /usr/share/nginx/html/

EXPOSE 80
