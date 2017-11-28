FROM nginx:alpine

RUN bash app/get_secret.sh

COPY app/nginx.conf /etc/nginx/conf.d/default.conf
COPY app/html/ /usr/share/nginx/html/

EXPOSE 80
