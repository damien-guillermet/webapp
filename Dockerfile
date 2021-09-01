FROM ubuntu

LABEL maintainer="dgui@hcuge.ch"

RUN apt-get update -y

RUN apt-get install nginx -y

RUN sed -i '23 {s/^/#/}' /etc/nginx/sites-available/default

RUN DEBIAN_FRONTEND=noninteractive apt-get install git -y
RUN rm -Rf /var/www/html/*
RUN git clone https://github.com/diranetafen/static-website-example.git /var/www/html

#wget -c "https://github.com/diranetafen/static-website-example/archive/refs/heads/master.zip" --no-check-certificate
#RUN unzip static-website-example-master
#ADD static-website-example /var/www/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

