FROM alpine:3.19

RUN apk update && apk upgrade && apk add --no-cache nginx

COPY requirements/nginx/tools/akostrik.42.fr.crt /etc/nginx/ssl/
COPY requirements/nginx/tools/akostrik.42.fr.key /etc/nginx/ssl/
COPY requirements/nginx/config/akostrik.42.fr.conf /etc/nginx/sites-available/

RUN rm -rf /etc/nginx/http.d/default.conf && \
    ln -s /etc/nginx/sites-available/akostrik.42.fr.conf /etc/nginx/http.d/ 

EXPOSE 443

CMD sleep 10 && nginx -g "daemon off;"