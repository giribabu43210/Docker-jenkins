FROM: ubuntu
RUN: apt-get update && apt-get upgrade -y
RUN: apt-get install apache2 -y
WORKDIR: /var/www/html
COPY: ./index.html .
CMD: 
