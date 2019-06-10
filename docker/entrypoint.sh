#!/bin/bash

# generate a new self signed SSL certificate when none is provided in the volume
if [ ! -f /etc/nginx/ssl/jupyter.key  ] || [ ! -f /etc/nginx/ssl/jupyter.crt ]
then
    openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc//ssl//certs/jupyter.key -out /etc/ssl//certs/jupyter.crt -subj "/C=US/ST=Chicago/L=Chicago/O=Self Signed/OU=IT Department/CN=Domain.com"
fi

# Start Postfix at boot
postfix start

# Start Crontab UI at boot
HOST=0.0.0.0 PORT=9000 crontab-ui

# Run Jupyter
runuser -l jupyter -c "/opt/conda/bin/jupyter lab --ip=*"
